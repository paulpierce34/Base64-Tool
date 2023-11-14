## The purpose of this script is to encode/decode a string to/from base64

function Invoke-Base64StringEncode {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline, Helpmessage = "Please specify a string to encode", Position = 1)]
        [string[]]$EncodeText
    )
    process {
        return @{[string]$EncodeText = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($EncodeText))}
    }

}

function Invoke-Base64StringDecode {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, Helpmessage = "Please specify a string to decode", Position = 1)]
        [string[]]$DecodeText
    )
    process {
        Return @{[string]$DecodeText = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($EncodedText))}
    }
}
