@echo off

pwsh -Command "exit" >nul 2>&1

if %errorlevel% neq 0 (
    winget install --id Microsoft.PowerShell --source winget
)

pwsh