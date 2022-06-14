Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force
Connect-ExchangeOnline

new-moverequest -identity user@domain.com
Get-MoveRequest -Identity user@domain.com
