Import-Module ExchangeOnlineManagement -Force

Connect-ExchangeOnline -UserPrincipalName fergus@oaknuggins.co.uk

Get-IRMConfiguration | Select AzureRMSLicensingEnabled

Test-IRMConfiguration -Sender fergus@oaknuggins.co.uk

Remove-PSSession $session