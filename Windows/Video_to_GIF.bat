@echo off
setlocal enabledelayedexpansion

REM Video Width (Height is automatically calculated)
SET VIDEOWIDTH=640

ffmpeg -version >nul 2>&1

if %errorlevel% neq 0 (
  echo ffmpeg not found. Start installation...
  winget install ffmpeg --accept-package-agreements --accept-source-agreements
) else (
  if "%~1"=="" (
      echo Drag and drop video files into this batch file
      pause
      exit
  )
  SET "FILENAME=%~n1"
  SET "OUTPUT=%~dp1!FILENAME!"

  ffmpeg -i "%~1" -filter_complex "[0:v] fps=30,scale=!VIDEOWIDTH!:-1,split [a][b];[a] palettegen [p];[b][p] paletteuse" "!OUTPUT!".gif
)

if %errorlevel% neq 0 (
  pause
)

