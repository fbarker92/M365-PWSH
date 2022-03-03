Set-ExecutionPolicy RemoteSigned -Force
Install-Module MicrosoftTeams -Force 
Import-Module MicrosoftTeams 
Connect-MicrosoftTeams 

Set-CsOnlineVoiceApplicationInstance -Identity resource@domain.com -TelephoneNumber '‪‪+(XX)XXXXXXXXXX'
