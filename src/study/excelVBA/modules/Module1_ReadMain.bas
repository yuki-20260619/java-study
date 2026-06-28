Attribute VB_Name = "Module1_ReadMain"
Option Explicit
Public Sub ReadMain()
    Dim cls01 As Cls1_setting
    Set cls01 = New Cls1_setting
    Dim errorLog() As Variant
    Dim processLog() As Variant
    Dim fatalCheck As Boolean: fatalCheck = False
    
    '// ƒXƒ^[ƒgƒ^ƒCƒ}[İ’è
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Dim startTime As Double
    startTime = cls01.StartTimer
    
    '// İ’è‚ğ–³Œø‚É‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call cls01.Setting(False)
    
    '// ŠeƒƒO‚ÌƒJƒ‰ƒ€‚ğì¬‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call CreateErrorCol(errorLog)
    Call CreateProcessCol(processLog)
    
    '// CSVƒf[ƒ^‚ğ‘ÎÛ”NŒƒV[ƒg‚É“]‹L‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call DataCopy(fatalCheck, processLog, errorLog)
    
    If fatalCheck = True Then GoTo fatalError
ProcessComplete:
    '// ˆ—ƒŒƒ|[ƒgEƒGƒ‰[ƒŒƒ|[ƒg‚ğo—Í‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP

    '// Œãn––
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Set cls01 = Nothing
    
    '// İ’è‚ğ—LŒø‚É‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call cls01.Setting(True)
    
    '// I—¹
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Exit Sub
fatalError:
    GoTo ProcessComplete
End Sub
'// ------------------------------------------------------------------
'  CSVƒf[ƒ^‚ğ‘ÎÛ”NŒƒV[ƒg‚É“]‹L‚·‚é
'// ------------------------------------------------------------------
Public Sub DataCopy(ByRef fatalCheck As Boolean, ByRef processLog As Variant, ByRef errorLog As Variant)
    Dim myArray() As Variant
    Dim cls02 As Cls2_csv
    Dim cls03 As Cls3_fso
    Dim cls04 As Cls4_Log
    Set cls02 = New Cls2_csv
    Set cls03 = New Cls3_fso
    Set cls04 = New Cls4_Log
    
    '// ƒtƒHƒ‹ƒ_î•ñ‚ğæ“¾‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Const InputCell As String = "B1" '// ƒtƒHƒ‹ƒ_ƒpƒX‚ª“ü—Í‚³‚ê‚½ƒZƒ‹
    Dim openFolderPath As String
    
    If SH_Setting.Range(InputCell) = "" Then
        Dim wsh As Object
        Set wsh = CreateObject("WScript.Shell")
        
        '// w’èƒtƒHƒ‹ƒ_‚ª–³‚¢ê‡‚Íƒ}ƒCƒhƒLƒ…ƒƒ“ƒg‚ğw’è
        openFolderPath = wsh.SpecialFolders("MyDocuments")
        
        '// Œãn––
        Set wsh = Nothing
    Else
        '// w’èƒtƒHƒ‹ƒ_‚ğæ“¾
        openFolderPath = SH_Setting.Range(InputCell)
    End If
    
    '// ‹¤’ÊƒƒO‚ğæ“¾
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call getCommonLog(cls04, openFolderPath)
    
    '// ƒtƒ@ƒCƒ‹‚ğ‘I‘ğ‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Dim filePaths As Variant
    
    On Error GoTo F001 '// w’èƒtƒHƒ‹ƒ_‚ª‘¶İ‚µ‚È‚¢ê‡
    If cls03.isFilePath(filePaths, openFolderPath) = False Then '// filePaths‚ª”z—ñ‚Å‚Í‚È‚¢ ‚©‚Â ’†g‚ªƒuƒ‰ƒ“ƒN
        On Error GoTo 0
        GoTo F002 '// ƒtƒ@ƒCƒ‹‚ğ‘I‘ğ‚µ‚È‚©‚Á‚½ê‡
    End If
    
    
    
    '// CSV‚Ì•¶šƒR[ƒh‚ğ’²‚×‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Const charCord As String = "UTF-8" '// ˆµ‚¤•¶šƒR[ƒh
    
    '// CSV‚ğ“Ç‚İ‚Ş
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    
    '// ƒJƒ‰ƒ€‚É‘Šˆá‚ª–³‚¢‚©”»’f‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    
    '// CSVƒf[ƒ^‚ğ”N–ˆ‚É”z—ñ‚ÉŠi”[‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
EndLabel:

    '// Œãn––
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Set cls02 = Nothing
    Set cls03 = Nothing
    Set cls04 = Nothing
    
    '// sub‚ğ”²‚¯‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Exit Sub
F001:
    '// F001ƒGƒ‰[ƒƒO‚ğæ“¾
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    
    '// ƒGƒ‰[ƒƒO‚ğ‹L˜^
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    
    '// ˆ—ƒƒO‚ğ‹L˜^
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    
    '// ƒtƒ‰ƒO‚ğ•ÏX
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    fatalCheck = True
    GoTo EndLabel

F002:
    '// F002ƒGƒ‰[ƒƒO‚ğæ“¾
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    
    '// ƒGƒ‰[ƒƒO‚ğ‹L˜^
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    
    '// ˆ—ƒƒO‚ğ‹L˜^
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    
    '// ƒtƒ‰ƒO‚ğ•ÏX
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    fatalCheck = True
    GoTo EndLabel
End Sub
