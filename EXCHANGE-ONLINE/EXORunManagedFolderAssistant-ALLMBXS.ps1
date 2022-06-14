Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force
Connect-ExchangeOnline


$MBXS = Get-Mailbox -ResultSize Unlimited -RecipientTypeDetails usermailbox 
$MBXS | foreach {
Write-Host "processing" $_.DisplayName "|" $_.PrimarySmtpAddress
Start-ManagedFolderAssistant -Identity $_.PrimarySmtpAddress
}

Start-ManagedFolderAssistant -Identity

