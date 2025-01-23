#Single-user Multi-group Add Script:

$User = Read-Host

$Groups = @('DAFS-DW-BD’, ‘DAFS-DW-CORR-ALL-BD’, ‘DAFS-DW-CORR-ALL-FN’, ‘DAFS-DW-CORR-ALL-HR’, ‘DAFS-DW-FN’, ‘DAFS-DW-HR’, ‘DAFS-DW-USER')

$Domain = "som"

ForEach ($Group in $Groups) {

 #add-ADGroupMember $User  -Identity  $Group -Server $Domain
 remove-ADGroupMember $User  -Identity  $Group -Server $Domain
  Write-Host "'$User' removed from '$Group'"
} 