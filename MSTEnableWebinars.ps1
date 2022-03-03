Set-ExecutionPolicy RemoteSigned
Install-Module MicrosoftTeams -Force 
Import-Module MicrosoftTeams 
Connect-MicrosoftTeams 

Set-CsTeamsMeetingPolicy -AllowMeetingRegistration $True
Set-CsTeamsMeetingPolicy -AllowPrivateMeetingScheduling $True
#Set-CsTeamsMeetingPolicy -WhoCanRegister EveryoneInCompany
Set-CsTeamsMeetingPolicy -WhoCanRegister Everyone
Set-CsTeamsMeetingPolicy -AllowEngagementReport Enabled
