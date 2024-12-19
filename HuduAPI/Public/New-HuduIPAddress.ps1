function New-HuduIPAddress {
    <#
    .DESCRIPTION 
    Creates a new IP Address in Hudu.

    .PARAMETER Address
    The IP Address to create.

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
    New-HuduIPAddress -Address "10.255.255.1" -NetworkId 1 -CompanyId 1

    .EXAMPLE
    New-HuduIPAddress -Address "10.255.255.1" -NetworkId 1 -CompanyId 1 -Status "Assigned" -FQDN "test.hudu.com" -Description "Test IP Address" -Comments "This is a test IP Address" -AssetId 1


    #>
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory = $true)]
        [string]$Address,
        
        [Parameter(Mandatory = $true)]
        [Alias("network_id")]
        [int]$NetworkId,

        [Parameter(Mandatory = $true)]
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

    $IPAddress.ip_address.Add("address", $Address)
    $IPAddress.ip_address.Add("network_id", $NetworkId)

    if ($CompanyId) { $IPAddress.ip_address.Add("company_id", $CompanyId) }
    if ($Status) { $IPAddress.ip_address.Add("status", $Status) }
    if ($FQDN) { $IPAddress.ip_address.Add("fqdn", $FQDN) }
    if ($Description) { $IPAddress.ip_address.Add("description", $Description) }
    if ($Comments) { $IPAddress.ip_address.Add("comments", $Comments) }
    if ($AssetId) { $IPAddress.ip_address.Add("asset_id", $AssetId) }

    $JSON = $IPAddress | ConvertTo-Json -Depth 10

    if ($PSCmdlet.ShouldProcess($Address)) {
        Invoke-HuduRequest -Method post -Resource "/api/v1/ip_addresses" -Body $JSON
    }
}