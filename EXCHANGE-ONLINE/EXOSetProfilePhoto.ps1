Set-ExecutionPolicy RemoteSigned -Force
Install-Module ExchangeOnlineManagement -Force
Connect-ExchangeOnline

Set-UserPhoto "username" -PictureData ([System.IO.File]::ReadAllBytes("C:\path\to\the\photo.jpg"))