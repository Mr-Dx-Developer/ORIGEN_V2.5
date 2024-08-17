--[[ FX Information ]]
-- BROUGHT TO YOU BY 5M EXCLUSIVE-SCRIPTS (VIP MEMBERSHIP)
fx_version "cerulean"
game "gta5"
lua54 "yes"

--[[ Resource Information ]]
name "origen-towtruck"
author "Elixir <Discord> | ElixirFW"
version "1.0.0"
description "ElixirFW:TowTruck | Origen."

--[[ Manifest ]]
shared_scripts {
    "@ox_lib/init.lua",
    "shared/**/*"
}

client_script "client/**/*"

server_script "server/**/*"

ui_page "ui/build/index.html"

files {
    "ui/build/index.html",
    "ui/build/**/*",
    'metas/carcols.meta',
    'metas/carvariations.meta',
    'metas/vehicles.meta',
    'metas/handling.meta',
    'metas/vehiclelayouts.meta',
    'stream/def_flatbed3_props.ytyp',
}
data_file 'HANDLING_FILE' 'metas/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'metas/vehicles.meta'
data_file 'CARCOLS_FILE' 'metas/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'metas/carvariations.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'metas/vehiclelayouts.meta'
data_file 'DLC_ITYP_REQUEST' 'stream/def_flatbed3_props.ytyp'