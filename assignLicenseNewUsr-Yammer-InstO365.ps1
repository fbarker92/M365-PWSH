Get-MsolUser -All -UnlicensedUsersOnly

Get-MsolAccountSku | Select SkuPartNumber

Set-MsolUserLicense -UserPrincipalName phil.mcrackin@MSTESTSFOFEBAR.onmicrosoft.com -AddLicenses "litwareinc:ENTERPRISEPACK"


###################################################


Connect-AzureAD -AccountId fergus@oaknuggins.co.uk
#Get-Command -Module AzureAD
Get-MsolUser -All -UnlicensedUsersOnly
$DisabledLicenses = "YAMMER_ENTERPRISE", "OFFICESUBSCRIPTION"
$LO = New-MsolLicenseOptions -AccountSkuId MSTESTSFOFEBAR:ENTERPRISEPREMIUM -DisabledPlans $DisabledLicenses
#$license = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses
Set-AzureADUserLicense -ObjectId phil.mcrackin@MSTESTSFOFEBAR.onmicrosoft.com -AssignedLicenses $LO

#View Available Service
$licenses = Get-AzureADSubscribedSku
$licenses[0].ServicePlans

#Get-AzureADSubscribedSku | Select -Property Sku*,ConsumedUnits -ExpandProperty PrepaidUnits
Get-AzureADSubscribedSku | Select -ExpandProperty SkuPartNumber 

Get-AzureADUser - "fergus@oaknuggins.com" | Select -ExpandProperty AssignedPlans

#List available services in plan
$licenses = Get-AzureADSubscribedSku
$licenses[0].ServicePlans


#Creat User and Assing custom license to them
Connect-MsolService 
$LO = New-MsolLicenseOptions -AccountSkuId MSTESTSFOFEBAR:ENTERPRISEPREMIUM -DisabledPlans "YAMMER_ENTERPRISE", "OFFICESUBSCRIPTION"
New-MsolUser -UserPrincipalName GiveMeLicensePls@oaknuggins.co.uk -DisplayName "GiveMeLicense" -FirstName GiveMeLicense -LastName Pls -LicenseAssignment MSTESTSFOFEBAR:ENTERPRISEPREMIUM -LicenseOptions $LO -UsageLocation US

#Assign custom license to existing User
Connect-MsolService
Get-MsolUser -All -UnlicensedUsersOnly
$LO = New-MsolLicenseOptions -AccountSkuId MSTESTSFOFEBAR:ENTERPRISEPREMIUM -DisabledPlans "YAMMER_ENTERPRISE", "OFFICESUBSCRIPTION"
Set-MsolUserLicense -UserPrincipalName GiveMeLicensePls@oaknuggins.co.uk -LicenseAssignment MSTESTSFOFEBAR:ENTERPRISEPREMIUM -LicenseOptions $LO -UsageLocation US


