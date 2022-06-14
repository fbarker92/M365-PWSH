Set-ExecutionPolicy RemoteSigned -Force
Import-Module MSOnline -Force 
Import-Module AzureAD -Force
Connect-MsolService
Connect-AzureAD

Set-MsolUserPassword -UserPrincipalName chris.rowe@oaknuggins.co.uk -ForceChangePasswordOnly $true -ForceChangePassword #$true
Get-MsolUser -All | Set-MsolUserPassword -ForceChangePasswordOnly $true -ForceChangePassword #$true

$Users = Get-MsolUser
foreach($User in $Users){
Get-AzureADUser -SearchString $User | Revoke-AzureADSignedInUserAllRefreshToken
}
