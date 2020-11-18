# Workaround for persistent credentials with PowerShellGet

This contains Powershell for generating an encrypted credential and creating a Powershell profile. The generated profile sets the $PSDefaultParameterValues variable for specified cmdlets, referencing the generated credential.

**Usage**
1. Run Create-Credential.ps1 - This will prompt for a password and store the encrypted file in the user profile folder. This will also generate Set-DefaultParameterValue.ps1. 
2. Run Update-PSProfile.ps1 - This will create your profile file and import the generated content from Set-DefaultParameterValue.ps1. 
3. Open Powershell, go, go go - The verify look at the $PSDefaultParameterValues variable

    `PS C:\> $PSDefaultParameterValues`

   ` Name                           Value`
   ` ----                           -----`
   ` Find-Module:Credential         System.Management.Automation.PSCredential`
   ` Register-PSRepository:Credent… System.Management.Automation.PSCredential`

To remove the default parameter values, remove the profile file located here: `$PROFILE.CurrentUserCurrentHost`

# Try with Artifactory
Authenticated repo URL: [https://relativity.jfrog.io/relativity/api/nuget/powershell-sandbox](https://relativity.jfrog.io/relativity/api/nuget/powershell-sandbox)
`Register-PSRepository -Name "JFrog" -SourceLocation "https://relativity.jfrog.io/relativity/api/nuget/powershell-sandbox" -InstallationPolicy Trusted`
`Find-Module -Repository JFrog`