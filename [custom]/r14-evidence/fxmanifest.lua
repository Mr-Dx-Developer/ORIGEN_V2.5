fx_version 'cerulean'
game 'gta5'

author 'R14 Development (cjsjs#2964)'
description 'r14-evidence'
version '1.44 hotfix'


shared_scripts {
    'config.lua',
}

ui_page 'html/index.html'

client_scripts {
	'config.lua',
	'client/*.lua',
}

server_scripts {	
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

files {
	'html/index.html',
	'html/main.js',
}

lua54 'yes'
