fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description 'Standalone Scoreboard'
version '1.1'

shared_script 'config.lua'
client_script 'client.lua'
server_script 'server.lua'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/script.js',
    'html/style.css'
}

dependencies {
    '/onesync',
}

escrow_ignore {
    'html/*',
    'config.lua',
    'server.lua',
    'client.lua',
}
dependency '/assetpacks'server_scripts { '@mysql-async/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }