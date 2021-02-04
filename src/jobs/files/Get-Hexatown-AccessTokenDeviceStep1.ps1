function Get-Hexatown-AccessTokenDeviceStep1 (){
param($client_id, $client_domain)

    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Content-Type", "application/x-www-form-urlencoded")
    $body = "client_id=$client_id&scope=$scope offline_access openid "
    
    $response = Invoke-RestMethod "https://login.microsoftonline.com/$client_domain/oauth2/v2.0/devicecode" -Method 'POST' -Headers $headers -body $body
    return $response
    

}
