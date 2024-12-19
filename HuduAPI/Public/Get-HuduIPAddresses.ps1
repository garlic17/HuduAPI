
function Get-HuduIPAddresses {
    <#
    .DESCRIPTION Retrieve a list of all IP Addresses, with optional filtering.

    .PARAMETER NetworkId 
    Filter by network_id

    .PARAMETER IPAddress
    Filter by IP address

    .PARAMETER Status

    .PARAMETER FQDN 
    Filter by FQDN

    .PARAMETER AssetId
    Filter by asset_id

    .PARAMETER CompanyId
    Filter by company_id

    .EXAMPLE
    Get-HuduIPAddresses -IPAddress 10.255.255.1

    .EXAMPLE
    Get-HuduIPAddresses -NetworkId 1

    .EXAMPLE
    Get-HuduIPAddresses -CompanyId 1 -Status 'Active'


    #>
    [CmdletBinding()]
    Param (
        [int]
        [Alias('network_id')]
        $NetworkId,

        [string]
        [Alias('address')]
        $IPAddress,

        [string]
        $Status,

        [string]
        $FQDN,

        [int]
        [Alias('asset_id')]
        $AssetId,

        [int]
        [Alias('company_id')]
        $CompanyId


    )

    if ($IPAddress) {
        $HuduRequest = @{
            Resource = "/api/v1/ip_addresses/$IPAddress"
            Method   = 'GET'
        }
        Invoke-HuduRequest @HuduRequest
    } else {
        $Params = @{}
        if ($NetworkId) { $Params.network_id = $NetworkId }
        if ($Status) { $Params.status = $Status }
        if ($FQDN) { $Params.fqdn = $FQDN }
        if ($AssetId) { $Params.asset_id = $AssetId }
        if ($CompanyId) { $Params.company_id = $CompanyId }
        $HuduRequest = @{
            Resource = "/api/v1/ip_addresses"
            Method   = 'GET'
            Params   = $Params
        }
        Invoke-HuduRequest @HuduRequest
        
    }

}