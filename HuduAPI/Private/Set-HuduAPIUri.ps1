function Set-HuduAPIUrl {
    [cmdletbinding()]
    param(
        
        [string]
        $base_uri
    )

    if ($base_url) {
        Set-Variable -Name HuduAPIUrl -Value $base_uri -Option ReadOnly -Scope Script -Force
    } else {
        $base_uri = Read-Host -Prompt "Enter the base URI for the Hudu API, this will include the version e.g. https://example.com/api/v1"
        Set-Variable -Name HuduAPIUrl -Value $base_uri -Option ReadOnly -Scope Script -Force
    }
    
    
    if ($HuduAPIKey -and $HuduAPIUrl) {
        Export-HuduAPIModuleSettings        
    }
    
    
}

