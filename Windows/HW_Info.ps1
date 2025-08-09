$CPU = Get-CimInstance -ClassName Win32_Processor | Select-Object -ExpandProperty Name

$MEM = Get-CimInstance -ClassName Win32_PhysicalMemory | ForEach-Object {
    [PSCustomObject]@{
        Manufacturer = $_.Manufacturer.Trim()
        PartNumber   = $_.PartNumber.Trim()
        Capacity_GB  = [math]::Round($_.Capacity / 1GB, 1)
    }
}
$MEM_Total = ($MEM.Capacity_GB | Measure-Object -Sum).Sum

if (Test-Path -LiteralPath "dxdiag.txt") {
    $text = Get-Content -Raw -LiteralPath "dxdiag.txt"

    $pattern = '(?ms)Card name:\s*(.+?)\r?\n.*?Dedicated Memory:\s*([\d,]+)\s*(MB|GB)'
    $matches = [regex]::Matches($text, $pattern)

    $GPU = foreach ($m in $matches) {
        $name = $m.Groups[1].Value.Trim()
        $sizeStr = $m.Groups[2].Value.Replace(',', '')
        $unit = $m.Groups[3].Value.ToUpper()

        if ($unit -eq 'MB') {
            $VRAM = [math]::Round($sizeStr / 1024)
        }
        else {
            $VRAM = [math]::Round($sizeStr)
        }

        [PSCustomObject]@{
            Name    = $name
            VRAM_GB = [int]$VRAM
        }
    }
}
else {
    $GPU = Get-CimInstance -ClassName Win32_VideoController | ForEach-Object {
        [PSCustomObject]@{
            Name    = $_.Name.Trim()
            VRAM_GB = [math]::Round($_.AdapterRAM / 1GB, 1)
        }
    }
}

function Convert-MediaType {
    param($mediaType)
    switch ($mediaType) {
        3 { 'HDD' }
        4 { 'SSD' }
        5 { 'SCM' }
        default { 'Unknown' }
    }
}

$Storage = Get-CimInstance -Namespace root\Microsoft\Windows\Storage -ClassName MSFT_PhysicalDisk | ForEach-Object {
    [PSCustomObject]@{
        Model     = $_.FriendlyName.Trim()
        MediaType = Convert-MediaType $_.MediaType
        Size_TB   = [math]::Round($_.Size / 1TB, 2)
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
