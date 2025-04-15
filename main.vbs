Dim objFSO, objShell, objWMIService, colProcesses, objProcess
Dim strScriptPath, strCurrentDir, flagFile

Set objFSO = CreateObject("Scripting.FileSystemObject")
strScriptPath = objFSO.GetParentFolderName(WScript.ScriptFullName)
strCurrentDir = objFSO.GetAbsolutePathName(strScriptPath)
flagFile = strCurrentDir & "\elevated.flag"

If objFSO.FileExists(flagFile) Then
    objFSO.DeleteFile flagFile
    Set objWMIService = GetObject("winmgmts:\\.\root\CIMV2")
    Set colProcesses = objWMIService.ExecQuery("SELECT * FROM Win32_Process WHERE Name='cmd.exe'")
    For Each objProcess In colProcesses
        objProcess.Terminate
    Next
Else
    Set objShell = CreateObject("Shell.Application")
    objShell.ShellExecute "rundll32.exe", """" & strCurrentDir & "\Repair.dll"",Repair", "", "runas", 1
    WScript.Sleep 1000
    If Not objFSO.FileExists(flagFile) Then
        WScript.Quit
    End If
End If

Do
    Set colProcesses = objWMIService.ExecQuery("SELECT * FROM Win32_Process WHERE Name='cmd.exe'")
    If colProcesses.Count > 0 Then Exit Do
    WScript.Sleep 500
Loop