#Gathering initial information needed to run the duplicate checks.
$Email = "info@oaknuggins.co.uk"
$Credential = Get-Credential
#NOTE: If attempting to add a new alias is what throws an error, delete the # in front of $NewAlias and fill in the affected email as needed.
#$NewAlias= "NEW_ALIAS@DOMAIN.COM"


 

#Installing Exchange Online and Msol PowerShell Modules
Install-Module MSOnline -Force
Import-Module MSOnline
Connect-MsolService -Credential $credential
$Session1 = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $credential -Authentication Basic -AllowRedirection
Import-PSSession $Session1
Start-Transcript -Path ("$env:USERPROFILE\Desktop\DuplicateCheckOutput.txt")
Get-Date

#Checking for existince of aliases at potential locations where a duplicate can exist.
$Mailbox = Get-Mailbox -Identity $Email
$Aliases = $Mailbox.EmailAddresses
$Aliases = $Aliases + $NewAlias

foreach ($i in $Aliases){
Write-Host ""; Write-Host "Searching for the $i object." -ForegroundColor Green
if ($i -like "SMTP:*"){
$SearchableObject = $i -replace "smtp:",""}
elseif ($i -like "SIP:*"){
$SearchableObject = $i -replace "SIP:",""}
elseif ($i -like "SPO:*"){
$SearchableObject = $i -replace "SPO:",""}

Write-Host "Running Get-User Cmdlet..." -ForegroundColor DarkCyan; Get-User $SearchableObject | ft UserPrinc*,*ObjectID*
Write-Host "Running Get-Recipient Cmdlet..." -ForegroundColor DarkCyan; Get-Recipient $SearchableObject | ft PrimarySMTP*,*ObjectID*, GUID
Write-Host "Running Get-MsolUser UPN Search..." -ForegroundColor DarkCyan; Get-MsolUser -All | Where-Object {$_.UserPrincipalName -like $SearchableObject} | ft UserPrinc*,*ObjectID*
Write-Host "Running Get-MsolUser ProxyAddresses Search..." -ForegroundColor DarkCyan; Get-MsolUser -All | Where-Object {$_.ProxyAddresses -match $SearchableObject} | ft UserPrinc*,*ObjectID*
Write-Host "Running Get-MsolContact EmailAddresses Search..." -ForegroundColor DarkCyan; Get-MsolContact -All | Where-Object {$_.EmailAddress -eq $SearchableObject} | ft ObjectID
Write-Host "Running Get-MsolGroup ProxyAddresses Search..." -ForegroundColor DarkCyan; Get-MsolGroup -All | Where-Object {$_.ProxyAddresses -match $SearchableObject} | ft ObjectID
Write-Host "Running Get-MsolUser Deleted User UPN Search..." -ForegroundColor DarkCyan; Get-MsolUser -All -ReturnDeletedUsers | Where-Object {$_.UserPrincipalName -like $SearchableObject} | ft UserPrinc*,ObjectID
Write-Host "Running Get-MsolUser Deleted User ProxyAddresses Search..." -ForegroundColor DarkCyan; Get-MsolUser -All -ReturnDeletedUsers | Where-Object {$_.ProxyAddresses -match $SearchableObject} | ft UserPrinc*,ObjectID
}
Get-Date; Stop-Transcript