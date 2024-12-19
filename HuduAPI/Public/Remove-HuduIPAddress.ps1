function Remove-HuduIPAddress {
    <#
    .DESCRIPTION
    Delete an IP Address

    .PARAMETER Id
    IP Address Id

    .EXAMPLE
    Remove-HuduIPAddress -Id 1
    
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true)]        
        [int]$Id
    )
    
    if ($PSCmdlet.ShouldProcess($Id)) {
        Invoke-HuduRequest -Method delete -Resource "/api/v1/ip_addresses/$Id"
    }
}