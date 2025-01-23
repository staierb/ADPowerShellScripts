# This script updates the 'managedBy' attribute for specified groups in Active Directory. 

# Import the Active Directory module
Import-Module ActiveDirectory

# Define the groups and their corresponding managers
$groups = @(‘DOE-EDW-Appsupport’, ‘doe-app-quality’, ‘DOE-ARCH-SRPA-PR5-FedReporting’, ‘DOE-ARCH-SRPA-PR5-FlatFiles’, ‘DOE-ARCH-SRPA-PR5-NEO’, ‘DOE-ITC-FedReporting’, ‘DOE-ITC-FlatFiles’, ‘DOE-ITC-NEO’, ‘DOE-PA-PR4-FedReporting’, ‘DOE-PA-PR4-FlatFiles’, ‘DOE-PA-PR4-NEO’, ‘DOE-User-FedReporting’, ‘DOE-User-FlatFiles’, ‘DOE-User-NEO’) 
$manager = "OIT-DOE-SQL-GATEKEEPERS"
$newDescription = "Gatekeeper: OIT-DOE-SQL-GATEKEEPERS"
$timestamp = Get-Date -Format "yyyyMMdd"
$outputFile = "C:\Users\b.staier-cent\Documents\WindowsPowerShell\Ouput\UpdateGatekeeper&Desc\GK&DescUpdated_$timestamp.txt"

# Loop through each group and manager pair
foreach ($group in $groups) {
    # Get the distinguished name of the group
    #$groupDN = (Get-ADGroup -Identity $group).DistinguishedName

    # Get the distinguished name of the manager
    #$managerDN = (Get-ADUser -Identity $groups[$group]).DistinguishedName

    # Update the 'managedBy' attribute of the group
    Set-ADGroup -Identity $group -ManagedBy $manager

    #update the description
     Set-ADGroup -Identity $group -Description $newDescription

     "Updated Gatekeeper attribute for group '$group' to '$manager' and set Description to '$newDescription" | Out-File -FilePath $outputFile -Append

    Write-Host "Updated Gatekeeper attribute for group '$group' to '$manager' and set Description to '$newDescription"
}