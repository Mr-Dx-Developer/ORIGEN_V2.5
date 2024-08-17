local QBCore = exports['qb-core']:GetCoreObject()

Config = {}

Config.Debug = {
    DebugCommand = true, -- enable debug command
    Evidence = {enabled = false, label = "Print evidence creation to console.", order = 1}, -- enable this to print debug information when normal evidence is created
    CarEvidence = {enabled = false, label = "Print car evidence creation to console.", order = 2}, -- enable this to print debug information when car evidence is created
    Database = {enabled = false, label = "Print database events to server console.", server = true, order = 3}, -- enable this to print debug information related to vehicle evidence being uploaded to the database
    Bucket = {enabled = false, label = "Print current bucket to console.", order = 4}, -- enable this to print debug information relating to routing buckets here
    ViewEvidence = {enabled = false, label = "View evidence without camera or police job", order = 5}, -- enable seeing evidence at all times without use of camera for testing
    PrintGSR = {enabled = false, label = "Print the contents of the PlayerGSR table to server console during loop", server = true, order = 6}, -- this will print the PlayerGSR table every loop
    PrintBAC = {enabled = false, label = "Print the contents of the PlayerBAC table to server console during loop", server = true, order = 7}, -- this will print the PlayerBAC table every loop
    PrintTamperLoop = {enabled = false, label = "Print the contents of the Vehicle Tamper tables to server console during loop", server = true, order = 8}, -- this will print the PlayerBAC table every loop
    PrintStatus = {enabled = false, label = "Print the contents of the PlayerBAC table to server console during loop", server = true, order = 9}, -- this will print the PlayerBAC table every loop
    PrintFade =  {enabled = false, label = "Print evidence expiring to server console", server = true, order = 10}, -- this will print evidence pieces being removed by the time check loop to server console
    PrintTest = {enabled = false, label = "Print result of player checks/tests to server console", server = true, order = 11}, -- print results of BAC, GSR, frisks, and investigates to server console
    PrintTestC = {enabled = false, label = "Print data sent to player check/test events to console.", order = 12}, -- print data sent to BAC, GSR, frisks, and investigates to console
    OutlineCasings = {enabled = false, label = "Draw entity outline for shell casing objects", order = 13}, -- print data sent to BAC, GSR, frisks, and investigates to console
    ConfirmDrugPositive = {enabled = false, label = "Create server print and notify player when they test positive for a drug.", order = 14}, -- print/notify when a player returns positive for a drug to assist in testing drug/consumables integration
}

Config.Bleed = {
    EnableCommand = true, -- set to FALSE to disabled the /bleed command that allows players to generate blood evidence (but recieve damage when doing so)
    Cooldown = 10, -- the amount, in seconds, to set the cooldown timer for the /bleed command
    DamageChance = 40, -- the chance a damage event causes a player to bleed, which a rng must 'beat' or go over to result in bleed
}

Config.GSR = {
    MinShotsStatus = 5, -- the amount of times someone can fire nearby a player before they get a gunpowder status effect
    MinShotsPositive = 2, -- the amount of times a player needs to shoot to test positive for GSR (not get a gunpowder status effect)
    FadeTime = 10, -- the amount, in minutes, it takes for a player to not test positive for GSR
    WhileAiming = true, -- this sets whether or not aiming a weapon will generate a positive GSR test
    AimingTime = 5, -- the time, in seconds, it takes for a player to test positive for GSR if aiming a weapon
    ShootingChance = 70, -- set to FALSE to use only MinShotsPositive, or set to a number between 1 and 100 to enable a chance of becoming GSR positive (less realistic, more rp leeway)
    NearbyChance = 70, -- set to FALSE to use only MinShotsStatus, or set to a number between 1 and 100 to enable a chance of becoming GSR positive (less realistic, more rp leeway)
    AimingChance = 50, -- set to FALSE to use only AimingTime, or set to a number between 1 and 100 to enable a chance of becoming GSR positive (less realistic, more rp leeway)
    WashOff = true, -- set to TRUE for gsr to wash off in water
}

Config.Consume = {
    GSR = false, -- set this to true if you want GSR tests to be consumed upon use
    DNA = false, -- set this to true if you want DNA tests to be consumed upon use
    AccessTool = 20, -- set to a number of uses if desired, if not set to false for no usage limit
}

Config.EvidenceFadeTime = {
    Casings = 60, -- time, in minutes, that casings remain before being removed
    Impact = 45, -- time, in minutes, that bullet impacts remain in workd before being removed
    Blood = 60, -- time, in minutes, that fingerprints remain before being removed
    Fingerprint = 20, -- time, in minutes, that fingerprint evidence gets removed without player intervention
    Tampering = 15, -- time, in minutes, that lock tamperings get removed
    Fragment = 45, -- time, in minutes, that vehicle fragments remain in world before being removed
    NetImpact = 30, -- time in minutes, that network entity remain in world before getting removed
    NetPedImpact = 30, -- time in minutes, that network ped impacts remain in world before getting removed
    VehTampers = 15, -- time, in minutes, that vehicle tampers remain before being removed
    VehFingerprints = 3, -- time, in days, that vehicle fingerprints gets removed from vehicles without player intervention
    VehCasings = 14, -- time, in days, that vehicle casings get removed from vehicles without player intervention
    VehBlood = 21, -- time, in days, that vehicle blood get removed from vehicles without player intervention
}

Config.DB = { -- this config sets what table you are using to store vehicle evidence
    Vehicle = 'player_vehicles', -- set this to your player vehicle table
    Plate = 'plate'
}

Config.VehInAndOut = { -- this configures your server side event that triggers when garaging or ungaraging a vehicle, the paramaters for base qb-garages are included
    InEvent = 'qb-garage:server:updateVehicle',
    InState = 1, -- the state receieved when placing a vehicle in a garage
    InStateVar = 1, -- the argument that is received for the vehicle state when putting it in a garage
    InPlateVar = 5, -- the argument that is received for the vehicle plate when putting it in a garage
    OutEvent = 'qb-garage:server:updateVehicleState',
    OutState = 0,
    OutStateVar = 1,
    OutPlateVar = 2,
}

Config.Emote = {
    Event = 'animations:client:PlayEmote',
    Arg = 1, -- the argument where the name of the emote is sent, if it is an array please set array to true
    Array = true, -- set to true if the name of the emote is in a table and not an argument
    Key = 1, -- set to the key of the array where the emote name is, can be a number, or if data.name put 'name' here to access it
    Activate = { -- name of emotes that activate being able to see evidence, you need to find the scenario or dictionary/animation being used so the script can check if they are being played
        ['record'] = {scenario = "WORLD_HUMAN_MOBILE_FILM_SHOCKING"},
        ['camera'] = {dict = "amb@world_human_paparazzi@male@base", anim = 'base'},
    }, 
}

Config.VehCasingChance = 70 -- set this to a number between 1 and 100, higher equals greater chance of casings staying in vehicle when fired in drive by

Config.Breathalyzer = false -- set this to true if you want to use the breathalyzer events contained in this script (may require additional setup if not using qb-smallresources)

--[[---------- Drug Testing Config ----------

This table allows you to set up or completely disable drug testing in the script, out of the box, r14-evidence is set up to work with the drugs included 
in qb-core through built-in event listeners/handlers both in the server and client. If you are using a third party drug script, you can use the EventTriggers
subfield to set up custom event handlers to integreate with your drug/consumables script, or you can follow the guide at regalonefour.github.io to insert
custom event triggers into your drug/consumables resource code in order to trigger the proper drug testing events in r14-evidence.

Below, we will add a sample config for a hypothetical drug script in which were we specify the paramaters that will trigger drug usage.

    [4] = {
        event = 'customdrugs:server:cocaine', -- REQUIRED, name of the event to listen for
        drugType = 'cocaine' -- REQUIRED, specify the config drug test that will be set positive by this event trigger
        type = 'server', -- OPTIONAL, will default to server if not specified, if you want to use a client event you must specify client
        positiveTime = 4, -- OPTIONAL, specify a custom time in hours for the character to return positive
        drugArgPos = 4, -- OPTIONAL, if your script uses one event for multiple drugs, you can access an argument to validate the drug 
        drugArgSubfield = 'drugName', -- OPTIONAL, if your argument is a table, specify the name of the key to be accessed
        drugArgValue = 'cocaine', -- OPTIONAL, the value the argument should be to trigger the drug usage, by default this will be true if not specified and you have specified an arg
        cidArgPos = , -- OPTIONAL, if your server event is being triggered by the server for some reason, specify the arg of the player CID, not needed if triggering from client
        cidArgSubfield = , -- OPTIONAL, specify the subfield if the arg is a table, not needed if triggering from client, not needed if triggering from client
        sourceArgPos = 3, -- OPTIONAL, if your server event is being triggered by the server for some reason, specify the source fo the player to find their CID, not needed if triggering from client
        souceArgSubfield = originalSource, -- OPTIONAL, specify the original source subfield if the arg is a table, such as here arg[3].originalSource, not needed if triggering from client
    },

--]]------------------------------------------

Config.DrugTesting = {
    Enabled = true,
    UsingQBSR = true, -- set to true if you are using basic qb-smallresources, if not you will need to specify an event trigger or edit your consumables resource
    DefaultPositiveTime = 2, -- number, in hours, that a player remains positive for a drug test (does not extend past script reset)
    Drugs = {
        ['weed'] = {
            label = 'Marijuana'
        },
        ['oxycodone'] = {
            label = 'Oxycodone',
        },
        ['ecstacy'] = {
            label = "Ecstacy",
        },
        ['cocaine'] = {
            label = 'Cocaine',
        },
        ['meth'] = {
            label = 'Methamphetamine',
        },
    },
    EventTriggers = {
        --[1] = {event = 'consumables:server:useMeth', type = 'server', drugType = 'meth', positiveTime = 4},
        --[2] = {event = 'evidence:client:SetStatus', type = 'client', drugType = 'weed', drugArgPos = 1, drugArgSubfield = nil, drugArgValue = 'weedsmell'}, -- this is how you could trigger weed in QBSR 
    }
}

--[[---------- Camera Upload Config ----------

This table contains the upload channels or image spaces that players can link their camera too to upload pictures to both discord and for other
players to view in city. Out of the box, the first image space will be the one that is posted when a user takes ANY photo in the city, whether or not
they ultimately choose to upload it to an image space, and should be linked to a hidden webhook in the discord that staff are able to see but other users are
not to try and prevent metagaming photos users did not actually post. 

To create a custom image space for users to upload too, you can use the following template showing an example of creating a webhook for a military job
in our city:

    [7] = { 
        Path = 'SANG_NSS/GEN', -- lets name our image space, we'll shorten San Andreas National Guard Nikoff Secure Space to SANG_NSS 
        Password = 'getsome', -- lets set a password so that not all members of our job can get to it
        Job = 'armynationalguard' -- we can use the name of our job to limit it to that job
        Type = 'military' -- we can set a job type if we want to use, maybe we have multiple national guard jobs
        Auth = 'SANG' -- we can also create a custom auth function in the config, and then set the Auth field to it
    }

--]]------------------------------------------

Config.Camera = { -- YOU MUST CREATE A WEBHOOK AND ADD IT TO THE SERVER.LUA FOR EACH ENTRY IN THIS TABLE
    [1] = {Path = 'LOCAL STORAGE'}, -- do not remove the default upload, this serves as local storage for the camera to save onto the camera item/sd card WITHOUT uploading it
    [2] = {Path = 'NIKOFF IMAGE SPACE', Password = nil}, -- this is a public webhook/image space for civilians to use the camera for, not required but recommended
    [3] = {Path = 'SA_NSS/POLICE/GENERAL/', Password = nil, Auth = 'LEO'}, 
    [4] = {Path = 'SA_NSS/POLICE/DRUGTASKFORCE/', Password = 'GangTask', Auth = 'LEO'},
    [5] = {Path = 'SA_NSS/POLICE/INVESTIGATIONS/', Password = 'password1234', Auth = 'LEO'},
    [6] = {Path = 'SA_NSS/EMS/MEDICAL/', Password = 'password123', Auth = 'EMS'},
    [7] = {Path = 'WEAZEL_NSS/BREAKING', Password = 'thetruth', Job = 'reporter'}, -- this is a private webhook for the reporter job, you can make job-specific webhooks using this method
}

-- notification functions

Config.Functions = {
    Notify = function(string, notifytype)
        QBCore.Functions.Notify(string, notifytype)
    end,
    Chat = function(args)
        TriggerEvent('chat:addMessage', args)
    end,
    ServerNotify = function(target, string, notifytype)
        TriggerClientEvent('QBCore:Notify', target, string, notifytype)
    end,
}

Config.Notification = {
    ClutterReminder = 'You notice the car is trash of full and clutter.',
    Clipboard = 'Copied %s to clipboard', -- requires one %s for copied text
    NoTarget = 'No one nearby!',
    Evading = "They're evading, breh!", -- suspect attempting to flee a test/investigation 
    NoEvidence = 'Did not discover any evidence in %s', -- requires one %s for plate
    Bleed = 'Blood trickles from your wound as you feel weaker',
    CancelEvidenceClear = "Couldn't even do this right?",
    Unlock = "Vehicle has been unlocked!",
    IncorrectJob = 'This is for emergency services only',
    Overweight = "You do not have space in your pockets to carry this evidence!",
    NoBag = "You do not have an evidence bag to collect this with!",
    NoTamper = "You notice nothing out of the ordinary about %s", -- requires one %s for plate
}

-- this is the table used to preform job checking functions, if you are using a custom name or 
-- job type, please add it to the Job/Type arrays so that they have access to those functions

Config.AuthorizedJobs = {
    LEO = { -- this is for job checks which should only return true for police officers
        Jobs = {['police'] = true, ['fib'] = true, ['hornypolice'] = true},
        Types = {['police'] = true, ['leo'] = true},
        Check = function(source)
            local PlyData = nil
            if source and QBCore.Functions.GetPlayer then PlyData = QBCore.Functions.GetPlayer(source) if PlyData then PlyData = PlyData.PlayerData else return end else PlyData = QBCore.Functions.GetPlayerData() end

            local job, jobtype = PlyData.job.name, PlyData.job.type

            if Config.AuthorizedJobs.LEO.Jobs[job] or Config.AuthorizedJobs.LEO.Types[jobtype] then return true end
        end
    },
    EMS = { -- this if for job checks which should only return true for ems workers
        Jobs = {['ambulance'] = true, ['fire'] = true},
        Types = {['ambulance'] = true, ['fire'] = true, ['ems'] = true},
        Check = function(source)
            local PlyData = nil
            if source and QBCore.Functions.GetPlayer then PlyData = QBCore.Functions.GetPlayer(source) if PlyData then PlyData = PlyData.PlayerData else return end else PlyData = QBCore.Functions.GetPlayerData() end

            local job, jobtype = PlyData.job.name, PlyData.job.type

            if Config.AuthorizedJobs.EMS.Jobs[job] or Config.AuthorizedJobs.EMS.Types[jobtype] then return true end
        end
    },
    FirstResponder = { -- do not touch, this is a combined job checking function for emergency services (police and ems)
        Check = function(source)
            local PlyData = nil
            if source and QBCore.Functions.GetPlayer then PlyData = QBCore.Functions.GetPlayer(source) if PlyData then PlyData = PlyData.PlayerData else return end else PlyData = QBCore.Functions.GetPlayerData() end

            local job, jobtype = PlyData.job.name, PlyData.job.type

            if Config.AuthorizedJobs.LEO.Check() or Config.AuthorizedJobs.EMS.Check() then return true end            
        end
    },
    Frisk = { -- this is for configuring the frisk job check, you can enable it for all civlians, or specific jobs
        All = false, -- set this to true if you want everyone to have access to frisk
        Jobs = {['police'] = true, ['fib'] = true, ['sheriff'] = true, ['ambulance'] = {['1'] = true, ['2'] = true,},}, -- you can add a rank table here to give the option to only specific job ranks, like bounchers
        Types = {['police'] = true, ['leo'] = true},
        Check = function(source)
            local PlyData = nil
            if source and QBCore.Functions.GetPlayer then PlyData = QBCore.Functions.GetPlayer(source) if PlyData then PlyData = PlyData.PlayerData else return end else PlyData = QBCore.Functions.GetPlayerData() end

            local job, jobtype, rank = PlyData.job.name, PlyData.job.type, tostring(PlyData.job.grade.level)

            if Config.AuthorizedJobs.Frisk.All then return true end
            if type(Config.AuthorizedJobs.Frisk.Jobs[job]) == 'table' then if Config.AuthorizedJobs.Frisk.Jobs[job][rank] then return true end end
            if Config.AuthorizedJobs.LEO.Jobs[job] or Config.AuthorizedJobs.LEO.Types[jobtype] then return true end
        end,
    }
}

-- labels

Config.ImpactLabels = {
    [1950175060] = "Pistol Caliber",
    [1820140472] = "Pistol Caliber",
    [218444191] = "Rifle Caliber",
    [1788949567] = "Rifle Caliber",
    [`ammo_stungun`] = "Taser Prongs",
    [-1878508229] = "Shotgun Shell",
    [1285032059] = "High-Caliber Rifle Round",
    [`weapon_musket`] = "Musket Ball?",
}

Config.StatusList = {
    ['fight'] = 'Bruising on hands',
    ['widepupils'] = 'Pupils dialated',
    ['redeyes'] = 'Red eyes',
    ['weedsmell'] = 'Smells of weed',
    ['gunpowder'] = 'Smells of gunpowder',
    ['chemicals'] = 'Smells of chemicals',
    ['heavybreath'] = 'Breathing heavily',
    ['sweat'] = 'Profusely sweating',
    ['handbleed'] = 'Blood on hands',
    ['confused'] = 'Dazed and confused',
    ['alcohol'] = 'Smells of alcohol',
    ['heavyalcohol'] = 'Smells heavily of alcohol'
}

Config.CarStatusList = {
    ['widepupils'] = 'have dialated pupils',
    ['redeyes'] = 'have red eyes',
    ['weedsmell'] = 'smell of weed',
    ['gunpowder'] = 'smell of gunpowder',
    ['chemicals'] = 'smell of chemicals',
    ['heavybreath'] = 'be breathing heavily',
    ['sweat'] = 'be profusely sweating',
    ['confused'] = 'be dazed and confused',
    ['alcohol'] = 'smell of alcohol',
    ['heavyalcohol'] = 'smell heavily of alcohol'
}

--[[---------- custom frisk table ----------

This list of items will result in a player using frisk positively detecting a weapon or contraband, it is highly recommended to only add items that would be large, bulky, or that would otherwise be 
clearly 'detectable' even under a suspect's clothing. You should not add any drug item just because it a drug item, and should consider whether or not you could tell what it was in your pocket without 
removing it

For real world reference, Minnesota v. Dickerson (1993), determined that officers could seize contraband that is immediately identifiable as contraband when touched under a 'plain touch' doctrine,
but that they could not legally seize contraband by "squeezing, sliding and otherwise manipulating the contents of the defendant’s pocket". This means you shouldn't make a joint discoverable via frisk, 
but it might make sense if a crack pipe or coke brick was. If you make things too easy to discover, crims will no longer 'trust' that a Frisk is only a frisk for weapons, and your police will lose a 
valuable tool!                                                                                                                                                                                              --]]

Config.FriskContrabandItems = { 
    ['spikestrip'] = true
}

-- Weapons that do not create drops

Config.NoGSRWeapon = {
    [`weapon_unarmed`] = true,
    [`weapon_snowball`] = true,
    [`weapon_stungun`] = true,
    [`weapon_petrolcan`] = true,
    [`weapon_hazardcan`] = true,
    [`weapon_fireextinguisher`] = true,
    [`weapon_raypistol`] = true,
    [`weapon_raycarbine`] = true,
    [`weapon_railgun`] = true,
    [`weapon_rayminigun`] = true,
    [`weapon_grenade`] = true,
    [`weapon_bzgas`] = true,
    [`weapon_molotov`] = true,
    [`weapon_stickybomb`] = true,
    [`weapon_proxmine`] = true,
    [`weapon_pipebomb`] = true,
    [`weapon_ball`] = true,
    [`weapon_smokegrenade`] = true,
    [`weapon_flare`] = true,
}

Config.NoCasingWeapon = {
    [`weapon_unarmed`] = true,
    [`weapon_snowball`] = true,
    [`weapon_petrolcan`] = true,
    [`weapon_hazardcan`] = true,
    [`weapon_fireextinguisher`] = true,
    [`weapon_raycarbine`] = true,
    [`weapon_musket`] = true,
    [`weapon_firework`] = true,
    [`weapon_railgun`] = true,
    [`weapon_rayminigun`] = true,
    [`weapon_molotov`] = true,
    [`weapon_stickybomb`] = true,
    [`weapon_proxmine`] = true,
    [`weapon_pipebomb`] = true,
    [`weapon_ball`] = true,
    [`weapon_rpg`] = true
}

Config.NonCasingWeapon = { -- these weapons create 'casings' that aren't casings
    [`weapon_stungun`] = true,
}

Config.NoImpactWeapon = {
    [`weapon_unarmed`] = true,
    [`weapon_snowball`] = true,
    [`weapon_petrolcan`] = true,
    [`weapon_hazardcan`] = true,
    [`weapon_fireextinguisher`] = true,
    [`weapon_grenade`] = true,
    [`weapon_bzgas`] = true,
    [`weapon_molotov`] = true,
    [`weapon_stickybomb`] = true,
    [`weapon_proxmine`] = true,
    [`weapon_pipebomb`] = true,
    [`weapon_ball`] = true,
    [`weapon_smokegrenade`] = true,
    [`weapon_flare`] = true,
    [`weapon_flaregun`] = true,
}

Config.LeftHandEject = {
    [`weapon_mg`] = true,
}

Config.DownEject = {
    [`weapon_flaregun`] = true,
    [`weapon_musket`] = true,
    [`weapon_stungun`] = true,
}

Config.Alerts = { -- you can add custom code here to trigger your alert script
    Active = false, -- set to false if you don't want to use these
    VehicleTheft = function() 
        if math.random(1, 100) > 60 and not alerttimeout then   
            TriggerServerEvent('police:server:policeAlert', "Possible Vehicle Theft In Progress")
        end
        alerttimeout = 10000
        SetTimeout(alerttimeout,function() alerttimeout = false end)
    end,
    Melee = function() 
        if math.random(1, 100) > 50 and not alerttimeout then   
            TriggerServerEvent('police:server:policeAlert', "Fight In Progress")
        end
        alerttimeout = 10000
        SetTimeout(alerttimeout,function() alerttimeout = false end)
    end,
    ExplosiveDevice = function() 
        if math.random(1, 100) > 20 and not alerttimeout then   
            TriggerServerEvent('police:server:policeAlert', "Report of Explosive Device")
        end
        alerttimeout = 10000
        SetTimeout(alerttimeout,function() alerttimeout = false end)
    end,
    IllegalFireworks = function() 
        if math.random(1, 100) > 70 and not alerttimeout then   
            TriggerServerEvent('police:server:policeAlert', "Possible Illegal Fireworks")
        end
        alerttimeout = 10000
        SetTimeout(alerttimeout,function() alerttimeout = false end)
    end,
    DriveBy = function() 
        if math.random(1, 100) > 50 and not alerttimeout then   
            TriggerServerEvent('police:server:policeAlert', "Shots Fired From Vehicle")
        end
        alerttimeout = 10000
        SetTimeout(alerttimeout,function() alerttimeout = false end)
    end,
    ShotsFired = function() 
        if math.random(1, 100) > 50 and not alerttimeout then   
            TriggerServerEvent('police:server:policeAlert', "Shots Fired")
        end
        alerttimeout = 10000
        SetTimeout(alerttimeout,function() alerttimeout = false end)
    end,
}

Config.NoAlertWeapon = {
    [`weapon_snowball`] = true,
    [`weapon_petrolcan`] = true,
    [`weapon_hazardcan`] = true,
    [`weapon_fireextinguisher`] = true,
    [`weapon_ball`] = true,
    [`weapon_flare`] = true,
}

Config.ExplosiveDevice = {
    [`weapon_pipebomb`] = true,
    [`weapon_proxmine`] = true,
    [`weapon_stickybomb`] = true,
    [`weapon_grenade`] = true,
    [`weapon_rpg`] = true,
    [`weapon_grenadelauncher`] = true,
    [`weapon_grenadelauncher_smoke`] = true,
    [`weapon_hominglauncher`] = true,
    [`weapon_compactlauncher`] = true,
    [`weapon_emplauncher`] = true,
}

Config.Colours = {
    ['0'] = "Metallic Black",
    ['1'] = "Metallic Graphite Black",
    ['2'] = "Metallic Black Steel",
    ['3'] = "Metallic Dark Silver",
    ['4'] = "Metallic Silver",
    ['5'] = "Metallic Blue Silver",
    ['6'] = "Metallic Steel Gray",
    ['7'] = "Metallic Shadow Silver",
    ['8'] = "Metallic Stone Silver",
    ['9'] = "Metallic Midnight Silver",
    ['10'] = "Metallic Gun Metal",
    ['11'] = "Metallic Anthracite Grey",
    ['12'] = "Matte Black",
    ['13'] = "Matte Gray",
    ['14'] = "Matte Light Grey",
    ['15'] = "Black",
    ['16'] = "Black Poly",
    ['17'] = "Dark silver",
    ['18'] = "Silver",
    ['19'] = "Gun Metal",
    ['20'] = "Shadow Silver",
    ['21'] = "Worn Black",
    ['22'] = "Worn Graphite",
    ['23'] = "Worn Silver Grey",
    ['24'] = "Worn Silver",
    ['25'] = "Worn Blue Silver",
    ['26'] = "Worn Shadow Silver",
    ['27'] = "Metallic Red",
    ['28'] = "Metallic Torino Red",
    ['29'] = "Metallic Formula Red",
    ['30'] = "Metallic Blaze Red",
    ['31'] = "Metallic Graceful Red",
    ['32'] = "Metallic Garnet Red",
    ['33'] = "Metallic Desert Red",
    ['34'] = "Metallic Cabernet Red",
    ['35'] = "Metallic Candy Red",
    ['36'] = "Metallic Sunrise Orange",
    ['37'] = "Metallic Classic Gold",
    ['38'] = "Metallic Orange",
    ['39'] = "Matte Red",
    ['40'] = "Matte Dark Red",
    ['41'] = "Matte Orange",
    ['42'] = "Matte Yellow",
    ['43'] = "Red",
    ['44'] = "Bright Red",
    ['45'] = "Garnet Red",
    ['46'] = "Worn Red",
    ['47'] = "Worn Golden Red",
    ['48'] = "Worn Dark Red",
    ['49'] = "Metallic Dark Green",
    ['50'] = "Metallic Racing Green",
    ['51'] = "Metallic Sea Green",
    ['52'] = "Metallic Olive Green",
    ['53'] = "Metallic Green",
    ['54'] = "Metallic Gasoline Blue Green",
    ['55'] = "Matte Lime Green",
    ['56'] = "Dark Green",
    ['57'] = "Green",
    ['58'] = "Worn Dark Green",
    ['59'] = "Worn Green",
    ['60'] = "Worn Sea Wash",
    ['61'] = "Metallic Midnight Blue",
    ['62'] = "Metallic Dark Blue",
    ['63'] = "Metallic Saxony Blue",
    ['64'] = "Metallic Blue",
    ['65'] = "Metallic Mariner Blue",
    ['66'] = "Metallic Harbor Blue",
    ['67'] = "Metallic Diamond Blue",
    ['68'] = "Metallic Surf Blue",
    ['69'] = "Metallic Nautical Blue",
    ['70'] = "Metallic Bright Blue",
    ['71'] = "Metallic Purple Blue",
    ['72'] = "Metallic Spinnaker Blue",
    ['73'] = "Metallic Ultra Blue",
    ['74'] = "Metallic Bright Blue",
    ['75'] = "Dark Blue",
    ['76'] = "Midnight Blue",
    ['77'] = "Blue",
    ['78'] = "Sea Foam Blue",
    ['79'] = "Uil Lightning blue",
    ['80'] = "Maui Blue Poly",
    ['81'] = "Bright Blue",
    ['82'] = "Matte Dark Blue",
    ['83'] = "Matte Blue",
    ['84'] = "Matte Midnight Blue",
    ['85'] = "Worn Dark blue",
    ['86'] = "Worn Blue",
    ['87'] = "Worn Light blue",
    ['88'] = "Metallic Taxi Yellow",
    ['89'] = "Metallic Race Yellow",
    ['90'] = "Metallic Bronze",
    ['91'] = "Metallic Yellow Bird",
    ['92'] = "Metallic Lime",
    ['93'] = "Metallic Champagne",
    ['94'] = "Metallic Pueblo Beige",
    ['95'] = "Metallic Dark Ivory",
    ['96'] = "Metallic Choco Brown",
    ['97'] = "Metallic Golden Brown",
    ['98'] = "Metallic Light Brown",
    ['99'] = "Metallic Straw Beige",
    ['100'] = "Metallic Moss Brown",
    ['101'] = "Metallic Biston Brown",
    ['102'] = "Metallic Beechwood",
    ['103'] = "Metallic Dark Beechwood",
    ['104'] = "Metallic Choco Orange",
    ['105'] = "Metallic Beach Sand",
    ['106'] = "Metallic Sun Bleeched Sand",
    ['107'] = "Metallic Cream",
    ['108'] = "Brown",
    ['109'] = "Medium Brown",
    ['110'] = "Light Brown",
    ['111'] = "Metallic White",
    ['112'] = "Metallic Frost White",
    ['113'] = "Worn Honey Beige",
    ['114'] = "Worn Brown",
    ['115'] = "Worn Dark Brown",
    ['116'] = "Worn straw beige",
    ['117'] = "Brushed Steel",
    ['118'] = "Brushed Black Steel",
    ['119'] = "Brushed Aluminium",
    ['120'] = "Chrome",
    ['121'] = "Worn Off White",
    ['122'] = "Off White",
    ['123'] = "Worn Orange",
    ['124'] = "Worn Light Orange",
    ['125'] = "Metallic Securicor Green",
    ['126'] = "Worn Taxi Yellow",
    ['127'] = "Police Car Blue",
    ['128'] = "Matte Green",
    ['129'] = "Matte Brown",
    ['130'] = "Worn Orange",
    ['131'] = "Matte White",
    ['132'] = "Worn White",
    ['133'] = "Worn Olive Army Green",
    ['134'] = "Pure White",
    ['135'] = "Hot Pink",
    ['136'] = "Salmon pink",
    ['137'] = "Metallic Vermillion Pink",
    ['138'] = "Orange",
    ['139'] = "Green",
    ['140'] = "Blue",
    ['141'] = "Mettalic Black Blue",
    ['142'] = "Metallic Black Purple",
    ['143'] = "Metallic Black Red",
    ['144'] = "hunter green",
    ['145'] = "Metallic Purple",
    ['146'] = "Metallic Dark Blue",
    ['147'] = "Black",
    ['148'] = "Matte Purple",
    ['149'] = "Matte Dark Purple",
    ['150'] = "Metallic Lava Red",
    ['151'] = "Matte Forest Green",
    ['152'] = "Matte Olive Drab",
    ['153'] = "Matte Desert Brown",
    ['154'] = "Matte Desert Tan",
    ['155'] = "Matte Foilage Green",
    ['156'] = "Default Alloy Color",
    ['157'] = "Epsilon Blue",
    ['158'] = "Pure Gold",
    ['159'] = "Brushed Gold",
}
