Import-Module "$PSScriptRoot\Config.psm1"
Import-Module "$PSScriptRoot\Helpers.psm1"
Import-Module "$PSScriptRoot\PlatformMap.psm1"
Import-Module "$PSScriptRoot\ESDESync.psm1"
Import-Module "$PSScriptRoot\RomManagement.psm1"

# --- Menu helpers ---

function New-MainMenuItem($Description, $FunctionName, $MenuSection) {
    $Item = New-Object Playnite.SDK.Plugins.ScriptMainMenuItem
    $Item.Description = $Description
    $Item.FunctionName = $FunctionName
    $Item.MenuSection = $MenuSection
    return $Item
}

function New-GameMenuItem($Description, $FunctionName, $MenuSection) {
    $Item = New-Object Playnite.SDK.Plugins.ScriptGameMenuItem
    $Item.Description = $Description
    $Item.FunctionName = $FunctionName
    $Item.MenuSection = $MenuSection
    return $Item
}

function Invoke-ForGames($Games, [scriptblock]$Action, $MessageTemplate) {
    $Result = & $Action $Games
    $PlayniteApi.Dialogs.ShowMessage(($MessageTemplate -f $Result))
}

# --- Main menu registration ---

function GetMainMenuItems() {
    param($getMainMenuItemsArgs)

    $Items = @()

    if (Get-Feature "EnableVideoSync") {
        $Items += New-MainMenuItem "Sync videos from ES-DE for selected games"  "MainMenuCopyESVideoToPlayniteForSelectedGames" "@Swiss Army Nite"
        $Items += New-MainMenuItem "Sync videos from ES-DE for filtered games"  "MainMenuCopyESVideoToPlayniteForFilteredGames" "@Swiss Army Nite"
    }
    if (Get-Feature "EnableDateUpdate") {
        $Items += New-MainMenuItem "Update Date Added from date created for selected games" "UpdateDateAddedFromDateCreatedForSelectedGames" "@Swiss Army Nite"
        $Items += New-MainMenuItem "Update Date Added from date created for filtered games" "UpdateDateAddedFromDateCreatedForFilteredGames" "@Swiss Army Nite"
    }
    if (Get-Feature "EnableIgnoreList") {
        $Items += New-MainMenuItem "Generate ignore list for selected games" "GenerateIgnoreListForSelectedGames" "@Swiss Army Nite"
        $Items += New-MainMenuItem "Generate ignore list for filtered games" "GenerateIgnoreListForFilteredGames" "@Swiss Army Nite"
    }
    if (Get-Feature "EnableRandomList") {
        $Items += New-MainMenuItem "Generate random list for filtered games" "GenerateRandomGameList" "@Swiss Army Nite"
    }
    if (Get-Feature "EnableRomSize") {
        $Items += New-MainMenuItem "Calculate total ROM size for filtered games" "CalculateTotalRomSize" "@Swiss Army Nite"
    }
    if (Get-Feature "EnableDuckStation") {
        $Items += New-MainMenuItem "Sync RetroArch to DuckStation saves for selected games" "MainMenuSyncRetroArchToDuckStationSaves" "@Swiss Army Nite"
    }
    if (Get-Feature "EnableSourceUpdate") {
        $Items += New-MainMenuItem "Update Source for selected games" "MainMenuUpdateSource" "@Swiss Army Nite"
    }
    if (Get-Feature "EnableUndubTag") {
        $Items += New-MainMenuItem "Update Undub tag for selected games"  "UpdateUndubTagForSelectedGames"  "@Swiss Army Nite"
        $Items += New-MainMenuItem "Update Undub tag for filtered games"  "UpdateUndubTagForFilteredGames"  "@Swiss Army Nite"
    }

    return $Items
}

# --- Game menu registration ---

function GetGameMenuItems() {
    param($getGameMenuItemsArgs)

    $Items = @()

    if (Get-Feature "EnableLogoReplace") {
        $Items += New-GameMenuItem "Use icons of selected games for logos" "GameMenuReplaceLogoWithIcon" "Extra Metadata|Logos"
    }
    if (Get-Feature "EnableVideoSync") {
        $Items += New-GameMenuItem "Sync videos from ES-DE for selected games" "GameMenuCopyESVideoToPlaynite" "Extra Metadata|Videos|Videos"
    }
    if (Get-Feature "EnableFtpSend") {
        $Items += New-GameMenuItem "Send ROM to phone" "GameMenuSendRomToPhone" ""
    }
    if (Get-Feature "EnableRomDelete") {
        $Items += New-GameMenuItem "Delete ROM" "GameMenuDeleteRom" ""
    }
    if (Get-Feature "EnableSwitchNCA") {
        $Items += New-GameMenuItem "Delete Yuzu NCAs"    "GameMenuDeleteYuzuNCAs"    ""
    }

    return $Items
}

# --- Main menu wrappers ---

function MainMenuCopyESVideoToPlayniteForSelectedGames() {
    param($scriptMainMenuItemActionArgs)
    Invoke-ForGames $PlayniteApi.MainView.SelectedGames { param($g) CopyESVideoToPlaynite $g } "Copied {0} videos to Playnite"
}

function MainMenuCopyESVideoToPlayniteForFilteredGames() {
    param($scriptMainMenuItemActionArgs)
    Invoke-ForGames $PlayniteApi.MainView.FilteredGames { param($g) CopyESVideoToPlaynite $g } "Copied {0} videos to Playnite"
}

function UpdateDateAddedFromDateCreatedForSelectedGames() {
    param($scriptMainMenuItemActionArgs)
    Invoke-ForGames $PlayniteApi.MainView.SelectedGames { param($g) UpdateDateAddedFromDateCreated $g } "Updated {0} games"
}

function UpdateDateAddedFromDateCreatedForFilteredGames() {
    param($scriptMainMenuItemActionArgs)
    Invoke-ForGames $PlayniteApi.MainView.FilteredGames { param($g) UpdateDateAddedFromDateCreated $g } "Updated {0} games"
}

function MainMenuUpdateSource() {
    param($scriptMainMenuItemActionArgs)
    Invoke-ForGames $PlayniteApi.MainView.SelectedGames { param($g) UpdateSource $g } "Updated {0} games"
}

function GenerateRandomGameList() {
    param($scriptMainMenuItemActionArgs)

    $SelectedGames = $PlayniteApi.MainView.FilteredGames

    $Count = Invoke-BufferedUpdate $SelectedGames {
        param($Game)
        $Game.Version = [guid]::NewGuid().ToString()
        $PlayniteApi.Database.Games.Update($Game)
        return $true
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

    $Count = Invoke-BufferedUpdate $SelectedGames {
        param($Game)
        $Game.Version = $Null
        $PlayniteApi.Database.Games.Update($Game)
        return $true
    }

    $PlayniteApi.Dialogs.ShowMessage("Reset Version of $Count games")
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

function UpdateUndubTagForSelectedGames() {
    param($scriptMainMenuItemActionArgs)
    Invoke-ForGames $PlayniteApi.MainView.SelectedGames { param($g) UpdateUndubTag $g } "Updated {0} games"
}

function UpdateUndubTagForFilteredGames() {
    param($scriptMainMenuItemActionArgs)
    Invoke-ForGames $PlayniteApi.MainView.FilteredGames { param($g) UpdateUndubTag $g } "Updated {0} games"
}

function MainMenuReplaceLogoWithIcon() {
    param($scriptMainMenuItemActionArgs)
    Invoke-ForGames $PlayniteApi.MainView.SelectedGames { param($g) ReplaceLogoWithIcon $g } "Replaced {0} logos"
}

function MainMenuSyncRetroArchToDuckStationSaves() {
    param($scriptMainMenuItemActionArgs)
    Import-Module "$PSScriptRoot\DuckStationUtil.psm1"
    Invoke-ForGames $PlayniteApi.MainView.SelectedGames { param($g) SyncRetroArchToDuckStationSaves $g } "Updated {0} games"
}

function GenerateIgnoreListForFilteredGames() {
    param($scriptMainMenuItemActionArgs)
    Import-Module "$PSScriptRoot\GenerateIgnoreList.psm1"
    $SelectedGames = $PlayniteApi.MainView.FilteredGames
    $IgnoreList = GenerateIgnoreList $SelectedGames
    $PlayniteApi.Dialogs.ShowMessage("Add $($IgnoreList.Count) files:`n$($IgnoreList -join "`n")")
}

function GenerateIgnoreListForSelectedGames() {
    param($scriptMainMenuItemActionArgs)
    Import-Module "$PSScriptRoot\GenerateIgnoreList.psm1"
    $SelectedGames = $PlayniteApi.MainView.SelectedGames
    $IgnoreList = GenerateIgnoreList $SelectedGames
    $PlayniteApi.Dialogs.ShowMessage("Add $($IgnoreList.Count) files:`n$($IgnoreList -join "`n")")
}

# --- Game menu wrappers ---

function GameMenuCopyESVideoToPlaynite() {
    param($scriptGameMenuItemActionArgs)
    Invoke-ForGames $scriptGameMenuItemActionArgs.Games { param($g) CopyESVideoToPlaynite $g } "Copied {0} videos to Playnite"
}

function GameMenuReplaceLogoWithIcon() {
    param($scriptGameMenuItemActionArgs)
    Invoke-ForGames $scriptGameMenuItemActionArgs.Games { param($g) ReplaceLogoWithIcon $g } "Replaced {0} logos"
}

function GameMenuSendRomToPhone() {
    param($scriptGameMenuItemActionArgs)
    $SelectedGames = $scriptGameMenuItemActionArgs.Games
    $SentList = SendRomToPhone $SelectedGames
    $PlayniteApi.Dialogs.ShowMessage("Sent $($SentList.Count) files:`n$($SentList -join "`n")")
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

function GameMenuDeleteYuzuNCAs() {
    param($scriptGameMenuItemActionArgs)

    $SelectedGames = $scriptGameMenuItemActionArgs.Games
    $DeletedList = @()
    foreach ($Game in $SelectedGames) {
        $DeletedList += RemoveSwitchGameNCAs $Game
    }
    $PlayniteApi.Dialogs.ShowMessage("Deleted $($DeletedList.Count) files:`n$($DeletedList -join "`n")")
}

# --- Event hooks ---

function OnLibraryUpdated() {
    $__logger.Info("OnLibraryUpdated")
    if (-not (Get-Feature "EnableAutoTagOnSync")) {
        return
    }

    $AllGames = $PlayniteApi.Database.Games

    if (Get-Feature "EnableUndubTag") {
        $Count = UpdateUndubTag $AllGames
        $__logger.Info("OnLibraryUpdated: UpdateUndubTag $Count games")
    }
    if (Get-Feature "EnableDateUpdate") {
        $Count = UpdateDateAddedFromDateCreated $AllGames
        $__logger.Info("OnLibraryUpdated: UpdateDateAddedFromDateCreated $Count games")
    }
    if (Get-Feature "EnableTranslateTag") {
        $Count = UpdateTranslateTag $AllGames
        $__logger.Info("OnLibraryUpdated: UpdateTranslateTag $Count games")
    }
    if (Get-Feature "EnableSourceUpdate") {
        $Count = UpdateSource $AllGames
        $__logger.Info("OnLibraryUpdated: UpdateSource $Count games")
    }
}
