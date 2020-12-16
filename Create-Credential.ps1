#Create Encrypted Credential
#This credential can only be decrypted on tha machine it was generated and by the user who generated it
$CredentialPath = "${env:\USERPROFILE}\jfrog.xml"
$Credential = Get-Credential -UserName $env:USERNAME
$Credential | Export-Clixml -Path $CredentialPath

#Generate Powershell Profile Content
Clear-Content -Path ".\Set-DefaultParameterValue.ps1"
Add-Content -Path ".\Set-DefaultParameterValue.ps1" -Value "#Import Credential"
Add-Content -Path ".\Set-DefaultParameterValue.ps1" -Value ('$Credential = Import-Clixml -Path "' + $CredentialPath + '"')
Add-Content -Path ".\Set-DefaultParameterValue.ps1" -Value '$PSDefaultParameterValues = @{'
Add-Content -Path ".\Set-DefaultParameterValue.ps1" -Value '    "Find-Module:Credential"=$Credential;'
Add-Content -Path ".\Set-DefaultParameterValue.ps1" -Value '    "Save-Module:Credential"=$Credential;'
Add-Content -Path ".\Set-DefaultParameterValue.ps1" -Value '    "Register-PSRepository:Credential"=$Credential'
Add-Content -Path ".\Set-DefaultParameterValue.ps1" -Value '}'