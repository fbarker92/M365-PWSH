Set-ExecutionPolicy RemoteSigned -Force
Import-Module MicrosoftTeams -Force
#$credential = Get-Credential
Connect-MicrosoftTeams #-Credential $credential 


Get-CsOnlineUser -Identity "sip:user@domain.com" | Format-List EnterpriseVoiceEnabled

Set-CsUser -Identity user@domain.com -EnterpriseVoiceEnabled $true -HostedVoiceMail $true
