Set-ExecutionPolicy RemoteSigned -Force

install-module msonline -Force
connect-msolservice

Get-MsolUser -ReturnDeletedUsers 

Remove-MsolUser -UserPrincipalName *UPN* -RemoveFromRecycleBin