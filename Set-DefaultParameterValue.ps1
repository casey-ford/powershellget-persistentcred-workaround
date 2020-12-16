#Import Credential
$Credential = Import-Clixml -Path "${env:\USERPROFILE}\jfrog.xml"
$PSDefaultParameterValues = @{
    "Find-Module:Credential"=$Credential;
    "Register-PSRepository:Credential"=$Credential
}
