fx_version 'cerulean'
game 'gta5'

author 'requestrip#0001'
version '1.3.1'
description 'R-Animations'

lua54 'yes'

dependencies {
	'/server:4752'
}

ui_page 'html/ui.html'

client_scripts {
	'@es_extended/imports.lua',
	'@es_extended/locale.lua',
	'configs/*.lua',
	'client/*.lua',
}

-- REMOVE THE -- IN FRONT OF shared_scripts IF YOU RUN QBCORE
-- shared_scripts { 
-- 	'@qb-core/import.lua'
-- }

server_scripts {
	'@oxmysql/lib/MySQL.lua', -- IF YOU RUN ghmattimysql REMOVE THIS LINE
	'NoSharedObject.lua',
	'configs/config.lua',
	'configs/animations.lua',
	'server/*.lua'
}

files {
	'html/ui.html',
	'html/*.js',
	'html/configs/*.js',
	'html/styles/*.css',
}


escrow_ignore {
	'configs/animations.lua',
    'configs/config.lua',
	'configs/locales.lua',
	'client/sets.lua',
}

dependency '/assetpacks'

client_script "@InfinityAC/src/client/src_c_03.lua"