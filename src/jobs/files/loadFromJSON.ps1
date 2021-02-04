function loadFromJSON (){
param($directory, $file)

    
    $data = Get-Content "$directory\$file.json" -Encoding UTF8 | Out-String | ConvertFrom-Json
    if ("System.Object[]" -ne $data.GetType()) {
        $data = @($data)
    }
    
    return $data

}
