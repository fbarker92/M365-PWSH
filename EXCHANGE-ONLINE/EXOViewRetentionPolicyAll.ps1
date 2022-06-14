Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force
Connect-ExchangeOnline

Get-EXOMailbox -Properties Name,RetentionPolicy | FL DisplayName,PrimarySmtpAddress,RetentionPolicy
