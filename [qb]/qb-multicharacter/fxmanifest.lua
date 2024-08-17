fx_version 'cerulean'
game 'gta5'

description 'QB-Multicharacter'
version '1.2.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts  {
    '@oxmysql/lib/MySQL.lua',
    '@qb-apartments/config.lua',
    'server/main.lua'
}

ui_page 'dist/index.html'

files {
    'dist/*',
    'dist/assets/*'
}

dependencies {
    'qb-core'
}

lua54 'yes'
