Import-Module ActiveDirectory

$users = Import-Csv "C:\Script\etudiants.csv" -Encoding UTF8

foreach ($u in $users) {

    # Génération du SamAccountName
    $Sam = ($u.LastName + $u.FirstName).ToLower()
    $BaseSam = $Sam
    $i = 1

    while (Get-ADUser -Filter { SamAccountName -eq $Sam }) {
        $Sam = "$BaseSam$i"
        $i++
    }

    # Génération du UPN
    $UPN = "$Sam@pharma.cm"

    # Création de l'utilisateur
    New-ADUser `
        -Name "$($u.FirstName) $($u.LastName)" `
        -GivenName $u.FirstName `
        -Surname $u.LastName `
        -SamAccountName $Sam `
        -UserPrincipalName $UPN `
        -Path $u.OU `
        -AccountPassword (ConvertTo-SecureString "P@ssword123" -AsPlainText -Force) `
        -Enabled $true

    # Ajout dans le groupe Licence ASR
    Add-ADGroupMember -Identity "GRP_LicenceASR" -Members $Sam

    Write-Host "Créé : $Sam et ajouté dans GRP_LicenceASR"
}
