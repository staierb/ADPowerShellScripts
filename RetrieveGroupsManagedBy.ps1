$acccount = Read-Host “Enter user name”

# Retrieve the groups managed by the desired user
Get-ADGroup -LDAPFilter "(ManagedBy=$((Get-ADUser -Identity $acccount).distinguishedname))" | Out-GridView

# Retrieve the groups managed by the desired group
#Get-ADGroup -LDAPFilter "(ManagedBy=$((Get-ADGroup -Identity $acccount).distinguishedname))" | Out-GridView