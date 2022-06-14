Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force
Connect-ExchangeOnline

Set-Mailbox user@domain.com -ProhibitSendQuota XXGB -ProhibitSendReceiveQuota XXGB -IssueWarningQuota XXGB