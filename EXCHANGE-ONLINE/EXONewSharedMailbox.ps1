Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force
Connect-ExchangeOnline

New-Mailbox -Shared -Name "NAME" -DisplayName "DISPLAYNAME" -Alias "ALIAS"