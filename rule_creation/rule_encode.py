'''
return the UTF8, UTF16-LE or both sets of base64 encoded possibilities for a string with the variable data trimmed

Examples:

print(get_base64variants('Mozilla', 'UTF-8'))

print(get_base64variants('Mozilla', 'UTF-16LE'))

print(get_base64variants('Mozilla', 'BOTH'))

'''

def get_base64variants(string_to_encode, encoding):
    debug = False
    import base64
    import string

    base64_variants = set()

    if encoding.upper() == 'UTF-8' or encoding.upper() == 'BOTH':
        for i in string.ascii_letters:
            for pre in range(0, 3):
                raw = str(base64.b64encode(bytearray((pre * i) + string_to_encode + (i * 2), encoding='UTF-8')))
                if pre == 0:
                    base64_variants.add(raw[2:-6])
                    if debug == True:
                        print("UTF-8 - pre 0 : " + raw[2:-6])
                elif pre == 1:
                    base64_variants.add(raw[4:-6])
                    if debug == True:
                        print("UTF-8 - pre 1 : " + raw[4:-6])
                elif pre == 2:
                    base64_variants.add(raw[5:-6])
                    if debug == True:
                        print("UTF-8 - pre 2 : " + raw[5:-6])
    if encoding.upper() == 'UTF-16LE' or encoding.upper() == 'BOTH':
        for i in string.ascii_letters:
            for pre in range(0, 3):
                raw = str(base64.b64encode(bytearray((pre * i) + string_to_encode + (i * 2), encoding='UTF-16LE')))
                if pre == 0:
                    base64_variants.add(raw[2:-9])
                    if debug == True:
                        print("UTF-16LE - pre 0 : " + raw[2:-9])
                elif pre == 1:
                    base64_variants.add(raw[4:-9])
                    if debug == True:
                        print("UTF-16LE - pre 1 : " + raw[4:-9])
                elif pre == 2:
                    base64_variants.add(raw[6:-9])
                    if debug == True:
                        print("UTF-16LE - pre 2 : " + raw[6:-9])


    return sorted(base64_variants, key=len)

def get_hex_of_string(string_to_encode):
    hex_to_return = str()
    for character in string_to_encode:
        this_character_hex = str(hex(ord(character)))
        if len(this_character_hex) == 4:
            hex_to_return = hex_to_return + this_character_hex.replace("0x", "")
        elif len(this_character_hex) == 3:
            hex_to_return = hex_to_return + this_character_hex.replace("0x", "0")
    return hex_to_return