Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force
Connect-ExchangeOnline

Get-Mailbox -Identity fergus.barker@oaknuggins.co.uk | FL Name,Alias,PrimarySmtpAddress

Get-Mailbox -Identity fergus.barker@oaknuggins.co.uk | Set-Mailbox -Name "Fergus Barker" -Alias "FergusBarker" -DisplayName "Fergus Barker"

Set-Mailbox -Identity fergus.barker@oaknuggins.co.uk -Name "Fergus Barker"

