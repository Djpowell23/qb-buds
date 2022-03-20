fx_version 'cerulean'
game 'gta5'

author 'Goobastank'
description 'Best Buds Job originally by BLVCKLISTED, heavily modified by Goobastank'
version '1.0.0'

shared_scripts {
    'config.lua',
    --'@qb-core/import.lua'
}

client_scripts {
	'client/main.lua',
	'client/menus.lua',
    'client/edibles.lua',
    'client/animations.lua'
}

server_script 'server/*.lua'