Start-Transcript -Path "$env:userprofile\Documents\Office365Support$ts.txt" -NoClobber

#Connect to the Azure Rights Management service. 
#Install the AIPservice module 
Uninstall-Module -Name AADRM 
Install-Module -Name AIPService 
Update-Module -Name AIPService 
#Connect to AIPservice 
Connect-AIPservice 



 
#Activate the service. 
Enable-Aadrm 



 
#Get the configuration information needed for message encryption. 
$rmsConfig = Get-AadrmConfiguration 
$licenseUri = $rmsConfig.LicensingIntranetDistributionPointUrl 



 
#Disconnect from the service. 
Disconnect-Aipservice 



 
#Create a remote PowerShell session and connect to Exchange Online. 
Install-module exchangeonlinemanagement 
Connect-ExchangeOnline 



 
#Collect IRM configuration for Office 365. 
$irmConfig = Get-IRMConfiguration 
$list = $irmConfig.LicensingLocation 
if (!$list) { $list = @() } 
if (!$list.Contains($licenseUri)) { $list += $licenseUri } 



 
#Enable message encryption for Office 365. 
Set-IRMConfiguration -LicensingLocation $list 
Set-IRMConfiguration -AzureRMSLicensingEnabled $true -InternalLicensingEnabled $true 



 
#Enable the Protect button in Outlook on the web (Optional). 
Set-IRMConfiguration -SimplifiedClientAccessEnabled $true 



 



OME Encryption for One Time Password: 



Set-OMEConfiguration -Identity "OME Configuration" -OTPEnabled $true 