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

## PowerShell

### Only run in an environment where the Windows is displaying Japanese for all native OS functionality

`${Sc}=12*1000+499` is the character code for the Japanese Katakana character ビ ("bi", sounds like like "bee")

If the system is displaying Japanese for native OS text, you will get `64-ビット` when querying Win32_OperatingSystem > osarchitecture

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
