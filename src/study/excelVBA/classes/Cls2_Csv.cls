VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Cls2_csv"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Public Function IsCharCode(ByVal filePath As String, ByVal charCord As String) As Boolean
    Dim adoSt As Object
    Set adoSt = CreateObject("ADODB.Stream")
    
    With adoSt
        '// ƒoƒCƒiƒŠƒ‚[ƒh‚Åƒtƒ@ƒCƒ‹‚ğŠJ‚­
        'PPPPPPPPPPPPPPPPPPPPPPPPP
        .Type = 1 'adTypeBinary
        .Open
        .LoadFromFile filePath
        
        '// ƒeƒLƒXƒgƒ‚[ƒh‚É•ÏX‚µA•¶šƒR[ƒh‚ğ©“®”»•Ê‚·‚é
        'PPPPPPPPPPPPPPPPPPPPPPPPP
        .Type = 2 'adTypeText
        .Charset = "_autodetect_all"
        
        If .Charset = charCord Then
            IsCharCode = True
        Else
            IsCharCode = False
        End If
    End With
    
    '// Œãn––
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Set adoSt = Nothing
End Function
Public Sub CsvReading(ByVal filePath As String, ByVal charCode As String, ByRef myArray() As Variant)
    Dim i As Long
    Dim j As Long
    Dim strLine As String
    Dim arrLine As Variant
    
    '// ADODB.StreamƒIƒuƒWƒFƒNƒg‚ğ¶¬
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Dim adoSt As Object
    Set adoSt = CreateObject("ADODB.Stream")
    
    i = 0
    With adoSt
        .Charset = charCode                                                              ' Stream‚Åˆµ‚¤•¶šƒR[ƒh‚ğİ’è
        .Open                                                                                   ' Stream‚ğƒI[ƒvƒ“
        .LoadFromFile (filePath)                                                          ' ƒtƒ@ƒCƒ‹‚©‚çStream‚Éƒf[ƒ^‚ğ“Ç‚İ‚Ş
        
        Do Until .EOS                                                                         ' Stream‚Ì––”ö‚Ü‚ÅŒJ‚è•Ô‚·
            strLine = .ReadText(adReadLine)                                         ' Stream‚©‚ç‚Psæ‚è‚İ
            arrLine = Split(Replace(replacecolon(strLine), """", ""), ":")     ' strLine‚ğƒJƒ“ƒ}‚Å‹æØ‚èarrLine‚ÉŠi”[
            
            For j = 0 To UBound(arrLine) Step 1
                myArray(i, j) = arrLine(j)
            Next j
            i = i + 1
        Loop
        .Close
    End With
    
    '// Œãn––
    'PPPPPPPPPPPPPPPPPPPPPPPPP
    Set adoSt = Nothing
    Erase strLine
    Erase arrLine
End Sub
