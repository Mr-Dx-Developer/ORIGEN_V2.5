Config = {}

Config.Framework = "qbcore"    -- esx - oldesx - qbcore - oldqb
Config.Target = "qb-target" -- ox-target - qb-target -- drawText
Config.UseOxLib = true
Config.Locales = {
    ["interact-npc"] = "[E] - Start Job",
    ["interact-finish-npc"] = "[E] - Finish Job",
    ["not-available-spawnpoint"] = "Vehicle spawn point is full.",
    ["start-job"] = "You have started the job. You can select a suitable job with the \"/towtruck\" command.",
    ["started-new-job"] = "You have started a new job. Go to the target location and see what you can do.",
    ["already-have-job"] = "You already have a job.",
    ["take-hook"] = "Press [E] get the hook",
    ["put-hook"] = "Press [E] put the hook",
    ["drop-hook"] = "Press [H] drop the hook",
    ["retake-hook"] = "Press [E] pick up the hook",
    ["hook-vehicle"] = "Press [E] hook the vehicle",
    ["unhook-vehicle"] = "Press [E] unhook the vehicle",
    ["attach-vehicle"] = "Press [E] attach the hook to the vehicle",
    ["wind-vehicle"] = "Press [H] wind the winch",
    ["broken-vehicle"] = "Broken Vehicle",
    ["finish-blip"] = "Destination",
    ["finish-interaction"] = "Press [H] Deliver the broken vehicle",
    ["no-broken-vehicle"] = "No broken vehicle found",
    ["gave-money"] = "You won %s. (Mil Price: %s, Base Price: %s, Vehicle Class Price: %s, Level Price: %s)",
    ["confirm-call"] = "Tow truck is coming to you for help",
    ["call-header"] = "Tow truck request, dropped on tablet",
    ["get-truck"] = "Start & Stop Job",
    ["warning-command"] = "To access the tablet, you need to get to work.",
    ["already-taken-task"] = "You've already taken this task before.",
    ["already-accept"] = "This call has been answered before!",
    ["already-called"] = "You've already called a tow truck. Wait a moment to call again!",
    ["warning-take-hook"] =
    "Please make sure that the car is directly behind the flatbed, otherwise there may be problems when towing",
    ui = {
        text_app_1 = "Tow Truck App",
        text_search = "Search",
        text_towtruck = "TowTruck",
        text_file = "File",
        text_order = "Order",
        text_image = "Image",
        text_history = "History",
        text_place_marks = "Place Marks",
        text_screen = "Screen",
        text_help = "Help",
        text_total_reputation = "Total Reputation",
        text_level = "Level",
        text_reputation = "Reputation",
        text_towtruck_about = "TowTruck About",
        text_victor_goods = "Victor Goods",
        text_towtruck_description =
        "Reliable and Fast TowTruck Service: Always by your side for your vehicle needs. Stay safe with our professional solutions, continue your journey with confidence.",
        home_text_home = "Home",
        home_text_location = "Location",
        home_text_regards = "Regards",
        home_text_rep = "Rep",
        home_text_gps = "GPS",
        text_money_type = "$",
        rank_text_avatar = "Avatar",
        rank_text_name = "Name",
        rank_text_level = "Level",
        rank_text_exp = "Exp",
        text_person = "Person",
    }
}

Config.JobOptions = {
    vehicleModels = {
        "blista",
        "windsor",
        "oracle",
        "blade",
        "coquette3",
        "hermes",
        "yosemite",
        "bfinjection",
        "blazer",
        "rancherxl",
        "baller",
        "fq2",
        "asea",
        "regina",
        "alpha",
        "buffalo2",
        "elegy2",
        "ninef2",
        "sultan",
        "ardent",
        "btype",
        "adder",
        "infernus",
        "t20",
        "rumpo",
    },
    milPrice = 50,    -- Additional fee per mile
    levelPrice = 120, -- Additional fee per level
    classMultiplier = {
        [0] = 1.0,    -- Compacts
        [1] = 1.0,    -- Sedans
        [2] = 1.2,    -- SUVs
        [3] = 1.0,    -- Coupes
        [4] = 1.0,    -- Muscle
        [5] = 1.0,    -- Sports Classics
        [6] = 1.4,    -- Sports
        [7] = 2.5,    -- Super
        [9] = 1.0,    -- Off-road
        [11] = 1.0,   -- Utility
        [12] = 1.5,   -- Vans
        [18] = 2.0,   -- Emergency
        [19] = 2.0,   -- Military
    },
    finishCoords = vector3(375.6, -1612.12, 29.29),
    maxExp = 500,
    ranks = { 0, 2100, 3800, 6100, 9500, 12500, 16000 },
    commandCooldown = 10, -- tow truck call cooldown (60 = 1 min)
    callCooldown = 300,   -- tow truck call cooldown (60 = 1 min)
    --[[ -> dailyTaskSystem
        If "false", it will restart after all work is finished.
        If "true", it waits for the server to restart after all jobs are finished.
    ]]
    dailyTaskSystem = false --
}

Config.AcceptableJobs = {
    [1] = {
        reward = 400,                                     -- money
        exp = 200,                                        -- exp
        coords = vector4(2395.19, 2867.69, 40.24, 305.84) -- coords
    },
    [2] = {
        reward = 500,
        exp = 210,
        coords = vector4(2941.62, 3782.37, 52.63, 349.07),
    },
    [3] = {
        reward = 550,
        exp = 220,
        coords = vector4(2974.03, 4572.22, 52.46, 182.26),
    },
    [4] = {
        reward = 600,
        exp = 230,
        coords = vector4(1737.28, 6392.59, 35.28, 89.31),
    },
    [5] = {
        reward = 200,
        exp = 240,
        coords = vector4(114.08, 6604.35, 31.94, 221.94),
    },
    [6] = {
        reward = 400,
        exp = 250,
        coords = vector4(-586.68, 5694.48, 37.91, 151.12),
    },
    [7] = {
        reward = 400,
        exp = 240,
        coords = vector4(-2272.5, 4275.96, 45.3, 236.31),
    },
    [8] = {
        reward = 400,
        exp = 230,
        coords = vector4(-2654.81, 2738.06, 16.7, 172.66),
    },
    [9] = {
        reward = 400,
        exp = 220,
        coords = vector4(-3138.2, 1090.85, 20.64, 84.11),
    },
    [10] = {
        reward = 400,
        exp = 210,
        coords = vector4(-1793.07, 763.42, 136.9, 305.44),
    },
    [11] = {
        reward = 400,
        exp = 300,
        coords = vector4(654.32, 769.88, 205.15, 274.21),
    },
    [12] = {
        reward = 400,
        exp = 333,
        coords = vector4(1046.3, 706.34, 158.43, 325.63),
    },
    [13] = {
        reward = 400,
        exp = 500,
        coords = vector4(393.68, -644.36, 28.5, 268.89),
    },
    [14] = {
        reward = 400,
        exp = 450,
        coords = vector4(1355.67, -584.28, 74.21, 35.87),
    },
    [15] = {
        reward = 400,
        exp = 250,
        coords = vector4(874.49, -506.73, 57.5, 228.06),
    },
}

Config.PedOptions = {
    {
        jobName = "none", -- if you want disable set "none"
        model = "s_m_m_autoshop_02",
        coords = vector4(392.74, -1632.67, 29.29, 16.8),
        spawnCoords = {
            vector4(395.15, -1625.97, 29.29, 49.44),
            vector4(397.04, -1623.66, 29.29, 51.29),
        }
    },
}

Config.FlatBed = {
    vehicleModel = "flatbed3",
    blacklistClass = {
        [0] = false,  -- Compacts
        [1] = false,  -- Sedans
        [2] = false,  -- SUVs
        [3] = false,  -- Coupes
        [4] = false,  -- Muscle
        [5] = false,  -- Sports Classics
        [6] = false,  -- Sports
        [7] = false,  -- Super
        [8] = true,   -- Motorcycles
        [9] = false,  -- Off-road
        [10] = true,  -- Industrial
        [11] = false, -- Utility
        [12] = false, -- Vans
        [13] = true,  -- Cycles
        [14] = true,  -- Boats
        [15] = true,  -- Helicopters
        [16] = true,  -- Planes
        [17] = true,  -- Service
        [18] = false, -- Emergency
        [19] = false, -- Military
        [20] = true,  -- Commercial
        [21] = true,  -- Trains
    }
}

Config.Commands = {
    TowTruck = "towtruck",
    FlatBed = "helpflatbed"
}
