Set-ExecutionPolicy RemoteSigned
Install-Module MicrosoftTeams -Force 
Import-Module MicrosoftTeams 
Connect-MicrosoftTeams 

Set-CsTeamsMeetingBroadcastPolicy -Identity Global -AllowBroadcastTranscription $true 