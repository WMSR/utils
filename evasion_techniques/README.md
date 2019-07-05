# Geo-Gating
## By Language
### VBA

#### Only run in environments using Unicode

*SHA256: 0f6fdc6c9d0181616920be9e10316bdbd97c324892db9bb87ab8b9a8a8f60ead*

On a non-unicode Windows system, this raises an error and can prevent macro execution.

```vbscript
    If InStr(DTt, Chr(-27570)) Then
    frmWait.Show 0
```

#### Only run in environments with the datetime in Italian in the month of June
*SHA256: 3d293298aaf5d5539049026e5b02bc6dfe3a5f55b20f27a782ffd50798f08a3f*

```vbscript
Function DTt()
DTt = Format(Date, "Lon" & "g D" & "ate")

If InStr(DTt, "no") Then
    timWW.Show 0
    DoEvents
    Application.ScreenUpdating = False
    bool = CBool("true"): sim 4
    Debug.Print "Hyp = CDbl(Sqr(Opp ^ 2 + Adj ^ 2))": ligamii
    lintersteel
Else
    MsgBox ("errore"): Application.Quit
End If
```

June in Italian is "Giugno", so `If InStr(DTt, "no")` returns True
