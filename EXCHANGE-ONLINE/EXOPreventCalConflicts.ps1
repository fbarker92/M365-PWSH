Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force
Connect-ExchangeOnline

Set-CalendarProcessing -Identity halo@oaknuggins.co.uk -AllowConflicts $false

Get-CalendarProcessing -Identity halo@oaknuggins.co.uk | FL