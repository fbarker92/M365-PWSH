Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force
Connect-ExchangeOnline

New-RoleGroup -Name "RoleName" -Roles "Roles" -Members "DisplayName(s)"





