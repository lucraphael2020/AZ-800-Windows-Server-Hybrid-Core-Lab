# Script complet — création automatique de toutes les OU AD

Import-Module ActiveDirectory

$ouList = @(
    "OU=Etudiants,DC=pharma,DC=cm",
    "OU=PremierCycle,OU=Etudiants,DC=pharma,DC=cm",
    "OU=SecondCycle,OU=Etudiants,DC=pharma,DC=cm",
    "OU=Enseignants,DC=pharma,DC=cm",
    "OU=Personnel,DC=pharma,DC=cm",
    "OU=Employes,DC=pharma,DC=cm",
    "OU=Groupes,DC=pharma,DC=cm",
    "OU=DEP_GenieLogiciel,OU=Enseignants,DC=pharma,DC=cm",
    "OU=DEP_ReseauxTelecom,OU=Enseignants,DC=pharma,DC=cm",
    "OU=DEP_GenieElectrique,OU=Enseignants,DC=pharma,DC=cm",
    "OU=DEP_GenieMecanique,OU=Enseignants,DC=pharma,DC=cm",
    "OU=DEP_GenieCivil,OU=Enseignants,DC=pharma,DC=cm",
    "OU=DEP_GestionLogistique,OU=Enseignants,DC=pharma,DC=cm",
    "OU=DEP_GestionComptabilite,OU=Enseignants,DC=pharma,DC=cm",
    "OU=DEP_MaintenanceIndustrielle,OU=Enseignants,DC=pharma,DC=cm",
    "OU=DEP_QualiteHygieneSecurite,OU=Enseignants,DC=pharma,DC=cm",
    "OU=DEP_CommerceVente,OU=Enseignants,DC=pharma,DC=cm"
)

foreach ($ou in $ouList) {
    if (-not (Get-ADOrganizationalUnit -LDAPFilter "(distinguishedName=$ou)" -ErrorAction SilentlyContinue)) {
        $name = $ou.Split(",")[0].Split("=")[1]
        $path = $ou.Substring($name.Length + 4)
        New-ADOrganizationalUnit -Name $name -Path $path -ProtectedFromAccidentalDeletion $false
        Write-Host "OU créée : $ou"
    } else {
        Write-Host "OU existe déjà : $ou"
    }
}
