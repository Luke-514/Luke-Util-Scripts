$CPU = Get-CimInstance -ClassName Win32_Processor | Select-Object -ExpandProperty Name

$MEM = Get-CimInstance -ClassName Win32_PhysicalMemory | ForEach-Object {
    [PSCustomObject]@{
        Manufacturer = $_.Manufacturer.Trim()
        PartNumber   = $_.PartNumber.Trim()
        Capacity_GB  = [math]::Round($_.Capacity / 1GB, 1)
    }
}
$MEM_Total = ($MEM.Capacity_GB | Measure-Object -Sum).Sum

$GPU = Get-CimInstance -ClassName Win32_VideoController | ForEach-Object {
    [PSCustomObject]@{
        Name    = $_.Name.Trim()
        VRAM_GB = [math]::Round($_.AdapterRAM / 1GB, 1)
    }
}

$Storage = Get-CimInstance -ClassName Win32_DiskDrive | ForEach-Object {
    [PSCustomObject]@{
        Model     = $_.Model.Trim()
        MediaType = if ($_.MediaType) { $_.MediaType.Trim() } else { "Unknown" }
        Size_TB   = "{0:N2} TB" -f ($_.Size / 1TB)
    }
}

$PageFile = Get-CimInstance -ClassName Win32_PageFileUsage | ForEach-Object {
    [PSCustomObject]@{
        Path           = $_.Name
        Allocated_GB   = [math]::Round($_.AllocatedBaseSize / 1024, 2)
    }
}
$VMEM_Total = ($PageFile.Allocated_GB | Measure-Object -Sum).Sum

$MB = Get-CimInstance -ClassName Win32_BaseBoard | Select-Object -First 1
$MBINFO = "$($MB.Manufacturer.Trim()) $($MB.Product.Trim())"

$OS = Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -First 1
$OSName = $OS.Caption.Trim()
$OSVer = $OS.Version

Write-Host "===== System Info ====="
Write-Host ("CPU           : {0}" -f $CPU)
Write-Host ("Memory        : {0} GB (Total)" -f $MEM_Total)
Write-Host ("VirtualMemory : {0} GB (Total)" -f $VMEM_Total)
Write-Host ("Motherboard   : {0}" -f $MBINFO)
Write-Host ("OS            : {0} (Version {1})" -f $OSName, $OSVer)
Write-Host ""

Write-Host "===== Memory ====="
$MEM | Format-Table -AutoSize

Write-Host "===== Virtual Memory ====="
$PageFile | Format-Table -AutoSize

Write-Host "===== GPU ====="
$GPU | Format-Table -AutoSize

Write-Host "===== Storage ====="
$Storage | Format-Table -AutoSize

