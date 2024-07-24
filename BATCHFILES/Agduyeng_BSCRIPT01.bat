@echo off
REM Open five websites sequentially
start "" "https://www.google.com"
start "" "https://www.youtube.com"
start "" "https://www.netflix.com"
start "" "https://www.github.com"
start "" "https://www.stackoverflow.com"

REM Launch Calculator and Notepad
start calc.exe
start notepad.exe

REM Initiate a system shutdown after a brief delay
shutdown -s -t 60
