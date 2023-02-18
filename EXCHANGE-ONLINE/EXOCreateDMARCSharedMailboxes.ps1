Connect-ExchangeOnline
Connect-MsolService

$Domains - (Get-MsolDomain).Name

ForEach ($Domain in $Domains) {
    $Name = $Domain 
    $PrimaryEmailAddressForensics = 'DMARCForensics@' + $Domain
    $PrimaryEmailAddressAggregate = 'DMARCAggregate@' + $Domain
    
    New-Mailbox -Shared -Name "DMARC Forensics | $Name" -PrimarySmtpAddress $PrimaryEmailAddressForensics
    New-Mailbox -Shared -Name "DMARC Aggregate | $Name" -PrimarySmtpAddress $PrimaryEmailAddressAggregate
    
    }