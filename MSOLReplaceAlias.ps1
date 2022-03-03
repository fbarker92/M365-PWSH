Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force
Connect-ExchangeOnline
 
$CurrentUPN = Read-Host "Enter the Current UPN for the User"
$OldAlias = Read-Host "Enter the Alias address you would like to remove"
$UserName = Get-Mailbox -Identity $CurrentUPN | select "Name" -ExpandProperty Name

Set-Mailbox $UserName -EmailAddresses @{remove=$OldAlias}

Set-Mailbox -Identity mcollins@axcethr.com -EmailAddresses @{remove="mthacker@axcethr.com"}


Write-Host "Alias", $OldAlias, "successfuly removed from the user", $CurrentUPN -BackgroundColor Cyan -ForegroundColor Black