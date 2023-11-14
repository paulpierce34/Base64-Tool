## The purpose of this script is to encode/decode a string to/from base64

function Invoke-Base64StringEncode {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline, Helpmessage = "Specify a string to encode", Position = 1)]
        [string[]]$EncodeText
    )
    process {
        $Response = @{}
        Foreach($Text in $EncodeText) {
            $Response += @{[string]$Text = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($Text))}
        }
        return $Response
    }
}

function Invoke-Base64StringDecode {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, Helpmessage = "Specify a string to decode", Position = 1)]
        [string[]]$DecodeText
    )
    process {
        $Response = @{}
        Foreach($Text in $DecodeText) {
            $Response += @{[string]$DecodeText = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($EncodedText))}
        }
        return $Response
    }
}
