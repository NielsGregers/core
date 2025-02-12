function Sync-Hexatown-List (){
param($hexatown, $listname, $delta)

    ShowState "Syncronzing List $listname" | Out-Null
    foreach ($item in $delta.newItems) {
        
        $body = @{fields = $item } | ConvertTo-Json
        DeleteSharePointListItem $hexatown.token $hexatown.site $listname  $item.Id
    }
    
    foreach ($item in $delta.deletedItems) {
        $item.PSObject.Properties.Remove("Id")
        $body = @{fields = $item } | ConvertTo-Json
        PostSharePointListItem $hexatown.token $hexatown.site $listname $body
    }
    
    foreach ($item in $delta.changedItems) {
        $id = $item.master.Id
        $item.slave.PSObject.Properties.Remove("Id")
        $body = @{fields = $item.slave } | ConvertTo-Json
        PatchSharePointListItem $hexatown.token $hexatown.site $listname $id $body
    }

}
