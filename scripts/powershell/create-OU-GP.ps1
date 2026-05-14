Import-Module ActiveDirectory

# create OU Etudiants

New-ADOrganizationalUnit -Name "Etudiants" -Path "DC=pharma,DC=cm" -ProtectedFromAccidentalDeletion $false
New-ADOrganizationalUnit -Name "PremierCycle" -Path "OU=Etudiants,DC=pharma,DC=cm" -ProtectedFromAccidentalDeletion $false



# Créer les 10 groupes du premier cycle dans l’OU Étudiants

$groups = @(
"GRP_GenieLogiciel",
"GRP_ReseauxTelecom",
"GRP_GenieElectrique",
"GRP_GenieMecanique",
"GRP_GenieCivil",
"GRP_GestionLogistique",
"GRP_GestionComptabilite",
"GRP_MaintenanceIndustrielle",
"GRP_QualiteHygieneSecurite",
"GRP_CommerceVente"
)

# Créer le groupe GRP_LicenceASR dans l’OU Étudiants

foreach ($g in $groups) {
    New-ADGroup -Name $g -GroupScope Global -GroupCategory Security -Path "OU=Etudiants,DC=pharma,DC=cm"
}
