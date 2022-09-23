@echo off
title Cleaner 1.2
echo.
For %%I IN (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) DO for /f "tokens=4,6*" %%k in ('vol %%I: 2^>nul^|find "drive"') do echo %%k - %%l %%m
echo.
:dr
SET DRVL=C
set /p DRVL=Enter a Drive Letter Only ( Example. C ): 
set confd=y
set conffile=
set /p confd=Confirm Before Delete? (y/n) 
if /i "%confd%"=="y" echo y&set conffile=/p
if /i "%confd%"=="n" set confdir=/q
set UFLD=Documents and Settings
if exist "%DRVL%:\Users" set UFLD=Users
if not exist "%DRVL%:\windows\explorer.exe" goto a

set runsix=
if exist %SYSTEMROOT%\sysnative\cmd.exe set runsix="%SYSTEMROOT%\sysnative\cmd.exe" /C 
if /i not "%SYSTEMDRIVE%"=="%DRVL%:" goto a
if not exist %SYSTEMROOT%\System32\wevtutil.exe goto sp
if /i "%confd%"=="y" set /p evend=Clear Event logs? (y/n): 
if /i "%confd%"=="y" if /i not "%evend%"=="y" goto sp
echo Clearing Event Logs
for %%x in (Analytic Application DirectShowFilterGraph DirectShowPluginControl EndpointMapper ForwardedEvents HardwareEvents Internet Explorer Key Management Service MF_MediaFoundationDeviceProxy "Media Center" MediaFoundationDeviceProxy MediaFoundationPerformance MediaFoundationPipeline MediaFoundationPlatform Microsoft-IE/Diagnostic Microsoft-IEFRAME/Diagnostic Microsoft-PerfTrack-IEFRAME/Diagnostic Microsoft-PerfTrack-MSHTML/Diagnostic Microsoft-Windows-ADSI/Debug Microsoft-Windows-API-Tracing/Operational Microsoft-Windows-ATAPort/General Microsoft-Windows-ATAPort/SATA-LPM Microsoft-Windows-ActionQueue/Analytic Microsoft-Windows-AltTab/Diagnostic Microsoft-Windows-AppID/Operational Microsoft-Windows-AppLocker/EXE and DLL Microsoft-Windows-AppLocker/MSI and Script Microsoft-Windows-Application-Experience/Problem-Steps-Recorder Microsoft-Windows-Application-Experience/Program-Compatibility-Assistant Microsoft-Windows-Application-Experience/Program-Compatibility-Troubleshooter Microsoft-Windows-Application-Experience/Program-Inventory Microsoft-Windows-Application-Experience/Program-Inventory/Debug Microsoft-Windows-Application-Experience/Program-Telemetry Microsoft-Windows-Audio/CaptureMonitor Microsoft-Windows-Audio/Operational Microsoft-Windows-Audio/Performance Microsoft-Windows-Audit/Analytic "Microsoft-Windows-Authentication User Interface/Operational" Microsoft-Windows-AxInstallService/Log Microsoft-Windows-Backup Microsoft-Windows-Biometrics/Operational Microsoft-Windows-BitLocker-DrivePreparationTool/Admin Microsoft-Windows-BitLocker-DrivePreparationTool/Operational Microsoft-Windows-Bits-Client/Analytic Microsoft-Windows-Bits-Client/Operational Microsoft-Windows-Bluetooth-MTPEnum/Operational Microsoft-Windows-BranchCache/Operational Microsoft-Windows-BranchCacheClientEventProvider/Diagnostic Microsoft-Windows-BranchCacheEventProvider/Diagnostic Microsoft-Windows-BranchCacheSMB/Analytic Microsoft-Windows-BranchCacheSMB/Operational Microsoft-Windows-CAPI2/Operational Microsoft-Windows-CDROM/Operational Microsoft-Windows-COM/Analytic Microsoft-Windows-COMRuntime/Tracing Microsoft-Windows-Calculator/Debug Microsoft-Windows-Calculator/Diagnostic Microsoft-Windows-CertPoleEng/Operational Microsoft-Windows-CertificateServicesClient-CredentialRoaming/Operational Microsoft-Windows-ClearTypeTextTuner/Diagnostic Microsoft-Windows-CmiSetup/Analytic Microsoft-Windows-CodeIntegrity/Operational Microsoft-Windows-CodeIntegrity/Verbose Microsoft-Windows-ComDlg32/Analytic Microsoft-Windows-ComDlg32/Debug Microsoft-Windows-CorruptedFileRecovery-Client/Operational Microsoft-Windows-CorruptedFileRecovery-Server/Operational Microsoft-Windows-CredUI/Diagnostic Microsoft-Windows-Crypto-RNG/Analytic Microsoft-Windows-DCLocator/Debug Microsoft-Windows-DNS-Client/Operational Microsoft-Windows-DUI/Diagnostic Microsoft-Windows-DUSER/Diagnostic Microsoft-Windows-DXP/Analytic Microsoft-Windows-DateTimeControlPanel/Analytic Microsoft-Windows-DateTimeControlPanel/Debug Microsoft-Windows-DateTimeControlPanel/Operational Microsoft-Windows-Deplorch/Analytic Microsoft-Windows-DeviceSync/Analytic Microsoft-Windows-DeviceSync/Operational Microsoft-Windows-DeviceUx/Informational Microsoft-Windows-DeviceUx/Performance Microsoft-Windows-Dhcp-Client/Admin Microsoft-Windows-Dhcp-Client/Operational Microsoft-Windows-DhcpNap/Admin Microsoft-Windows-DhcpNap/Operational Microsoft-Windows-Dhcpv6-Client/Admin Microsoft-Windows-Dhcpv6-Client/Operational Microsoft-Windows-DiagCpl/Debug Microsoft-Windows-Diagnosis-DPS/Analytic Microsoft-Windows-Diagnosis-DPS/Debug Microsoft-Windows-Diagnosis-DPS/Operational Microsoft-Windows-Diagnosis-MSDE/Debug Microsoft-Windows-Diagnosis-PCW/Analytic Microsoft-Windows-Diagnosis-PCW/Debug Microsoft-Windows-Diagnosis-PCW/Operational Microsoft-Windows-Diagnosis-PLA/Debug Microsoft-Windows-Diagnosis-PLA/Operational Microsoft-Windows-Diagnosis-Perfhost/Analytic Microsoft-Windows-Diagnosis-Scheduled/Operational Microsoft-Windows-Diagnosis-Scripted/Admin Microsoft-Windows-Diagnosis-Scripted/Analytic Microsoft-Windows-Diagnosis-Scripted/Debug Microsoft-Windows-Diagnosis-Scripted/Operational Microsoft-Windows-Diagnosis-ScriptedDiagnosticsProvider/Debug Microsoft-Windows-Diagnosis-ScriptedDiagnosticsProvider/Operational Microsoft-Windows-Diagnosis-TaskManager/Debug Microsoft-Windows-Diagnosis-WDC/Analytic Microsoft-Windows-Diagnosis-WDI/Debug Microsoft-Windows-Diagnostics-Networking/Debug Microsoft-Windows-Diagnostics-Networking/Operational Microsoft-Windows-Diagnostics-PerfTrack-Counters/Diagnostic Microsoft-Windows-Diagnostics-PerfTrack/Diagnostic Microsoft-Windows-Diagnostics-Performance/Diagnostic Microsoft-Windows-Diagnostics-Performance/Diagnostic/Loopback Microsoft-Windows-Diagnostics-Performance/Operational Microsoft-Windows-DirectShow-KernelSupport/Performance Microsoft-Windows-DirectSound/Debug Microsoft-Windows-DirectWrite-FontCache/Tracing Microsoft-Windows-Disk/Operational Microsoft-Windows-DiskDiagnostic/Operational Microsoft-Windows-DiskDiagnosticDataCollector/Operational Microsoft-Windows-DiskDiagnosticResolver/Operational Microsoft-Windows-DisplayColorCalibration/Debug Microsoft-Windows-DisplayColorCalibration/Operational Microsoft-Windows-DisplaySwitch/Diagnostic Microsoft-Windows-Documents/Performance Microsoft-Windows-DriverFrameworks-UserMode/Operational Microsoft-Windows-DxgKrnl/Diagnostic Microsoft-Windows-DxgKrnl/Performance Microsoft-Windows-DxpTaskRingtone/Analytic Microsoft-Windows-DxpTaskSyncProvider/Analytic Microsoft-Windows-EFS/Debug Microsoft-Windows-EapHost/Analytic Microsoft-Windows-EapHost/Debug Microsoft-Windows-EapHost/Operational Microsoft-Windows-EaseOfAccess/Diagnostic Microsoft-Windows-EventCollector/Debug Microsoft-Windows-EventCollector/Operational Microsoft-Windows-EventLog-WMIProvider/Debug Microsoft-Windows-EventLog/Analytic Microsoft-Windows-EventLog/Debug Microsoft-Windows-FMS/Analytic Microsoft-Windows-FMS/Debug Microsoft-Windows-FMS/Operational Microsoft-Windows-FailoverClustering-Client/Diagnostic Microsoft-Windows-Fault-Tolerant-Heap/Operational Microsoft-Windows-Feedback-Service-TriggerProvider Microsoft-Windows-FileInfoMinifilter/Operational Microsoft-Windows-Firewall-CPL/Diagnostic "Microsoft-Windows-Windows Firewall With Advanced Security/Firewall" "Microsoft-Windows-Folder Redirection/Operational" Microsoft-Windows-Forwarding/Debug Microsoft-Windows-Forwarding/Operational Microsoft-Windows-GettingStarted/Diagnostic Microsoft-Windows-GroupPolicy/Operational Microsoft-Windows-HAL/Debug Microsoft-Windows-HealthCenter/Debug Microsoft-Windows-HealthCenter/Performance Microsoft-Windows-HealthCenterCPL/Performance Microsoft-Windows-Help/Operational "Microsoft-Windows-HomeGroup Control Panel Performance/Diagnostic" "Microsoft-Windows-HomeGroup Control Panel/Operational" "Microsoft-Windows-HomeGroup Listener Service/Operational" "Microsoft-Windows-HomeGroup Provider Service Performance/Diagnostic" "Microsoft-Windows-HomeGroup Provider Service/Operational" Microsoft-Windows-HomeGroup-ListenerService Microsoft-Windows-HotStart/Diagnostic Microsoft-Windows-HttpService/Trace Microsoft-Windows-IKE/Operational Microsoft-Windows-IKEDBG/Debug Microsoft-Windows-IPBusEnum/Tracing Microsoft-Windows-IPSEC-SRV/Diagnostic Microsoft-Windows-International-RegionalOptionsControlPanel/Operational Microsoft-Windows-International/Operational Microsoft-Windows-Iphlpsvc/Debug Microsoft-Windows-Iphlpsvc/Operational Microsoft-Windows-Iphlpsvc/Trace Microsoft-Windows-Kernel-Acpi/Diagnostic Microsoft-Windows-Kernel-Boot/Analytic Microsoft-Windows-Kernel-BootDiagnostics/Diagnostic Microsoft-Windows-Kernel-Disk/Analytic Microsoft-Windows-Kernel-EventTracing/Admin Microsoft-Windows-Kernel-EventTracing/Analytic Microsoft-Windows-Kernel-File/Analytic Microsoft-Windows-Kernel-Memory/Analytic Microsoft-Windows-Kernel-Network/Analytic Microsoft-Windows-Kernel-PnP/Diagnostic Microsoft-Windows-Kernel-Power/Diagnostic Microsoft-Windows-Kernel-Power/Thermal-Diagnostic Microsoft-Windows-Kernel-Power/Thermal-Operational Microsoft-Windows-Kernel-Prefetch/Diagnostic Microsoft-Windows-Kernel-Process/Analytic Microsoft-Windows-Kernel-Processor-Power/Diagnostic Microsoft-Windows-Kernel-Registry/Analytic Microsoft-Windows-Kernel-StoreMgr/Analytic Microsoft-Windows-Kernel-StoreMgr/Operational Microsoft-Windows-Kernel-WDI/Analytic Microsoft-Windows-Kernel-WDI/Debug Microsoft-Windows-Kernel-WDI/Operational Microsoft-Windows-Kernel-WHEA/Errors Microsoft-Windows-Kernel-WHEA/Operational "Microsoft-Windows-Known Folders API Service" "Microsoft-Windows-Known Folders/Operational" Microsoft-Windows-L2NA/Diagnostic Microsoft-Windows-LDAP-Client/Debug Microsoft-Windows-LUA-ConsentUI/Diagnostic Microsoft-Windows-LanguagePackSetup/Analytic Microsoft-Windows-LanguagePackSetup/Debug Microsoft-Windows-LanguagePackSetup/Operational Microsoft-Windows-MCT/Operational Microsoft-Windows-MPS-CLNT/Diagnostic Microsoft-Windows-MPS-DRV/Diagnostic Microsoft-Windows-MPS-SRV/Diagnostic Microsoft-Windows-MSPaint/Admin Microsoft-Windows-MSPaint/Debug Microsoft-Windows-MSPaint/Diagnostic Microsoft-Windows-MUI/Admin Microsoft-Windows-MUI/Analytic Microsoft-Windows-MUI/Debug Microsoft-Windows-MUI/Operational Microsoft-Windows-MediaFoundation-MFReadWrite/SinkWriter Microsoft-Windows-MediaFoundation-MFReadWrite/SourceReader Microsoft-Windows-MediaFoundation-MFReadWrite/Transform Microsoft-Windows-MediaFoundation-PlayAPI/Analytic Microsoft-Windows-MemoryDiagnostics-Results/Debug Microsoft-Windows-MobilityCenter/Performance Microsoft-Windows-NCSI/Analytic Microsoft-Windows-NCSI/Operational Microsoft-Windows-NDF-HelperClassDiscovery/Debug Microsoft-Windows-NDIS-PacketCapture/Diagnostic Microsoft-Windows-NDIS/Diagnostic Microsoft-Windows-NDIS/Operational Microsoft-Windows-NTLM/Operational Microsoft-Windows-NWiFi/Diagnostic Microsoft-Windows-Narrator/Diagnostic Microsoft-Windows-NetShell/Performance Microsoft-Windows-Network-and-Sharing-Center/Diagnostic Microsoft-Windows-NetworkAccessProtection/Operational Microsoft-Windows-NetworkAccessProtection/WHC Microsoft-Windows-NetworkLocationWizard/Operational Microsoft-Windows-NetworkProfile/Diagnostic Microsoft-Windows-NetworkProfile/Operational Microsoft-Windows-Networking-Correlation/Diagnostic Microsoft-Windows-NlaSvc/Diagnostic Microsoft-Windows-NlaSvc/Operational Microsoft-Windows-OLEACC/Debug Microsoft-Windows-OLEACC/Diagnostic Microsoft-Windows-OOBE-Machine/Diagnostic Microsoft-Windows-OfflineFiles/Analytic Microsoft-Windows-OfflineFiles/Debug Microsoft-Windows-OfflineFiles/Operational Microsoft-Windows-OfflineFiles/SyncLog Microsoft-Windows-OneX/Diagnostic Microsoft-Windows-OobeLdr/Analytic Microsoft-Windows-PCI/Diagnostic Microsoft-Windows-ParentalControls/Operational Microsoft-Windows-PeerToPeerDrtEventProvider/Diagnostic Microsoft-Windows-PeopleNearMe/Operational Microsoft-Windows-PortableDeviceStatusProvider/Analytic Microsoft-Windows-PortableDeviceSyncProvider/Analytic Microsoft-Windows-PowerCfg/Diagnostic Microsoft-Windows-PowerCpl/Diagnostic Microsoft-Windows-PowerEfficiencyDiagnostics/Diagnostic Microsoft-Windows-PowerShell/Analytic Microsoft-Windows-PowerShell/Operational Microsoft-Windows-PrimaryNetworkIcon/Performance Microsoft-Windows-PrintService/Admin Microsoft-Windows-PrintService/Debug Microsoft-Windows-PrintService/Operational Microsoft-Windows-Program-Compatibility-Assistant/Debug Microsoft-Windows-QoS-Pacer/Diagnostic Microsoft-Windows-QoS-qWAVE/Debug Microsoft-Windows-RPC/Debug Microsoft-Windows-RPC/EEInfo Microsoft-Windows-ReadyBoost/Analytic Microsoft-Windows-ReadyBoost/Operational Microsoft-Windows-ReadyBoostDriver/Analytic Microsoft-Windows-ReadyBoostDriver/Operational Microsoft-Windows-Recovery/Operational Microsoft-Windows-ReliabilityAnalysisComponent/Operational Microsoft-Windows-RemoteApp and Desktop Connections/Admin Microsoft-Windows-RemoteAssistance/Admin Microsoft-Windows-RemoteAssistance/Operational Microsoft-Windows-RemoteAssistance/Tracing Microsoft-Windows-Remotefs-UTProvider/Diagnostic Microsoft-Windows-Resource-Exhaustion-Detector/Operational Microsoft-Windows-Resource-Exhaustion-Resolver/Operational Microsoft-Windows-Resource-Leak-Diagnostic/Operational Microsoft-Windows-ResourcePublication/Tracing Microsoft-Windows-RestartManager/Operational Microsoft-Windows-Search-Core/Diagnostic Microsoft-Windows-Search-ProtocolHandlers/Diagnostic Microsoft-Windows-Security-Audit-Configuration-Client/Diagnostic Microsoft-Windows-Security-Audit-Configuration-Client/Operational Microsoft-Windows-Security-IdentityListener/Operational Microsoft-Windows-Security-SPP/Perf Microsoft-Windows-Sens/Debug Microsoft-Windows-ServiceReportingApi/Debug Microsoft-Windows-Services-Svchost/Diagnostic Microsoft-Windows-Services/Diagnostic Microsoft-Windows-Setup/Analytic Microsoft-Windows-SetupCl/Analytic Microsoft-Windows-SetupQueue/Analytic Microsoft-Windows-SetupUGC/Analytic Microsoft-Windows-ShareMedia-ControlPanel/Diagnostic Microsoft-Windows-Shell-AuthUI-BootAnim/Diagnostic Microsoft-Windows-Shell-AuthUI-Common/Diagnostic Microsoft-Windows-Shell-AuthUI-CredUI/Diagnostic Microsoft-Windows-Shell-AuthUI-Logon/Diagnostic Microsoft-Windows-Shell-AuthUI-PasswordProvider/Diagnostic Microsoft-Windows-Shell-AuthUI-Shutdown/Diagnostic Microsoft-Windows-Shell-Core/Diagnostic Microsoft-Windows-Shell-DefaultPrograms/Diagnostic Microsoft-Windows-Shell-Shwebsvc Microsoft-Windows-Shell-ZipFolder/Diagnostic Microsoft-Windows-Shsvcs/Diagnostic Microsoft-Windows-Sidebar/Diagnostic Microsoft-Windows-Speech-UserExperience/Diagnostic Microsoft-Windows-StickyNotes/Admin Microsoft-Windows-StickyNotes/Debug Microsoft-Windows-StickyNotes/Diagnostic Microsoft-Windows-StorDiag/Operational Microsoft-Windows-StorPort/Operational Microsoft-Windows-Subsys-Csr/Operational Microsoft-Windows-Subsys-SMSS/Operational Microsoft-Windows-Superfetch/Main Microsoft-Windows-Superfetch/StoreLog Microsoft-Windows-Sysprep/Analytic Microsoft-Windows-SystemHealthAgent/Diagnostic Microsoft-Windows-TCPIP/Diagnostic Microsoft-Windows-TSF-msctf/Debug Microsoft-Windows-TSF-msctf/Diagnostic Microsoft-Windows-TSF-msutb/Debug Microsoft-Windows-TSF-msutb/Diagnostic Microsoft-Windows-TZUtil/Operational Microsoft-Windows-TaskScheduler/Debug Microsoft-Windows-TaskScheduler/Diagnostic Microsoft-Windows-TaskScheduler/Operational Microsoft-Windows-TaskbarCPL/Diagnostic Microsoft-Windows-TerminalServices-LocalSessionManager/Admin Microsoft-Windows-TerminalServices-LocalSessionManager/Analytic Microsoft-Windows-TerminalServices-LocalSessionManager/Debug Microsoft-Windows-TerminalServices-LocalSessionManager/Operational Microsoft-Windows-TerminalServices-MediaRedirection/Analytic Microsoft-Windows-TerminalServices-PnPDevices/Admin Microsoft-Windows-TerminalServices-PnPDevices/Analytic Microsoft-Windows-TerminalServices-PnPDevices/Debug Microsoft-Windows-TerminalServices-PnPDevices/Operational Microsoft-Windows-TerminalServices-RDPClient/Analytic Microsoft-Windows-TerminalServices-RDPClient/Debug Microsoft-Windows-TerminalServices-RDPClient/Operational Microsoft-Windows-TerminalServices-RdpSoundDriver/Capture Microsoft-Windows-TerminalServices-RdpSoundDriver/Playback Microsoft-Windows-TerminalServices-RemoteConnectionManager/Admin Microsoft-Windows-TerminalServices-RemoteConnectionManager/Analytic Microsoft-Windows-TerminalServices-RemoteConnectionManager/Debug Microsoft-Windows-TerminalServices-RemoteConnectionManager/Operational Microsoft-Windows-ThemeCPL/Diagnostic Microsoft-Windows-ThemeUI/Diagnostic Microsoft-Windows-TunnelDriver Microsoft-Windows-UAC-FileVirtualization/Operational Microsoft-Windows-UAC/Operational Microsoft-Windows-UIAnimation/Diagnostic Microsoft-Windows-UIAutomationCore/Debug Microsoft-Windows-UIAutomationCore/Diagnostic Microsoft-Windows-UIAutomationCore/Perf Microsoft-Windows-UIRibbon/Diagnostic Microsoft-Windows-USB-USBHUB/Diagnostic Microsoft-Windows-USB-USBPORT/Diagnostic "Microsoft-Windows-User Control Panel Performance/Diagnostic" "Microsoft-Windows-User Profile Service/Diagnostic" "Microsoft-Windows-User Profile Service/Operational" Microsoft-Windows-User-Loader/Analytic Microsoft-Windows-UserModePowerService/Diagnostic Microsoft-Windows-UserPnp/DeviceMetadata/Debug Microsoft-Windows-UserPnp/DeviceNotifications Microsoft-Windows-UserPnp/Performance Microsoft-Windows-UserPnp/SchedulerOperations Microsoft-Windows-UxTheme/Diagnostic Microsoft-Windows-VAN/Diagnostic Microsoft-Windows-VDRVROOT/Operational Microsoft-Windows-VHDMP/Operational Microsoft-Windows-VWiFi/Diagnostic "Microsoft-Windows-Virtual PC/Admin" Microsoft-Windows-VolumeControl/Performance Microsoft-Windows-VolumeSnapshot-Driver/Operational Microsoft-Windows-WABSyncProvider/Analytic Microsoft-Windows-WCN-Config-Registrar/Diagnostic Microsoft-Windows-WER-Diag/Operational Microsoft-Windows-WFP/Analytic Microsoft-Windows-WFP/Operational Microsoft-Windows-WLAN-AutoConfig/Operational Microsoft-Windows-WLAN-Autoconfig/Diagnostic Microsoft-Windows-WLANConnectionFlow/Diagnostic Microsoft-Windows-WMI-Activity/Trace Microsoft-Windows-WMPDMCCore/Diagnostic Microsoft-Windows-WMPDMCUI/Diagnostic Microsoft-Windows-WMPNSS-PublicAPI/Diagnostic Microsoft-Windows-WMPNSS-Service/Diagnostic Microsoft-Windows-WMPNSSUI/Diagnostic Microsoft-Windows-WPD-ClassInstaller/Analytic Microsoft-Windows-WPD-ClassInstaller/Operational Microsoft-Windows-WPD-CompositeClassDriver/Analytic Microsoft-Windows-WPD-CompositeClassDriver/Operational Microsoft-Windows-WPD-MTPClassDriver/Operational Microsoft-Windows-WSC-SRV/Diagnostic Microsoft-Windows-WUSA/Debug Microsoft-Windows-WWAN-MM-Events/Diagnostic Microsoft-Windows-WWAN-NDISUIO-EVENTS/Diagnostic Microsoft-Windows-WWAN-SVC-Events/Diagnostic Microsoft-Windows-WWAN-UI-Events/Diagnostic Microsoft-Windows-WebIO-NDF/Diagnostic Microsoft-Windows-WebIO/Diagnostic Microsoft-Windows-WebServices/Tracing Microsoft-Windows-Win32k/Concurrency Microsoft-Windows-Win32k/Power Microsoft-Windows-Win32k/Render Microsoft-Windows-Win32k/Tracing Microsoft-Windows-Win32k/UIPI Microsoft-Windows-WinHTTP-NDF/Diagnostic Microsoft-Windows-WinHttp/Diagnostic Microsoft-Windows-WinINet/Analytic Microsoft-Windows-WinRM/Analytic Microsoft-Windows-WinRM/Debug Microsoft-Windows-WinRM/Operational Microsoft-Windows-Windeploy/Analytic "Microsoft-Windows-Windows Defender/Operational" "Microsoft-Windows-Windows Defender/WHC" "Microsoft-Windows-Windows Firewall With Advanced Security/ConnectionSecurity" "Microsoft-Windows-Windows Firewall With Advanced Security/ConnectionSecurityVerbose" "Microsoft-Windows-Windows Firewall With Advanced Security/Firewall" "Microsoft-Windows-Windows Firewall With Advanced Security/FirewallVerbose" Microsoft-Windows-WindowsBackup/ActionCenter Microsoft-Windows-WindowsColorSystem/Debug Microsoft-Windows-WindowsColorSystem/Operational Microsoft-Windows-WindowsSystemAssessmentTool/Operational Microsoft-Windows-WindowsSystemAssessmentTool/Tracing Microsoft-Windows-WindowsUpdateClient/Operational Microsoft-Windows-Wininit/Diagnostic Microsoft-Windows-Winlogon/Diagnostic Microsoft-Windows-Winlogon/Operational Microsoft-Windows-Winsock-AFD/Operational Microsoft-Windows-Winsock-WS2HELP/Operational Microsoft-Windows-Winsrv/Analytic Microsoft-Windows-Wired-AutoConfig/Diagnostic Microsoft-Windows-Wired-AutoConfig/Operational Microsoft-Windows-Wordpad/Admin Microsoft-Windows-Wordpad/Debug Microsoft-Windows-Wordpad/Diagnostic Microsoft-Windows-mobsync/Diagnostic Microsoft-Windows-ntshrui Microsoft-Windows-osk/Diagnostic Microsoft-Windows-stobject/Diagnostic ODiag OSession Security Setup System TabletPC_InputPanel_Channel WINDOWS_MP4SDECD_CHANNEL WMPSetup WMPSyncEngine "Windows PowerShell") do echo.&echo Clearing %%x& %runsix% wevtutil.exe cl %%x
:sp
if /i "%confd%"=="y" set /p spbk=Clear Service pack backup files? (y/n): 
if /i "%confd%"=="y" if /i not "%spbk%"=="y" goto a
if exist %SYSTEMROOT%\System32\vsp1cln.exe %runsix% vsp1cln.exe /quiet
if exist %SYSTEMROOT%\System32\compcln.exe %runsix% compcln.exe /quiet
if exist %SYSTEMROOT%\System32\dism.exe %runsix% dism.exe /online /cleanup-image /spsuperseded /hidesp
:a
(
echo %DRVL%:\pagefile.sys
echo %DRVL%:\hiberfil.sys
echo %DRVL%:\Windows\WindowsUpdate.log
)>%SYSTEMDRIVE%\$tmplistf.txt 2>nul
(
dir /b /s "%DRVL%:\Windows\inf\setupapi*.log"
dir /b /s "%DRVL%:\Windows\Microsoft.NET\Framework\*.log"
)>>%SYSTEMDRIVE%\$tmplistf.txt 2>nul


(
echo %DRVL%:\$Recycle.Bin
echo %DRVL%:\Recycler
echo %DRVL%:\Recycled
echo %DRVL%:\System Volume Information
echo %DRVL%:\Temp
echo %DRVL%:\ProgramData\Microsoft\Windows\WER
echo %DRVL%:\ProgramData\Microsoft\Windows Defender\Scans\History\Results
echo %DRVL%:\Program Files\Google\Update\Download
echo %DRVL%:\Windows\Prefetch
echo %DRVL%:\Windows\pchealth\ERRORREP
echo %DRVL%:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Media Player\Art Cache
echo %DRVL%:\Windows\SoftwareDistribution\Download
echo %DRVL%:\Windows\SoftwareDistribution\DataStore\Logs
echo %DRVL%:\Windows\System32\spool\Printers
echo %DRVL%:\Windows\Temp
echo %DRVL%:\Windows\Logs
echo %DRVL%:\Windows\Debug
echo %DRVL%:\Windows\MiniDump
echo %DRVL%:\Windows\Security\Logs
echo %DRVL%:\Windows\System32\Wbem\Logs
)>%SYSTEMDRIVE%\$tmplistd.txt

for /F "tokens=* delims=" %%w in ('dir "%DRVL%:\Windows\$n*$" /A:D /b 2^>nul') do (
echo %DRVL%:\Windows\%%w>>%SYSTEMDRIVE%\$tmplistd.txt
)

for /F "tokens=* delims=" %%i in ('dir "%DRVL%:\%UFLD%" /A:D-H /b 2^>nul') do (
(
echo %DRVL%:\%UFLD%\%%i\AppData\Roaming\Adobe\Flash Player\AssetCache
echo %DRVL%:\%UFLD%\%%i\AppData\Roaming\Macromedia\Flash Player
echo %DRVL%:\%UFLD%\%%i\AppData\Roaming\Microsoft\Windows\Cookies
echo %DRVL%:\%UFLD%\%%i\AppData\Roaming\Microsoft\Windows\Recent
echo %DRVL%:\%UFLD%\%%i\AppData\LocalLow\Microsoft\CryptnetUrlCache
echo %DRVL%:\%UFLD%\%%i\AppData\LocalLow\Sun\Java\Deployment\cache
echo %DRVL%:\%UFLD%\%%i\AppData\LocalLow\Sun\Java\Deployment\SystemCache
echo %DRVL%:\%UFLD%\%%i\AppData\LocalLow\Sun\Java\Deployment\javaws\cache
echo %DRVL%:\%UFLD%\%%i\AppData\Local\Downloaded Installations
echo %DRVL%:\%UFLD%\%%i\AppData\Local\Google\Chrome\User Data\Default\Cache
echo %DRVL%:\%UFLD%\%%i\AppData\Local\Microsoft\Media Player
echo %DRVL%:\%UFLD%\%%i\AppData\Local\Microsoft\Messenger
echo %DRVL%:\%UFLD%\%%i\AppData\Local\Microsoft\Windows Live Contacts
echo %DRVL%:\%UFLD%\%%i\AppData\Local\Microsoft\Windows\Explorer
echo %DRVL%:\%UFLD%\%%i\AppData\Local\Microsoft\Windows\Temporary Internet Files
echo %DRVL%:\%UFLD%\%%i\AppData\Local\Mozilla\Firefox\Profiles
echo %DRVL%:\%UFLD%\%%i\AppData\Local\Temp
echo %DRVL%:\%UFLD%\%%i\AppData\Local\Microsoft\Windows\Burn
echo %DRVL%:\%UFLD%\%%i\Application Data\Sun\Java\Deployment\cache
echo %DRVL%:\%UFLD%\%%i\Application Data\Sun\Java\Deployment\SystemCache
echo %DRVL%:\%UFLD%\%%i\Application Data\Sun\Java\Deployment\javaws\cache
echo %DRVL%:\%UFLD%\%%i\Application Data\Opera\Opera\cache
echo %DRVL%:\%UFLD%\%%i\Local Settings\Application Data\Google\Chrome\User Data\Default\Cache
echo %DRVL%:\%UFLD%\%%i\Local Settings\Application Data\Mozilla\Firefox\Profiles
echo %DRVL%:\%UFLD%\%%i\Local Settings\Application Data\Microsoft\Media Player\Art Cache
echo %DRVL%:\%UFLD%\%%i\Application Data\Microsoft\CryptnetUrlCache
echo %DRVL%:\%UFLD%\%%i\Application Data\Macromedia\Flash Player
echo %DRVL%:\%UFLD%\%%i\Application Data\Adobe\Flash Player\AssetCache
echo %DRVL%:\%UFLD%\%%i\Recent
echo %DRVL%:\%UFLD%\%%i\Local Settings\Temp
echo %DRVL%:\%UFLD%\%%i\Local Settings\Temporary Internet Files
echo %DRVL%:\%UFLD%\%%i\Local Settings\Temp\History
echo %DRVL%:\%UFLD%\%%i\Local Settings\Temp\Temporary Internet Files
)>>%SYSTEMDRIVE%\$tmplistd.txt

for /d %%c in ("%DRVL%:\Program Files\Google\Chrome\Application\*") do echo %%c\installer>>%SYSTEMDRIVE%\$tmplistd.txt
(
dir /b /s "%DRVL%:\%UFLD%\%%i\AppData\Local\Microsoft\Windows Mail\edb*.log"
dir /b /s "%DRVL%:\%UFLD%\%%i\AppData\Local\Microsoft\Windows Mail\edb*.jrs"
echo "%DRVL%:\%UFLD%\%%i\AppData\Local\IconCache.db"
)>>%SYSTEMDRIVE%\$tmplistf.txt 2>nul
)
echo.
echo Delete Confirmation
for /F "tokens=* delims=" %%j in (%SYSTEMDRIVE%\$tmplistf.txt) do (
if exist "%%j" echo Removing %%j &del /f /a %conffile% "%%j"
)
del %SYSTEMDRIVE%\$tmplistf.txt

for /F "tokens=* delims=" %%j in (%SYSTEMDRIVE%\$tmplistd.txt) do (
if exist "%%j" echo Removing Directory %%j &rmdir /s %confdir% "%%j"
)
del %SYSTEMDRIVE%\$tmplistd.txt

:y
mkdir %DRVL%:\Windows\Temp
if not exist %SYSTEMROOT%\System32\cleanmgr.exe goto sc
if /i "%confd%"=="y" set /p clnm=Clear everything from "Disk Cleanup" section using windows tool? (y/n): 
if /i "%confd%"=="y" if /i not "%clnm%"=="y" goto sc
for %%c in ("Active Setup Temp Folders","Content Indexer Cleaner","GameNewsFiles","GameUpdateFiles","Internet Cache Files","Memory Dump Files","Microsoft Office Temp Files","Microsoft_Event_Reporting_2.0_Temp_Files","Office Setup Files","Offline Files","Offline Pages Files","Old ChkDsk Files","Previous Installations","Remote Desktop Cache Files","Service Pack Cleanup","Setup Log Files","System error memory dump files","System error minidump files","System Restore","Temporary Files","Temporary Setup Files","Temporary Offline Files","Temporary Sync Files","Thumbnail Cache","Uninstall Backup Image","Upgrade Discarded Files","WebClient and WebPublisher Cache","Windows Error Reporting Archive Files","Windows Error Reporting Queue Files","Windows Error Reporting System Archive Files","WebClient and WebPublisher Cache","Windows Error Reporting System Queue Files","Windows Upgrade Log Files") do (
%runsix% REG.exe ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\%%~c" /v StateFlags0011 /t REG_DWORD /d 2 /f
)>nul
%runsix% cleanmgr.exe /d %DRVL%: /sagerun:11
:sc
echo.
if not "%UFLD%"=="Users" goto z
if not exist %SYSTEMROOT%\System32\vssadmin.exe goto z
echo System Restore Points (Shadow Copies) 
%runsix% vssadmin Delete Shadows /For=%DRVL%: /All
:z
echo Done.
if exist %SYSTEMROOT%\TempFileCleaner.cmd del %SYSTEMROOT%\TempFileCleaner.cmd&pause>nul&exit

