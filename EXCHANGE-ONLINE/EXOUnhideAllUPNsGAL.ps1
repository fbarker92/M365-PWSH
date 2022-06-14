Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force
Connect-ExchangeOnline

Get-Mailbox | Set-Mailbox -HiddenFromAddressListsEnabled $false