$Script:PlatformMap = @{
    "3DO Interactive Multiplayer"   = @{ ES = "3do";              Source = "3DO" }
    "Arcade"                        = @{ ES = "arcade";           Source = "Arcade" }
    "Bandai WonderSwan Color"       = @{ ES = "wonderswancolor";  Source = "WonderSwan Color" }
    "Microsoft Xbox 360"            = @{ ES = "xbox360";          Source = "Xbox 360" }
    "NEC PC-FX"                     = @{ ES = "pcfx";             Source = "PC-FX" }
    "NEC TurboGrafx 16"             = @{ ES = "pcengine";         Source = "PCEngine" }
    "NEC TurboGrafx-CD"             = @{ ES = "pcenginecd";       Source = "PCE-CD" }
    "Nintendo 3DS"                  = @{ ES = "n3ds";             Source = "3DS" }
    "Nintendo 64"                   = @{ ES = "n64";              Source = "N64" }
    "Nintendo DS"                   = @{ ES = "nds";              Source = "NDS" }
    "Nintendo Entertainment System" = @{ ES = "nes";              Source = "NES" }
    "Nintendo Game Boy Advance"     = @{ ES = "gba";              Source = "GBA" }
    "Nintendo Game Boy Color"       = @{ ES = "gbc";              Source = "GBC" }
    "Nintendo GameCube"             = @{ ES = "gc";               Source = "GameCube" }
    "Nintendo Satellaview"          = @{ ES = "satellaview";      Source = "Satellaview" }
    "Nintendo SNES"                 = @{ ES = "snes";             Source = "SNES" }
    "Nintendo SNES MSU1"            = @{ ES = "snes-msu1";        Source = "SNES MSU1" }
    "Nintendo Switch"               = @{ ES = "switch";           Source = "Switch" }
    "Nintendo Wii"                  = @{ ES = "wii";              Source = "Wii" }
    "Nintendo Wii U"                = @{ ES = "wiiu";             Source = "Wii U" }
    "PC (Windows)"                  = @{ ES = "pc";               Source = "Windows" }
    "Sega CD"                       = @{ ES = "segacd";           Source = "Sega CD" }
    "Sega Dreamcast"                = @{ ES = "dreamcast";        Source = "Dreamcast" }
    "Sega Game Gear"                = @{ ES = "gamegear";         Source = "Game Gear" }
    "Sega Genesis"                  = @{ ES = "genesis";          Source = "Genesis" }
    "Sega Mega Drive"               = @{ ES = "megadrive";        Source = "Mega Drive" }
    "Sega Saturn"                   = @{ ES = "saturn";           Source = "Saturn" }
    "SNK Neo Geo AES"               = @{ ES = "neogeo";           Source = "Neo Geo" }
    "SNK Neo Geo CD"                = @{ ES = "neogeocd";         Source = "Neo Geo CD" }
    "Sony Playstation"              = @{ ES = "psx";              Source = "PS1" }
    "Sony Playstation 2"            = @{ ES = "ps2";              Source = "PS2" }
    "Sony Playstation 3"            = @{ ES = "ps3";              Source = "PS3" }
    "Sony Playstation Portable"     = @{ ES = "psp";              Source = "PSP" }
    "Sony Playstation Vita"         = @{ ES = "psvita";           Source = "PSVita" }
}

$Script:ESToPlayniteMap = @{}
foreach ($Entry in $Script:PlatformMap.GetEnumerator()) {
    $Script:ESToPlayniteMap[$Entry.Value.ES] = $Entry.Key
}

function GetESPlatformName($PlatformName) {
    $Entry = $Script:PlatformMap[$PlatformName]
    if ($Entry) { return $Entry.ES }
    return $PlatformName
}

function GetPlaynitePlatformName($ESName) {
    $Result = $Script:ESToPlayniteMap[$ESName]
    if ($Result) { return $Result }
    return $ESName
}

function GetPlayniteSourceName($PlatformName) {
    $Entry = $Script:PlatformMap[$PlatformName]
    if ($Entry) { return $Entry.Source }
    return "Playnite"
}
