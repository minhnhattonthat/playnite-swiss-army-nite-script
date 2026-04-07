Import-Module "$PSScriptRoot\Helpers.psm1"
Import-Module "$PSScriptRoot\PlatformMap.psm1"
Import-Module "$PSScriptRoot\Config.psm1"

function CopyESVideoToPlaynite($SelectedGames) {
    $Cfg = Get-Config
    $Count = 0
    foreach ($Game in $SelectedGames) {
        if ($Game.Roms.Count -eq 0) {
            continue
        }
        $RomName = Get-RomName $Game
        $PlatformName = $Game.Platforms[0].Name
        $ESPlatformName = GetESPlatformName $PlatformName

        $SrcVideoPath = $Cfg.ESMediaPath + "\" + $ESPlatformName + "\videos\" + $RomName + ".mp4"
        $DestVideoDir = $Cfg.ExtraMetadataPath + "\" + $Game.Id
        $DestVideoPath = $DestVideoDir + "\VideoTrailer.mp4"
        if (-not (Test-Path -LiteralPath $SrcVideoPath -PathType Leaf)) {
            continue
        }
        if (-not (Test-Path -LiteralPath $DestVideoDir -PathType Container)) {
            New-Item -Path $DestVideoDir -ItemType Directory
        }
        Copy-Item -LiteralPath $SrcVideoPath -Destination $DestVideoPath -Force
        $Count++
    }
    return $Count
}

function ReplaceLogoWithIcon($SelectedGames) {
    $Cfg = Get-Config
    $Count = 0
    foreach ($Game in $SelectedGames) {
        $SrcIconPath = $Cfg.PlayniteLibraryPath + "\" + $Game.Icon
        $DestIconDir = $Cfg.ExtraMetadataPath + "\" + $Game.Id
        $DestIconPath = $DestIconDir + "\Logo.png"
        if (-not (Test-Path -LiteralPath $SrcIconPath -PathType Leaf)) {
            continue
        }
        if (Test-Path -LiteralPath $DestIconPath -PathType Leaf) {
            continue
        }
        if (-not (Test-Path -LiteralPath $DestIconDir -PathType Container)) {
            New-Item -Path $DestIconDir -ItemType Directory
        }
        Copy-Item -LiteralPath $SrcIconPath -Destination $DestIconPath -Force
        $Count++
    }
    return $Count
}

function UpdateDateAddedFromDateCreated($SelectedGames) {
    return Invoke-BufferedUpdate $SelectedGames {
        param($Game)
        if (-not $Game.IsInstalled) { return $false }
        if ($Game.Roms.Count -eq 0) { return $false }
        $Path = $Game.Roms[0].Path.replace("{InstallDir}\", $Game.InstallDirectory)
        $CreationTime = (Get-Item -LiteralPath $Path).CreationTime
        $Game.Added = $CreationTime
        $PlayniteApi.Database.Games.Update($Game)
        return $true
    }
}

function UpdateSource($SelectedGames) {
    return Invoke-BufferedUpdate $SelectedGames {
        param($Game)
        if ($Game.Source.Count -ne 0) { return $false }
        $PlatformName = $Game.Platforms[0].Name
        $SourceName = GetPlayniteSourceName $PlatformName
        $SourceId = Get-OrCreateDbItem $PlayniteApi.Database.Sources "Playnite.SDK.Models.GameSource" $SourceName
        $Game.SourceId = $SourceId
        $PlayniteApi.Database.Games.Update($Game)
        return $true
    }
}

function UpdateUndubTag($SelectedGames) {
    return Invoke-BufferedUpdate $SelectedGames {
        param($Game)
        if ($Game.Roms.Count -eq 0) { return $false }
        $FileName = $Game.Roms[0].Path.replace("{InstallDir}\", "")
        if ($FileName -notmatch "\(Undub\)") { return $false }
        $UndubFeatureId = Get-OrCreateDbItem $PlayniteApi.Database.Features "Playnite.SDK.Models.GameFeature" "Undub"
        if ($Game.FeatureIds -contains $UndubFeatureId) { return $false }
        $Game.FeatureIds += $UndubFeatureId
        $PlayniteApi.Database.Games.Update($Game)
        return $true
    }
}

function UpdateTranslateTag($SelectedGames) {
    return Invoke-BufferedUpdate $SelectedGames {
        param($Game)
        if ($Game.Roms.Count -eq 0) { return $false }
        $FileName = $Game.Roms[0].Path.replace("{InstallDir}\", "")
        if ($FileName -notmatch "\(Japan\)") { return $false }
        if ($FileName -notmatch "\(patched\)") { return $false }
        $TranslatedFeatureId = Get-OrCreateDbItem $PlayniteApi.Database.Features "Playnite.SDK.Models.GameFeature" "English Patched"
        if ($Game.FeatureIds -contains $TranslatedFeatureId) { return $false }
        $Game.FeatureIds += $TranslatedFeatureId
        $PlayniteApi.Database.Games.Update($Game)
        return $true
    }
}
