# Rule creation utilities

## rulestrings.py
*python3 only*

Usage:

For a new rule:

```
 python3 rulestrings.py Mozilla
// UTF8 and UTF16-LE string base64 encoded
$encstring_1 = "TW96aWx" ascii wide // Mozilla
$encstring_2 = "Nb3ppbGx" ascii wide // Mozilla
$encstring_3 = "1vemlsbGF" ascii wide // Mozilla
$encstring_4 = "TQBvAHoAaQBsAGwA" ascii wide // Mozilla
$encstring_5 = "BNAG8AegBpAGwAbABh" ascii wide // Mozilla
$encstring_6 = "AE0AbwB6AGkAbABsAGEA" ascii wide // Mozilla
// string reversed UTF8 and UTF16-LE string base64 encoded
$encstring_7 = "YWxsaXp" ascii wide // allizoM
$encstring_8 = "hbGxpem9" ascii wide // allizoM
$encstring_9 = "FsbGl6b01" ascii wide // allizoM
$encstring_10 = "YQBsAGwAaQB6AG8A" ascii wide // allizoM
$encstring_11 = "BhAGwAbABpAHoAbwBN" ascii wide // allizoM
$encstring_12 = "AGEAbABsAGkAegBvAE0A" ascii wide // allizoM
// hex encoded string - format present in embedded RTF objects
$encstring_13 = "4d6f7a696c6c61" ascii wide nocase // Mozilla
// string reversed hex encoded string - format present in embedded RTF objects
$encstring_14 = "616c6c697a6f4d" ascii wide nocase // allizoM
// reversed string - frequently used obfuscation to evade tight static signatures
$encstring_15 = "allizoM" ascii wide nocase // allizoM
```

Starting at a certain offset:

```
python3 rulestrings.py Mozilla 13
// UTF8 and UTF16-LE string base64 encoded
$encstring_13 = "TW96aWx" ascii wide // Mozilla
$encstring_14 = "Nb3ppbGx" ascii wide // Mozilla
$encstring_15 = "1vemlsbGF" ascii wide // Mozilla
$encstring_16 = "TQBvAHoAaQBsAGwA" ascii wide // Mozilla
$encstring_17 = "BNAG8AegBpAGwAbABh" ascii wide // Mozilla
$encstring_18 = "AE0AbwB6AGkAbABsAGEA" ascii wide // Mozilla
// string reversed UTF8 and UTF16-LE string base64 encoded
$encstring_19 = "YWxsaXp" ascii wide // allizoM
$encstring_20 = "hbGxpem9" ascii wide // allizoM
$encstring_21 = "FsbGl6b01" ascii wide // allizoM
$encstring_22 = "YQBsAGwAaQB6AG8A" ascii wide // allizoM
$encstring_23 = "BhAGwAbABpAHoAbwBN" ascii wide // allizoM
$encstring_24 = "AGEAbABsAGkAegBvAE0A" ascii wide // allizoM
// hex encoded string - format present in embedded RTF objects
$encstring_25 = "4d6f7a696c6c61" ascii wide nocase // Mozilla
// string reversed hex encoded string - format present in embedded RTF objects
$encstring_26 = "616c6c697a6f4d" ascii wide nocase // allizoM
// reversed string - frequently used obfuscation to evade tight static signatures
$encstring_27 = "allizoM" ascii wide nocase // allizoM
```
