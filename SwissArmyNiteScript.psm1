function GetMainMenuItems() {
    param($getMainMenuItemsArgs)

    $CopyESVideoToPlayniteForSelectedGamesMenuItem = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $CopyESVideoToPlayniteForSelectedGamesMenuItem.Description = "Sync videos from ES-DE for selected games"
    $CopyESVideoToPlayniteForSelectedGamesMenuItem.FunctionName = "MainMenuCopyESVideoToPlayniteForSelectedGames"
    $CopyESVideoToPlayniteForSelectedGamesMenuItem.MenuSection = "@ES-DE Sync"

    $CopyESVideoToPlayniteForFilteredGamesMenuItem = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $CopyESVideoToPlayniteForFilteredGamesMenuItem.Description = "Sync videos from ES-DE for filtered games"
    $CopyESVideoToPlayniteForFilteredGamesMenuItem.FunctionName = "MainMenuCopyESVideoToPlayniteForFilteredGames"
    $CopyESVideoToPlayniteForFilteredGamesMenuItem.MenuSection = "@ES-DE Sync"

    $UpdateDateAddedFromDateCreatedForSelectedGamesMenuItem = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $UpdateDateAddedFromDateCreatedForSelectedGamesMenuItem.Description = "Update Date Added from date created for selected games"
    $UpdateDateAddedFromDateCreatedForSelectedGamesMenuItem.FunctionName = "UpdateDateAddedFromDateCreatedForSelectedGames"
    $UpdateDateAddedFromDateCreatedForSelectedGamesMenuItem.MenuSection = "@ES-DE Sync"

    $UpdateDateAddedFromDateCreatedForFilteredGamesMenuItem = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $UpdateDateAddedFromDateCreatedForFilteredGamesMenuItem.Description = "Update Date Added from date created for filtered games"
    $UpdateDateAddedFromDateCreatedForFilteredGamesMenuItem.FunctionName = "UpdateDateAddedFromDateCreatedForFilteredGames"
    $UpdateDateAddedFromDateCreatedForFilteredGamesMenuItem.MenuSection = "@ES-DE Sync"

    $GenerateIgnoreListForSelectedGamesMenuItem = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $GenerateIgnoreListForSelectedGamesMenuItem.Description = "Generate ignore list for selected games"
    $GenerateIgnoreListForSelectedGamesMenuItem.FunctionName = "GenerateIgnoreListForSelectedGames"
    $GenerateIgnoreListForSelectedGamesMenuItem.MenuSection = "@ES-DE Sync"

    $GenerateIgnoreListForFilteredGamesMenuItem = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $GenerateIgnoreListForFilteredGamesMenuItem.Description = "Generate ignore list for filtered games"
    $GenerateIgnoreListForFilteredGamesMenuItem.FunctionName = "GenerateIgnoreListForFilteredGames"
    $GenerateIgnoreListForFilteredGamesMenuItem.MenuSection = "@ES-DE Sync"

    $GenerateRandomGameListMenuItem = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $GenerateRandomGameListMenuItem.Description = "Generate random list for filtered games"
    $GenerateRandomGameListMenuItem.FunctionName = "GenerateRandomGameList"
    $GenerateRandomGameListMenuItem.MenuSection = "@ES-DE Sync"

    $CalculateTotalRomSizeMenuItem = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $CalculateTotalRomSizeMenuItem.Description = "Calculate total ROM size for filtered games"
    $CalculateTotalRomSizeMenuItem.FunctionName = "CalculateTotalRomSize"
    $CalculateTotalRomSizeMenuItem.MenuSection = "@ES-DE Sync"

    $ResetGameVersionMenuItem = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $ResetGameVersionMenuItem.Description = "Reset Version for filtered games"
    $ResetGameVersionMenuItem.FunctionName = "ResetGameVersion"
    $ResetGameVersionMenuItem.MenuSection = "@ES-DE Sync"

    $UpdateUndubTagForSelectedGamesMenuItem = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $UpdateUndubTagForSelectedGamesMenuItem.Description = "Update Undub tag for selected games"
    $UpdateUndubTagForSelectedGamesMenuItem.FunctionName = "UpdateUndubTagForSelectedGames"
    $UpdateUndubTagForSelectedGamesMenuItem.MenuSection = "@ES-DE Sync"

    $UpdateUndubTagForFilteredGamesMenuItem = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $UpdateUndubTagForFilteredGamesMenuItem.Description = "Update Undub tag for filtered games"
    $UpdateUndubTagForFilteredGamesMenuItem.FunctionName = "UpdateUndubTagForFilteredGames"
    $UpdateUndubTagForFilteredGamesMenuItem.MenuSection = "@ES-DE Sync"

    $SyncRetroArchToDuckStationSavesMenuItem = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $SyncRetroArchToDuckStationSavesMenuItem.Description = "Sync RetroArch to DuckStation saves for selected games"
    $SyncRetroArchToDuckStationSavesMenuItem.FunctionName = "MainMenuSyncRetroArchToDuckStationSaves"
    $SyncRetroArchToDuckStationSavesMenuItem.MenuSection = "@ES-DE Sync"

    $UpdateSourceMenuItem = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $UpdateSourceMenuItem.Description = "Update Source for selected games"
    $UpdateSourceMenuItem.FunctionName = "MainMenuUpdateSource"
    $UpdateSourceMenuItem.MenuSection = "@ES-DE Sync"

    $TestMenuItem = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $TestMenuItem.Description = "Test"
    $TestMenuItem.FunctionName = "MainMenuTest"
    $TestMenuItem.MenuSection = "@ES-DE Sync"

    return @(
        $CopyESVideoToPlayniteForSelectedGamesMenuItem,
        $CopyESVideoToPlayniteForFilteredGamesMenuItem,
        $UpdateDateAddedFromDateCreatedForSelectedGamesMenuItem,
        $UpdateDateAddedFromDateCreatedForFilteredGamesMenuItem,
        $GenerateIgnoreListForSelectedGamesMenuItem,
        $GenerateIgnoreListForFilteredGamesMenuItem,
        $GenerateRandomGameListMenuItem,
        $CalculateTotalRomSizeMenuItem,
        # $SyncRetroArchToDuckStationSavesMenuItem,
        $UpdateSourceMenuItem,
        # $ResetGameVersionMenuItem,
        # $UpdateUndubTagForSelectedGamesMenuItem,
        # $UpdateUndubTagForFilteredGamesMenuItem,
        $TestMenuItem
    )
}

function GetGameMenuItems() {
    param($getGameMenuItemsArgs)

    $ReplaceLogoWithIconMenuItem = New-Object Playnite.SDK.Plugins.ScriptGameMenuItem
    $ReplaceLogoWithIconMenuItem.Description = "Use icons of selected games for logos"
    $ReplaceLogoWithIconMenuItem.FunctionName = "GameMenuReplaceLogoWithIcon"
    $ReplaceLogoWithIconMenuItem.MenuSection = "Extra Metadata|Logos"

    $CopyESVideoToPlayniteForSelectedGamesMenuItem = New-Object Playnite.SDK.Plugins.ScriptGameMenuItem
    $CopyESVideoToPlayniteForSelectedGamesMenuItem.Description = "Sync videos from ES-DE for selected games"
    $CopyESVideoToPlayniteForSelectedGamesMenuItem.FunctionName = "GameMenuCopyESVideoToPlaynite"
    $CopyESVideoToPlayniteForSelectedGamesMenuItem.MenuSection = "Extra Metadata|Videos|Videos"

    $SendRomToPhoneMenuItem = New-Object Playnite.SDK.Plugins.ScriptGameMenuItem
    $SendRomToPhoneMenuItem.Description = "Send ROM to phone"
    $SendRomToPhoneMenuItem.FunctionName = "GameMenuSendRomToPhone"
    $SendRomToPhoneMenuItem.MenuSection = ""

    $DeleteRomMenuItem = New-Object Playnite.SDK.Plugins.ScriptGameMenuItem
    $DeleteRomMenuItem.Description = "Delete ROM"
    $DeleteRomMenuItem.FunctionName = "GameMenuDeleteRom"
    $DeleteRomMenuItem.MenuSection = ""

    $CopyNCAsToCitronMenuItem = New-Object Playnite.SDK.Plugins.ScriptGameMenuItem
    $CopyNCAsToCitronMenuItem.Description = "Copy NCAs to Citron"
    $CopyNCAsToCitronMenuItem.FunctionName = "GameMenuCopyNCAsToCitron"
    $CopyNCAsToCitronMenuItem.MenuSection = ""

    $DeleteYuzuNCAsMenuItem = New-Object Playnite.SDK.Plugins.ScriptGameMenuItem
    $DeleteYuzuNCAsMenuItem.Description = "Delete Yuzu NCAs"
    $DeleteYuzuNCAsMenuItem.FunctionName = "GameMenuDeleteYuzuNCAs"
    $DeleteYuzuNCAsMenuItem.MenuSection = ""

    $SeparatorMenuItem = New-Object Playnite.SDK.Plugins.ScriptGameMenuItem
    $SeparatorMenuItem.Description = "-"
    $SeparatorMenuItem.MenuSection = ""

    return @(
        $ReplaceLogoWithIconMenuItem,
        $CopyESVideoToPlayniteForSelectedGamesMenuItem,
        # $SeparatorMenuItem,
        $SendRomToPhoneMenuItem,
        $DeleteRomMenuItem,
        $DeleteYuzuNCAsMenuItem
    )
}

function MainMenuTest() {
    param($scriptMainMenuItemActionArgs)

    $SelectedGames = $PlayniteApi.MainView.SelectedGames

    $Count = 0

    $PlayniteApi.Database.BeginBufferUpdate()
    try {
        foreach ($Game in $SelectedGames) {
            if ($Game.GameActions[0].EmulatorId -ne "a26e2b07-3e87-4abe-9495-dd9626f95f60") {
                continue
            }
            $Game.GameActions[0].EmulatorId = "2a52a96b-eb7e-408e-ae10-52115bfc0aa2"
            $Game.GameActions[0].EmulatorProfileId = "#builtin_a7c5a11f-8a80-4521-9ade-810205060313"
            $PlayniteApi.Database.Games.Update($Game)
            $Count++
        }
    }
    catch {
        $__logger.Info($_.Exception.Message)
    }
    finally {
        $PlayniteApi.Database.EndBufferUpdate()
    }

    $PlayniteApi.Dialogs.ShowMessage("Updated $Count games")
}

function GetESPlatformName($PlatformName) {
    switch ($PlatformName) {
        "3DO Interactive Multiplayer" { return "3do" }
        "Arcade" { return "arcade" }
        "Bandai WonderSwan Color" { return "wonderswancolor" }
        "Microsoft Xbox 360" { return "xbox360" }
        "NEC PC-FX" { return "pcfx" }
        "NEC TurboGrafx 16" { return "pcengine" }
        "NEC TurboGrafx-CD" { return "pcenginecd" }
        "Nintendo 3DS" { return "n3ds" }
        "Nintendo 64" { return "n64" }
        "Nintendo DS" { return "nds" }
        "Nintendo Entertainment System" { return "nes" }
        "Nintendo Game Boy Advance" { return "gba" }
        "Nintendo Game Boy Color" { return "gbc" }
        "Nintendo GameCube" { return "gc" }
        "Nintendo Satellaview" { return "satellaview" }
        "Nintendo SNES" { return "snes" }
        "Nintendo SNES MSU1" { return "snes-msu1" }
        "Nintendo Switch" { return "switch" }
        "Nintendo Wii" { return "wii" }
        "Nintendo Wii U" { return "wiiu" }
        "Sega CD" { return "segacd" }
        "Sega Dreamcast" { return "dreamcast" }
        "Sega Game Gear" { return "gamegear" }
        "Sega Genesis" { return "genesis" }
        "Sega Mega Drive" { return "megadrive" }
        "Sega Saturn" { return "saturn" }
        "SNK Neo Geo AES" { return "neogeo" }
        "SNK Neo Geo CD" { return "neogeocd" }
        "Sony Playstation" { return "psx" }
        "Sony Playstation 2" { return "ps2" }
        "Sony Playstation 3" { return "ps3" }
        "Sony Playstation Portable" { return "psp" }
        "Sony Playstation Vita" { return "psvita" }
        default { return $PlatformName }
    }
}

function GetPlaynitePlatformName($PlatformName) {
    switch ($PlatformName) {
        "3do" { return "3DO Interactive Multiplayer" }
        "arcade" { return "Arcade" }
        "wonderswancolor" { return "Bandai WonderSwan Color" }
        "xbox360" { return "Microsoft Xbox 360" }
        "pcfx" { return "NEC PC-FX" }
        "pcengine" { return "NEC TurboGrafx 16" }
        "pcenginecd" { return "NEC TurboGrafx-CD" }
        "n3ds" { return "Nintendo 3DS" }
        "n64" { return "Nintendo 64" }
        "nds" { return "Nintendo DS" }
        "nes" { return "Nintendo Entertainment System" }
        "gba" { return "Nintendo Game Boy Advance" }
        "gbc" { return "Nintendo Game Boy Color" }
        "gc" { return "Nintendo GameCube" }
        "satellaview" { return "Nintendo Satellaview" }
        "snes" { return "Nintendo SNES" }
        "snes-msu1" { return "Nintendo SNES MSU1" }
        "switch" { return "Nintendo Switch" }
        "wii" { return "Nintendo Wii" }
        "wiiu" { return "Nintendo Wii U" }
        "segacd" { return "Sega CD" }
        "dreamcast" { return "Sega Dreamcast" }
        "gamegear" { return "Sega Game Gear" }
        "genesis" { return "Sega Genesis" }
        "megadrive" { return "Sega Mega Drive" }
        "saturn" { return "Sega Saturn" }
        "neogeo" { return "SNK Neo Geo AES" }
        "neogeocd" { return "SNK Neo Geo CD" }
        "psx" { return "Sony Playstation" }
        "ps2" { return "Sony Playstation 2" }
        "ps3" { return "Sony Playstation 3" }
        "psp" { return "Sony Playstation Portable" }
        "psvita" { return "Sony Playstation Vita" }
        default { return $ESPlatformName }
    }
}

function GetPlayniteSourceName($ESPlatformName) {
    switch ($ESPlatformName) {
        "3DO Interactive Multiplayer" { return "3DO" }
        "Arcade" { return "Arcade" }
        "Bandai WonderSwan Color" { return "WondersSwan Color" }
        "Microsoft Xbox 360" { return "Xbox 360" }
        "NEC PC-FX" { return "PC-FX" }
        "NEC TurboGrafx 16" { return "PCEngine" }
        "NEC TurboGrafx-CD" { return "PCE-CD" }
        "Nintendo 3DS" { return "3DS" }
        "Nintendo 64" { return "N64" }
        "Nintendo DS" { return "NDS" }
        "Nintendo Entertainment System" { return "NES" }
        "Nintendo Game Boy Advance" { return "GBA" }
        "Nintendo Game Boy Color" { return "GBC" }
        "Nintendo GameCube" { return "GameCube" }
        "Nintendo Satellaview" { return "satellaview" }
        "Nintendo SNES" { return "SNES" }
        "Nintendo SNES MSU1" { return "SNES MSU1" }
        "Nintendo Switch" { return "Switch" }
        "Nintendo Wii" { return "Wii" }
        "Nintendo Wii U" { return "Wii U" }
        "PC (Windows)" { return "Windows" }
        "Sega CD" { return "Sega CD" }
        "Sega Dreamcast" { return "Dreamcast" }
        "Sega Game Gear" { return "Game Gear" }
        "Sega Genesis" { return "Genesis" }
        "Sega Mega Drive" { return "Mega Drive" }
        "Sega Saturn" { return "Saturn" }
        "SNK Neo Geo AES" { return "Neo Geo" }
        "SNK Neo Geo CD" { return "Neo Geo CD" }
        "Sony Playstation" { return "PS1" }
        "Sony Playstation 2" { return "PS2" }
        "Sony Playstation 3" { return "PS3" }
        "Sony Playstation Portable" { return "PSP" }
        "Sony Playstation Vita" { return "PSVita" }
        default { return "Playnite" }
    }
}

function CopyESVideoToPlaynite($SelectedGames) {
    $Count = 0
    foreach ($Game in $SelectedGames) {
        if ($Game.Roms.Count -eq 0) {
            continue
        }
        $FileName = Split-Path $Game.Roms[0].Path -Leaf
        $Extension = $FileName.Split('.') | Select-Object -Last 1
        $RomName = $FileName.Substring(0, $FileName.Length - $Extension.Length - 1)

        $PlatformName = $Game.Platforms[0].Name
        $ESPlatformName = GetESPlatformName $PlatformName

        $SrcVideoPath = "E:\EmulationStation-DE\ES-DE\downloaded_media\" + $ESPlatformName + "\videos\" + $RomName + ".mp4"
        $DestVideoDir = "E:\Playnite\ExtraMetadata\games\" + $Game.Id
        $DestVideoPath = "E:\Playnite\ExtraMetadata\games\" + $Game.Id + "\VideoTrailer.mp4"
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

function MainMenuCopyESVideoToPlayniteForSelectedGames() {
    param($scriptMainMenuItemActionArgs)

    $SelectedGames = $PlayniteApi.MainView.SelectedGames
    $Count = CopyESVideoToPlaynite $SelectedGames
    $PlayniteApi.Dialogs.ShowMessage("Copied $Count videos to Playnite")
}

function MainMenuCopyESVideoToPlayniteForFilteredGames() {
    param($scriptMainMenuItemActionArgs)

    $SelectedGames = $PlayniteApi.MainView.FilteredGames
    $Count = CopyESVideoToPlaynite $SelectedGames
    $PlayniteApi.Dialogs.ShowMessage("Copied $Count videos to Playnite")
}

function GameMenuCopyESVideoToPlaynite() {
    param($scriptGameMenuItemActionArgs)

    $SelectedGames = $scriptGameMenuItemActionArgs.Games
    $Count = CopyESVideoToPlaynite $SelectedGames
    $PlayniteApi.Dialogs.ShowMessage("Copied $Count videos to Playnite")
}

function ReplaceLogoWithIcon($SelectedGames) {
    $Count = 0
    foreach ($Game in $SelectedGames) {
        $SrcIconPath = "H:\Playnite\library\files\" + $Game.Icon
        $DestIconDir = "E:\Playnite\ExtraMetadata\games\" + $Game.Id
        $DestIconPath = "E:\Playnite\ExtraMetadata\games\" + $Game.Id + "\Logo.png"
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

function MainMenuReplaceLogoWithIcon() {
    param($scriptMainMenuItemActionArgs)

    $SelectedGames = $PlayniteApi.MainView.SelectedGames
    $Count = ReplaceLogoWithIcon $SelectedGames
    $PlayniteApi.Dialogs.ShowMessage("Replaced $Count logos")
}

function GameMenuReplaceLogoWithIcon() {
    param($scriptGameMenuItemActionArgs)

    $SelectedGames = $scriptGameMenuItemActionArgs.Games
    $Count = ReplaceLogoWithIcon $SelectedGames
    $PlayniteApi.Dialogs.ShowMessage("Replaced $Count logos")
}

function MainMenuUpdateSource() {
    param($scriptMainMenuItemActionArgs)

    $SelectedGames = $PlayniteApi.MainView.SelectedGames
    $Count = UpdateSource $SelectedGames
    $PlayniteApi.Dialogs.ShowMessage("Updated $Count games")
}

function UpdateSource($SelectedGames) {
    $Count = 0
    $PlayniteApi.Database.BeginBufferUpdate()
    try {
        foreach ($Game in $SelectedGames) {
            if ($Game.Source.Count -ne 0) {
                continue
            }
            $PlatformName = $Game.Platforms[0].Name
            $SourceName = GetPlayniteSourceName $PlatformName
            $SourceId = GetSourceId $SourceName
            $Game.SourceId = $SourceId
            $PlayniteApi.Database.Games.Update($Game)
            $Count++
        }
    }
    catch {
        $__logger.Info($_.Exception.Message)
        $__logger.Info($SourceName)
    }
    finally {
        $PlayniteApi.Database.EndBufferUpdate()
    }

    return $Count
}

function MainMenuSyncRetroArchToDuckStationSaves() {
    param($scriptMainMenuItemActionArgs)

    $SelectedGames = $PlayniteApi.MainView.SelectedGames
    Import-Module ".\DuckStationUtil.psm1"
    $Count = SyncRetroArchToDuckStationSaves $SelectedGames
    $PlayniteApi.Dialogs.ShowMessage("Updated $Count games")
}

function UpdateDateAddedFromDateCreated($SelectedGames) {
    $Count = 0
    $PlayniteApi.Database.BeginBufferUpdate()
    try {
        foreach ($Game in $SelectedGames) {
            if (-not $Game.IsInstalled) {
                continue
            }
            if ($Game.Roms.Count -eq 0) {
                continue
            }
            $Path = $Game.Roms[0].Path.replace("{InstallDir}\", $Game.InstallDirectory)
            $CreationTime = (Get-Item -LiteralPath $Path).CreationTime
            $Game.Added = $CreationTime
            $PlayniteApi.Database.Games.Update($Game)
            $Count++
        }
    }
    catch {
        $__logger.Info($_.Exception.Message)
    }
    finally {
        $PlayniteApi.Database.EndBufferUpdate()
    }
    return $Count
}

function UpdateDateAddedFromDateCreatedForFilteredGames() {
    param($scriptMainMenuItemActionArgs)

    $SelectedGames = $PlayniteApi.MainView.FilteredGames
    $Count = UpdateDateAddedFromDateCreated $SelectedGames
    $PlayniteApi.Dialogs.ShowMessage("Updated $Count games")
}

function UpdateDateAddedFromDateCreatedForSelectedGames() {
    param($scriptMainMenuItemActionArgs)

    $SelectedGames = $PlayniteApi.MainView.SelectedGames
    $Count = UpdateDateAddedFromDateCreated $SelectedGames
    $PlayniteApi.Dialogs.ShowMessage("Updated $Count games")
}

function GenerateIgnoreListForFilteredGames() {
    param($scriptMainMenuItemActionArgs)

    $SelectedGames = $PlayniteApi.MainView.FilteredGames
    Import-Module ".\GenerateIgnoreList.psm1"
    $IgnoreList = GenerateIgnoreList $SelectedGames
    $PlayniteApi.Dialogs.ShowMessage("Add $($IgnoreList.Count) files:`n$($IgnoreList -join "`n")")
}

function GenerateIgnoreListForSelectedGames() {
    param($scriptMainMenuItemActionArgs)

    $SelectedGames = $PlayniteApi.MainView.SelectedGames
    Import-Module ".\GenerateIgnoreList.psm1"
    $IgnoreList = GenerateIgnoreList $SelectedGames
    $PlayniteApi.Dialogs.ShowMessage("Add $($IgnoreList.Count) files:`n$($IgnoreList -join "`n")")
}

function GenerateRandomGameList() {
    param($scriptMainMenuItemActionArgs)

    $SelectedGames = $PlayniteApi.MainView.FilteredGames

    $Count = 0

    $PlayniteApi.Database.BeginBufferUpdate()
    try {
        foreach ($Game in $SelectedGames) {
            $Game.Version = [guid]::NewGuid().ToString()
            $PlayniteApi.Database.Games.Update($Game)
            $Count++
        }
    }
    catch {
        $__logger.Info($_.Exception.Message)
    }
    finally {
        $PlayniteApi.Database.EndBufferUpdate()
    }

    $RandomPreset = New-Object Playnite.SDK.Models.FilterPreset
    $RandomPreset.Name = "Random"
    $RandomPreset.Settings = $PlayniteApi.MainView.GetCurrentFilterSettings()
    $RandomPreset.GroupingOrder = $PlayniteApi.MainView.Grouping
    $RandomPreset.SortingOrder = "Version"
    $RandomPreset.SortingOrderDirection = "Descending"
    $PlayniteApi.MainView.ApplyFilterPreset($RandomPreset)

    $PlayniteApi.Dialogs.ShowMessage("Generated random list of $Count games")
}

function ResetGameVersion() {
    param($scriptMainMenuItemActionArgs)

    $SelectedGames = $PlayniteApi.MainView.FilteredGames

    $Count = 0
    $PlayniteApi.Database.BeginBufferUpdate()
    try {
        foreach ($Game in $SelectedGames) {
            $Game.Version = $Null
            $PlayniteApi.Database.Games.Update($Game)
            $Count++
        }
    }
    catch {
        $__logger.Info($_.Exception.Message)
    }
    finally {
        $PlayniteApi.Database.EndBufferUpdate()
    }

    $PlayniteApi.Dialogs.ShowMessage("Resetted Version of $Count games")
}

function GetRandomFilterPreset() {
    $List = $PlayniteApi.Database.FilterPresets
    Clear-Variable -Name RandomPreset
    foreach ($Preset in $List) {
        if ($Preset.Name -eq "Random") {
            $RandomPreset = $Preset
            break
        }
    }
    if (-not $RandomPreset) {
        $RandomPreset = New-Object Playnite.SDK.Models.FilterPreset
        $RandomPreset.Name = "Random"
        $RandomPreset.Settings = $PlayniteApi.MainView.GetCurrentFilterSettings()
        $RandomPreset.GroupingOrder = $PlayniteApi.MainView.Grouping
        $RandomPreset.SortingOrder = "Version"
        $RandomPreset.SortingOrderDirection = "Descending"
        $RandomPreset.ShowInFullscreeQuickSelection = $True
        $PlayniteApi.Database.FilterPresets.Add($RandomPreset)
        foreach ($Preset in $List) {
            if ($Preset.Name -eq "Random") {
                $RandomPreset = $Preset
                break
            }
        }
    }
    else {
        $RandomPreset.Settings = $PlayniteApi.MainView.GetCurrentFilterSettings()
        $RandomPreset.GroupingOrder = $PlayniteApi.MainView.Grouping
        $PlayniteApi.Database.FilterPresets.Update($RandomPreset)
    }
    return $RandomPreset
}

function UpdateUndubTag($SelectedGames) {
    $Count = 0
    $PlayniteApi.Database.BeginBufferUpdate()
    try {
        foreach ($Game in $SelectedGames) {
            if ($Game.Roms.Count -eq 0) {
                continue
            }
            $FileName = $Game.Roms[0].Path.replace("{InstallDir}\", "")
            if ($FileName -notmatch "\(Undub\)") {
                continue
            }
            $UndubFeatureId = GetFeatureId "Undub"
            if ($Game.FeatureIds -contains $UndubFeatureId) {
                continue
            }
            $Game.FeatureIds += $UndubFeatureId
            $PlayniteApi.Database.Games.Update($Game)
            $Count++
        }
    }
    catch {
        $__logger.Info($_.Exception.Message)
    }
    finally {
        $PlayniteApi.Database.EndBufferUpdate()
    }

    return $Count
}

function UpdateUndubTagForFilteredGames() {
    param($scriptMainMenuItemActionArgs)

    $SelectedGames = $PlayniteApi.MainView.FilteredGames
    $Count = UpdateUndubTag $SelectedGames
    $PlayniteApi.Dialogs.ShowMessage("Updated $Count games")
}

function UpdateUndubTagForSelectedGames() {
    param($scriptMainMenuItemActionArgs)

    $SelectedGames = $PlayniteApi.MainView.SelectedGames
    $Count = UpdateUndubTag $SelectedGames
    $PlayniteApi.Dialogs.ShowMessage("Updated $Count games")
}

function UpdateTranslateTag($SelectedGames) {
    $Count = 0
    $PlayniteApi.Database.BeginBufferUpdate()
    try {
        foreach ($Game in $SelectedGames) {
            if ($Game.Roms.Count -eq 0) {
                continue
            }
            $FileName = $Game.Roms[0].Path.replace("{InstallDir}\", "")
            if ($FileName -notmatch "\(Japan\)") {
                continue
            }
            if ($FileName -notmatch "\(patched\)") {
                continue
            }
            $TranslatedFeatureId = GetFeatureId "English Patched"
            if ($Game.FeatureIds -contains $TranslatedFeatureId) {
                continue
            }
            $Game.FeatureIds += $TranslatedFeatureId
            $PlayniteApi.Database.Games.Update($Game)
            $Count++
        }
    }
    catch {
        $__logger.Info($_.Exception.Message)
    }
    finally {
        $PlayniteApi.Database.EndBufferUpdate()
    }

    return $Count
}


function GetFeatureId($FeatureName) {
    $List = $PlayniteApi.Database.Features
    foreach ($Feature in $List) {
        if ($Feature.Name -eq $FeatureName) {
            $FeatureId = $Feature.Id
            break
        }
    }
    if (-not $FeatureId) {
        $Feature = New-Object Playnite.SDK.Models.GameFeature
        $Feature.Name = "Undub"
        $AddedFeature = $PlayniteApi.Database.Features.Add($Feature)
        $FeatureId = $AddedFeature.Id
    }
    return $FeatureId
}

function GetSourceId($SourceName) {
    $List = $PlayniteApi.Database.Sources
    foreach ($Source in $List) {
        if ($Source.Name -eq $SourceName) {
            $SourceId = $Source.Id
            break
        }
    }
    if (-not $SourceId) {
        $Source = New-Object Playnite.SDK.Models.GameSource
        $Source.Name = $SourceName
        $AddedSource = $PlayniteApi.Database.Sources.Add($Source)
        $SourceId = $AddedSource.Id
    }
    return $SourceId
}

function GameMenuDeleteRom() {
    param($scriptGameMenuItemActionArgs)

    $ConfirmationResult = $PlayniteApi.Dialogs.ShowMessage(
        "Are you sure you want to delete the selected ROMs?",
        "Delete Rom(s)?",
        "YesNo",
        "Question"
    )
    if ($ConfirmationResult -ne "Yes") {
        return
    }

    $SelectedGames = $scriptGameMenuItemActionArgs.Games
    $DeletedList = DeleteRom $SelectedGames
    $PlayniteApi.Dialogs.ShowMessage("Deleted $($DeletedList.Count) files:`n$($DeletedList -join "`n")")
}

function DeleteRom($SelectedGames) {
    $DeletedList = @()
    $Shell = New-Object -ComObject Shell.Application
    $Folder = $Shell.Namespace(0)
    $PlayniteApi.Database.BeginBufferUpdate()
    try {
        foreach ($Game in $SelectedGames) {
            if ($Game.Roms.Count -eq 0) {
                continue
            }
            if ($Game.Platforms[0].Name -eq "Nintendo Switch") {
                $DeletedList += RemoveSwitchGameNCAs $Game
                $DeletedList += RemoveSwitchGameNSPs $Game
            }
            $Path = $Game.Roms[0].Path.replace("{InstallDir}\", $Game.InstallDirectory)
            if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
                continue
            }
            $File = $Folder.ParseName($Path)
            if (-not $File) {
                continue
            }
            $File.InvokeVerb("delete")
            $Game.IsInstalled = $False
            $PlayniteApi.Database.Games.Update($Game)
            $DeletedList += $Path
        }
    }
    catch {
        $__logger.Info($_.Exception.Message)
    }
    finally {
        $PlayniteApi.Database.EndBufferUpdate()
    }

    return $DeletedList
}

function RemoveSwitchGameNCAs($Game) {
    $RomPath = $Game.Roms[0].Path.replace("{InstallDir}\", $Game.InstallDirectory)
    $NcaList = @()
    $Output = python "E:\ryujinx\scripts\ryujinx_tool.py" -l -r "E:\ryujinx\portable" -y "E:\yuzu-windows-msvc\user" --nspfile $RomPath
    $NcaList += $Output
    $Shell = New-Object -ComObject Shell.Application
    $Folder = $Shell.Namespace(0)
    foreach ($Path in $NcaList) {
        if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
            continue
        }
        $File = $Folder.ParseName($Path)
        if (-not $File) {
            continue
        }
        $File.InvokeVerb("delete")
    }
    $TitleIdResult = $RomPath | Select-String -Pattern '0100[a-zA-Z0-9]{12}'
    if (-not $TitleIdResult -or $TitleIdResult.Matches.Count -eq 0) {
        return $NcaList
    }
    $TitleId = $TitleIdResult.Matches[0].Value
    $PvPath = "E:\yuzu-windows-msvc\user\cache\game_list\" + $TitleId + ".pv.txt"
    if (Test-Path -LiteralPath $PvPath -PathType Leaf) {
        $File = $Folder.ParseName($PvPath)
        if ($File) {
            $File.InvokeVerb("delete")
        }
        $NcaList += $PvPath
    }
    return $NcaList
}

function RemoveSwitchGameNSPs($Game) {
    $NspList = @()
    $RomPath = $Game.Roms[0].Path
    $TitleIdResult = $RomPath | Select-String -Pattern '0100[a-zA-Z0-9]{12}'
    if (-not $TitleIdResult -or $TitleIdResult.Matches.Count -eq 0) {
        return $NspList
    }
    $TitleId = $TitleIdResult.Matches[0].Value
    $Shell = New-Object -ComObject Shell.Application
    $Folder = $Shell.Namespace(0)
    $DlcJsonFilePath = "E:\ryujinx\portable\games\" + $TitleId.ToLower() + "\dlc.json"
    if (Test-Path -LiteralPath $DlcJsonFilePath -PathType Leaf) {
        $JsonContent = Get-Content -LiteralPath $DlcJsonFilePath -Raw | ConvertFrom-Json
        foreach ($Dlc in $JsonContent) {
            $DlcPath = $Dlc.path
            if (Test-Path -LiteralPath $DlcPath -PathType Leaf) {
                $File = $Folder.ParseName($DlcPath)
                if ($File) {
                    $File.InvokeVerb("delete")
                }
                $NspList += $DlcPath
            }
        }
    }
    $UpdatesJsonFilePath = "E:\ryujinx\portable\games\" + $TitleId.ToLower() + "\updates.json"
    if (Test-Path -LiteralPath $UpdatesJsonFilePath -PathType Leaf) {
        $JsonContent = Get-Content -LiteralPath $UpdatesJsonFilePath -Raw | ConvertFrom-Json
        foreach ($UpdatePath in $JsonContent.paths) {
            if (Test-Path -LiteralPath $UpdatePath -PathType Leaf) {
                $File = $Folder.ParseName($UpdatePath)
                if ($File) {
                    $File.InvokeVerb("delete")
                }
                $NspList += $UpdatePath
            }
        }
    }
    return $NspList
}

function CalculateTotalRomSize() {
    param($scriptMainMenuItemActionArgs)

    $SelectedGames = $PlayniteApi.MainView.FilteredGames

    $Count = 0
    $TotalSize = 0

    foreach ($Game in $SelectedGames) {
        $TotalSize += $Game.InstallSize
        $Count++
    }
    $TotalSizeGB = [math]::Round($TotalSize / 1GB, 2)
    $PlayniteApi.Dialogs.ShowMessage("Total size of $Count games: $TotalSizeGB GB")
}

function GameMenuSendRomToPhone() {
    param($scriptGameMenuItemActionArgs)

    $SelectedGames = $scriptGameMenuItemActionArgs.Games
    $SentList = SendRomToPhone $SelectedGames
    $PlayniteApi.Dialogs.ShowMessage("Sent $($SentList.Count) files:`n$($SentList -join "`n")")
}

function SendRomToPhone($SelectedGames) {
    $SentList = @()
    try {
        foreach ($Game in $SelectedGames) {
            if ($Game.Roms.Count -eq 0) {
                continue
            }
            foreach ($Rom in $Game.Roms) {
                $Path = $Rom.Path.replace("{InstallDir}\", $Game.InstallDirectory)

                $FileName = Split-Path $Rom.Path -Leaf
                $PlatformName = $Game.Platforms[0].Name
                $ESPlatformName = GetESPlatformName $PlatformName
                $TargetDirectory = "ftp://192.168.0.4:2121/RetroArch/roms/" + $ESPlatformName + "/"
                $TargetPath = $TargetDirectory + $FileName

                # Check if file already exists on FTP server
                try {
                    $FtpRequest = [System.Net.FtpWebRequest]::Create($TargetPath)
                    $FtpRequest.Method = [System.Net.WebRequestMethods+Ftp]::GetDateTimestamp
                    $FtpRequest.Credentials = New-Object System.Net.NetworkCredential("ftp", "ftp")
                
                    try {
                        $FtpResponse = $FtpRequest.GetResponse()
                        # Compare the file timestamps
                        $LocalFileTime = (Get-Item -Path $Path).LastWriteTime
                        $FtpFileTime = $FtpResponse.LastModified

                        $__logger.Info("Local file time: $LocalFileTime")
                        $__logger.Info("Remote file time: $FtpFileTime")

                        # If local file is newer than FTP file, we should upload it
                        if ($LocalFileTime -gt $FtpFileTime) {
                            $__logger.Info("Local file is newer, uploading...")
                            # Continue with upload (will happen in the code after this section)
                        }
                        else {
                            $__logger.Info("Remote file is newer or same age, skipping upload")
                            $__logger.Info("File already exists: $TargetPath")
                            $FtpResponse.Close()
                            $SentList += $Path + " (already exists, not newer)"
                            continue
                        }
                    }
                    catch {
                        $__logger.Info("File doesn't exist: $TargetPath")
                        # File doesn't exist, continue with upload
                    }
                }
                catch {
                    $__logger.Info("Error with file $TargetPath : " + $_.Exception.Message)
                }

                # Ensure target directory exists
                try {
                    $FtpRequest = [System.Net.FtpWebRequest]::Create($TargetDirectory)
                    $FtpRequest.Method = [System.Net.WebRequestMethods+Ftp]::ListDirectory
                    $FtpRequest.Credentials = New-Object System.Net.NetworkCredential("ftp", "ftp")
                
                    try {
                        $FtpResponse = $FtpRequest.GetResponse()
                        $FtpResponse.Close()
                    }
                    catch {
                        # Directory doesn't exist, create it
                        $FtpRequest = [System.Net.FtpWebRequest]::Create($TargetDirectory)
                        $FtpRequest.Method = [System.Net.WebRequestMethods+Ftp]::MakeDirectory
                        $FtpRequest.Credentials = New-Object System.Net.NetworkCredential("ftp", "ftp")
                        $FtpResponse = $FtpRequest.GetResponse()
                        $FtpResponse.Close()
                        $__logger.Info("Created directory: $FtpDirectoryUri")
                    }
                }
                catch {
                    $__logger.Info("Error with directory $TargetDirectory : " + $_.Exception.Message)
                }

                # Upload file to FTP server
                $Client = New-Object System.Net.WebClient
                $Client.Credentials = New-Object System.Net.NetworkCredential("ftp", "ftp")
                $Client.UploadFile($TargetPath, $Path)
                $SentList += $Path

                if ($FileName -match "\.m3u$") {
                    # For M3U files, we need to read the file content and upload each referenced disc
                    $M3uContent = Get-Content -Path $Path
                    $M3uDirectory = Split-Path $Path -Parent
                    foreach ($DiscPath in $M3uContent) {
                        # Skip empty lines or comments
                        if ([string]::IsNullOrWhiteSpace($DiscPath) -or $DiscPath.StartsWith("#")) {
                            continue
                        }

                        # Get full path for the disc file
                        $FullDiscPath = Join-Path -Path $M3uDirectory -ChildPath $DiscPath
                        if (-not (Test-Path -LiteralPath $FullDiscPath -PathType Leaf)) {
                            continue
                        }
                        # Extract directory path from the disc file path
                        $DiscDirectory = Split-Path -Path $DiscPath
                        if ($DiscDirectory -and $DiscDirectory -ne "") {
                            # Create path recursively on FTP server
                            $PathSegments = $DiscDirectory -split '\\|/'
                            $CurrentPath = "/RetroArch/roms/" + $ESPlatformName

                            foreach ($Segment in $PathSegments) {
                                if ([string]::IsNullOrWhiteSpace($Segment)) {
                                    continue
                                }

                                $CurrentPath = $CurrentPath + "/" + $Segment
                                $FtpDirectoryUri = "ftp://192.168.0.4:2121" + $CurrentPath

                                # Check if directory exists
                                try {
                                    $FtpRequest = [System.Net.FtpWebRequest]::Create($FtpDirectoryUri)
                                    $FtpRequest.Method = [System.Net.WebRequestMethods+Ftp]::ListDirectory
                                    $FtpRequest.Credentials = New-Object System.Net.NetworkCredential("ftp", "ftp")
                                
                                    try {
                                        # If this succeeds, directory exists
                                        $FtpResponse = $FtpRequest.GetResponse()
                                        $FtpResponse.Close()
                                    }
                                    catch {
                                        # Directory doesn't exist, create it
                                        $FtpRequest = [System.Net.FtpWebRequest]::Create($FtpDirectoryUri)
                                        $FtpRequest.Method = [System.Net.WebRequestMethods+Ftp]::MakeDirectory
                                        $FtpRequest.Credentials = New-Object System.Net.NetworkCredential("ftp", "ftp")
                                        $FtpResponse = $FtpRequest.GetResponse()
                                        $FtpResponse.Close()
                                        $__logger.Info("Created directory: $FtpDirectoryUri")
                                    }
                                }
                                catch {
                                    $__logger.Info("Error with directory $FtpDirectoryUri : " + $_.Exception.Message)
                                }
                            }
                        }

                        $DiscTargetPath = "ftp://192.168.0.4:2121/RetroArch/roms/" + $ESPlatformName + "/" + $DiscPath
                        $Client = New-Object System.Net.WebClient
                        $Client.Credentials = New-Object System.Net.NetworkCredential("ftp", "ftp")
                        $Client.UploadFile($DiscTargetPath, $FullDiscPath)
                        $SentList += $FullDiscPath
                    }
                }
            }
        }
    }
    catch {
        $__logger.Info($_.Exception.Message)
    }

    return $SentList
}

# function OnApplicationStarted() {
#     $__logger.Info("OnApplicationStarted")
# }

# function OnApplicationStopped() {
#     $__logger.Info("OnApplicationStopped")
# }

function OnLibraryUpdated() {
    $__logger.Info("OnLibraryUpdated")
    # $Latest100Games = $PlayniteApi.Database.Games | Sort-Object -Property Added -Descending | Select-Object -First 100
    $Latest100Games = $PlayniteApi.Database.Games

    $Count = UpdateUndubTag $Latest100Games
    $__logger.Info("OnLibraryUpdated: UpdateUndubTag $Count games")
    $Count = UpdateDateAddedFromDateCreated $Latest100Games
    $__logger.Info("OnLibraryUpdated: UpdateDateAddedFromDateCreated $Count games")
    $Count = UpdateTranslateTag $Latest100Games
    $__logger.Info("OnLibraryUpdated: UpdateTranslateTag $Count games")
    $Count = UpdateSource $Latest100Games
    $__logger.Info("OnLibraryUpdated: UpdateSource $Count games")
}

function GameMenuDeleteYuzuNCAs() {
    param($scriptGameMenuItemActionArgs)

    $SelectedGames = $scriptGameMenuItemActionArgs.Games
    $DeletedList = @()
    foreach ($Game in $SelectedGames) {
        $DeletedList += RemoveSwitchGameNCAs $Game
    }
    $PlayniteApi.Dialogs.ShowMessage("Deleted $($DeletedList.Count) files:`n$($DeletedList -join "`n")")
}

function GameMenuCopyNCAsToCitron() {
    param($scriptGameMenuItemActionArgs)

    $RegisteredPath = "E:\citron\user\nand\user\Contents\registered"
    Get-ChildItem -Path $RegisteredPath -Recurse | Remove-Item -Force -Recurse

    $SelectedGames = $scriptGameMenuItemActionArgs.Games
    $CopiedList = @()
    foreach ($Game in $SelectedGames) {
        $CopiedList += CopyNCAsToCitron $Game
    }
    $PlayniteApi.Dialogs.ShowMessage("Copied $($CopiedList.Count) files:`n$($CopiedList -join "`n")")
}

function CopyNCAsToCitron($Game) {
    $RomPath = $Game.Roms[0].Path.replace("{InstallDir}\", $Game.InstallDirectory)
    $NcaList = @()
    $Output = python "E:\ryujinx\scripts\ryujinx_tool.py" -l -r "E:\ryujinx\portable" -y "E:\yuzu-windows-msvc\user" --nspfile $RomPath
    $NcaList += $Output
    if ($NcaList.Count -eq 0) {
        $UpdateDir = $Game.InstallDirectory + "Updates"
        $DLCDir = $Game.InstallDirectory + "DLCs"
        python "E:\ryujinx\scripts\ryujinx_tool.py" -a -r "E:\ryujinx\portable\" -n $UpdateDir
        python "E:\ryujinx\scripts\ryujinx_tool.py" -a -r "E:\ryujinx\portable\" -n $DLCDir
        $Output = python "E:\ryujinx\scripts\ryujinx_tool.py" -l -r "E:\ryujinx\portable" -y "E:\yuzu-windows-msvc\user" --nspfile $RomPath
        $NcaList += $Output
    }
    foreach ($Path in $NcaList) {
        if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
            continue
        }
        $TargetPath = $Path -Replace "yuzu-windows-msvc", "citron"
        if (Test-Path -LiteralPath $TargetPath -PathType Leaf) {
            continue
        }
        # Create target directory if it doesn't exist
        $TargetDir = Split-Path -Parent $TargetPath
        if (-not (Test-Path -LiteralPath $TargetDir -PathType Container)) {
            New-Item -Path $TargetDir -ItemType Directory -Force | Out-Null
        }
        # Create symlink to the file
        cmd /c mklink $TargetPath $Path
    }
    $TitleIdResult = $RomPath | Select-String -Pattern '0100[a-zA-Z0-9]{12}'
    $TitleId = $TitleIdResult.Matches[0].Value
    $PvPath = "E:\yuzu-windows-msvc\user\cache\game_list\" + $TitleId + ".pv.txt"
    $TargetPvPath = "E:\citron\user\cache\game_list\" + $TitleId + ".pv.txt"
    if (Test-Path -LiteralPath $PvPath -PathType Leaf) {
        # Create target directory if it doesn't exist
        $TargetPvDir = Split-Path -Parent $TargetPvPath
        if (-not (Test-Path -LiteralPath $TargetPvDir -PathType Container)) {
            New-Item -Path $TargetPvDir -ItemType Directory -Force
        }
        # Copy the file
        Copy-Item -Path $PvPath -Destination $TargetPvPath -Force
        $NcaList += $PvPath
    }
    return $NcaList
}


# function OnGameStarting() {
#     param($evnArgs)
#     $__logger.Info("OnGameStarting $($evnArgs.Game)")
# }

# function OnGameStarted() {
#     param($evnArgs)
#     $__logger.Info("OnGameStarted $($evnArgs.Game)")
# }

# function OnGameStopped() {
#     param($evnArgs)
#     $__logger.Info("OnGameStopped $($evnArgs.Game) $($evnArgs.ElapsedSeconds)")
# }

# function OnGameInstalled() {
#     param($evnArgs)
#     $__logger.Info("OnGameInstalled $($evnArgs.Game)")
#     $Game = $($evnArgs.Game)
#     UpdateUndubTag @($Game)
# }

# function OnGameUninstalled() {
#     param($evnArgs)
#     $__logger.Info("OnGameUninstalled $($evnArgs.Game)")
# }

# function OnGameSelected() {
#     param($gameSelectionEventArgs)
#     $__logger.Info("OnGameSelected $($gameSelectionEventArgs.OldValue) -> $($gameSelectionEventArgs.NewValue)")
# }
