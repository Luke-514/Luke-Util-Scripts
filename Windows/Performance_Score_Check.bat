@echo off
powershell -NoProfile -ExecutionPolicy Unrestricted -Command "Get-CimInstance Win32_WinSat | Select-Object CPUScore, MemoryScore, GraphicsScore, DiskScore, WinSPRLevel | Out-String -Stream | ?{$_ -ne \"\"}"
pause