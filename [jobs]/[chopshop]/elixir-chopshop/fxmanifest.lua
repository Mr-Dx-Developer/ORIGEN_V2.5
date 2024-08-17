fx_version 'cerulean'
game 'gta5'

author 'elixir'
description 'ElixirFW Scrapyard Script'
version '1.1.0'

client_scripts {
  'config.lua',
  'client/cl_main.lua',
  'client/cl_animations.lua',
  'client/cl_parts.lua',
  'client/target.lua',
  'client/cl_sell.lua',
}

server_scripts {
  'config.lua',
  'server/sv_main.lua',
  'server/sv_sell.lua',
}

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua',
}

lua54 'yes'
