function Invoke-HuduAPIInitializeHeaders  {
    $tmp_headers =  New-Object "System.Collections.Generic.Dictionary[[String],[String]]"  
    $tmp_headers.Add('Content-Type','application/json')
    $tmp_headers.Add('Accept','application/json')
    Set-Variable -Name HuduAPI_HEADERS -Value $tmp_headers -Option ReadOnly -Scope Script -Force
}