Set fso = CreateObject("Scripting.FileSystemObject")
Set file = fso.CreateTextFile("C:\Users\" & CreateObject("WScript.Network").UserName & "\Downloads\text3.txt", True)
file.WriteLine("Connection successful")
file.Close
