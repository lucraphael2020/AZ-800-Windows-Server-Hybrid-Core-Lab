Import-Module ActiveDirectory

$csvPath = "C:\Script\CSV\etudiants2024.csv"
$defaultPassword = "P@ssw0rd2024!"
$securePassword  = ConvertTo-SecureString $defaultPassword -AsPlainText -Force

Import-Csv -Path $csvPath | ForEach-Object {

    $First = $_.FirstName
    $Last  = $_.LastName
    $CN    = "$First $Last"
    $OU    = $_.OU

    # Vérifier si le CN existe déjà dans l’OU
    $i = 1
    $NewCN = $CN

    while (Get-ADUser -LDAPFilter "(cn=$NewCN)" -SearchBase $OU -ErrorAction SilentlyContinue) {
        $NewCN = "$CN-$i"
        $i++
    }

    # Générer SamAccountName et UPN
    $sam = ($_.Email.Split("@")[0])
    $upn = "$sam@pharma.cm"

    New-ADUser `
        -Name $NewCN `
        -GivenName $First `
        -Surname $Last `
        -SamAccountName $sam `
        -UserPrincipalName $upn `
        -DisplayName $NewCN `
        -EmailAddress $_.Email `
        -Office $_.Filiere `
        -Department $_.Filiere `
        -Title "Etudiant $($_.Cycle)" `
        -Company "PHARMA" `
        -Path $OU `
        -AccountPassword $securePassword `
        -Enabled $true `
        -ChangePasswordAtLogon $true
}
