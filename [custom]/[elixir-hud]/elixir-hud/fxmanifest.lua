fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author "Elixir FW"
description "Elixir FW HUD System 4.0 "
version '1.0.0'

ui_page 'web/index.html'

files {
	'web/*',
}

client_scripts {
	'client/client.lua',
	'client/open_client.lua',
	'client/cl_pursuit.lua',
	--'client/gears.lua',
}

shared_script {
	'shared/config.lua',
}
server_script {
	'server/sv_pursuit.lua',
}

escrow_ignore {
	'client/open_client.lua',
	'shared/config.lua',
	'server/sv_pursuit.lua',
	'client/cl_pursuit.lua'
}