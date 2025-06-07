# DefenderLogMonitor.ps1
# Author: Mary
# Description: Monitors recent Windows Defender events for malware detection or issues.

# Set time window (last 24 hours)
$startTime = (Get-Date).AddDays(-1)

# Get Defender event logs from the Security-Microsoft-Windows-Windows Defender/Operational log
$events = Get-WinEvent -FilterHashtable @{
    LogName = "Microsoft-Windows-Windows Defender/Operational"
    StartTime = $startTime
} | Where-Object {
    $_.Id -in @(1006, 1007, 1116, 1117, 1118)
}

# Interpret key event IDs
$eventNames = @{
    1006 = "Malware detected"
    1007 = "Malware action taken"
    1116 = "Threat detected"
    1117 = "Threat remediation failed"
    1118 = "Threat remediation successful"
}

# Display or log findings
if ($events) {
    Write-Host "⚠️ Defender Alerts Found (Past 24hrs):" -ForegroundColor Yellow
    foreach ($event in $events) {
        $name = $eventNames[$event.Id]
        $time = $event.TimeCreated
        $msg = $event.Message
        Write-Host "[$time] $name`n$msg`n" -ForegroundColor Cyan
    }
} else {
    Write-Host "✅ No Defender threats found in the past 24 hours." -ForegroundColor Green
}