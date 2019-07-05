# Geo-Gating
## VBA
### Only run in environments using Unicode

*SHA256: 0f6fdc6c9d0181616920be9e10316bdbd97c324892db9bb87ab8b9a8a8f60ead*

On a non-unicode Windows system, this raises an error and can prevent macro execution.

```vbscript
    If InStr(DTt, Chr(-27570)) Then
    frmWait.Show 0
```

### Only run in environments with the datetime in Italian in the month of June
*SHA256: 3d293298aaf5d5539049026e5b02bc6dfe3a5f55b20f27a782ffd50798f08a3f*

Since June in Italian is "Giugno", `If InStr(DTt, "no")` returns True if your DateTime settings are set to Italian.

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
### Only run in environments where the currency symbol is ¥ and the xlCountrySetting is from Japan or Korea

The character returned from `Asc(Format(msoSyncCompareAndMerge, "cur" + "rency"))` will be ¥ if the system's Unicode settings are set to Japanese. If set to US English, it returns a single backslash `\`.

Variable `DateAndTime` is the country code from `Application.international(xlCountrySetting)`. 81 is Japan and 82 is Korea.

*SHA256: 23e85ee19a2f46f4f462e72995b6a91616ea2f315908c1566c36cd0afc3aa200*

```vbscript
ZeRo = Asc(Format(msoSyncCompareAndMerge, "cur" + "rency"))
Function DateAndTime()
DateAndTime = Application.International(xlCountrySetting)
If ZeRo = 92 And DateAndTime > 80 And DateAndTime < 83 Then ConflictResolutions1
```

## PowerShell

### Only run in an environment where the Windows is displaying Japanese for all native OS functionality

`${Sc}=12*1000+499` is the character code for the Japanese Katakana character ビ ("bi", sounds like like "bee")

If the system is displaying Japanese for native OS text, you will get `64-ビット` when querying Win32_OperatingSystem > osarchitecture

It is not enough to have your Unicode language set to Japanese - the full Japanese language pack must be installed, and the OS native language set to Japanese.

```powershell
${Sc}=12*1000+499
if((.('g'+'et-wMIOBj'+'eC'+'t') ('W'+('in32'+'_O')+('pe'+'r')+('at'+'ing')+('Syst'+'em'))).OsArChItecTURe -match [char]`${s`C}){...}
```

# Anti-Emulation
## VB
### Out-of-order variable assignment

In VB, constant variable assignment takes place first, regardless of where it is located in the code flow. Emulators may not accurately emulate this, so you can use the outcome of a test of the functionality to determine whether or not to terminate the script.

*SHA256: 52df163363942aebfddb8252b9fde1bc9e5e633a77e2cb6d4533e822a96929a8*

Note: this is not the VBA from the sample, but it demonstrates the anti-emulation technique in VB

```vbscript
A=Array(b,c)
d = A(0) + 1000

Wscript.Echo d

const b=424
const c=13

'Wscript.Echo A(0)
'Wscript.Echo A(1)
'Wscript.Echo d
```

### Emulation DOS

Emulation is very likely to be more expensive than native code execution. Creating expensive loops is one way to slow down and time out emulation.

*SHA256: 3d293298aaf5d5539049026e5b02bc6dfe3a5f55b20f27a782ffd50798f08a3f*

```vbscript
Function ligamii()
    For i = 1 To 1000000000
        Q = poudog(3)
        If Q = "ttt" Then Exit For
    Next
End Function
Function poudog(n)
    Dim i, j, m, s, chars
    Randomize: cM = "abcdefghijklmnopqrstuvwxyzQWERTYUIOPASDFGHJKLZXCVBNM"
    m = Len(cM)
    For i = 1 To n
        j = 1 + Int(m * Rnd())
        s = s & Mid(cM, j, 1)
    Next
    poudog = s
End Function
```

### Emulation DOS targeting loop shortcuts

A technique to deal with anti-emulation DOS loops is to detect a DOS loop and shortcut the loop completion. After a few times through the loop, the emulator can set the loop condition so that the code can continue past the loop more quickly.

This technique targets such shortcuts by checking if you're nearly done completing the loop normally. In this case, if you have looped 5,010,014 times `If (XyrZn=5010014) Then` Then add 424 to XIcCa `XIcCa=XIcCa+424`. If the value of XIcCa remains 1,600,977 after the loop, the script quits. Unless the loop runs its course normally, its unlikely the emulator will reach the 5 millionth time through the loop and correctly set the variable.

*SHA256: 52df163363942aebfddb8252b9fde1bc9e5e633a77e2cb6d4533e822a96929a8*

```vbscript
Function fcUbL()
  gymc = 2868
  XyrZn=424
  XIcCa=1600977
  Dim KTSVH
  KTSVH = 3161
  Do While XyrZn < 5010421
    If (XyrZn=5010421) Then
      Dim TxtYX
      TxtYX = 1927
      WScript.Quit
      Dim bOZN
      bOZN = 7705
    Else
      BlWYV = 9645
    End if
    Dim BqJQe
    BqJQe = 8447
    If (XyrZn=5010014) Then
      XIcCa=XIcCa+424
    Else
    End if
    Dim GuWq
    GuWq = 3300
    XyrZn=XyrZn+1
  Loop
  If (XIcCa=1600977) Then
    WScript.Quit
    Dim PdyIR
    PdyIR = 7373
  End if
End Function
```

# Machine Learning Evasion
## VB
### Code from legitimate scripts as string literals

If the decompressed VBA is being used to train a ML model without parsing and recognizing executable vs. non-executable code, string literals containing valid-looking VBA could make a script look more legitimate and evade ML detection

*SHA256: 3d293298aaf5d5539049026e5b02bc6dfe3a5f55b20f27a782ffd50798f08a3f*

```vbscript
DTt = Format(Date, "Lon" & "g D" & "ate")
End Function
Function co()
coo = "MsgBox (""Your Interest to Date is "" & int_now & ""."")": co = Cells
End Function
Function SediR()
fbb = False
remmi = "If (pFeatureLayer.FeatureClass.ShapeType = esriGeometryPolygon) Then"
misR = 19
tre1 = ""
For u = 1 To 4
```
