Import-Module ActiveDirectory

# OU principale
New-ADOrganizationalUnit -Name "Employés" -ProtectedFromAccidentalDeletion $false

# Liste des groupes
$groups = @(
"GRP_Employes",
"GRP_Sales",
"GRP_Techno",
"GRP_Commerciaux",
"GRP_Direction",
"GRP_Cadre",
"GRP_Soutien",
"GRP_Guest",
"GRP_Fournisseurs",
"GRP_Admin",
"GRP_Admsp",
"GRP_RH",
"GRP_Sport",
"GRP_Finance",
"GRP_Temporaire"
)

foreach ($g in $groups) {
    New-ADGroup -Name $g -GroupScope Global -GroupCategory Security -Path "OU=Employés,DC=pharma,DC=cm"
}
