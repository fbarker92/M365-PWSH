Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force
Connect-ExchangeOnline

Set-CASMailbox -Identity info@oaknuggins.co.uk -SmtpClientAuthenticationDisabled $true
get-mailbox -Identity info2@oaknuggins.co.uk | Set-Mailbox -EmailAddresses @{remove="info@oaknuggins.co.uk"}

Set-Mailbox -Identity info2@oaknuggins.co.uk -EmailAddresses @{remove="info@oaknuggins.co.uk"}