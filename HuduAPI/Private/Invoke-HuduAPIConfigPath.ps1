function Invoke-HuduAPIConfigPath {
    $ModuleConfigPath = "~/HuduApiV1"
    $ModuleConfigFile = "config.psd1"

    Set-variable -name ModuleConfigPath -value $ModuleConfigPath -option ReadOnly -Scope Script
    Set-variable -name ModuleConfigFile -value $ModuleConfigFile -option ReadOnly -Scope Script   
}



