Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force
$UPN = Read-Host "Enter The Admin Email Address"
$PSW = Read-Host "Enter Your Password" -AsSecureString
$cred = New-Object -TypeName System.Management.Automation.PSCredential - 
argumentlist $userName, $(convertto-securestring $Password -asplaintext -force)

Connect-ExchangeOnline -Credential $cred

$Domain = Read-Host "Enter The Domain"

new-dkimsigningconfig -domainname $Domain -enabled $false
Rotate-DkimSigningConfig -Identity $Domain
set-dkimsigningconfig -identity $Domain -enabled $true
get-dkimsigningconfig -identity $Domain|fl selector1cname, selector2cname


Read-Host -Prompt "Press Enter to exit"

