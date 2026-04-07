$Script:RequiredKeys = @(
    "PlayniteLibraryPath",
    "ExtraMetadataPath"
)

# Path keys only required when their feature is enabled
$Script:FeaturePathDeps = @{
    "EnableVideoSync"    = @("ESMediaPath")
    "EnableDuckStation"  = @("RetroArchSavesPath", "DuckStationMemcardsPath")
    "EnableSwitchNCA"    = @("RyujinxToolPath", "RyujinxPortablePath", "YuzuUserPath", "CitronUserPath")
    "EnableRomDelete"    = @("RyujinxToolPath", "RyujinxPortablePath", "YuzuUserPath")
    "EnableFtpSend"      = @("FtpHost", "FtpRomsPath", "FtpUsername", "FtpPassword")
}

$Script:FeatureFlags = @(
    "EnableVideoSync",
    "EnableLogoReplace",
    "EnableDateUpdate",
    "EnableSourceUpdate",
    "EnableUndubTag",
    "EnableTranslateTag",
    "EnableIgnoreList",
    "EnableRandomList",
    "EnableRomSize",
    "EnableRomDelete",
    "EnableFtpSend",
    "EnableSwitchNCA",
    "EnableDuckStation",
    "EnableAutoTagOnSync"
)

$Script:Config = @{}

$IniPath = "$PSScriptRoot\config.ini"
if (-not (Test-Path -LiteralPath $IniPath -PathType Leaf)) {
    throw "Config file not found: $IniPath"
}

$Lines = Get-Content -LiteralPath $IniPath
foreach ($Line in $Lines) {
    $Line = $Line.Trim()
    if ($Line -eq "" -or $Line.StartsWith("[") -or $Line.StartsWith("#") -or $Line.StartsWith(";")) {
        continue
    }
    $Parts = $Line -split "\s*=\s*", 2
    if ($Parts.Count -eq 2) {
        $Script:Config[$Parts[0]] = $Parts[1]
    }
}

# Default feature flags to false if not set
foreach ($Flag in $Script:FeatureFlags) {
    if (-not $Script:Config.ContainsKey($Flag)) {
        $Script:Config[$Flag] = "false"
    }
}

# Validate required keys
$MissingKeys = @($Script:RequiredKeys | Where-Object { -not $Script:Config.ContainsKey($_) })

# Validate path keys for enabled features
foreach ($Feature in $Script:FeaturePathDeps.Keys) {
    if ($Script:Config[$Feature] -eq "true") {
        $MissingKeys += @($Script:FeaturePathDeps[$Feature] | Where-Object { -not $Script:Config.ContainsKey($_) })
    }
}

if ($MissingKeys.Count -gt 0) {
    throw "Missing required config keys in ${IniPath}: $($MissingKeys -join ', ')"
}

function Get-Config() {
    return $Script:Config
}

function Get-Feature($Name) {
    return $Script:Config[$Name] -eq "true"
}
