fx_version 'cerulean'
game 'gta5'

author 'Free City'
version '1.0.0 - release'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/css/basic.css',
	'html/js/basic.js',
	'html/extras/jquery.min.1.7.js',
	'html/extras/modernizr.2.5.3.min.js',
	'html/audio/*.mp3',
	'html/pages/*.jpg',
	'html/lib/turn.html4.min.js',
	'html/lib/turn.min.js',
}

client_scripts{
    'client/client.lua',
}

server_scripts{
    'server/server.lua',
}

shared_script 'shared.lua'

escrow_ignore {
    'server/server.lua',
    'client/client.lua',
    'shared.lua'
}


lua54 'yes'
dependency '/assetpacks'