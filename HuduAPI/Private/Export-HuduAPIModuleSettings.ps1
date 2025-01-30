function Export-HuduAPIModuleConfig {
    $ModuleConfig = Join-Path -Path $ModuleConfigPath -ChildPath $ModuleConfigFile
    if ($HuduAPIKey -and $HuduAPIUri) {
        $secureString = $HuduAPIKey | ConvertFrom-SecureString
        
        New-Item -ItemType Directory -Path $ModuleConfigPath -Force | Out-Null

        $ModuleConfigData = @{
            HuduAPIKey = $secureString
            HuduAPIUri = $HuduAPIUri
        }
        $ModuleConfigData |Out-File -FilePath $ModuleConfig -Force
    } else {
        Write-Host "Failed to export the HuduApi module config file." -ForegroundColor Red
    }
}