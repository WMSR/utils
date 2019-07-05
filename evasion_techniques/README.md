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

