$MBXS = Get-Mailbox -ResultSize Unlimited -Filter {(RecipientTypeDetails -eq 'UserMailbox') -and (UserPrincipalName -ne 'user@domain.com')}


ForEach ($MBX in $MBXS) {
Add-MailboxPermission -Identity $MBX.PrimarySmtpAddress -User user@domain.com -AccessRights fullaccess -InheritanceType all -AutoMapping $false
}
