function Get-Hexatown-Delegate (){
param($datapath, $scope)

# $scope = "https%3A//graph.microsoft.com/.default"
# $scope = "Team.ReadBasic.All User.ReadBasic.All "

$refreshTokenFilePath = "$datapath\$($hexatownAppId).refreshtoken.$scope.txt"
if (!(Test-Path $refreshTokenFilePath)) {
    $step1 = Get-Hexatown-AccessTokenDeviceStep1 $hexatownAppId $domainid
    start $step1.verification_uri
    write-host $step1.message
    

    Set-Clipboard -Value $step1.user_code
    $step2 = Get-Hexatown-AccessTokenDeviceStep2 $hexatownAppId $domainid $step1.device_code
    $hexatownDelegate = @{
        token = $step2.access_token
    }
    $accessInfo = Parse-JWTtoken $step2.access_token

    $step2.refresh_token | Out-File -FilePath $refreshTokenFilePath
    return $step2.access_token

}
else {
    
    $refreshToken =  Get-Content $refreshTokenFilePath -Raw
    $step2 = Get-Hexatown-AccessTokenDeviceStepRefresh $hexatownAppId $domainid $refreshToken 
    $hexatownDelegate = @{
        token = $step2.access_token
    }
    return $step2.access_token

}

}
