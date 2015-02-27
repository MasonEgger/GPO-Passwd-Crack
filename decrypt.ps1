$AesObject = New-Object System.Security.Cryptography.AesCryptoServiceProvider
[Byte[]] $AesKey = @(0x4e,0x99,0x06,0xe8,0xfc,0xb6,0x6c,0xc9,0xfa,0xf4,0x93,0x10,0x62,0x0f,0xfe,0xe8,0xf4,0x96,0xe8,0x06,0xcc,0x05,0x79,0x90,0x20,0x9b,0x09,0xa4,0x33,0xb6,0x6c,0x1b)
$AesIV = New-Object Byte[]($AesObject.IV.Length)
$AesObject.IV = $AesIV
$AesObject.Key = $AesKey
$DecryptorObject = $AesObject.CreateDecryptor()
$Base64Decoded = [Convert]::FromBase64String("Password_Goes_HERE(Padding may need to be added)")
[Byte[]] $OutBlock = $DecryptorObject.TransformFinalBlock($Base64Decoded, 0, $Base64Decoded.length)
echo ([System.Text.UnicodeEncoding]::Unicode.GetString($OutBlock))
cmd /c pause | out-null