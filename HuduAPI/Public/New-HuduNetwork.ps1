function New-HuduNetwork {
    <#
    .DESCRIPTION 
    Add a new network to the system.

    .PARAMETER Address
    The IPv4 CIDR address of the network.

    .PARAMETER CompanyId
    The company ID of the network.

    .PARAMETER NetworkType
    The type of network.

    .PARAMETER Name
    The name of the network.

    .PARAMETER Description
    The description of the network.

    .PARAMETER LocationId
    The location ID of the network.

    .PARAMETER ParentNetworkId
    Parent Network ID

    .EXAMPLE
    New-HuduNetwork -Address "10.255.255.0/24" -CompanyId 1

    .EXAMPLE
    New-HuduNetwork -Address "10.255.255.4/30" -CompanyId 1 -Description "This is a test network."

    #>
    [CmdletBinding(SupportsShouldProcess)]
    param (

        [Parameter(Mandatory = $true)]
        [string]$Address,

        [Alias("company_id")]
        [Parameter(Mandatory = $true)]
        [int]$CompanyId,
        
        [Alias("network_type")]
        [int]$NetworkType,
    
        [string]$Name,
        
        [string]$Description,

        [Alias("location_id")]
        [int]$LocationId,

        [Alias('parent_network_id')]
        [Int]$ParentNetworkId = ''


    )

    $Network = [ordered]@{network = [ordered]@{}}

    $Network.network.add("address", $Address)
    $Network.network.add("company_id", $CompanyId)

    if ($NetworkType) { $Network.network.add("network_type", $NetworkType) }
    if ($Name) { $Network.network.add("name", $Name) }    
    if ($Description) { $Network.network.add("description", $Description) }
    if ($LocationId) { $Network.network.add("location_id", $LocationId) }
    if ($ParentNetworkId) { $Network.network.add('parent_network_id', $ParentNetworkId) }

    $JSON = $Network | ConvertTo-Json -Depth 10

    if ($PSCmdlet.ShouldProcess($Address)) {
       Invoke-HuduRequest -Method post -Resource "/api/v1/networks" -Body $JSON
    }

}