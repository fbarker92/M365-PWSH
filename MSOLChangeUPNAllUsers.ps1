Import-Module MSOnline
$MyCredential = Get-Credential
$O365Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell -Credential $MyCredential -Authentication Basic -AllowRedirection 
Import-PSSession $O365Session -AllowClobber 
Connect-MsolService -Credential $MyCredential

Install-Module -Name AzureAD
Connect-AzureAD

$domain = "MSTESTSFOFEBAR.onmicrosoft.com"
$NewDomain = Read-Host "Enter the New Domain:"
$OldDomain = Read-Host "Enter the Old Domain:"

Get-AzureADUser -All $True | Where { $_.UserPrincipalName.ToLower().EndsWith($OldDomain) } |
ForEach {
 $newupn = $_.UserPrincipalName.Split("@")[0] + "@" + $NewDomain
 Write-Host "Changing UPN value from: "$_.UserPrincipalName" to: " $newupn -ForegroundColor Yellow
 Set-AzureADUser -ObjectId $_.UserPrincipalName  -UserPrincipalName $newupn
}