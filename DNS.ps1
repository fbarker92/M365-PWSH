Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force

Connect-ExchangeOnline 

$Domain = Read-Host "Enter The Domain"

new-dkimsigningconfig -domainname $Domain -enabled $false
#Rotate-DkimSigningConfig -Identity $Domain
set-dkimsigningconfig -identity $Domain -enabled $true
get-dkimsigningconfig -identity $Domain|fl selector1cname, selector2cname


Read-Host -Prompt "Press Enter to exit"

