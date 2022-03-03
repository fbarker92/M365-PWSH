Set-ExecutionPolicy RemoteSigned
Install-Module MicrosoftTeams -force
Connect-MicrosoftTeams

$PSTN = Read-Host "Please enter the phone number to remove from the conference bridge"
$BridgeID = Get-CsOnlineDialInConferencingBridge -Name "Conference Bridge" | Select Identity
Unregister-CsOnlineDialInConferencingServiceNumber -identity $PSTN.ToString() -bridgeId $BridgeID.ToString()


Get-CsOnlineDialInConferencingBridge -Name "Conference Bridge" | Select ServiceNumbers



