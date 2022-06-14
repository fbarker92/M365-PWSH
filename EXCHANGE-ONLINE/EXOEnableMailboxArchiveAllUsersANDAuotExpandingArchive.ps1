Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force
Connect-ExchangeOnline

Get-Mailbox -Filter {ArchiveStatus -Eq "None" -AND RecipientTypeDetails -eq "UserMailbox"} | Enable-Mailbox -Archive


Get-Mailbox -Identity fergus.barker | FL ArchiveStatus

Get-Mailbox -Filter {RecipientTypeDetails -eq "SharedMailbox"} | FL Name, Alias, MessageCopyForSentAsEnabled
set-mailbox sharedmailbox@domain.com -MessageCopyForSentAsEnabled $True

#enable auto-expanding archive (EXO plan 2)
get-mailbox *Name* | FL Archive*Quota,AutoexpandingArchiveEnabled
Enable-Mailbox *Shared Mailbox* -AutoExpandingArchive 
