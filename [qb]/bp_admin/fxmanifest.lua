description 'Admin'
name ' admin'
author 'bp_admin'
version 'v1.0.0'



ui_page 'html/index.html'


files {
  'html/index.html',
  'html/*.js',
  'html/*.css',
  'html/weatherimage/*.jpg',
  'html/weatherimage/*.jpeg',
  'html/vehicleimg/*.png',
  'html/vehicleimg/*.jpg',
  'html/*.png',
  'html/*.otf',
  'html/*.svg'




    

}

client_scripts {
    'config.lua',
    'framework/cl_wrapper.lua',
    'entity.lua',
    'noclip.lua',
    'client.lua'

}

server_scripts {
    'config.lua',
    'framework/sv_wrapper.lua',
    'entity.lua',
    'noclip.lua',
    'server.lua'
}

lua54 'yes'

escrow_ignore {
  'config.lua',
}

fx_version 'adamant'
games {'gta5'}