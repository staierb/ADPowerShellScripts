$User = Read-Host

$Groups = @('DAFS-DW-USER', 'DAFS-DW-FN', 'DAFS-DW-HR', 'DAFS-DW-BD', 'DAFS-DW-CORR-ALL-FN', 'DAFS-DW-CORR-ALL-HR', 'DAFS-DW-CORR-ALL-BD')

$Domain = "som"
$gatekeeper = "DOT-Gatekeeper"

ForEach ($Group in $Groups) {

Set-ADGroup -Identity $Group -ManagedBy $gatekeeper }