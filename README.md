# DefenderLogMonitor

**Author**:Mary
**Role**: SOC Analyst (in training)  
**Tool**: PowerShell

## Overview

This PowerShell script scans Windows Defender logs from the past 24 hours to detect:

- Malware/threat detections
- Remediation attempts (successful or failed)
- Suspicious behavior (e.g. tampering or blocked threats)

It’s a lightweight log-monitoring tool useful for blue teamers and anyone interested in endpoint protection.

---

##  How It Works

- Collects recent events from:
  `Microsoft-Windows-Windows Defender/Operational`
- Filters key Event IDs:
  - `1006` - Malware detected
  - `1007` - Action taken
  - `1116` - Threat detected
  - `1117` - Remediation failed
  - `1118` - Remediation successful
- Outputs results in readable format

> ✅ If no threats are found, it returns:  
> `No Defender threats found in the past 24 hours.`

---

##  Tools Used

- PowerShell
- Windows Defender event logs
- Windows Event Viewer API

---

##  How to Run

1. Save the script as: `DefenderLogMonitor.ps1`
2. Open PowerShell **as Administrator**
3. Run the script:
   ```powershell
   .\DefenderLogMonitor.ps1

   Security Note

This script is read-only. It queries logs only — no system changes are made. Ideal for learning, auditing, or home lab use.

## Sample Output
[06/05/2025 10:34:22] Malware detected
Threat: Trojan:Win32/AgentTesla
Action: Quarantine succeeded

Why This Project Matters

Monitoring Defender logs is a practical skill in endpoint protection and threat hunting. This project shows my ability to:
	•	Analyze system logs
	•	Automate blue team tasks
	•	Understand security events at the OS level
