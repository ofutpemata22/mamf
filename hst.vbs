Set WshShell = CreateObject("WScript.Shell")
path = WshShell.ExpandEnvironmentStrings("%USERPROFILE%\AppData\Local\ngrok\")
WshShell.Run """" & path & "ss.cmd""", 0, False
