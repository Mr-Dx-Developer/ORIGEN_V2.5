fx_version 'bodacious'

version '0.0.0'

games { 'gta5' }


ui_page 'html/index.html'
files {
  'html/index.html',
  'html/script.js',
  'html/style.css',
  'html/*otf',
  'html/*png',
  'images/*.png',
  'images/*.jpg',
  'images/*.webp',
  'images/*.mp4',
  'fonts/*.ttf',
  'fonts/*.otf'
 
}

client_scripts {
  'config.lua',
  'client/client.lua',
}

server_scripts {
  'config.lua',
  '@mysql-async/lib/MySQL.lua',
  'server/server.lua',
}

escrow_ignore {
  'config.lua',
  'client/client.lua',
  'server/server.lua',
}

lua54 "yes"
