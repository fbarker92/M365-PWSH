Set-ExecutionPolicy RemoteSigned -Force
Import-Module MSOnline -Force
Connect-MsolService
 
Get-MsolUser -All | FT DisplayName,UserPrincipalName,PasswordNeverExpires 