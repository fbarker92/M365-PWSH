#Obtain and store the login credentials
Get-Credential | Export-Clixml -Path "C:\path\to\cred.xml"

#Import the 365 credentials 
$cred = Import-Clixml -Path "C:\path\to\cred.xml"

#set the PSSessions options
$pso = new-PSSessionOption -IdleTimeout 1800000 
#connect to exchange module using a locked down account, that only has access to run message reports, w/ conditional access for the server only
Connect-ExchangeOnline -Credential $cred -PSSessionOption $pso

#get the date range of the previous month - must be run on the first of the month to work correcly 
#calculate the start and end dates of the month, e.g mm/dd/yyy
$DateStr = (Get-Date).AddMonths(-1).ToString("MMMyy")
$StartDateStr = (Get-Date).AddMonths(-1).ToString("MM/dd/yyyy")
$EndDateStr = (Get-Date).AddDays(-1).ToString('MM/dd/yyyy')

#start the historic serach and grab the JobId
$JobId = Start-HistoricalSearch -ReportTitle "no-reply@ email report - $DateStr" -StartDate $StartDateStr -EndDate $EndDateStr -ReportType MessageTraceDetail -SenderAddress no-reply@lemondrizzle.uk | Select-Object JobId

#check the historicalserach request, wait until there is a value for FileURL
Do {

$FileURL = Get-HistoricalSearch -JobId $JobId | Select-Object FileURL
Start-Sleep -Seconds 1500
Write-Host "Report $JobId is not ready yet..."

} until ($null -ne $FileURL)

#download the mess tarce to a set location 
$URL = $FileURL.ToString()
Invoke-WebRequest $URL -OutFile "C:\path\to\email report email@ - $DateStr.csv"
