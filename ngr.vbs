Set shell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
tempPath = shell.ExpandEnvironmentStrings("%TEMP%")
target = tempPath & "\ngr.bat"
shell.Run Chr(34) & target & Chr(34), 0, False
