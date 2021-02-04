function getListCount (){
param($hexatown, $listName, $filter)


    Write-Progress -Activity "Counting $listName from SharePoint" 

    $items = (SharePointReadThrottleableQuery  $hexatown ('/Lists/' + $listName + '/items/?$expand=fields&' + $filter))
    
    return $items.Count

}
