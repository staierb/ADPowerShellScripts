$Group = "MDOT-CADD-Users"
$user = "William.T.Rohman"
$path = "C:\Users\$user\Documents\Groups.txt"
Get-ADGroupMember $Group|?{$_.objectClass -eq "Group"}|Select -Expand Name|Out-File $path 