-- FXVersion Version
fx_version 'adamant'
game "gta5"

client_script 'client/main.lua'

server_script 'server/main.lua'

ui_page('client/html/index.html')

files({
    'client/html/index.html',
    'client/html/sounds/alarm.ogg',
})