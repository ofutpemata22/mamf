Set WshShell = CreateObject("WScript.Shell")
path = WshShell.ExpandEnvironmentStrings("%USERPROFILE%\AppData\Local\ngrok\ss.cmd")
WshShell.Run """" & path & """", 0, False
