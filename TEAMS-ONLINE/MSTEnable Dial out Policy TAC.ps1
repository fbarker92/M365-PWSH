Set-ExecutionPolicy RemoteSigned
Install-Module MicrosoftTeams -force
Connect-MicrosoftTeams


Grant-CsDialoutPolicy -Identity "user@domain.com" -PolicyName $Null