#requires -version 4.0
#requires -runasadministrator

<#
.SYNOPSIS
    Script to Disable Pre-Installed SystemApps in Windows 10
.DESCRIPTION
    Script to Disable Pre-Installed SystemApps in Windows 10
    Cortana SearchUI.exe accesses the internet even with cortana disabled
    I remove the other sysapps as they are reporting/feedback apps
    Note: Make sure Cortana is first in list if req'd as process respawns quickly
    Also if you get access denied, run the script twice
    Requires Admin Access
    Twitter: @equilibriumuk 
.NOTES
    File Name      : disable-services.ps1
    Author         : @equilibriumuk
    Prerequisite   : PowerShell V4
.LINK
    Script posted on github:
    https://github.com/equk
#>

$sysapppath = "$env:systemroot\SystemApps"
$sysapps = @(
    "Microsoft.Windows.Cortana_cw5n1h2txyewy"
    "ContactSupport_cw5n1h2txyewy"
    "ParentalControls_cw5n1h2txyewy"
    "WindowsFeedback_cw5n1h2txyewy"
    )

Write-Host ">> Killing Cortana Process"
Get-Process *SearchUI* | Stop-Process -Force
Write-Host ">> Moving Folders"
foreach ($sysapp in $sysapps) {
    if (Test-Path $sysapppath\$sysapp) {
        mv $sysapppath\$sysapp $sysapppath\$sysapp"_disabled"
    }
}