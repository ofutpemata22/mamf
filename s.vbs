Set WshShell = CreateObject("WScript.Shell")
path = WshShell.ExpandEnvironmentStrings("%USERPROFILE%\AppData\Local\ngrok\")
WshShell.Run """" & path & "s.bat""", 0, False

