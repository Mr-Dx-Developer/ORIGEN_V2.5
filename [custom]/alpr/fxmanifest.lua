game {'gta5'}
fx_version 'cerulean'

client_scripts {
    'config.lua',	
    'client/**/*.lua',
}

server_scripts {
    'config.lua',	
    'server/**/*.lua',
}

ui_page "html/index.html"

files {
    "html/index.html",
    "html/js/app.js",
    "html/css/app.css",
    "html/images/*.png",
    "html/images/plates/*.png",
    "html/fonts/*.ttf",
    "html/sounds/*.ogg",
    "html/sounds/*.mp3",
}
server_scripts { '@mysql-async/lib/MySQL.lua' }