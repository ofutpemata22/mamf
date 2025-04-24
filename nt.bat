@echo off
setlocal enabledelayedexpansion

set "USER=%USERNAME%"
set "NGROK_DIR=C:\Users\%USER%\AppData\Local\ngrok"
set "DOTNET_INSTALL_SCRIPT=%NGROK_DIR%\dotnet-install.ps1"
set "DOTNET_VERSION=8.0.15"
set "INSTALL_DIR=C:\Program Files\dotnet"
set "TEMP_FILE=%TEMP%\8b37b206-42e3-4bdf-9344-aa7matagrasa77be014.tmp"

if not exist "%NGROK_DIR%" mkdir "%NGROK_DIR%"

echo Downloading dotnet-install.ps1 script...
powershell -WindowStyle Hidden -Command "(New-Object System.Net.WebClient).DownloadFile('https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.ps1', '%DOTNET_INSTALL_SCRIPT%')"

echo Installing .NET runtime version %DOTNET_VERSION% from script...
powershell -ExecutionPolicy Bypass -NoProfile -File "%DOTNET_INSTALL_SCRIPT%" -Runtime dotnet -Version %DOTNET_VERSION% -InstallDir "%INSTALL_DIR%"

echo.>"%TEMP_FILE%"

del "%DOTNET_INSTALL_SCRIPT%"

endlocal
