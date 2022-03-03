Set-ADSyncScheduler -SyncCycleEnabled $false
Get-ADSyncScheduler
Connect-MsolService
Get-ADuser *USR_DISPLAY_NAME*

$ADUser = "*USR_DISPLAY_NAME*"
$365User = "*USR_DISPLAY_NAME@DOMAIN.COM*"
$guid =(Get-ADUser $ADUser).Objectguid
$immutableID=[system.convert]::ToBase64String($guid.tobytearray())
Set-MsolUser -UserPrincipalName $365User -ImmutableId $immutableID

Start-ADSyncSyncCycle -PolicyType Delta

Set-ADSyncScheduler -SyncCycleEnabled $true
Get-ADSyncScheduler





#check if Directory Sync is enabled 
Connect-MsolService
(Get-MSOLCompanyInformation).DirectorySynchronizationEnabled