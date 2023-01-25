Install-Module -Name ExchangeOnlineManagement -Force
Install-Module -Name Msonline -Force

Connect-MsolService
Connect-ExchangeOnline

$Domains = (Get-MsolDomain).Name

ForEach ($Domain in $Domains) {

$Name = $Domain.Split(".")[0]
$PrimaryEmailAddress = 'info@' + $Domain

New-Mailbox -Shared -Name $Alias -PrimarySmtpAddress $PrimaryEmailAddress

}
