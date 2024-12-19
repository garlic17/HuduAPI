function Get-HuduNetworks {
    <#
    .DESCRIPTION Retrieve a list of all Networks, with optional filtering.

    .PARAMETER Id
    Filter by id

    .PARAMETER CompanyId
    Filter by company_id

    .PARAMETER Slug
    Filter by slug

    .PARAMETER Name
    Filter by name

    .PARAMETER NetworkType
    Filter by network_type

    .PARAMETER Address
    Filter by address

    .PARAMETER LocationId
    Filter by location_id

    .EXAMPLE
    Get-HuduNetworks -id 1
    
    .EXAMPLE
    Get-HuduNetworks -Name 'My Network'

    .EXAMPLE
    Get-HuduNetworks -CompanyId 1

    .EXAMPLE
    Get-HuduNetworks -CompanyId 1 -NetworkType 1

    #>
    [CmdletBinding()]
    Param (
        [int]        
        $Id,

        [int]
        [Alias('company_id')]
        $CompanyId,

        [string]
        $Slug,

        [string]
        $Name,

        [int]
        [Alias('network_type')]
        $NetworkType,

        [string]
        $Address,

        [int]
        [Alias('location_id')]
        $LocationId
   
    )

    if ($Id) {
        $HuduRequest = @{
            Resource = "/api/v1/networks/$Id"
            Method = 'Get'        
        }
        
        Invoke-HuduRequest @HuduRequest        
    } else {        
        $Params =@{}
        if ($CompanyId) { $Params.Add('company_id', $CompanyId)}
        if ($Slug) { $Params.Add('slug', $Slug)}
        if ($Name) { $Params.Add('name', $Name)}
        if ($NetworkType) { $Params.Add('network_type', $NetworkType)}
        if ($Address) { $Params.Add('address', $Address)}
        if ($LocationId) { $Params.Add('location_id', $LocationId)}

        $HuduRequest = @{
            Resource = "/api/v1/networks"
            Method = 'Get'        
            Params = $Params
        }

        Invoke-HuduRequest @HuduRequest
    }


}