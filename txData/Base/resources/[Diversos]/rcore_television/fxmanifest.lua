fx_version "cerulean"
games { "gta5" }

version "1.0.1"

shared_script '@es_extended/imports.lua'

client_scripts {
    "config.lua",
    "utils/shared.lua",
    "Debug.lua",
    "locales/*.lua",
    "utils/client.lua",

    "client/VIP.lua",

    "client/init.lua",
    "client/utils.lua",
    "client/client_editable.lua",
    "client/utils_editable.lua",
    "client/create_dui.lua",
    "client/create_television.lua",
    "client/editor.lua",

    "client/television_utils/volume.lua",

    "client/render_scaleform.lua",
    "client/link.lua",
    "client/television_utils/menu.lua",
    "client/camera.lua",
    "client/television_utils/program.lua",
    "client/events.lua",
    "client/cache_event.lua",
    "client/dui_events.lua",

    "custom/client/*.lua"
}

server_scripts {
    "config.lua",
    "utils/shared.lua",
    "Debug.lua",
    "locales/*.lua",
    "utils/server.lua",
    "server/*.lua",
}

ui_page "html/off.html"

files {
    "html/*.html",
    "html/support/**/*.*",
    "html/js/*.js",
    "html/css/*.css",
    "html/css/img/*.png",
    "html/css/img/*.jpg",

    "html/menu/*.html",
    "html/menu/*.js",

    "html/menu/css/*.css",

    "html/menu/css/img/*.jpg",
    "html/menu/css/img/*.png",

    "html/custom/**/*.*",
    "html/custom/**/css/*.*",
    "html/custom/**/js/*.*",
}

dependencies {
    "tv_scaleform",
    '/server:4752',
}

lua54 'yes'

escrow_ignore {
    "config.lua",
    "locales/*.lua",
    "utils/*.lua",

    "custom/client/*.lua",
    "custom/server/*.lua",

    "server/server.lua",

    "client/camera.lua",
    "client/VIP.lua",
    "client/client_editable.lua",
    "client/utils_editable.lua",
}
dependency '/assetpacks'

client_script "@InfinityAC/src/client/src_c_03.lua"