function PostSharePointListItem (){
param($token, $site, $listName, $body)

    # https://stackoverflow.com/questions/49238355/whats-the-post-body-to-create-multichoice-fields-in-sharepoint-online-using-gra
    $myHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $myHeaders.Add("Content-Type", "application/json; charset=utf-8")
    $myHeaders.Add("Accept", "application/json")
    $myHeaders.Add("Authorization", "Bearer $token" )
    
    $url = ($site + "/Lists/$listName/items")
    $result = Invoke-RestMethod $url -Method 'POST' -Headers $myHeaders -Body ([System.Text.Encoding]::UTF8.GetBytes($body) )
    return $result
    # write-output "."
    # return $null -eq $dummy

}
