# ------------------------------------------------------------------------------
# Script: PowerShell Essential Modules Setup
# ------------------------------------------------------------------------------

Install-Module -Name PSWindowsUpdate -Force -SkipPublisherCheck -Scope CurrentUser
Install-Module -Name Terminal-Icons -Force -SkipPublisherCheck -Scope CurrentUser
Install-Module -Name NerdFonts -Force -SkipPublisherCheck -Scope CurrentUser
Install-Module -Name Fonts -Force -SkipPublisherCheck -Scope CurrentUser
Install-Module -Name pstools -Force -SkipPublisherCheck -Scope CurrentUser

Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force

Write-Host "✅ Módulos do PowerShell instalados com sucesso!"
