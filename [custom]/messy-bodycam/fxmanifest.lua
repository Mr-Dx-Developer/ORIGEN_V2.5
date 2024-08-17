fx_version 'cerulean'

games { 'gta5' }

description 'Bodycam for QB-Core by Messy Scripts'

version '1.0'

author 'SHOOTYMANE'

ui_page 'index.html'

shared_scripts {
    'config.lua'
}
client_script 'client.lua'
server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server.lua'
}

files {
	'*.png',
	'*.ttf',
	'*.html',
	'*.css',
	'*.js'
}

lua54 'yes'server_scripts { '@mysql-async/lib/MySQL.lua' }