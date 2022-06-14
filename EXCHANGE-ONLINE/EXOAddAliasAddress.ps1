Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force
Connect-ExchangeOnline
 
$CurrentUPN = Read-Host "Enter the Current UPN for the User"

$NewAlias = Read-Host "Enter the Alias address you would like to add"

$UserName = Get-Mailbox -Identity $CurrentUPN | select "Name" -ExpandProperty Name

Set-Mailbox $UserName -EmailAddresses @{add=$NewAlias}

Write-Host "Alias", $NewAlias, "successfuly added to the user", $CurrentUPN -BackgroundColor Cyan -ForegroundColor Black

