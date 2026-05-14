# ajouter les membres dans les groupes (ex : Informatique, RH, Logistique)



Import-Module ActiveDirectory

# Informatique
Get-ADUser -Filter "Department -eq 'Informatique'" | ForEach-Object {
    Add-ADGroupMember -Identity "GRP_Informatique" -Members $_ -ErrorAction SilentlyContinue
}

# RH
Get-ADUser -Filter "Department -eq 'RH'" | ForEach-Object {
    Add-ADGroupMember -Identity "GRP_RH" -Members $_ -ErrorAction SilentlyContinue
}

# Logistique
Get-ADUser -Filter "Department -eq 'Logistique'" | ForEach-Object {
    Add-ADGroupMember -Identity "GRP_Logistique" -Members $_ -ErrorAction SilentlyContinue
}

# Comptabilite
Get-ADUser -Filter "Department -eq 'Comptabilite'" | ForEach-Object {
    Add-ADGroupMember -Identity "GRP_Comptabilite" -Members $_ -ErrorAction SilentlyContinue
}
