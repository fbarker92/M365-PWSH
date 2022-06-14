Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force
Connect-ExchangeOnline

Get-Mailbox -Filter {RecipientTypeDetails -eq "SharedMailbox"}
set-mailbox sharedmailbox@domain.com -MessageCopyForSentAsEnabled $True
set-mailbox sharedmailbox@domain.com -MessageCopyForSendOnBehalfEnabled $True