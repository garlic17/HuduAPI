function Remove-HuduWebsite {
    Param (
      [Parameter(Mandatory=$true)]
      [Int]$Id =''
    )
      
    $Response = Invoke-HuduRequest -Method delete -Resource "/api/v1/websites/$Id"
    
    $Response
    
  }