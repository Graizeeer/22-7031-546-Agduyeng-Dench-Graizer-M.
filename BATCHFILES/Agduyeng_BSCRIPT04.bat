@echo off
setlocal enabledelayedexpansion

REM Sort text files on Drive C: by date and archive older files to Drive Z:
for /f "delims=" %%i in ('dir C:\*.txt /A-D /O-D /B') do (
    set file=%%i
    echo Moving %%i to Drive Z: archive folder.
    move "C:\%%i" "Z:\archive\%%i"
)

REM Sort archived files by size
for /f "delims=" %%i in ('dir Z:\archive\*.txt /A-D /O-S /B') do (
    echo Archived file: %%i
)

REM Prompt the user for permission to delete old, large files
set /p delete="Do you want to delete old, large files? (y/n): "
if /i "%delete%"=="y" (
    for /f "delims=" %%i in ('dir Z:\archive\*.txt /A-D /O-S /B') do (
        del "Z:\archive\%%i"
        echo Deleted: %%i
    )
) else (
    echo No files were deleted.
)

pause
