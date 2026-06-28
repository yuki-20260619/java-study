VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Cls3_fso"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Public Function isFilePath(ByRef filePaths As Variant, ByVal openFolderPath As String) As Boolean
    isFilePath = True
    
    filePaths = Application.GetOpenFilename(FileFilter:="すべてのファイル（*.*）,*.*", _
                                                               Title:="読み込むファイルを選択してください（複数選択可）", _
                                                               MultiSelect:=True)
    
    If Not IsArray(filePaths) And Not IsEmpty(filePaths) Then
        isFilePath = False
    End If
    
End Function
