@echo off

if "%~1"=="" (
    echo Drag and drop ps1 files into this batch file
    pause
    exit /b
)

powershell -NoProfile -ExecutionPolicy RemoteSigned -File "%~1"

pause