#Import Credential
$Credential = Import-Clixml -Path "C:\Users\Casey\jfrog.xml"
$PSDefaultParameterValues = @{
    "Find-Module:Credential"=$Credential;
    "Register-PSRepository:Credential"=$Credential
}
