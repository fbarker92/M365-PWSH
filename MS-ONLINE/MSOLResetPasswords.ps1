Set-ExecutionPolicy RemoteSigned -Force
Import-Module MSOnline -Force 
Import-Module AzureAD -Force
Connect-MsolService
Connect-AzureAD

#Set-MsolUserPassword -UserPrincipalName chris.rowe@oaknuggins.co.uk -ForceChangePasswordOnly $true -ForceChangePassword $true
Get-MsolUser -All | Set-MsolUserPassword -ForceChangePasswordOnly $true -ForceChangePassword $true

#Revoke all active sign in sessions
$Users = Get-MsolUser
foreach($User in $Users){
Get-AzureADUser -SearchString $User | Revoke-AzureADSignedInUserAllRefreshToken
}

#Get-MsolUser -all | Select UserPrincipalName, DisplayName,  @{n="MFA"; e={$_.StrongAuthenticationRequirements.State}}, @{n="Methods"; e={($_.StrongAuthenticationMethods).MethodType}}, @{n="Default Method"; e={($_.StrongAuthenticationMethods).IsDefault}}
#foreach($User in $Users){Set-MsolUser -UserPrincipalName $User -StrongAuthenticationRequirements @()
#}