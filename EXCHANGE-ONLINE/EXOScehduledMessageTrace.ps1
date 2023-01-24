#connect to exchange module using a locked down account, that only has access to run message reports, w/ conditional access for the server only
Connect-ExchangeOnline -Credential $creds -PSSessionOption IdleTimeout 1800000


#get the date range of the previous month - must be run on the first of the month to work correcly 
#calculate the start and end dates of the month, e.g dd/mm/yyy

$Start = (Get-Date).AddMonths(-1).ToString('mm/dd/yyyy')
$end = (Get-Date).AddDays(-1).ToString('mm/dd/yyyy')

#start the historic serach and grab the JobId

$JobId = Start-HistoricalSearch -ReportTitle "contactcentre@ email report - " + $month + $year -StartDate $start -EndDate $end -ReportType MessageTraceDetail -RecipientAddress contactcentre@circadiantrust.org | Select-Object JobId


#check the historicalserach request, wait until there is a value for FileURL
Do {

$FileURL = Get-HistoricalSearch -JobId $JobId | Select-Object FileURL
Start-Sleep -Seconds 1500

} until ($null -ne $FileURL)

#download the mess tarce to a set location 

Invoke-WebRequest $FileURL -OutFile "c:\path\to\message\trace.csv" 