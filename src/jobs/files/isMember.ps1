function isMember (){
param($members, $roomSmtpAddress)

    $found = $false
    foreach ($member in $members) {
        if ($members.PrimarySmtpAddress -eq $roomSmtpAddress) {
            $found = $true
        }
    }
    return $found

}
