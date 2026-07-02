Attribute VB_Name = "Module3_Log"
Option Explicit
Private Enum colProcessLog
'Public Enum colProcessLog
    実行日時 = 0
    実行者
    フォルダパス
    ファイル名
    レコード数
    読込レコード数
    エラーレコード数
    処理ステータス
    処理時間
    endCol = 処理時間
End Enum
Private Enum colErrorLog
'Public Enum colErrorLog
    実行日時 = 0
    実行者
    フォルダパス
    ファイル名
    エラーコード
    エラー行番号
    該当データ
    エラー理由
    endCol = エラー理由
End Enum
'// -------------------------------------------------------
'  処理ログ
'// -------------------------------------------------------
Public Sub CreateProcessCol(ByRef processLog() As Variant)
    ReDim processLog(colProcessLog.endCol, 0)
    
    processLog(colProcessLog.実行日時, 0) = "実行日時"
    processLog(colProcessLog.実行者, 0) = "実行者"
    processLog(colProcessLog.フォルダパス, 0) = "フォルダパス"
    processLog(colProcessLog.ファイル名, 0) = "ファイル名"
    processLog(colProcessLog.レコード数, 0) = "レコード数"
    processLog(colProcessLog.読込レコード数, 0) = "読込レコード数"
    processLog(colProcessLog.エラーレコード数, 0) = "エラーレコード数"
    processLog(colProcessLog.処理ステータス, 0) = "処理ステータス"
    processLog(colProcessLog.処理時間, 0) = "処理時間"
End Sub
Public Sub WriteProcessLog(ByRef processLog As Variant, ByRef cls04 As Cls4_Log)
    Dim writeRow As Long
    writeRow = UBound(processLog, 1) + 1
    ReDim Preserve processLog(colProcessLog.endCol, writeRow)
    
    '// ログを記録する
    '￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
    With cls04
        If Not .runDateTime = "" Then
            processLog(colProcessLog.実行日時, writeRow) = .runDateTime
        End If
        If Not .userName = "" Then
            processLog(colProcessLog.実行者, writeRow) = .userName
        End If
        If Not .folderPath = "" Then
            processLog(colProcessLog.フォルダパス, writeRow) = .folderPath
        End If
        If Not .fileName = "" Then
            processLog(colProcessLog.ファイル名, writeRow) = .fileName
        End If
        If Not .totalRecord = 0 Then
            processLog(colProcessLog.レコード数, writeRow) = .totalRecord
        End If
        If Not .readRecord = 0 Then
            processLog(colProcessLog.読込レコード数, writeRow) = .readRecord
        End If
        If Not .errorRecord = 0 Then
            processLog(colProcessLog.エラーレコード数, writeRow) = .errorRecord
        End If
        If Not .processStatus = "" Then
            processLog(colProcessLog.処理ステータス, writeRow) = .processStatus
        End If
        If Not .timeSpent = 0 Then
            processLog(colProcessLog.処理時間, writeRow) = .timeSpent
        End If
        
        '// ログを消去
        '￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
        Call ClearLog(cls04)
    End With
End Sub
Public Sub CreateErrorCol(ByRef errorLog() As Variant)
    ReDim errorLog(colErrorLog.endCol, 0)
    
    errorLog(colErrorLog.実行日時, 0) = "実行日時"
    errorLog(colErrorLog.実行者, 0) = "実行者"
    errorLog(colErrorLog.フォルダパス, 0) = "フォルダパス"
    errorLog(colErrorLog.ファイル名, 0) = "ファイル名"
    errorLog(colErrorLog.エラーコード, 0) = "エラーコード"
    errorLog(colErrorLog.エラー行番号, 0) = "エラー行番号"
    errorLog(colErrorLog.該当データ, 0) = "該当データ"
    errorLog(colErrorLog.エラー理由, 0) = "エラー理由"
End Sub
Public Sub WriteErrorLog(ByRef errorLog As Variant, ByRef cls04 As Cls4_Log)
    Dim writeRow As Long
    writeRow = UBound(errorLog, 1) + 1
    ReDim Preserve errorLog(colErrorLog.endCol, writeRow)
    
    '// ログを記録する
    '￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
    With cls04
        If Not .runDateTime = 0 Then
            errorLog(colErrorLog.実行日時, writeRow) = .runDateTime
        End If
        If Not .userName = "" Then
            errorLog(colErrorLog.実行者, writeRow) = .userName
        End If
        If Not .folderPath = "" Then
            errorLog(colErrorLog.フォルダパス, writeRow) = .folderPath
        End If
        If Not .fileName = "" Then
            errorLog(colErrorLog.ファイル名, writeRow) = .fileName
        End If
        If Not .errorCode = "" Then
            errorLog(colErrorLog.エラーコード, writeRow) = .errorCode
        End If
        If Not .errorRow = 0 Then
            errorLog(colErrorLog.エラー行番号, writeRow) = .errorRow
        End If
        If Not .relevantData = "" Then
            errorLog(colErrorLog.該当データ, writeRow) = .relevantData
        End If
        If Not .errorReason = "" Then
            errorLog(colErrorLog.エラー理由, writeRow) = .errorReason
        End If
    End With
End Sub
Public Sub ClearLog(ByRef cls04 As Cls4_Log)
    With cls04
        .runDateTime = 0
        .userName = ""
        .folderPath = ""
        .fileName = ""
        .totalRecord = 0
        .readRecord = 0
        .processStatus = ""
        .timeSpent = 0
        .errorRecord = 0
        .errorCode = ""
        .relevantData = ""
        .errorReason = ""
    End With
End Sub
'// -------------------------------------------------------
'  ログ取得
'// -------------------------------------------------------
Public Sub getCommonLog(ByRef cls04 As Cls4_Log, ByVal openFolderPath As String)
    '// 共通ログを取得
    '￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
    Call WriteRunDateTime(cls04)                          '// 実行日時
    Call WriteUserName(cls04)                              '// 実行者
    Call WriteFolderPath(cls04, openFolderPath)      '// フォルダパス
End Sub
Public Sub getCommonLogToFile(ByRef cls04 As Cls4_Log, ByVal openFolderPath As String, ByVal fileName As String)
    '// 共通ログを取得
    '￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
    Call WriteRunDateTime(cls04)                          '// 実行日時
    Call WriteUserName(cls04)                              '// 実行者
    Call WriteFolderPath(cls04, openFolderPath)      '// フォルダパス
    Call WriteFileName(cls04, fileName)                 '// ファイル名
End Sub
Public Sub getErrorF001(ByRef cls04 As Cls4_Log, ByVal startTime As Double)
    '// F001ログを取得
    '￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
    Dim endTime As Double: endTime = Timer
    
    ' // エラーログ
    Call WriteerrorCode(cls04, "F001")                                              '// エラーコード
    Call WriteErrorReason(cls04, "指定フォルダが存在しません。")         '// エラー理由
    
    '// 処理ログ
    Call WriteProcessStatus(cls04, "失敗")                                         '// 処理ステータス
    Call WriteTimeSpent(cls04, startTime, endTime)                          '// 処理時間
End Sub
Public Sub getErrorF002(ByRef cls04 As Cls4_Log, ByVal startTime As Double)
    '// F002ログを取得
    '￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
    Dim endTime As Double: endTime = Timer
    
    ' // エラーログ
    Call WriteerrorCode(cls04, "F002")                                                  '// エラーコード
    Call WriteErrorReason(cls04, "ファイルが選択されませんでした。")        '// エラー理由
    
    '// 処理ログ
    Call WriteProcessStatus(cls04, "失敗")                                              '// 処理ステータス
    Call WriteTimeSpent(cls04, startTime, endTime)                               '// 処理時間
End Sub
Public Sub getErrorE001(ByRef cls04 As Cls4_Log, ByVal startTime As Double, ByVal charCode As String)
    '// E001ログを取得
    '￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
    Dim endTime As Double: endTime = Timer
    
    ' // エラーログ
    Call WriteerrorCode(cls04, "E001")                                                                    '// エラーコード
    Call WriteErrorReason(cls04, "文字コードが" & charCode & "ではありません。")        '// エラー理由
    
    '// 処理ログ
    Call WriteProcessStatus(cls04, "失敗")                                                                '// 処理ステータス
    Call WriteTimeSpent(cls04, startTime, endTime)                                                 '// 処理時間
End Sub
Public Sub getErrorE002(ByRef cls04 As Cls4_Log, ByVal startTime As Double, ByVal targetContent As String)
    '// E002ログを取得
    '￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
    Dim endTime As Double: endTime = Timer
    
    ' // エラーログ
    Call WriteerrorCode(cls04, "E002")                                       '// エラーコード
    Call WriteErrorReason(cls04, "カラム名が一致しません。")        '// エラー理由
    Call WriteRelevantData(cls04, targetContent)                        '// 該当データ
    
    '// 処理ログ
    Call WriteProcessStatus(cls04, "失敗")                                  '// 処理ステータス
    Call WriteTimeSpent(cls04, startTime, endTime)                   '// 処理時間
End Sub
Public Sub getErrorE003(ByRef cls04 As Cls4_Log, ByVal startTime As Double)
    '// E001ログを取得
    '￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
    Dim endTime As Double: endTime = Timer
    
    ' // エラーログ
    Call WriteerrorCode(cls04, "E003")                                          '// エラーコード
    Call WriteErrorReason(cls04, "取引データが存在しません。")        '// エラー理由
    
    '// 処理ログ
    Call WriteProcessStatus(cls04, "失敗")                                      '// 処理ステータス
    Call WriteTimeSpent(cls04, startTime, endTime)                       '// 処理時間
End Sub
Public Sub WriteRunDateTime(ByRef cls04 As Cls4_Log)
    cls04.runDateTime = Format(Now, "yyyy/mm/dd/ hh:mm:ss")
End Sub
Public Sub WriteUserName(ByRef cls04 As Cls4_Log)
    cls04.userName = Environ("USERNAME")
End Sub
Public Sub WriteFolderPath(ByRef cls04 As Cls4_Log, ByVal folderPath As String)
    cls04.folderPath = folderPath
End Sub
Public Sub WriteFileName(ByRef cls04 As Cls4_Log, ByVal fileName As String)
    cls04.fileName = fileName
End Sub
Public Sub WriteerrorCode(ByRef cls04 As Cls4_Log, ByVal errorCode As String)
    cls04.errorCode = errorCode
End Sub
Public Sub WriteTotalRecord(ByRef cls04 As Cls4_Log, ByVal maxRecord As Long)
    cls04.totalRecord = maxRecord
End Sub
Public Sub WriteReadRecord(ByRef cls04 As Cls4_Log, ByVal readCount As Long)
    cls04.readRecord = readCount
End Sub
Public Sub WriteErrorRecord(ByRef cls04 As Cls4_Log, ByVal errorCount As Long)
    cls04.errorRecord = errorCount
End Sub
Public Sub WriteProcessStatus(ByRef cls04 As Cls4_Log, ByVal status As String)
    cls04.processStatus = status
End Sub
Public Sub WriteTimeSpent(ByRef cls04 As Cls4_Log, ByVal startTime As Double, ByVal endTime As Double)
    cls04.timeSpent = endTime - startTime
End Sub
Public Sub WriteErrorRow(ByRef cls04 As Cls4_Log, ByVal errorRowNumber As Long)
    cls04.errorRow = errorRowNumber
End Sub
Public Sub WriteErrorReason(ByRef cls04 As Cls4_Log, ByVal errorContent As String)
    cls04.errorReason = errorContent
End Sub
Public Sub WriteRelevantData(ByRef cls04 As Cls4_Log, ByVal targetContent As String)
    cls04.relevantData = targetContent
End Sub
