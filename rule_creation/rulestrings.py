'''
Encode the input string and output as yara rule lines

1st arg should always be the string to encode

2nd arg is optional and specifies the offset to start at for the rule variable numbering

rulestrings.py "Mozilla"
$encstring_1 = "1vemlsbGF" ascii wide // Mozilla
$encstring_2 = "Nb3ppbGxh" ascii wide // Mozilla
$encstring_3 = "TW96aWxsY" ascii wide // Mozilla
$encstring_4 = "BNAG8AegBpAGwAbABhA" ascii wide // Mozilla
$encstring_5 = "TQBvAHoAaQBsAGwAYQB" ascii wide // Mozilla
$encstring_6 = "AE0AbwB6AGkAbABsAGEA" ascii wide // Mozilla

rulestrings.py "Mozilla" 7
$b64string_7 = "Nb3ppbGxh" ascii wide // Mozilla
$b64string_8 = "TW96aWxsY" ascii wide // Mozilla
$b64string_9 = "1vemlsbGF" ascii wide // Mozilla
$b64string_10 = "BNAG8AegBpAGwAbABhA" ascii wide // Mozilla
$b64string_11 = "TQBvAHoAaQBsAGwAYQB" ascii wide // Mozilla
$b64string_12 = "AE0AbwB6AGkAbABsAGEA" ascii wide // Mozilla

'''

import sys

encoding = 'BOTH'  # BOTH, UTF-8 or UTF-16LE

if len(sys.argv) > 1:

    if len(sys.argv[1]) < 5:
        print("String to encode must be at least 5 characters long")
        exit(1)

    stringtoencode = sys.argv[1]
    reversed_stringtoencode = stringtoencode[::-1]
    import rule_encode

    if len(sys.argv) == 3:
        try:
            counter = int(sys.argv[2])
        except:
            counter = 1
    else:
        counter = 1
    print("// UTF8 and UTF16-LE string base64 encoded")
    for i in rule_encode.get_base64variants(stringtoencode, encoding):
        print('$encstring_' + str(counter) + ' = "' + i + '" ascii wide // ' + stringtoencode)
        counter = counter + 1
    print("// string reversed UTF8 and UTF16-LE string base64 encoded")
    for i in rule_encode.get_base64variants(reversed_stringtoencode, encoding):
        print('$encstring_' + str(counter) + ' = "' + i + '" ascii wide // ' + reversed_stringtoencode)
        counter = counter + 1
    print("// hex encoded string - format present in embedded RTF objects")
    print('$encstring_' + str(counter) + ' = "' + rule_encode.get_hex_of_string(
        stringtoencode) + '" ascii wide nocase // ' + stringtoencode)
    counter = counter + 1
    print("// string reversed hex encoded string - format present in embedded RTF objects")
    print('$encstring_' + str(counter) + ' = "' + rule_encode.get_hex_of_string(
        reversed_stringtoencode) + '" ascii wide nocase // ' + reversed_stringtoencode)
    counter = counter + 1
    print("// base64 encoded, then hex encoded")
    for i in rule_encode.get_base64variants(stringtoencode, encoding):
        print('$encstring_' + str(counter) + ' = "' + rule_encode.get_hex_of_string(
            i) + '" ascii wide nocase // ' + i)
        counter = counter + 1
    print("// reversed string - frequently used obfuscation to evade tight static signatures")
    print('$encstring_' + str(counter) + ' = "' +
        reversed_stringtoencode + '" ascii wide nocase // ' + reversed_stringtoencode)
    counter = counter + 1