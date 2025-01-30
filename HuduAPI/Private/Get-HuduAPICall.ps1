function Get-HuduAPICall {
    param(
        [parameter(Mandatory=$true)]
        [string]
        $uriStem,

        [parameter(Mandatory=$false)]
        $body       
    )

    begin {
        if (-not ($HuduAPI_HEADERS.keys -contains "x-api-key")) {
            $HuduAPI_HEADERS.Add('x-api-key',(Get-HuduAPIKey))
        }
        
    }

    process {
        $uri = "$($HuduAPIUri)$($uriStem)"
        Write-Host "GET - $($uriStem)"

        try {
            if ($null -eq $body) {
                Invoke-RestMethod -Uri $uri -Method Get -Headers $HuduAPI_HEADERS
            } else {
                Invoke-RestMethod -Uri $uri -Method Get -Headers $HuduAPI_HEADERS -Body $body
            }
            
        } catch {
            Write-Host "Error: $($_.Exception.Message)"            
        }
    }

    end {
        $HuduAPI_HEADERS.Remove('x-api-key') | Out-Null
    }
}