#Config Variables
$SiteURL = "https://tenantname-my.sharepoint.com/personal/ueser_email_domain_com"
$ListName ="Documents/*folder to delete ontents of*"
$FolderServerRelativeURL = "/personal/ueser_email_domain_com/Documents/*folder to delete contents of*"

Try {
    #Connect to PNP Online
    Connect-PnPOnline -Url $SiteURL -UseWebLogin
    #Get All List Items in Batch
    $ListItems = Get-PnPListItem -List $ListName -FolderServerRelativeUrl $FolderServerRelativeURL -PageSize 5000

    #Loop through List Items and Delete
    ForEach ($Item in $ListItems)
    {
        Remove-PnPListItem -List $ListName -Identity $Item.Id -Force
        Write-Host "Item successfully been deleted" -ForegroundColor Green
    }
}
catch {
    write-host "Error: $($_.Exception.Message)" -foregroundcolor Red
}