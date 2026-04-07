function GenerateIgnoreList($SelectedGames) {
    $IgnoreList = @()
    foreach ($Game in $SelectedGames) {
        foreach($Feature in $Game.Features) {
            if ($Feature.Name -NotMatch "\[Sync\]") {
                continue
            }
            $SyncType = ($Feature.Name -replace "\[Sync\] ", "").ToLower() -replace " ", "_"
            $IgnoreFile = $Game.InstallDirectory + "_ignore_list_" + $SyncType + ".txt"
            if (-not (Test-Path -LiteralPath $IgnoreFile -PathType Leaf)) {
                New-Item -Path $IgnoreFile -ItemType File
                Add-Content -Path $IgnoreFile -Value "*"
            }

            foreach ($Rom in $Game.Roms) {
                $IgnorePath = $Rom.Path.replace("{InstallDir}\", "!")
                $Content = Get-Content -Path $IgnoreFile
                if ($Content -notcontains $IgnorePath) {
                    $Content = @($IgnorePath) + $Content
                    Set-Content -Path $IgnoreFile -Value $Content
                    $IgnoreList += $IgnorePath
                }

                if ($IgnorePath -notmatch "\.m3u$") {
                    continue
                }
                $Path = $Rom.Path.replace("{InstallDir}\", $Game.InstallDirectory)
                $M3uContent = Get-Content -Path $Path
                foreach ($DiscPath in $M3uContent) {
                    $IgnorePath = "!" + $DiscPath
                    $Content = Get-Content -Path $IgnoreFile
                    if ($Content -notcontains $IgnorePath) {
                        $Content = @($IgnorePath) + $Content
                        Set-Content -Path $IgnoreFile -Value $Content
                        $IgnoreList += $IgnorePath
                    }
                }
            }
        }
    }
    return $IgnoreList
}