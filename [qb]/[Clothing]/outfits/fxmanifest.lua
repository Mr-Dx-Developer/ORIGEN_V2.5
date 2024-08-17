fx_version "cerulean"

lua54 'yes'

games { "gta5" }

author 'Tech Script'

description "Tech Script- Outfit System 4.0"

version "2.1.0"

ui_page 'web/dist/index.html'

files {
    "web/dist/**/*",
}

server_scripts { "build/sv_*.lua" }
client_scripts { "build/cl_*.js" }