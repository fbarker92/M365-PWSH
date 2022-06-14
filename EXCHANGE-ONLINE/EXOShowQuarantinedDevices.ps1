Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force
Connect-ExchangeOnline

$UsrMailbox = Get-Mailbox | FL Name
Get-MobileDevice -Identity $UsrMailbox.Name -Filter {DeviceAccessState -eq 'Quarantined'} | FT UserDisplayName,DeviceAccessState,IsCompliant,DeviceAccessStateReason,DeviceID,DeviceModel

