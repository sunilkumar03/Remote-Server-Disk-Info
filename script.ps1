$inputC = Read-Host "Client id (please put 'd' if dev instance)"
$list = $inputC 
$idols = @(Get-ADComputer -Filter {Name -like $list} | Select-Object -ExpandProperty Name)

foreach ($idol in $idols) {
    $disks = Invoke-Command -ComputerName $idol -ScriptBlock {
        Get-WmiObject -Class Win32_LogicalDisk | Where-Object {$_.DriveType -eq 3}
    }

    # Display the server name
    Write-Host ""
    Write-Host "Server Name: $idol"

    # Display the disk details
    Write-Host "DeviceID VolumeName   TotalSpace FreeSpace FreeSpace(%)"
    Write-Host "-------- ----------   ---------- --------- ------------"

    $disks | Select-Object @{Name = "DeviceID"; Expression = {$_.DeviceID}},
                          @{Name = "VolumeName"; Expression = {$_.VolumeName}},
                          @{Name = "TotalSpace"; Expression = {[Math]::Round($_.Size / 1GB, 1)}},
                          @{Name = "FreeSpace"; Expression = {[Math]::Round($_.FreeSpace / 1GB, 1)}},
                          @{Name = "FreeSpace(%)"; Expression = {("{0:P1}" -f ($_.FreeSpace / $_.Size))}} |
             Format-Table -AutoSize
}
