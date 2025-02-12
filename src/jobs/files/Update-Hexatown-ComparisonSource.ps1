function Update-Hexatown-ComparisonSource (){
param($hexatown, $map, $source)

$inputData = loadFromJSON $hexatown.datapath $map.$source.file
$sourceMap = $map.$source

$counter = 0
$result = @()
foreach ($input in $inputData) { 
    $percent = [int]($counter / $inputData.Count * 100)
    Write-Progress -Activity "Reading $($sourceMap.file)" -Status "$counter Read" -PercentComplete $percent
        $item = @{}
        $item.Title = $input.($sourceMap.primaryKey)
        $item.Id    = $input.($sourceMap.id)
        
        foreach ($field in $sourceMap.fields) {

        
                $split = $field.from.Split(".")
                if ($split.Count -gt 1){
                $array = @()
                    foreach ($value in $input.($split[0])) {
                        $element = $value.($split[1])
                        $array += $element
                    }

                $item.($field.to) = $array
                }
                else{
                $item.($field.to) = $input.($field.from)
                }
                if ($field.typename){
                    $item.($field.typename) =$field.typevalue
                }
        }
        
        $result +=  $item
        $counter ++
}
ConvertTo-Json -InputObject $result   -Depth 10 | Out-File "$($hexatown.datapath)\$($map.list).$source.json" 


}
