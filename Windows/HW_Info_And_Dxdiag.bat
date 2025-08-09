@echo off

if not exist "HW_Info.ps1" (
    echo HW_Info.ps1 not found.
    pause
    exit /b
)

echo Exporting...
echo Do Not Close this window
START /B /WAIT cmd /c "dxdiag /t dxdiag.txt"
cls

powershell -NoProfile -ExecutionPolicy Bypass -File "HW_Info.ps1"

pause
