set-executionpolicy unrestricted -scope currentuser
 
Install-module AIPservice
 
Import-module AIPService
 
#$cred = Get-Credential
 
Get-Command -Module AIPService
 
Connect-AipService #-Credential $cred
 
Enable-AipService
 
$rmsConfig = Get-AipServiceConfiguration
 
$licenseUri = $rmsConfig.LicensingIntranetDistributionPointUrl
 
Disconnect-AIPservice
 
#Connect to Exchange Online
$session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -AllowRedirection #-Credential $cred -Authentication Basic -AllowRedirection
 
Import-PSSession $session
 
$irmConfig = Get-IRMConfiguration
 
$list = $irmConfig.LicensingLocation
 
if (!$list) { $list = @() }
 
if (!$list.Contains($licenseUri)) { $list += $licenseUri }
 
Set-IRMConfiguration -LicensingLocation $list
 
Set-IRMConfiguration -AzureRMSLicensingEnabled $true -InternalLicensingEnabled $true
 
Set-IRMConfiguration -SimplifiedClientAccessEnabled $true
 
Get-IRMConfiguration

Test-IRMConfiguration -Sender "user@domain.com"