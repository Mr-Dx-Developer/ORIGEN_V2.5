Config = {}

Config.UseTarget = true -- Set to true to use Third-Eye, otherwise false

-- The Locations to access Body Cam menu
Config.Locations = {
    { vector3(441.24, -978.85, 30.69) }, 
    { vector3(447.97, -973.38, 30.69) },  
    { vector3(437.03, -996.21, 30.69) },
}

-- Box zones if using Config.Target = true to access Body Cam menu
Config.Targets = {
    { coords = vector3(452.36, -999.59, 30.6), width = 1.5, height = 1.5 }, 
    { coords = vector3(453.67, -985.9, 30.65), width = 1.5, height = 1.5 },  
    { coords = vector3(453.63, -981.61, 30.65), width = 1.5, height = 1.5 },
}