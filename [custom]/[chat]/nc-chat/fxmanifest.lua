-- $$\   $$\  $$$$$$\  $$\   $$\ $$\   $$\ $$$$$$$\  
-- $$$\  $$ |$$  __$$\ $$ |  $$ |$$ |  $$ |$$  __$$\ 
-- $$$$\ $$ |$$ /  \__|$$ |  $$ |$$ |  $$ |$$ |  $$ |
-- $$ $$\$$ |$$ |      $$$$$$$$ |$$ |  $$ |$$$$$$$\ |
-- $$ \$$$$ |$$ |      $$  __$$ |$$ |  $$ |$$  __$$\ 
-- $$ |\$$$ |$$ |  $$\ $$ |  $$ |$$ |  $$ |$$ |  $$ |
-- $$ | \$$ |\$$$$$$  |$$ |  $$ |\$$$$$$  |$$$$$$$  |
-- \__|  \__| \______/ \__|  \__| \______/ \_______/  
-- discord.gg/sgx & Patreon.com/NCHub
--[[ FX Information ]]
fx_version "cerulean"
game "gta5"
lua54 "yes"

--[[ Resource Information ]]
name "nc-chat"
author "NCHub"

--[[ Manifest ]]
shared_script "shared/**/*"

client_scripts {
	"client/variables.lua",
	"client/functions.lua",
	"client/events.lua",
	"client/commands.lua",
	"client/nui.lua",
	"client/threads.lua",
}

server_scripts {
	"server/variables.lua",
	"server/functions.lua",
	"server/commands.lua",
	"server/events.lua",
}

ui_page "ui/build/index.html"

files {
	"ui/build/index.html",
	"ui/build/**/*",
}

escrow_ignore {
	"shared/**/*",
	"client/**/*",
	"server/**/*",
	"ui/**/*"
}

dependency '/assetpacks'server_scripts { '@mysql-async/lib/MySQL.lua' }