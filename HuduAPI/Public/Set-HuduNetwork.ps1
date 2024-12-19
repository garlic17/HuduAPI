function Set-HuduNetwork {
    <#
    .DESCRIPTION 
    Modify details of an existing network.

    .PARAMETER Id
    The ID of the network to modify.

    .PARAMETER Name
    The name of the network.
   
    .PARAMETER Address
    The IPv4 CIDR address of the network.

    .PARAMETER NetworkType
    The type of network.

    .PARAMETER CompanyId
    The company ID of the network.

    .PARAMETER Description
    The description of the network.

    .PARAMETER LocationId
    The location ID of the network.

    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param (
        [Parameter(Mandatory = $true)]
        [int]$Id,

        [string]$Name,

        [string]$Address,

        [Alias("network_type")]
        [int]$NetworkType,

        [Alias("company_id")]
        [int]$CompanyId,

        [Alias("location_id")]
        [int]$LocationId,

        [string]$Description


    )
    $Network = [ordered]@{network = [ordered]@{}}

    if ($Name) { $Network.network.add("name", $Name) }
    if ($Address) { $Network.network.add("address", $Address) }
    if ($NetworkType) { $Network.network.add("network_type", $NetworkType) }
    if ($CompanyId) { $Network.network.add("company_id", $CompanyId) }
    if ($LocationId) { $Network.network.add("location_id", $LocationId) }
    if ($Description) { $Network.network.add("description", $Description) }

    $JSON = $Network | ConvertTo-Json -Depth 10

    if ($PSCmdlet.ShouldProcess($Id)) {
        Invoke-HuduRequest -Method put -Resource "/api/v1/networks/$Id" -Body $JSON
    }
}