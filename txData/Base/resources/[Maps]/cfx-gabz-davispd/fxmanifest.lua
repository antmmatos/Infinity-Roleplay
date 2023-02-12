fx_version 'cerulean'
game 'gta5'
author 'Gabz'
description 'Davis PD'
version '8.0.0'
lua54 'yes'
this_is_a_map 'yes'

client_script {
    'gabz_entityset_davispd.lua',
}

dependencies {
    '/server:4960',     -- ⚠️PLEASE READ⚠️; Requires at least SERVER build 4960.
    '/gameBuild:2189',  -- ⚠️PLEASE READ⚠️; Requires at least GAME build 2189.
    'cfx-gabz-pdprops', -- ⚠️PLEASE READ⚠️; Requires [cfx-gabz-pdprops] to work properly.
}

server_scripts {
    'version_check.lua',
}

escrow_ignore {
    'stream/**/*.ytd',
    'gabz_entityset_davispd.lua',
    'davispd.lua',
}

data_file 'TIMECYCLEMOD_FILE' 'gabz_davispd.xml'

files {
    'gabz_davispd.xml',
}


dependency '/assetpacks'

client_script "@InfinityAC/src/client/src_c_03.lua"