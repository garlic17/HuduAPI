function Set-HuduIPAddress {
    <#
    .DESCRIPTION
    Updates an existing IP Address in Hudu.

    .PARAMETER Id
    The ID of the IP Address to update.

    .PARAMETER NetworkId
    The ID of the network the IP Address is associated with.

    .PARAMETER CompanyId
    The ID of the company the IP Address is associated with.

    .PARAMETER Status
    The status of the IP Address.

    .PARAMETER FQDN
    The fully qualified domain name of the IP Address.

    .PARAMETER Description
    A description of the IP Address.

    .PARAMETER Comments
    Comments about the IP Address.

    .PARAMETER AssetId
    The ID of the asset the IP Address is associated with.

    .EXAMPLE
    Set-HuduIPAddress -Id 1 -Status "Assigned" -FQDN "test.hudu.com" -Description "Test IP Address" -Comments "This is a test IP Address" -AssetId 1

    .EXAMPLE
    Set-HuduIPAddress -Id 1 -CompanyId 2 -NetworkId 2
    Move an IP Address to a different company and network provided the IP Address is in the CIDR range of the new network.
    

    #>    
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory = $true)]
        [int]$Id,
        
        [Alias("network_id")]
        [int]$NetworkId,
        
        [Alias("company_id")]
        [int]$CompanyId,        

        [ValidateSet("Unassigned","Assigned","Reserved","Deprecated","DHCP","SLAAC")]
        [string]$Status,

        [string]$FQDN,

        [string]$Description,

        [string]$Comments,

        [Alias("asset_id")]
        [int]$AssetId
    )
    
    $IPAddress = [ordered]@{ip_address = [ordered]@{}}

    if ($NetworkId) { $IPAddress.ip_address.network_id = $NetworkId  }
    if ($CompanyId) { $IPAddress.ip_address.company_id = $CompanyId  }
    if ($Status) { $IPAddress.ip_address.status = $Status  }
    if ($FQDN) { $IPAddress.ip_address.fqdn = $FQDN  }
    if ($Description) { $IPAddress.ip_address.description = $Description  }
    if ($Comments) { $IPAddress.ip_address.comments = $Comments  }
    if ($AssetId) { $IPAddress.ip_address.asset_id = $AssetId  }

    $JSON = $IPAddress | ConvertTo-Json -Depth 10

    if ($PSCmdlet.ShouldProcess($Id)) {
        Invoke-HuduRequest -Method put -Resource "/api/v1/ip_addresses/$Id" -Body $JSON
    }    

}