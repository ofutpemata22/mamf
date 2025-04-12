@echo off
set USERPROFILE=%USERPROFILE%
set NGROK_PATH=%USERPROFILE%\AppData\Local\ngrok\ngrok.exe

if not exist "%NGROK_PATH%" (
    echo ngrok not found
    exit /b
)

start "" "%NGROK_PATH%" http 4444 --subdomain=amused-learning-griffon
pause
