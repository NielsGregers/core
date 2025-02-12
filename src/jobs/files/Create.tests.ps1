BeforeAll { 
    . "$PSScriptRoot\Create.ps1"
    function GraphAPI($hexatown, $verb, $url, $body){
        return "$verb,$url,$body"
    }
    $hexatown = @{
        apis = @{
            mock = @{
                method = @{
                    url = "http://dummy/"
                }
            }
        }
    }
    
    $hexatown.apis.$apiName.$method
}

Describe 'Create' {
    It 'Test Create' {
        $result = Create $hexatown mock method body
        $result | Should -Be "POST,http://dummy/,body"
    }
}


