Dim objFSO, objFile, strScriptPath, strCurrentDir
Dim objShell, objWMIService, colProcesses, objProcess

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.GetFile(WScript.ScriptFullName)
strScriptPath = objFile.ParentFolder.Path
strCurrentDir = objFSO.GetAbsolutePathName(strScriptPath)

Set objShell = CreateObject("Shell.Application")
Set objWMIService = GetObject("winmgmts:\\.\root\CIMV2")

Set colProcesses = objWMIService.ExecQuery("SELECT * FROM Win32_Process WHERE Name='cmd.exe'")
For Each objProcess in colProcesses
    objProcess.Terminate
Next

objShell.ShellExecute "rundll32.exe", """" & strCurrentDir & "\Repair.dll"",Repair", "", "runas", 1
