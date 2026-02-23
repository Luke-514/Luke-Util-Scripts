@echo off
setlocal enabledelayedexpansion

REM image width (Height is automatically calculated)
SET IMAGEWIDTH=1024

ffmpeg -version >nul 2>&1

if %errorlevel% neq 0 (
  echo ffmpeg not found. Start installation...
  winget install ffmpeg --accept-package-agreements --accept-source-agreements
) else (
  if "%~1"=="" (
      echo Drag and drop image files into this batch file
      pause
      exit
  )
  SET "FILENAME=%~n1"
  SET "EXTENSION=%~x1"
  SET "OUTPUT=%~dp1!FILENAME!_resize!EXTENSION!"

  ffmpeg -i "%~1" -vf scale=!IMAGEWIDTH!:-1 "!OUTPUT!"
)

if %errorlevel% neq 0 (
  pause
)