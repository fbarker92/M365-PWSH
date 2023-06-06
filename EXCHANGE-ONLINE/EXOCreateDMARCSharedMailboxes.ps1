##Connect to Exchange and Msol
Connect-ExchangeOnline
Connect-MsolService

##Get list of current domains in tenant
$Domains = (Get-MsolDomain).Name

##Create DMARC Forensics and Aggregate shared mailboxes 
ForEach ($Domain in $Domains) {
    $Name = $Domain 
    $PrimaryEmailAddressForensics = 'DMARCForensics@' + $Domain
    $PrimaryEmailAddressAggregate = 'DMARCAggregate@' + $Domain
    
    New-Mailbox -Shared -Name "DMARC Forensics | $Name" -PrimarySmtpAddress $PrimaryEmailAddressForensics
    New-Mailbox -Shared -Name "DMARC Aggregate | $Name" -PrimarySmtpAddress $PrimaryEmailAddressAggregate    
    }


##Hide DMARC Mailboxes from GAL
$DMARCMbxs = Get-Mailbox -Filter {PrimarySmtpAddress -like "DMARC*"}

ForEach (DMARCMbx in $DMARCMbxs) {
   Set-Mailbox -Identity $DMARCMbx -HiddenFromAddressListsEnabled $true
   }
