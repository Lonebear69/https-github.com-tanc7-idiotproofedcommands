# Make a admin account with a really long password as Admin, and make new user accounts for old people that get tricked into being pwned all the time. As your admin user, run all of this.
# Open a cmd.exe prompt, Windows + R then 'cmd.exe' in the bar, and Ctrl+Shift+Enter
netsh advfirewall firewall add rule name="BlockHostile" dir=in action=block protocol=TCP localport=1-65535
netsh advfirewall firewall add rule name="BlockHostile" dir=in action=block protocol=UDP localport=1-65535
# Inbound contact through listener ports are NOT required. At least for TCP connections, since you can browse the web just fine if you open a ephemeral port while browsing idk... onlyfans?
#CHECK netstat -ano | findstr /i LISTEN first!
# For Microsuck, if the elderly installs new apps that require some sort of server or listening socket running, the rule will most likely be placed first, allowing that listening port to be used
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "RequirePlatformSecurityFeatures" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "Locked" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Locked" /t REG_DWORD /d 0 /f
# Experimental feature, forces all new binaries to run in a sandbox
setx /M MP_FORCE_USE_SANDBOX 1
powershell.exe -ep bypass "Set-MpPreference -HighThreatDefaultAction Remove -Force;Set-MpPreference -LowThreatDefaultAction Remove -Force;Set-MpPreference -MAPSReporting Advanced -Force;Set-MpPreference -ModerateThreatDefaultAction Remove -Force;Set-MpPreference -SevereThreatDefaultAction Remove -Force;Set-MpPreference -UnknownThreatDefaultAction Remove -Force;Set-MpPreference -DisableRealtimeMonitoring $false -Force;Set-MpPreference -DisableArchiveScanning $false -Force;Set-MpPreference -DisableBehaviorMonitoring $false -Force;Set-MpPreference -DisableBlockAtFirstSeen $false -Force;Set-MpPreference -DisableEmailScanning $false -Force;Set-MpPreference -DisableIntrusionPreventionSystem $false -Force;Set-MpPreference -DisableIOAVProtection $false -Force;Set-MpPreference -DisableRealTimeMonitoring $false -Force;Set-MpPreference -DisableScriptScanning $false -Force;Set-ExecutionPolicy restricted -Force;Set-MpPreference -PUAProtection Enabled;Set-MpPreference -SubmitSamplesConsent SendAllSamples"
# Then go add a NON-admin user for the old people
net user username password /add
# And then go configure the laptop
# If some worthless Hadji phone scammer tries to trick them into shutting down their firewall rules the non-admin account doesn't let them even see the rules.
