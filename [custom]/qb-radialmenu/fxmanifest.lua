fx_version 'adamant'
Developer 'Elixir'
Version '1.0.0'

games { 'gta5' }

client_script {
  "config.lua",
  "client_menu.lua",
	"utils.lua"
}

ui_page "nui/dist/index.html"

files {
  "nui/dist/*",
  "nui/dist/index.html",
	"nui/dist/assets/*",
}

lua54 'yes'
escrow_ignore {
  "config.lua",
  "client_menu.lua",
	"utils.lua",
  "nui/dist/*",
  "nui/dist/index.html",
	"nui/dist/assets/*",
}
