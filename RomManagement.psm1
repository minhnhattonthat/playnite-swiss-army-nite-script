Import-Module "$PSScriptRoot\Helpers.psm1"
Import-Module "$PSScriptRoot\PlatformMap.psm1"
Import-Module "$PSScriptRoot\Config.psm1"

function DeleteRom($SelectedGames) {
    $DeletedList = @()
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
            if (Send-ToRecycleBin $Path) {
                $DeletedList += $Path
            }
            $Game.IsInstalled = $False
            $PlayniteApi.Database.Games.Update($Game)
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
    $Cfg = Get-Config
    $RomPath = $Game.Roms[0].Path.replace("{InstallDir}\", $Game.InstallDirectory)
    $NcaList = @()
    $Output = python $Cfg.RyujinxToolPath -l --nspfile $RomPath
    $NcaList += $Output
    foreach ($Path in $NcaList) {
        Send-ToRecycleBin $Path | Out-Null
    }
    $TitleIdResult = $RomPath | Select-String -Pattern '0100[a-zA-Z0-9]{12}'
    if (-not $TitleIdResult -or $TitleIdResult.Matches.Count -eq 0) {
        return $NcaList
    }
    $TitleId = $TitleIdResult.Matches[0].Value
    $PvPath = $Cfg.YuzuUserPath + "\cache\game_list\" + $TitleId + ".pv.txt"
    if (Send-ToRecycleBin $PvPath) {
        $NcaList += $PvPath
    }
    return $NcaList
}

function RemoveSwitchGameNSPs($Game) {
    $Cfg = Get-Config
    $NspList = @()
    $RomPath = $Game.Roms[0].Path
    $TitleIdResult = $RomPath | Select-String -Pattern '0100[a-zA-Z0-9]{12}'
    if (-not $TitleIdResult -or $TitleIdResult.Matches.Count -eq 0) {
        return $NspList
    }
    $TitleId = $TitleIdResult.Matches[0].Value
    $DlcJsonFilePath = $Cfg.RyujinxPortablePath + "\games\" + $TitleId.ToLower() + "\dlc.json"
    if (Test-Path -LiteralPath $DlcJsonFilePath -PathType Leaf) {
        $JsonContent = Get-Content -LiteralPath $DlcJsonFilePath -Raw | ConvertFrom-Json
        foreach ($Dlc in $JsonContent) {
            $DlcPath = $Dlc.path
            if (Send-ToRecycleBin $DlcPath) {
                $NspList += $DlcPath
            }
        }
    }
    $UpdatesJsonFilePath = $Cfg.RyujinxPortablePath + "\games\" + $TitleId.ToLower() + "\updates.json"
    if (Test-Path -LiteralPath $UpdatesJsonFilePath -PathType Leaf) {
        $JsonContent = Get-Content -LiteralPath $UpdatesJsonFilePath -Raw | ConvertFrom-Json
        foreach ($UpdatePath in $JsonContent.paths) {
            if (Send-ToRecycleBin $UpdatePath) {
                $NspList += $UpdatePath
            }
        }
    }
    return $NspList
}

function Ensure-FtpDirectory($DirectoryUri, $Credential) {
    try {
        $FtpRequest = [System.Net.FtpWebRequest]::Create($DirectoryUri)
        $FtpRequest.Method = [System.Net.WebRequestMethods+Ftp]::ListDirectory
        $FtpRequest.Credentials = $Credential
        try {
            $FtpResponse = $FtpRequest.GetResponse()
            $FtpResponse.Close()
        }
        catch {
            $FtpRequest = [System.Net.FtpWebRequest]::Create($DirectoryUri)
            $FtpRequest.Method = [System.Net.WebRequestMethods+Ftp]::MakeDirectory
            $FtpRequest.Credentials = $Credential
            $FtpResponse = $FtpRequest.GetResponse()
            $FtpResponse.Close()
            $__logger.Info("Created directory: $DirectoryUri")
        }
    }
    catch {
        $__logger.Info("Error with directory $DirectoryUri : " + $_.Exception.Message)
    }
}

function SendRomToPhone($SelectedGames) {
    $Cfg = Get-Config
    $SentList = @()
    $FtpBaseUrl = $Cfg.FtpHost
    $FtpRomsPath = $Cfg.FtpRomsPath
    $FtpCredential = New-Object System.Net.NetworkCredential($Cfg.FtpUsername, $Cfg.FtpPassword)
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
                $TargetDirectory = $FtpBaseUrl + $FtpRomsPath + "/" + $ESPlatformName + "/"
                $TargetPath = $TargetDirectory + $FileName

                # Check if file already exists on FTP server
                try {
                    $FtpRequest = [System.Net.FtpWebRequest]::Create($TargetPath)
                    $FtpRequest.Method = [System.Net.WebRequestMethods+Ftp]::GetDateTimestamp
                    $FtpRequest.Credentials = $FtpCredential

                    try {
                        $FtpResponse = $FtpRequest.GetResponse()
                        $LocalFileTime = (Get-Item -Path $Path).LastWriteTime
                        $FtpFileTime = $FtpResponse.LastModified

                        $__logger.Info("Local file time: $LocalFileTime")
                        $__logger.Info("Remote file time: $FtpFileTime")

                        if ($LocalFileTime -gt $FtpFileTime) {
                            $__logger.Info("Local file is newer, uploading...")
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
                    }
                }
                catch {
                    $__logger.Info("Error with file $TargetPath : " + $_.Exception.Message)
                }

                Ensure-FtpDirectory $TargetDirectory $FtpCredential

                # Upload file to FTP server
                $Client = New-Object System.Net.WebClient
                $Client.Credentials = $FtpCredential
                $Client.UploadFile($TargetPath, $Path)
                $SentList += $Path

                if ($FileName -match "\.m3u$") {
                    $M3uContent = Get-Content -Path $Path
                    $M3uDirectory = Split-Path $Path -Parent
                    foreach ($DiscPath in $M3uContent) {
                        if ([string]::IsNullOrWhiteSpace($DiscPath) -or $DiscPath.StartsWith("#")) {
                            continue
                        }

                        $FullDiscPath = Join-Path -Path $M3uDirectory -ChildPath $DiscPath
                        if (-not (Test-Path -LiteralPath $FullDiscPath -PathType Leaf)) {
                            continue
                        }
                        $DiscDirectory = Split-Path -Path $DiscPath
                        if ($DiscDirectory -and $DiscDirectory -ne "") {
                            $PathSegments = $DiscDirectory -split '\\|/'
                            $CurrentPath = $FtpRomsPath + "/" + $ESPlatformName

                            foreach ($Segment in $PathSegments) {
                                if ([string]::IsNullOrWhiteSpace($Segment)) {
                                    continue
                                }
                                $CurrentPath = $CurrentPath + "/" + $Segment
                                $FtpDirectoryUri = $FtpBaseUrl + $CurrentPath
                                Ensure-FtpDirectory $FtpDirectoryUri $FtpCredential
                            }
                        }

                        $DiscTargetPath = $FtpBaseUrl + $FtpRomsPath + "/" + $ESPlatformName + "/" + $DiscPath
                        $Client = New-Object System.Net.WebClient
                        $Client.Credentials = $FtpCredential
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
