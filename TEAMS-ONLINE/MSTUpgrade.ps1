Set-ExecutionPolicy RemoteSigned -Force
Install-Module -Name MicrosoftTeams -Force
Connect-MicrosoftTeams

Grant-CsTeamsUpgradePolicy -PolicyName UpgradeToTeams -Global

