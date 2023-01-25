Connect-ExchangeOnline

$Mailboxes = Get-Mailbox -ResultSize Unlimited | where{($_.PrimarySmtpAddress -like "*@lemondrizzle.uk") -and ($_.RecipientTypeDetails -eq "UserMailbox")}

New-DynamicDistributionGroup -Name “testddl1” -RecipientFilter "(RecipientTypeDetails -eq ‘UserMailbox’) -and (WindowsLiveID -eq ‘*@lemondrizzle.uk’)"

