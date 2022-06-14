Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement - Force
Connect-ExchangeOnline


Get-OrganizationConfig | fl Sendfrom*

Set-OrganizationConfig -SendFromAliasEnabled $true