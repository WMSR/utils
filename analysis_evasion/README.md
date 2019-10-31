# Target Selection and Sandbox Detection

### Processes
Check the running processes on the box for the following processes:
- AgentSimulator.exe
- B.exe
- BehaviorDumper
- BennyDB.exe
- ctfmon.exe
- DFLocker64
- FrzState2k
- gemu – ga.exe
- iexplore.exe
- ImmunityDebugger
- LOGSystem.Agent.Service.exe
- lordPE.exe
- ProcessHacker
- procexp
- Procmon
- PROCMON
- Proxifier.exe
- tcpdump
- VBoxService
- VBoxTray.exe
- vmtoolsd
- vmware
- VzService.exe
- windanr.exe
- Wireshark
- SAMPLE.EXE
- MALWARE.EXE
- BOT.EXE
- SANDBOX.EXE
- TEST.EXE
- KLAVME.EXE
- MYAPP.EXE
- TESTAPP.EXE
- Python.EXE
- vmacthlp.exe


### Usernames
Check the users on the system for the following users:
- Emily
- HAPUBWS
- Hong Lee
- Johnson
- milozs
- Peter Wilson
- SystemIT | admin
- VmRemoteGuest
- WIN7 – TRAPS

### Loaded DLLs
Check your processes for the following DLLs loaded:
- pstorec.dll
- vmcheck.dll
- dbghelp.dll
- wpespy.dll
- api_log.dll
- SbieDll.dll
- SxIn.dll
- dir_watch.dll
- Sf2.dll
- cmdvrt32.dll
- snxhk.dll

### MAC Addresses
Check for the following MAC Addresses:

| MAC Address | Vendor |
|---------|---------------------------|
| F01FAF00	| Dell |
| 00505600	| VMWare |
| 8002700	| PCS System Technology GmbH |
| 000C2900 | VMWare |
| 00056900	| VMWare |
| 0003FF00	| Microsoft |
| 001C4200	| Parallels |
| 00163E00	| XenSource |

### Registry Queries
Check for the existence of or the data in the following keys:
- \HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Word\User MRU (Look for recently opened files)
- HARDWARE\Description\System\VideoBiosVersion (Look for VirtualBox)
- SOFTWARE\Microsoft\Windows\CurrentVersion\SystemBiosVersion (See Footnote #1)
- HARDWARE\DESCRIPTION\System\SystemBiosVersion

### Other Notable Methodologies
- Language Checks
- Domain Joined


### References
- https://blog.trendmicro.com/trendlabs-security-intelligence/latest-trickbot-campaign-delivered-via-highly-obfuscated-js-file/
- https://www.cert.pl/en/news/single/detricking-trickbot-loader/
- https://www.sentinelone.com/blog/gootkit-banking-trojan-deep-dive-anti-analysis-features/
- https://github.com/LordNoteworthy/al-khaser
- https://unit42.paloaltonetworks.com/unit42-upatre-continues-evolve-new-anti-analysis-techniques/
- https://www.bleepingcomputer.com/news/security/upgraded-jasperloader-malware-adds-anti-analysis-mechanisms/

### Footnotes
1. 55274-640-2673064-23950: Joe Sandbox <br/>
76487-644-3177037-23510: CWSandbox <br/>
76487-337-8429955-22614: CWSandbox
