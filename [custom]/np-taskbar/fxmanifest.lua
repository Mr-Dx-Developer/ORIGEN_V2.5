fx_version 'cerulean'
games { 'rdr3', 'gta5' }

ui_page "nui/dist/index.html"
files {
  "nui/dist/*",
  "nui/dist/index.html",
  "nui/dist/assets/*",

}

client_scripts {
  'client/cl_*.lua',
}

export "taskBar"
export "closeGuiFail"
