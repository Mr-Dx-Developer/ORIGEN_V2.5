fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'rytrak.fr'
version '1.0'

escrow_ignore {
	'config.lua',
	'cl_utils.lua'
}

server_script {
	'config.lua',
	'server.lua'
}

client_scripts {
	'config.lua',
	'client.lua',
	'cl_utils.lua'
}
dependency '/assetpacks' 