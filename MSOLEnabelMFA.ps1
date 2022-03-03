Connect-MsolService 
Get-MsolUser -all | Select UserPrincipalName, DisplayName,  @{n="MFA"; e={$_.StrongAuthenticationRequirements.State}}, @{n="Methods"; e={($_.StrongAuthenticationMethods).MethodType}}, @{n="Default Method"; e={($_.StrongAuthenticationMethods).IsDefault}}
Set-MsolUser -UserPrincipalName user@domain.com -StrongAuthenticationRequirements @()