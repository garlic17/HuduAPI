function Get-HuduAPIKey {
    if ($null -eq $HuduAPIKey) {
        Write-Error "No API key exists.  Please execute Set-HuduAPIKey to set your API key."
    } else {
        [PSCredential]::new(0,($HuduAPIKey)).GetNetworkCredential().Password
    }
}