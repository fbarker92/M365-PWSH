# Provide credentials over here
#$creds = Get-Credential

#Install the PnP module
Install-Module -Name PnP.PowerShell -Force

#connect to SPO site
$ODSite = Read-Host "Enter the URL for the OneDrive site"
Connect-PnPOnline -Url $ODSite -UseWebLogin 
 
# -Folder: Relative path of the location
# -Name: Name of the folder
# If parameter "-Force" is applied then on the execution of command, it will not ask for confirmation to delete the Folder
$Folder = Read-Host "Enter the name of the folder to be deleted"
Remove-PnPFolder -Name $Folder -Folder "/Documents" 