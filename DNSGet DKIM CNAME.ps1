#Import-ExchangeOnline -Force
Connect-ExchangeOnline
new-dkimsigningconfig -domainname "DOMAIN" -enabled $false
get-dkimsigningconfig -identity "DOMAIN"|fl selector1cname, selector2cname
set-dkimsigningconfig -identity "DOMAIN" -enabled $true

#Rotate DKIM Keys
Rotate-DkimSigningConfig -Identity "DOMAIN"