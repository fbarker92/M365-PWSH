Install-Module Msonline -Force

Connect-MsolService

$Aduser = Read-Host -Prompt 'input cloud Alias of the user (everything before the @ symbol)'
$365User = Read-Host -Prompt 'input cloud UPN of 365 user'
$OnmicrosoftUser = Read-Host -Prompt 'Input UPN of the onmicrosoft user'

Remove-MsolUser -UserPrincipalName $OnmicrosoftUser -Force
Remove-MsolUser -UserPrincipalName $OnmicrosoftUser -RemoveFromRecycleBin

$guid =(Get-Aduser $Aduser).Objectguid
$immutableID=[system.convert]::ToBase64String($guid.tobytearray())
Set-MsolUser -UserPrincipalName $365User -ImmutableId $immutableID