Set-ExecutionPolicy RemoteSigned
Install-Module MicrosoftTeams -force
Connect-MicrosoftTeams

Set-CsOnlineVoiceApplicationInstance -Identity resource@domain.com -TelephoneNumber +XXXXXXXXXX
