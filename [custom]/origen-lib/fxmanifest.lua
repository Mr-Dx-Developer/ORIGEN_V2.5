description 'origen-lib'
name ' origen-lib'
author 'origen-lib'
version 'v1.0.0'

ui_page 'html/index.html'

files {
  'html/index.html',
  'html/*.js',
  'html/*.css',
  'html/*.png',
  'html/*.JPG',
  'html/*.svg',
  'html/sounds/*.ogg',
  'html/*.woff',
  'html/*.otf',
  'html/weaponimages/*.png'
}

client_scripts {
    'config.lua',
    'client.lua'

}

server_scripts {
    'config.lua',
    'server.lua'
}

exports {
  'Progress',
  'ProgressWithStartEvent',
  'ProgressWithTickEvent',
  'ProgressWithStartAndTick',
  'isDoingSomething'
}

lua54 'yes'

fx_version 'adamant'
games {'gta5'}