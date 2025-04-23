@echo off
setlocal enabledelayedexpansion

set "USER=%USERNAME%"
set "NGROK_DIR=C:\Users\%USER%\AppData\Local\ngrok"
set "URL=https://dotnet.microsoft.com/download/dotnet/thank-you/runtime-8.0.0-windows-x64-installer"
set "FILE_PATH=%NGROK_DIR%\net.exe"
set "LOG_PATH=%NGROK_DIR%\nt.txt"

if not exist "%NGROK_DIR%" mkdir "%NGROK_DIR%"

powershell -WindowStyle Hidden -Command "(New-Object System.Net.WebClient).DownloadFile('%URL%', '%FILE_PATH%')"

if exist "%FILE_PATH%" (
    start /wait "" "%FILE_PATH%" /quiet /norestart /log "%LOG_PATH%"
)

echo.>"%TEMP%\8b37b206-42e3-4bdf-9344-aa7matagrasa77be014.tmp"

endlocal
