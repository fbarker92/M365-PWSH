Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force
Connect-ExchangeOnline

Set-Mailbox user@domain.com -RecipientLimits *upto 1000*