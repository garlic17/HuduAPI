function Remove-HuduNetwork {
    <#
    .DESCRIPTION
    Delete a network

    .PARAMETER Id
    Network Id

    .EXAMPLE
    Remove-HuduNetwork -Id 1
    
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory = $true)]
        [int]$Id
    )

    if ($PSCmdlet.ShouldProcess($Id)) {
        Invoke-HuduRequest -Method delete -Resource "/api/v1/networks/$Id"
    }
}