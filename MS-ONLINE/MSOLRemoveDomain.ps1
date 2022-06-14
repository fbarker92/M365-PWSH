Set-ExecutionPolicy RemoteSigned -Force
Import-Module MSOnline -Force
Connect-MsolService

Remove-MsolDomain -DomainName "domain.com" -Force