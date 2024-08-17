fx_version 'cerulean'
game 'gta5'

ui_page 'html/index.html'

files {
	'compat/*.lua',
	'stream/*.ytd',
	'data/*.lua',
	'html/index.html',
	'html/style.css',
	'html/script.js'
}

client_scripts {
	'compat/*.lua',
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
	'init.lua',
	'data/bones.lua',
	'client.lua',
}

lua54 'yes'

use_fxv2_oal 'yes'

dependency 'PolyZone'

escrow_ignore {
	'client.lua',
	'compat/*.lua',
	'init.lua',
	'data/bones.lua'
}
dependency '/assetpacks'