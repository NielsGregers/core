function FatalError (){
param($message)

    Write-Error $message 
    exit

}
