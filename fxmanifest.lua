fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_fxv2_oal 'yes'

version '1.0.0-alpha'

shared_scripts {
    "config.lua",

    "gamemode/shared/*.lua",
    "gamemode/shared/**/*.lua",

    "modules/**/shared/*.lua",
    "modules/**/shared/**/*.lua",
}

server_scripts {
    "vendors/MySQL/oxmysql.js",

    "gamemode/server/**/*.lua",

    "modules/**/server/**/*.lua",
}

client_scripts  {
    "vendors/RageUI/RMenu.lua",
    "vendors/RageUI/menu/RageUI.lua",
    "vendors/RageUI/menu/Menu.lua",
    "vendors/RageUI/menu/MenuController.lua",
    "vendors/RageUI/components/*.lua",
    "vendors/RageUI/menu/elements/*.lua",
    "vendors/RageUI/menu/items/*.lua",
    "vendors/RageUI/menu/panels/*.lua",
    "vendors/RageUI/menu/windows/*.lua",

    "gamemode/client/**/*.lua",

    "modules/**/client/**/*.lua",
}