Import-Module ExchangeOnlineManagement 

$credential = Get-Credential
Connect-ExchangeOnline -Credential $credential

Get-Mailbox -Identity fergus@oaknuggins.co.uk | Get-MailboxPermission 




