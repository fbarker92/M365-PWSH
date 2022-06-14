Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force
Connect-ExchangeOnline

Get-CalendarDiagnosticLog -Identity *UsrDisplayName* -StartDate "8/1/2021 6:00:00 AM" -EndDate "9/1/2021 5:00:00 PM" | Export-Csv -Path "$env:userprofile\Documents\Office365Support$ts.txt"

Get-CalendarDiagnosticAnalysis -Identity FergusBarker -StartDate "8/1/2021 6:00:00 AM" -EndDate "9/1/2021 5:00:00 PM" | Export-Csv -Path "$env:userprofile\Documents\Office365Support$ts.txt"

Get-Mailbox

$logs = Get-CalendarDiagnosticLog -Identity FergusBarker -StartDate "8/1/2021 6:00:00 AM" -EndDate "9/1/2021 5:00:00 PM"
Get-CalendarDiagnosticAnalysis -CalendarLogs $logs -DetailLevel Advanced | Export-Csv -Path "$env:userprofile\Documents\CalendarLogs.csv"