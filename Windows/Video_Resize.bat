@echo off
setlocal enabledelayedexpansion

REM Image quality (0-51, the lower the number, the higher the image quality)
SET IMAGEQUALITY=23

ffmpeg -version >nul 2>&1

if %errorlevel% neq 0 (
  echo ffmpeg not found. Start installation...
  winget install ffmpeg
) else (
  if "%~1"=="" (
      echo Drag and drop video files into this batch file
      pause
      exit
  )
  SET "FILENAME=%~n1"
  SET "EXTENSION=%~x1"
  SET "OUTPUT=%~dp1!FILENAME!_resize!EXTENSION!"

  ffmpeg -i "%~1" -crf !IMAGEQUALITY! -preset medium "!OUTPUT!"
)

pause