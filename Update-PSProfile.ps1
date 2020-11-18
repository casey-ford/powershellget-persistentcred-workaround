#Create Powershell Profile for CurrentUserCurrentHost
if (!(Test-Path -Path $PROFILE.CurrentUserCurrentHost)) {
    New-Item -ItemType File -Path $PROFILE.CurrentUserCurrentHost -Force
}

Add-Content -Path $PROFILE.CurrentUserCurrentHost -Value (Get-Content .\Set-DefaultParameterValue.ps1)