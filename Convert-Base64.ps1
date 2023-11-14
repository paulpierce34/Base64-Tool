## The purpose of this script is to encode/decode a string to/from base64


function Encode-String{
[CmdletBinding()]
param(

[Parameter(Mandatory, Helpmessage="Please specify a string to encode", Position=1)]
[string[]]$Text

)

$Bytes = [System.Text.Encoding]::Unicode.GetBytes($Text)
$global:EncodedText = [Convert]::ToBase64String($Bytes)
write-host -Foregroundcolor Cyan "Encoded base64: $EncodedText"

}


function Decode-String{
[CmdletBinding()]
param (

[Parameter(Helpmessage="Please specify a string to decode", Position=1)]
[string[]]$DecodeText

)

if ($EncodedText){

$PromptUser = Read-host "Encoded variable detected. Did you want to decode this or something else? (type yes or no)"

if ($PromptUser -notmatch "y" -or $PromptUser -notmatch "yes"){

$DecodePrompt = Read-Host "Please supply a base64 encoded string for me to decode"
$result = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($DecodePrompt))
write-host -Foregroundcolor Green "Base64 decoded string:" $result

}
else {

$result = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($EncodedText))
write-host -Foregroundcolor Green "Base64 decoded string:" $result

}
}
}

