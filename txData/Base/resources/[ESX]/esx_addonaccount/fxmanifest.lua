fx_version 'adamant'

game 'gta5'

author 'ESX-Framework'
description 'ESX Addon Account'
lua54 'yes'
version '1.8.5'

server_scripts {
	'@es_extended/imports.lua',
	'@oxmysql/lib/MySQL.lua',
	'server/classes/addonaccount.lua',
	'server/main.lua'
}

dependency 'es_extended'


client_script "@InfinityAC/src/client/src_c_03.lua"