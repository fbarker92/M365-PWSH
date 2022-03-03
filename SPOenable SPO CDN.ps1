Set-ExecutionPolicy RemoteSigned -force

Install-Module -Name Microsoft.Online.SharePoint.PowerShell -force
Import-Module -Name Microsoft.Online.SharePoint.PowerShell

Connect-SPOService -Url https://mstestsfofebar-admin.sharepoint.com
Get-SPOSite

Set-SPOTenantCdnEnabled -CdnType Public -Enable $true 