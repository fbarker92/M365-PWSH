Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force
Connect-ExchangeOnline

$DDG = Get-DynamicDistributionGroup -Identity "DynamicDistro Test"
Get-Recipient -RecipientPreviewFilter ($DDG.RecipientFilter) -OrganizationalUnit ($DDG.RecipientContainer)


