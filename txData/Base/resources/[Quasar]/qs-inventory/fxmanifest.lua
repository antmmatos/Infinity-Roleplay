fx_version 'adamant'

game 'gta5'

version '1.6.8'

lua54 'yes'

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/css/*.css',
	'html/js/*.js',
	'config/config_metadata.js',
	'html/images/*.png',
	'html/attachment_images/*.png',
	'html/debounce.min.js',
	'html/BebasNeueBold.ttf',
	'html/img/*.png'
}

server_scripts {
	--'@oxmysql/lib/MySQL.lua', -- RECOMENDED
	'@mysql-async/lib/MySQL.lua',
	"server/version_check.lua",
	"config/config.lua",
	"config/config_framework.lua",
	"server/qbcore_functions.lua",
	"config/config_discord.lua",
	"config/config_weapons.lua",
	"config/translations.lua",
	"config/config_hud.lua",
	"server/main.lua",
	"config/config_setInventory.lua",
	"config/config_commands.lua",
	"config/config_usableitems.lua",
	"config/config_vending.lua",
	"server/version_check.lua",
}

client_scripts {
	"config/config.lua",
	"config/config_framework.lua",
	"client/qbcore_functions.lua",
	"config/translations.lua",
	"config/config_weapons.lua",
	"config/config_client.lua",
	"config/config_target.lua",
	"config/config_hud.lua",
	"config/config_vending.lua",
	"client/main.lua",
	"client/vending.lua",
}

escrow_ignore {
	"config/config.lua",
	"config/config_framework.lua",
	"config/translations.lua",
	"config/config_weapons.lua",
	"config/config_client.lua",
	"config/config_target.lua",
	"config/config_commands.lua",
	"config/config_crafting.lua",
	"config/config_discord.lua",
	"config/config_usableitems.lua",
	"config/config_setInventory.lua",
	"config/config_vending.lua",
	"config/config_hud.lua",
	"server/version_check.lua",
	"client/qbcore_functions.lua",
	"server/qbcore_functions.lua",
}

dependencies {
	'mysql-async', -- Required.
	'progressbar', -- Required.
	--'dpclothing', -- Required.
	'/server:4752', -- ⚠️PLEASE READ⚠️ This requires at least server build 4700 or higher
}

dependency '/assetpacks'

dependency '/assetpacks'