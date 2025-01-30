function Import-HuduAPIModuleConfig {
    $ModuleConfig = Join-Path -Path $ModuleConfigPath -ChildPath $ModuleConfigFile
    if (Test-Path -Path $ModuleConfig) {
        Import-LocalizedData -BaseDirectory $ModuleConfigPath -FileName $ModuleConfigFile
    } else {
        Write-Host "No module config file found at $($ModuleConfig)." -ForegroundColor Yellow
        Write-Host "Please execute Set-HuduAPIKey to set your API key." -ForegroundColor Yellow
        Write-Host "Please execute Set-HuduAPIUri to set your API URL." -ForegroundColor Yellow        
    }
}
