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
    "vendors/oxmysql.js",

    "gamemode/server/*.lua",
    "gamemode/server/**/*.lua",

    "modules/**/server/*.lua",
    "modules/**/server/**/*.lua",
}

client_scripts  {
    "gamemode/client/*.lua",
    "gamemode/client/**/*.lua",

    "modules/**/client/*.lua",
    "modules/**/client/**/*.lua",
}