#  création des groupes (Informatique, RH, Logistique, etc.)

Import-Module ActiveDirectory

$groups = @(
    "GRP_Informatique",
    "GRP_RH",
    "GRP_Logistique",
    "GRP_Comptabilite",
    "GRP_Administration",
    "GRP_Enseignants",
    "GRP_Etudiants"
)

$groups | ForEach-Object {
    if (-not (Get-ADGroup -Filter "Name -eq '$_'" -ErrorAction SilentlyContinue)) {
        New-ADGroup `
            -Name $_ `
            -SamAccountName $_ `
            -GroupScope Global `
            -GroupCategory Security `
            -Path "OU=Groupes,DC=pharma,DC=cm"
    }
}
