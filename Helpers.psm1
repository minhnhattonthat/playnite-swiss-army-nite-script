function Get-RomName($Game) {
    $FileName = Split-Path $Game.Roms[0].Path -Leaf
    $Extension = $FileName.Split('.') | Select-Object -Last 1
    return $FileName.Substring(0, $FileName.Length - $Extension.Length - 1)
}

function Invoke-BufferedUpdate($Games, [scriptblock]$Action) {
    $Count = 0
    $PlayniteApi.Database.BeginBufferUpdate()
    try {
        foreach ($Game in $Games) {
            $Result = & $Action $Game
            if ($Result) { $Count++ }
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

function Get-OrCreateDbItem($Collection, $TypeFullName, $Name) {
    foreach ($Item in $Collection) {
        if ($Item.Name -eq $Name) {
            return $Item.Id
        }
    }
    $NewItem = New-Object $TypeFullName
    $NewItem.Name = $Name
    $Added = $Collection.Add($NewItem)
    return $Added.Id
}

function Send-ToRecycleBin($Path) {
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) { return $false }
    $Shell = New-Object -ComObject Shell.Application
    $Folder = $Shell.Namespace(0)
    $File = $Folder.ParseName($Path)
    if ($File) {
        $File.InvokeVerb("delete")
        return $true
    }
    return $false
}
