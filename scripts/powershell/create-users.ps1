Import-Module ActiveDirectory

# Import du CSV
# $users = Import-Csv -Path "C:\Script\users.csv"
$users = Import-Csv -Path "C:\Script\users_utf8.csv" -Encoding UTF8


foreach ($user in $users) {

    # nomprenom en minuscules

    $Sam = ($user.LastName.Substring(0,1) + $user.FirstName).ToLower()
    $UPN = "$Sam@pharma.cm"
    $Display = "$($user.FirstName) $($user.LastName)"

    Write-Host "DN lu depuis le CSV :" $user.OU
    Write-Host "Nom complet :" $Display

    New-ADUser `
        -Name $Display `
        -GivenName $user.FirstName `
        -Surname $user.LastName `
        -SamAccountName $Sam `
        -UserPrincipalName $UPN `
        -Path $user.OU `
        -AccountPassword (ConvertTo-SecureString "P@ssword123" -AsPlainText -Force) `
        -Enabled $true
}
