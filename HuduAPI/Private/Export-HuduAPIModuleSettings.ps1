function Export-HuduAPIModuleConfig {
    $ModuleConfig = Join-Path -Path $ModuleConfigPath -ChildPath $ModuleConfigFile
    if ($HuduAPIKey -and $HuduAPIUrl) {
        $secureString = $HuduAPIKey | ConvertFrom-SecureString
        
        New-Item -ItemType Directory -Path $ModuleConfigPath -Force | Out-Null

        $ModuleConfigData = @{
            HuduAPIKey = $secureString
            HuduAPIUrl = $HuduAPIUrl
        }
        $ModuleConfigData |Out-File -FilePath $ModuleConfig -Force
    } else {
        Write-Host "Failed to export the HuduApi module config file." -ForegroundColor Red
    }
}