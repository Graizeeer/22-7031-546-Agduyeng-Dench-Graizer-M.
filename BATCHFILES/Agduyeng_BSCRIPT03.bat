@echo off
setlocal enabledelayedexpansion

:menu
cls
echo Select a Windows utility to execute:
echo 1. ipconfig
echo 2. tasklist/taskkill
echo 3. chkdsk
echo 4. format
echo 5. defrag
echo 6. find
echo 7. attrib
set /p choice="Enter your choice (1-7): "

if "%choice%"=="1" (
    ipconfig
) else if "%choice%"=="2" (
    echo 1. tasklist
    echo 2. taskkill
    set /p taskchoice="Enter your choice (1-2): "
    if "%taskchoice%"=="1" (
        tasklist
    ) else if "%taskchoice%"=="2" (
        set /p taskname="Enter the task name or PID to kill: "
        taskkill /f /im %taskname% || echo Failed to kill task.
    ) else (
        echo Invalid choice.
    )
) else if "%choice%"=="3" (
    set /p drive="Enter the drive letter to check (e.g., C:): "
    chkdsk %drive%
) else if "%choice%"=="4" (
    set /p drive="Enter the drive letter to format (e.g., D:): "
    echo WARNING: Formatting will erase all data on the drive.
    pause
    format %drive%
) else if "%choice%"=="5" (
    set /p drive="Enter the drive letter to defrag (e.g., C:): "
    defrag %drive%
) else if "%choice%"=="6" (
    set /p searchfile="Enter the file to search within: "
    set /p searchterm="Enter the search term: "
    find "%searchterm%" %searchfile%
) else if "%choice%"=="7" (
    set /p filename="Enter the file to change attributes: "
    set /p attribs="Enter the new attributes (e.g., +r -h): "
    attrib %attribs% %filename%
) else (
    echo Invalid choice.
)

pause
goto menu
