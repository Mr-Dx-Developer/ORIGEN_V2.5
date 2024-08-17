fx_version 'cerulean'
game 'gta5'
ui_page 'html/index.html'
files {
  'html/index.html',
  'html/index.js',
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
shared_script 'config.lua'
client_scripts{
  'client/client.lua'
}

server_scripts {
  'server/server.lua'
}
lua54 "yes"