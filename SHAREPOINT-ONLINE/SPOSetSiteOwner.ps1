Set-ExecutionPolicy RemoteSigned -Force
Install-Module -Name Microsoft.Online.SharePoint.PowerShell -Force
Connect-SPOService -Url https://company-admin.sharepoint.com

Get-SPOSite -Identity https://company-my.sharepoint.com/personal/user_domain_com


Set-SPOSite -Identity https://company-my.sharepoint.com/personal/user_domain_com -Owner user@domain.com -NoWait