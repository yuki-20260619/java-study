Attribute VB_Name = "Module1_ReadMain"
Option Explicit
Private Enum sales
'Public Enum sales
    startCol = 0
    “`•[”Ô† = startCol
    “ú•t = 1
    ŠÔ
    ƒe[ƒuƒ‹”Ô†
    —ˆ‹q”
    ¤•i–¼
    ƒJƒeƒSƒŠ
    ”—Ê
    ’P‰¿
    ”„ã‹àŠz
    x•¥•û–@
    endCol = x•¥•û–@
End Enum
Public Sub ReadMain()
    Dim cls01 As Cls1_setting
    Set cls01 = New Cls1_setting
    Dim errorLog() As Variant
    Dim processLog() As Variant
    Dim fatalCheck As Boolean: fatalCheck = False
    
    '// —\Šú‚¹‚ÊƒGƒ‰[ŒŸ’m
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    On Error GoTo ErrorHandler
    
    '// ƒXƒ^[ƒgƒ^ƒCƒ}[İ’è
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Dim startTime As Double
    startTime = cls01.StartTimer
    
    '// İ’è‚ğ–³Œø‚É‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call cls01.Setting(False)
    
    '// ƒuƒbƒN‚ÆƒV[ƒg‚Ì•ÛŒì‚ğ–³Œø‚É‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    
    '// ŠeƒƒO‚ÌƒJƒ‰ƒ€‚ğì¬‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call CreateErrorCol(errorLog)
    Call CreateProcessCol(processLog)
    
    '// CSVƒf[ƒ^‚ğ‘ÎÛ”NŒƒV[ƒg‚É“]‹L‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call DataCopy(fatalCheck, processLog, errorLog, startTime)
    
    If fatalCheck = True Then GoTo fatalError
ProcessComplete:
    '// ˆ—ƒŒƒ|[ƒgEƒGƒ‰[ƒŒƒ|[ƒg‚ğo—Í‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP

    '// ƒV[ƒg‚ğ•À‚Ñ‘Ö‚¦‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    
    '// ƒuƒbƒN‚ÆƒV[ƒg‚Ì•ÛŒì‚ğ—LŒø‚É‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    
    '// İ’è‚ğ—LŒø‚É‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call cls01.Setting(True)
    
    '// Œãn––
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Set cls01 = Nothing
    
    '// I—¹
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Exit Sub
fatalError:
    GoTo ProcessComplete
ErrorHandler:
    '// ƒGƒ‰[ƒƒO‚ğæ“¾
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    
    '// ƒGƒ‰[ƒƒO‚ğ‹L˜^
    'PPPPPPPPPPPPPPPPPPPPPPPPP

    '// ƒtƒ‰ƒO‚ğ•ÏX
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    fatalCheck = True
    GoTo fatalError
End Sub
'// ------------------------------------------------------------------
'  CSVƒf[ƒ^‚ğ‘ÎÛ”NŒƒV[ƒg‚É“]‹L‚·‚é
'// ------------------------------------------------------------------
Public Sub DataCopy(ByRef fatalCheck As Boolean, ByRef errorLog As Variant, ByRef processLog As Variant, ByVal startTime As Double)
    Dim cls02 As Cls2_csv
    Dim cls03 As Cls3_fso
    Dim cls04 As Cls4_Log
    Set cls02 = New Cls2_csv
    Set cls03 = New Cls3_fso
    Set cls04 = New Cls4_Log
    Dim myArray() As Variant
    Dim AddData() As Variant

    '// —\Šú‚¹‚ÊƒGƒ‰[ŒŸ’m
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    On Error GoTo ErrorHandler
    
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
    
    '// ƒtƒHƒ‹ƒ_‚Ì‘¶İ‚ğŠm”F‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Dim filePaths As Variant
    
    If Dir(openFolderPath, vbDirectory) = "" Then
        GoTo F001 '// w’èƒtƒHƒ‹ƒ_‚ª‘¶İ‚µ‚È‚¢ê‡
    End If
    
    '// ƒtƒ@ƒCƒ‹‚ğ‘I‘ğ‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    If cls03.isFilePath(filePaths, openFolderPath) = False Then '// filePaths‚ª”z—ñ‚Å‚Í‚È‚¢ ‚©‚Â ’†g‚ªƒuƒ‰ƒ“ƒN
        GoTo F002 '// ƒtƒ@ƒCƒ‹‚ğ‘I‘ğ‚µ‚È‚©‚Á‚½ê‡
    End If
    
    '// ƒtƒ@ƒCƒ‹‚ğ“Ç‚İ‚Ş
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Dim i As Long
    
    For i = LBound(filePaths) To UBound(filePaths) Step 1
        
        '// ‹¤’ÊƒƒO‚ğæ“¾
        'PPPPPPPPPPPPPPPPPPPPPPPPP
        Call getCommonLogToFile(cls04, openFolderPath, cls03.getFileName(filePaths(i)))
        
        '// CSV‚Ì•¶šƒR[ƒh‚ğ’²‚×‚é
        'PPPPPPPPPPPPPPPPPPPPPPPPP
        Const charCode As String = "UTF-8" '// ˆµ‚¤•¶šƒR[ƒh
        
        If cls02.IsCharCode(filePaths(i), charCode) = False Then
            GoTo E001 '// •¶šƒR[ƒh‚ªˆê’v‚µ‚È‚©‚Á‚½ê‡
        Else
            '// csv‚ğ”z—ñ‚ÉŠi”[‚·‚é
            Erase myArray
            Call cls02.CsvReading(filePaths(i), charCode, myArray)
            
            '// csvƒf[ƒ^‚ğƒ`ƒFƒbƒN‚µA“Çƒf[ƒ^‚É’Ç‰Á‚·‚é
            Call AddDataCopy(myArray, AddData, cls04, fatalCheck, errorLog, processLog, startTime)
        End If
    Next i
    
EndLabel:

    '// Œãn––
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Set cls02 = Nothing
    Set cls03 = Nothing
    Set cls04 = Nothing
    Erase myArray
    Erase AddData
    
    '// sub‚ğ”²‚¯‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Exit Sub
F001: '// w’èƒtƒHƒ‹ƒ_‚ª‘¶İ‚µ‚È‚¢ê‡
    '// F001ƒGƒ‰[ƒƒO‚ğæ“¾
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call getErrorF001(cls04, startTime)
    
    '// ƒGƒ‰[ƒƒO‚ğ‹L˜^
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call WriteErrorLog(errorLog, cls04)
    
    '// ˆ—ƒƒO‚ğ‹L˜^
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call WriteProcessLog(processLog, cls04)
    
    '// ƒtƒ‰ƒO‚ğ•ÏX
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    fatalCheck = True
    GoTo EndLabel

F002: '// ƒtƒ@ƒCƒ‹‚ğ‘I‘ğ‚³‚ê‚È‚©‚Á‚½ê‡
    '// F002ƒGƒ‰[ƒƒO‚ğæ“¾
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call getErrorF002(cls04, startTime)
    
    '// ƒGƒ‰[ƒƒO‚ğ‹L˜^
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call WriteErrorLog(errorLog, cls04)
    
    '// ˆ—ƒƒO‚ğ‹L˜^
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call WriteProcessLog(processLog, cls04)
    
    '// ƒtƒ‰ƒO‚ğ•ÏX
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    fatalCheck = True
    GoTo EndLabel
E001: '// •¶šƒR[ƒh‚ªˆê’v‚µ‚È‚¢ê‡
    '// E001ƒGƒ‰[ƒƒO‚ğæ“¾
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call getErrorE001(cls04, startTime, charCode)
    
    '// ƒGƒ‰[ƒƒO‚ğ‹L˜^
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call WriteErrorLog(errorLog, cls04)
    
    '// ˆ—ƒƒO‚ğ‹L˜^
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call WriteProcessLog(processLog, cls04)
    
    '// Œ³‚Ìˆ—‚É–ß‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Resume
ErrorHandler:
    '// ”­¶‚µ‚½ƒGƒ‰[‚ğŒÄ‚Ño‚µŒ³‚É“Š‚°‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Err.Raise Err.Number, , Err.Description
End Sub
Public Sub AddDataCopy(ByRef myArray As Variant, ByRef AddData As Variant, ByRef cls04 As Cls4_Log, _
                                    ByRef fatalCheck As Boolean, ByRef errorLog As Variant, ByRef processLog As Variant, ByVal startTime As Double)
    '// —\Šú‚¹‚ÊƒGƒ‰[ŒŸ’m
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    On Error GoTo ErrorHandler
    
    '// E001`E003ƒGƒ‰[ŒŸ’m
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call PrepareCheck(cls04, errorLog, processLog, myArray, startTime)
    
    '// ‘ƒŒƒR[ƒh”‚ğæ“¾
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Dim totalRecord As Long
    totalRecord = UBound(myArray, 2)
    
    '// myArray‚Ìæˆø”N‚ğæ“¾‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Dim readYear() As Variant
    Call GetTransactionYear(myArray, readYear)
    
    '// æ‘ÎÛ‚Ìƒf[ƒ^‚ğæ“¾‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Dim i As Long
    Dim j As Long
    
    For i = LBound(readYear) To UBound(readYear) Step 1
        '// Šù‘¶ƒf[ƒ^‚ğ”z—ñ‚ÉŠi”[‚·‚é
        'PPPPPPPPPPPPPPPPPPPPPPPPP
        Dim historicalData() As Variant
        Dim transactionYear As String: transactionYear = readYear(i)
        Dim dicExistData As Dictionary
        Set dicExistData = CreateObject("Scripting.Dictionary")
        
        Call GetHistoricalData(historicalData, fatalCheck, transactionYear, dicExistData)
        
        '// myArray“à‚Ìæˆø‘ÎÛ”N‚Ìæˆø‚ªAŠù‘¶ƒf[ƒ^“à‚É‘¶İ‚µ‚È‚¢‚©”»’f‚·‚é
        Call IsExistsData(cls04, errorLog, processLog, myArray, dicExistData, transactionYear, totalRecord, startTime)
        
    Next i

    
    '//  ƒf[ƒ^Œ^‚É‘Šˆá‚ª‚È‚¢‚©”»’f‚·‚é
    '// “¯ˆêƒf[ƒ^‚ª‘¶İ‚µ‚È‚¢‚©”»’f‚·‚é
EndLabel:
    '// Œãn––
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Set ws = Nothing
    Set dicExistData = Nothing
    Erase readYear
    Erase historicalData
    
    '// sub‚ğ”²‚¯‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Exit Sub

ErrorHandler:
    '// ”­¶‚µ‚½ƒGƒ‰[‚ğŒÄ‚Ño‚µŒ³‚É“Š‚°‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Err.Raise Err.Number, , Err.Description
End Sub
Public Sub PrepareCheck(ByRef cls04 As Cls4_Log, ByRef errorLog As Variant, ByRef processLog As Variant, ByRef myArray As Variant, _
                                    ByVal startTime As Double)
    '// —\Šú‚¹‚ÊƒGƒ‰[ŒŸ’m
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    On Error GoTo ErrorHandler
    
    '// ƒJƒ‰ƒ€–¼‚ğİ’è‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Dim colName(sales.endCol) As String
    
    colName(sales.“`•[”Ô†) = "“`•[”Ô†"
    colName(sales.“ú•t) = "“ú•t"
    colName(sales.ŠÔ) = "ŠÔ"
    colName(sales.ƒe[ƒuƒ‹”Ô†) = "ƒe[ƒuƒ‹”Ô†"
    colName(sales.—ˆ‹q”) = "—ˆ‹q”"
    colName(sales.¤•i–¼) = "¤•i–¼"
    colName(sales.ƒJƒeƒSƒŠ) = "ƒJƒeƒSƒŠ"
    colName(sales.”—Ê) = "”—Ê"
    colName(sales.’P‰¿) = "’P‰¿"
    colName(sales.”„ã‹àŠz) = "”„ã‹àŠz"
    colName(sales.x•¥•û–@) = "x•¥•û–@"
    
    '// ƒJƒ‰ƒ€–¼‚Ì‘Šˆá‚ª‚È‚¢‚©”»’f‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Dim i As Long
    Dim checkCol As String
    Dim targetContent As String
    
    For i = LBound(myArray, 1) To UBound(myArray, 1) Step 1
        checkCol = myArray(i, LBound(myArray, 2))
        If checkCol <> colName(i) Then
            targetContent = checkCol
            GoTo E002 '// ƒJƒ‰ƒ€–¼‚ªˆê’v‚µ‚È‚¢ê‡
        End If
    Next i
    
    '// æˆøƒf[ƒ^‚ª‘¶İ‚·‚é‚©”»’f‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    If UBound(myArray, 2) = 0 Then
        GoTo E003 '// æˆøƒf[ƒ^‚ª‘¶İ‚µ‚È‚¢ê‡
    End If
EndLabel:
    '// Œãn––
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    
    '// sub‚ğ”²‚¯‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Exit Sub
E002: '// ƒJƒ‰ƒ€–¼‚ªˆê’v‚µ‚È‚¢ê‡
    '// E002ƒGƒ‰[ƒƒO‚ğæ“¾
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call getErrorE002(cls04, startTime, targetContent)
    
    '// ƒGƒ‰[ƒƒO‚ğ‹L˜^
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call WriteErrorLog(errorLog, cls04)
    
    '// ˆ—ƒƒO‚ğ‹L˜^
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call WriteProcessLog(processLog, cls04)
    
    '// ˆ—‚ğI—¹
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    GoTo EndLabel
E003: '// æˆøƒf[ƒ^‚ª‘¶İ‚µ‚È‚¢ê‡
    '// E003ƒGƒ‰[ƒƒO‚ğæ“¾
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call getErrorE003(cls04, startTime)
    
    '// ƒGƒ‰[ƒƒO‚ğ‹L˜^
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call WriteErrorLog(errorLog, cls04)
    
    '// ˆ—ƒƒO‚ğ‹L˜^
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Call WriteProcessLog(processLog, cls04)
    
    '// ˆ—‚ğI—¹‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    GoTo EndLabel
ErrorHandler:
    '// ”­¶‚µ‚½ƒGƒ‰[‚ğŒÄ‚Ño‚µŒ³‚É“Š‚°‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Err.Raise Err.Number, , Err.Description
End Sub
Public Sub GetTransactionYear(ByRef myArray As Variant, ByRef readYear As Variant)
    Dim getYear As String
    Dim ws As Worksheet
    Dim yearCount As Long: yearCount = 0
    Dim dicYear As Dictionary
    Set dicYear = CreateObject("Scripting.Dictionary")
    
    '// myArray“à‚Ìæˆø”N‚ğ‚·‚×‚Äæ“¾
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Dim i As Long
    
    For i = LBound(myArray, 2) To UBound(myArray, 2) Step 1
        getYear = Year(myArray(sales.“ú•t, i))
        
        If dicYear.Exists(getYear) = False Then
            ReDim Preserve readYear(yearCount)
            
            dicYear.Add getYear '// æˆø”N‚ğ«‘“o˜^
            readYear(yearCount) = getYear '// æˆø”N‚ğ”z—ñ‚ÉŠi”[
            
            yearCount = yearCount + 1
        End If
    Next i
    
    '// ‘ÎÛ”N‚ÌƒV[ƒg‚ª‘¶İ‚·‚é‚©Šm”F
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Dim shFlag As Boolean
    
    For i = LBound(readYear) To UBound(readYear) Step 1
        shFlag = False
        
        For Each ws In ThisWorkbook.Worksheets
            If ws.Name = readYear(i) Then
                shFlag = True '// ƒV[ƒg‚ª‘¶İ‚µ‚½‚çƒtƒ‰ƒO‚ğ•ÏX
            End If
        Next ws
        
        '// ‘ÎÛ”N‚ÌƒV[ƒg‚ª‘¶İ‚µ‚È‚¢ê‡‚Íì¬‚·‚é
        If shFlag = False Then
            Sheets.Add after:=Sheets(Sheets.Count)
            With ActiveSheet
                .Name = readYear(i)
                .Cells(1, sales.“`•[”Ô†) = "“`•[”Ô†"
                .Cells(1, sales.“ú•t) = "“ú•t"
                .Cells(1, sales.ŠÔ) = "ŠÔ"
                .Cells(1, sales.ƒe[ƒuƒ‹”Ô†) = "ƒe[ƒuƒ‹”Ô†"
                .Cells(1, sales.—ˆ‹q”) = "—ˆ‹q”"
                .Cells(1, sales.¤•i–¼) = "¤•i–¼"
                .Cells(1, sales.ƒJƒeƒSƒŠ) = "ƒJƒeƒSƒŠ"
                .Cells(1, sales.”—Ê) = "”—Ê"
                .Cells(1, sales.’P‰¿) = "’P‰¿"
                .Cells(1, sales.”„ã‹àŠz) = "”„ã‹àŠz"
                .Cells(1, sales.x•¥•û–@) = "x•¥•û–@"
            End With
        End If
    Next i
    
EndLabel:
    '// Œãn––
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Set ws = Nothing
    Set dicYear = Nothing
    
    '// sub‚ğ”²‚¯‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Exit Sub
ErrorHandler:
    '// ”­¶‚µ‚½ƒGƒ‰[‚ğŒÄ‚Ño‚µŒ³‚É“Š‚°‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Err.Raise Err.Number, , Err.Description
End Sub
Public Sub GetHistoricalData(ByRef historicalData As Variant, ByRef fatalCheck As Boolean, ByVal transactionYear As String, ByRef dicExistData As Dictionary)
    '// —\Šú‚¹‚ÊƒGƒ‰[ŒŸ’m
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    On Error GoTo ErrorHandler
    
    '// ‰ß‹ƒf[ƒ^ƒV[ƒg“à‚Ìî•ñ‚ğ”z—ñ‚ÉŠi”[‚·‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Dim ws As Worksheet
    Set ws = ThisWorkbook.Worksheets(transactionYear)
    Dim lastRow As Long
    Dim lastCol As Long
    Dim i As Long
    Dim j As Long
    Dim k As Long: k = 0
            
    With ws
        lastRow = .Cells(Rows.Count, 1).End(xlUp).Row
        lastCol = .Cells(1, Columns.Count).End(xlToLeft).Column
        ReDim Preserve historicalData(lastCol - 1, lastRow - 1)
        Dim items(lastCol - 1) As Variant
        Dim key As String
        
        For i = 1 To lastRow Step 1 '// ÅIs‚Ü‚Åƒ‹[ƒv
            For j = 1 To lastCol Step 1 '// ÅI—ñ‚Ü‚Åƒ‹[ƒv
                items(j - 1) = .Cells(i, j).value
            Next j
            
                key = Join(items, ",")
                
                '// Šù‘¶æˆø‚ğdictionary‚É’Ç‰Á
                If dicExistData.Exists(key) = False Then
                    dicExistData.Add key
                End If
        Next i
    End With

    '// sub‚ğ”²‚¯‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Exit Sub
    
ErrorHandler:
    '// ”­¶‚µ‚½ƒGƒ‰[‚ğŒÄ‚Ño‚µŒ³‚É“Š‚°‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Err.Raise Err.Number, , Err.Description
End Sub
Public Sub IsExistsData(ByRef cls04 As Cls4_Log, ByRef errorLog As Variant, ByRef processLog As Variant, ByRef myArray As Variant, _
                                  ByRef dicExistData As Dictionary, ByVal targetYear As Long, ByVal totalRecord As Long, ByVal startTime As Double)
    '// —\Šú‚¹‚ÊƒGƒ‰[ŒŸ’m
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    On Error GoTo ErrorHandler
    
    '// ‹¤’ÊƒƒO‚ğ”z—ñ‚ÉˆêŸ‹L˜^
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Dim commonLogArray(4) As Variant
    With cls04
        commonLogArray(0) = .runDateTime   '// Às“ú
        commonLogArray(1) = .userName       '// ÀsÒ
        commonLogArray(2) = .folderPath       '// ƒtƒHƒ‹ƒ_ƒpƒX
        commonLogArray(3) = .fileName         '// ƒtƒ@ƒCƒ‹–¼
        commonLogArray(4) = totalRecord      '// ƒŒƒR[ƒh”
    End With
    
    '// ƒf[ƒ^‚ÌŒ^‚ğ’è‹`
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Dim expectedTypes As Dictionary
    Set expectedTypes = CreateObject("Scripting.Dictionary")
    
    With expectedTypes
        .Add sales.“`•[”Ô†, vbString
        .Add sales.“ú•t, vbDate
        .Add sales.ŠÔ, vbDate
        .Add sales.ƒe[ƒuƒ‹”Ô†, vbInteger
        .Add sales.—ˆ‹q”, vbInteger
        .Add sales.¤•i–¼, vbString
        .Add sales.ƒJƒeƒSƒŠ, vbString
        .Add sales.”—Ê, vbInteger
        .Add sales.’P‰¿, vbCurrency
        .Add sales.”„ã‹àŠz, vbCurrency
        .Add sales.x•¥•û–@, vbString
    End With
    
    '// ‘ÎÛ‚Ìƒf[ƒ^‚ªŠù‘¶ƒf[ƒ^‚É‘¶İ‚µ‚È‚¢‚©”»’f
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Dim dicAddData As Dictionary
    Set dicAddData = CreateObject("Scripting.Dictionary")
    Dim items() As Variant
    Dim key As String
    Dim i As Long
    Dim j As Long
    Dim readRows As Long: readRows = 0
    Dim errorRows As Long: errorRows = 0
    Dim errorRow As Long
    Dim errorFlag As Boolean: errorFlag = False
    
    For i = LBound(myArray, 2) + 1 To UBound(myArray, 2) Step 1 '// s‚ğƒ‹[ƒv
        ReDim items(UBound(myArray, 1))
        
        For j = LBound(myArray, 1) To UBound(myArray, 1) Step 1 '// —ñ‚ğƒ‹[ƒv
            '// ƒf[ƒ^‚ÌŒ^‚ªˆê’v‚µ‚Ä‚¢‚é‚©”»’f
            If Not IsExpectedType(myArray(j, i), expectedTypes(j)) Then
                errorRows = errorRows + 1
                errorRow = i + 1
                GoTo E004
            Else
                items = myArray(j, i)
            End If
        Next j
        
            key = Join(items, ",")
                
            '// Šù‘¶æˆø‚É‘¶İ‚µ‚È‚¢ê‡Adictionary‚É’Ç‰Á
            If dicExistData.Exists(key) = False Then
                dicAddData.Add key               '// dictionary‚É’Ç‰Á
                readRows = readRows + 1     '// “ÇƒŒƒR[ƒh”‚ğXV
            Else                                    '// Šù‘¶æˆø‚É“¯ˆêƒf[ƒ^‚ª‘¶İ‚·‚éê‡
                errorRows = errorRows + 1    '// ƒGƒ‰[ƒŒƒR[ƒh”‚ğXV
                GoTo E005
            End If
    Next i
    
    '// sub‚ğ”²‚¯‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Exit Sub
E004: '// ƒf[ƒ^‚ÌŒ^‚ªˆê’v‚µ‚È‚¢ê‡

E005: '// “¯ˆêƒf[ƒ^‚ª‚·‚Å‚É“o˜^‚³‚ê‚Ä‚¢‚éê‡
    
ErrorHandler:
    '// ”­¶‚µ‚½ƒGƒ‰[‚ğŒÄ‚Ño‚µŒ³‚É“Š‚°‚é
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Err.Raise Err.Number, , Err.Description
End Sub
Private Function IsExpectedType(ByVal value As Variant, ByVal expectedType As VbVarType) As Boolean
    IsExpectedType = (VarType(value) = expectedType)
End Function
