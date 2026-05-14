# création des employés / personnel

Import-Module ActiveDirectory

$csvPath = "C:\Script\CSV\employes.csv"

$defaultPassword = "P@ssEmp2024!"
$securePassword  = ConvertTo-SecureString $defaultPassword -AsPlainText -Force

Import-Csv -Path $csvPath | ForEach-Object {
    $sam = ($_.Email.Split("@")[0])
    $upn = "$sam@pharma.cm"

    New-ADUser `
        -Name "$($_.FirstName) $($_.LastName)" `
        -GivenName $_.FirstName `
        -Surname $_.LastName `
        -SamAccountName $sam `
        -UserPrincipalName $upn `
        -DisplayName "$($_.FirstName) $($_.LastName)" `
        -EmailAddress $_.Email `
        -Office $_.Filiere `
        -Department $_.Departement `
        -Title $_.Role `
        -Company "PHARMA" `
        -Path $_.OU `
        -AccountPassword $securePassword `
        -Enabled $true `
        -ChangePasswordAtLogon $true
}
