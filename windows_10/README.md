#Windows_10

This is a small collection of scripts for Tweaking / Fixing Windows 10

    disable-services.ps1
    disable-tasks.ps1
    disable-telemetry.ps1
    fw-blocklist.ps1
    fw-block.ps1
    hosts-blocklist.ps1
    misc-tweaks.ps1
    remove-apps.ps1
    set-windowsupdate.ps1

##Specific Information

Note: Cleanup folder contains scripts which could cause problems with Windows Components as it removes unwanted applications / components.

###disable-telemetry

Disable Telemetry & Related Items in Windows 10 Using Software Policies

    >> Disabling Telemetry in SOFTWARE Policies
    >> Disabling Problem Steps Recorder in SOFTWARE Policies
    >> Disabling Application Impact Telemetry in SOFTWARE Policies
    >> Disabling Customer Experience Improvement Program in SOFTWARE Policies

**Microsoft Customer Experience Improvement Program**

CEIP collects information about how our customers use Microsoft programs and about some of the problems they encounter. Microsoft uses this information to improve the products and features customers use most often and to help solve problems. Participation in the program is voluntary, and the end results are software improvements to better meet the needs of our customers.

**Problem Steps Recorder:**

Problem Steps Recorder automatically captures the steps you take on a computer, including a text description of where you clicked and a screenshot during each click. Once you capture these steps, you can save them to a file that can be used by a support professional or someone else helping you with a computer problem.

Note: some people/companies may want to keep Problem Steps Recorder enabled.

If you only want to disable telemetry:

    If (-Not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"))
    {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name DataCollection
    }
    sp "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "AllowTelemetry" 0
    sp "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\DataCollection" "AllowTelemetry" 0

###disable-services

Disables a lot of built-in Windows Services which could be considered privacy 
or security risks due to the information they collect.

Examples:

    Data Collection and Publishing Service
    Microsoft (R) Diagnostics Hub Standard Collector Service
    Diagnostics Tracking Service
    Geolocation Service
    Remote Registry
    Windows Biometric Service
    Windows Media Player Network Sharing Service

###disable-tasks

Disables some data collecting scheduled tasks built-in to windows 10.


      Disabling Scheduled Tasks


    TaskPath                                       TaskName                          State
    --------                                       --------                          -----
    \Microsoft\Windows\AppID\                      SmartScreenSpecific               Disabled
    \Microsoft\Windows\Application Experience\     Microsoft Compatibility Appraiser Disabled
    \Microsoft\Windows\Application Experience\     ProgramDataUpdater                Disabled
    \Microsoft\Windows\Autochk\                    Proxy                             Disabled
    \Microsoft\Windows\Customer Experience Impr... Consolidator                      Disabled
    \Microsoft\Windows\Customer Experience Impr... KernelCeipTask                    Disabled
    \Microsoft\Windows\Customer Experience Impr... UsbCeip                           Disabled
    \Microsoft\Windows\DiskDiagnostic\             Microsoft-Windows-DiskDiagnost... Disabled
    \Microsoft\Windows\DiskDiagnostic\             Microsoft-Windows-DiskDiagnost... Disabled
    \Microsoft\Windows\PI\                         Sqm-Tasks                         Disabled

      All Tasks Successfully Disabled


###set-windowsupdate

Sets Windows Update to Notify Before Downloading Available Updates.

The default settings for Windows 10 is to automatically download & install updates.

###hosts-blocklist

Block Hostnames From A Blocklist Using HOSTS file in windows

example to show how it works:

    > ping watson.live.com
    Pinging watson.live.com [207.46.223.94] with 32 bytes of data:
    > .\hosts-blocklist.ps1 .\telemetry_hosts.txt
    > ping watson.live.com
    Ping request could not find host watson.live.com. Please check the name and try again.

I've found a lot of hosts files regarding telemetry and have added one to this repo to make it easier but if you have any additions, please comment.
Also a lot of the hosts lists I found blocked skype & other applications.

###fw-blocklist

Block a list of IP Addresses in Windows Firewall

more info: [https://equk.co.uk/2015/09/15/extend-win-fw-powershell/](https://equk.co.uk/2015/09/15/extend-win-fw-powershell/)

###remove-apps

Cleans up all possible appstore applications from windows.

Some apps however cannot be removed using this script as they are considered system applications.

    Non-Removable Applications : 
                    Microsoft.BioEnrollment
                    Microsoft.MicrosoftEdge
                    Microsoft.Windows.Cortana
                    Microsoft.WindowsFeedback
                    Microsoft.XboxGameCallableUI
                    Microsoft.XboxIdentityProvider
                    Windows.ContactSupport

I am still adding new scripts and updates to this repo as I have not yet deployed 
Windows 10 as I am still testing in VMs.

If you find the scripts useful or have any tweaks or improvements please contact me on github or on twitter @equilibriumuk