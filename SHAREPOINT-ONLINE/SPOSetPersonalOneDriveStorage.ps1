Set-ExecutionPolicy RemoteSigned -force
Install-Module -Name Microsoft.Online.SharePoint.PowerShell -Scope CurrentUser
Update-Module -Name Microsoft.Online.SharePoint.PowerShell

$TenantUrl = Read-Host "Enter the SharePoint admin center URL" 
$UPN = Read-Host "Enter the admin email address"
Connect-SPOService -Url $TenantUrl -Credential $UPN

$OneDriveSite = Read-Host "Enter the OneDrive Site URL"
$OneDriveStorageQuota = Read-Host "Enter the OneDrive Storage Quota in MB" 
$OneDriveStorageQuotaWarningLevel = Read-Host "Enter the OneDrive Storage Quota Warning Level in MB" 
Set-SPOSite -Identity $OneDriveSite -StorageQuota $OneDriveStorageQuota -StorageQuotaWarningLevel $OneDriveStorageQuotaWarningLevel 
Write-Host "Done" 

