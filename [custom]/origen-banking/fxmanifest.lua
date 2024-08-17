fx_version 'adamant'

game 'gta5'

description 'ORIGEN - Banking script | NP Inspired'

version '1.0.0'

ui_page 'UI/index.html'

files {
    'UI/index.html',
    'UI/styles/*.css',
    'UI/scripts/*.js',
    'UI/images/*.png',
	'UI/images/*.jpg',
    'UI/images/*.svg',
	'UI/fonts/*.ttf'
}

dependency '2na_core'

shared_script 'Config.lua'
client_script 'Client/*.lua'
server_script 'Server/*.lua'

lua54 'yes'

escrow_ignore {
    'Config.lua',
    'UI/index.html',
    'UI/styles/*.css',
    'UI/scripts/*.js',
    'UI/images/*.png',
	'UI/images/*.jpg',
    'UI/images/*.svg',
	'UI/fonts/*.ttf'
}