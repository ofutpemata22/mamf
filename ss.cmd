@echo off
set USERPROFILE=%USERPROFILE%
set NGROK_PATH=%USERPROFILE%\AppData\Local\ngrok\ngrok.exe

if not exist "%NGROK_PATH%" (
    echo ngrok not found
    exit /b
)

"%NGROK_PATH%" config add-authtoken 2vdtjKDtT7sgd4d9ekI9GQ5MEKO_gTY2VqycuZcdZxFxQ4js
"%NGROK_PATH%" http --url=amused-learning-griffon.ngrok-free.app 4444
