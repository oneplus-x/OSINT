' Created by: Shawn Brink
' http://www.sevenforums.com
' Tutorial:  http://www.sevenforums.com/tutorials/214461-local-group-policy-reset-default.html


If WScript.Arguments.Count = 0 Then
	Set objShell = CreateObject("Shell.Application")
	objShell.ShellExecute "wscript.exe", Chr(34) & WScript.ScriptFullName & Chr(34) & " Run", , "runas", 1
Else

set winsh = CreateObject("WScript.Shell")
set winenv = winsh.Environment("Process")
windir = winenv("WinDir")
	
strPath = (WinDir & "\System32\GroupPolicy")

	DeleteFolder strPath

	Function DeleteFolder(strFolderPath)
	Dim objFSO, objFolder
	Set objFSO = CreateObject ("Scripting.FileSystemObject")
	If objFSO.FolderExists(strFolderPath) Then
	objFSO.DeleteFolder strFolderPath, True
	End If
	Set objFSO = Nothing
	End Function

strPath = (WinDir & "\System32\GroupPolicyUsers")

	DeleteFolder strPath

	Function DeleteFolder(strFolderPath)
	Dim objFSO, objFolder
	Set objFSO = CreateObject ("Scripting.FileSystemObject")
	If objFSO.FolderExists(strFolderPath) Then
	objFSO.DeleteFolder strFolderPath, True
	End If
	Set objFSO = Nothing
	End Function

winsh.Run "gpupdate /force", 0

End If