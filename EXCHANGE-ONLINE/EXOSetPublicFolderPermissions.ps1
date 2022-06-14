Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force
Connect-ExchangeOnline

Get-PublicFolder -Identity "\" -Recurse | Add-PublicFolderClientPermission -User user@domain.com -AccessRights Owner

