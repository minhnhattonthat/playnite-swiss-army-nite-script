
function SyncRetroArchToDuckStationSaves($SelectedGames) {
    $Count = 0
    foreach ($Game in $SelectedGames) {
        if ($Game.Platforms[0].Name -ne "Sony PlayStation") {
            continue
        }
        if ($Game.Roms.Count -eq 0) {
            continue
        }
        $FileName = Split-Path $Game.Roms[0].Path -Leaf
        $Extension = $FileName.Split('.') | Select-Object -Last 1
        $RomName = $FileName.Substring(0, $FileName.Length - $Extension.Length - 1)
        $DuckStationSavePath = "E:\DuckStation\memcards\" + $RomName + "_1.mcd"
        $RetroArchSavePath = "H:\RetroArch\saves\Beetle PSX HW\" + $RomName + ".srm"
        if (Test-Path -LiteralPath $RetroArchSavePath -PathType Leaf) {
            Copy-Item -LiteralPath $RetroArchSavePath -Destination $DuckStationSavePath -Force
            Write-Output "Synced save for $RomName"
            $Count++
        }
    }

    return $Count
}
function Test($Game) {
    $FileName = Split-Path $Game.Roms[0].Path -Leaf
    $Extension = $FileName.Split('.') | Select-Object -Last 1
    $RomName = $FileName.Substring(0, $FileName.Length - $Extension.Length - 1)
    $DuckStationSavePath = "E:\DuckStation\memcards\" + $RomName + "_1.mcd"
    $RetroArchSavePath = "H:\RetroArch\saves\Beetle PSX HW\" + $RomName + ".srm"
    $RetroArchLastWrite = $null
    $DuckStationLastWrite = $null
    $RetroArchSaveExists = $false
    $DuckStationSaveExists = $false
    if (Test-Path -LiteralPath $RetroArchSavePath -PathType Leaf) {
        $RetroArchLastWrite = (Get-Item -LiteralPath $RetroArchSavePath).LastWriteTime
        $RetroArchSaveExists = $true
    }
    if (Test-Path -LiteralPath $DuckStationSavePath -PathType Leaf) {
        $DuckStationLastWrite = (Get-Item -LiteralPath $DuckStationSavePath).LastWriteTime
        $DuckStationSaveExists = $true
    }
    if ($RetroArchSaveExists -and $RetroArchLastWrite -gt $DuckStationLastWrite) {
        Copy-Item -LiteralPath $DuckStationSavePath -Destination $RetroArchSavePath -Force
        Write-Output "Synced save from retroarch for $RomName"
    } elseif ($DuckStationSaveExists -and $DuckStationLastWrite -gt $RetroArchLastWrite) {
        Copy-Item -LiteralPath $RetroArchSavePath -Destination $DuckStationSavePath -Force
        Write-Output "Synced save from duckstation for $RomName"
    }
}

function SyncDuckStationToRetroArchSave($Game) {
    if ($Game.Platforms[0].Name -ne "Sony PlayStation") {
        continue
    }
    if ($Game.Roms.Count -eq 0) {
        continue
    }
    $FileName = Split-Path $Game.Roms[0].Path -Leaf
    $Extension = $FileName.Split('.') | Select-Object -Last 1
    $RomName = $FileName.Substring(0, $FileName.Length - $Extension.Length - 1)
    $DuckStationSavePath = "E:\DuckStation\memcards\" + $RomName + "_1.mcd"
    $RetroArchSavePath = "H:\RetroArch\saves\Beetle PSX HW\" + $RomName + ".srm"
    if (Test-Path -LiteralPath $DuckStationSavePath -PathType Leaf) {
        Copy-Item -LiteralPath $DuckStationSavePath -Destination $RetroArchSavePath -Force
        Write-Output "Synced save for $RomName"
    }
}