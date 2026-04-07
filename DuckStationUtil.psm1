Import-Module "$PSScriptRoot\Helpers.psm1"
Import-Module "$PSScriptRoot\Config.psm1"

function SyncRetroArchToDuckStationSaves($SelectedGames) {
    $Cfg = Get-Config
    $Count = 0
    foreach ($Game in $SelectedGames) {
        if ($Game.Platforms[0].Name -ne "Sony PlayStation") {
            continue
        }
        if ($Game.Roms.Count -eq 0) {
            continue
        }
        $RomName = Get-RomName $Game
        $DuckStationSavePath = $Cfg.DuckStationMemcardsPath + "\" + $RomName + "_1.mcd"
        $RetroArchSavePath = $Cfg.RetroArchSavesPath + "\" + $RomName + ".srm"
        if (Test-Path -LiteralPath $RetroArchSavePath -PathType Leaf) {
            Copy-Item -LiteralPath $RetroArchSavePath -Destination $DuckStationSavePath -Force
            Write-Output "Synced save for $RomName"
            $Count++
        }
    }

    return $Count
}

function SyncDuckStationToRetroArchSave($SelectedGames) {
    $Cfg = Get-Config
    $Count = 0
    foreach ($Game in $SelectedGames) {
        if ($Game.Platforms[0].Name -ne "Sony PlayStation") {
            continue
        }
        if ($Game.Roms.Count -eq 0) {
            continue
        }
        $RomName = Get-RomName $Game
        $DuckStationSavePath = $Cfg.DuckStationMemcardsPath + "\" + $RomName + "_1.mcd"
        $RetroArchSavePath = $Cfg.RetroArchSavesPath + "\" + $RomName + ".srm"
        if (Test-Path -LiteralPath $DuckStationSavePath -PathType Leaf) {
            Copy-Item -LiteralPath $DuckStationSavePath -Destination $RetroArchSavePath -Force
            Write-Output "Synced save for $RomName"
            $Count++
        }
    }

    return $Count
}
