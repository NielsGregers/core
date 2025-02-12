function buildDelta (){
param($hexatown, $table, $fields)

    ShowState "Building delta for $table" 
    $masterItems = CreateMasterDictionary $hexatown "$table.sharepoint"
    $slaveItems = CreateSlaveDictionary $hexatown "$table.slave" $fields
    $delta = buildDelta2 $masterItems $slaveItems $fields

    ConvertTo-Json -InputObject $delta  -Depth 10 | Out-File "$($hexatown.datapath)\$table.delta.json" 


}
