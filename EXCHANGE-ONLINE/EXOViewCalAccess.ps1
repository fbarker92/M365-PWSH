Get-Mailbox | % { Get-MailboxFolderPermission (($_.PrimarySmtpAddress.ToString())+”:\Calendar”) -User '*DISPLAY NAME*' -ErrorAction SilentlyContinue} | select Identity,User,AccessRights
