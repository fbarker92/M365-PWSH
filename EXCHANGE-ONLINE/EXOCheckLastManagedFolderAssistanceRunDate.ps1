Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force
Connect-ExchangeOnline

$MBXS = Get-Mailbox -RecipientTypeDetails UserMailbox -ResultSize Unlimited
$Report = @()
ForEach ($MBX in $MBXS) {
   $LastProcessed = $Null
   Write-Host "Processing" $MBX.DisplayName "|" $MBX.PrimarySmtpAddress
   $Log = Export-MailboxDiagnosticLogs -Identity $MBX.PrimarySmtpAddress -ExtendedProperties
   $xml = [xml]($Log.MailboxLog)  
   $LastProcessed = ($xml.Properties.MailboxTable.Property | ? {$_.Name -like "*ELCLastSuccessTimestamp*"}).Value  
   $ItemsDeleted  = $xml.Properties.MailboxTable.Property | ? {$_.Name -like "*ElcLastRunDeletedFromRootItemCount*"}
   If ($LastProcessed -eq $Null) {
      $LastProcessed = "Not processed"}
   $ReportLine = [PSCustomObject]@{
           User          = $MBX.DisplayName
           SMTP          = $MBX.PrimarySmtpAddress
           LastProcessed = $LastProcessed
           ItemsDeleted  = $ItemsDeleted.Value}      
    $Report += $ReportLine
  }
$Report | Select User, SMTP, LastProcessed, ItemsDeleted