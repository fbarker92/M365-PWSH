install-module msonline -Force

$credential = Get-Credential
connect-msolservice -Credential $credential

Get-MsolDomain

Remove-MsolDomain -DomainName "DOMAIN TO BE REMOVED"
