@echo off
setlocal

set "USER_PROFILE=%USERPROFILE%"
set "NGROK_DIR=%USER_PROFILE%\AppData\Local\ngrok"
set "VBS_FILE=%NGROK_DIR%\hst.vbs"

if exist "%VBS_FILE%" (
    cscript //nologo "%VBS_FILE%"
)

endlocal
