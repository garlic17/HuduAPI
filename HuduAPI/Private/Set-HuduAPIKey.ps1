function Set-HuduAPIKey {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline)]
        [string]
        $ApiKey
    )
    
    if ($ApiKey) {
        $tmp_api_key = ConvertTo-SecureString $ApiKey -AsPlainText -Force
        Set-Variable -Name HuduAPIKey -Value $tmp_api_key -Option ReadOnly -Scope Script -Force
    } else {
        $tmp_api_key = Read-Host -Prompt "Enter your Hudu API key" -AsSecureString
        Set-Variable -Name HuduAPIKey -Value $tmp_api_key -Option ReadOnly -Scope Script -Force
    }
    
    if ($HuduAPIKey -and $HuduAPIUri) {
        Export-HuduAPIModuleSettings        
    }
}
