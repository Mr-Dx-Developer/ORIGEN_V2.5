fx_version 'cerulean'
game 'gta5'

author "Elixir"
description "Emotes Menu"
version '1.0.0'

ui_page 'web/build/index.html'
--ui_page 'http://localhost:5173'
files {'web/build/index.html', 'web/build/**/*'}

server_script 'server/server.js'
client_script 'client/client.js'
client_script 'client/client.lua'

server_script '@oxmysql/lib/MySQL.ts'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
}

lua54 'yes'

escrow_ignore {
    'server/server.js',
    'client/client.js',
    'client/client.lua',
  }
  