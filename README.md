# Remote-Server-Disk-Info
PowerShell script to retrieve disk info (DeviceID, VolumeName, TotalSpace, FreeSpace, FreeSpace(%)) from remote computers. Prompt for client ID ('d' for dev), use Get-ADComputer &amp; Invoke-Command. Output in a tabular format.

This PowerShell script allows you to retrieve disk information (such as DeviceID, VolumeName, TotalSpace, FreeSpace, and FreeSpace(%)) from multiple remote computers. The script prompts for a client ID (or 'd' for a development instance) and fetches the details using the Get-ADComputer and Invoke-Command cmdlets. The output is displayed in a tabular format for easy readability.
