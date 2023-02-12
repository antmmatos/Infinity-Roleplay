fx_version 'cerulean'
game 'gta5'

ui_page('html/index.html')

files({
    'html/index.html',
	'html/sounds/On.ogg',
	'html/sounds/Upgrade.ogg',
	'html/sounds/Off.ogg',
	'html/sounds/Downgrade.ogg'
})

client_script 'client.lua'
server_script 'server.lua'

client_script "@InfinityAC/src/client/src_c_03.lua"