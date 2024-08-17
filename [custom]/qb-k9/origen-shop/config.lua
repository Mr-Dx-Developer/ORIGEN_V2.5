Config = {}
Config.Core = "qb" -- qb, esx
Config.UseTextUI = true
Config.Shops = {
    {
        name = "Market",
        label = "7/24 Market",
        type = "normal",
        blip = true,
        blipSprite = 59,
        radius = 1.5,
        blipColor = 2,
        blipScale = 0.5,
        categories = {
            [1] = {
                name = "General",
                description = "24/7",
                items = {
                    {name = "water_bottle", label = "Water", perPrice = 150, description = "Drinks"},
                    {name = "sandwich", label = "Sandwich", perPrice = 150, description = "Food"},
                    {name = "snikkel_candy", label = "Snikkel Candy", perPrice = 150, description = "General"},
                    {name = "tosti", label = "Tosti", perPrice = 150, description = "General"},
                    {name = "beer", label = "Beer", perPrice = 150, description = "General"},
                    {name = "cola", label = "Cola", perPrice = 150, description = "General"},
                    {name = "twerks_candy", label = "Twerks Candy", perPrice = 150, description = "General"},
                    {name = "whiskey", label = "Whiskey", perPrice = 150, description = "General"}
                }
            },
        },
        pedHash = 'mp_m_shopkeep_01',
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        coords = {
            {ped = nil, coords = vector4(24.47, -1346.62, 29.5, 271.66)},
            {ped = nil, coords = vector4(-3039.54, 584.38, 7.91, 17.27)},
            {ped = nil, coords = vector4(-3242.97, 1000.01, 12.83, 357.57)},
            {ped = nil, coords = vector4(1728.07, 6415.63, 35.04, 242.95)},
            {ped = nil, coords = vector4(1959.82, 3740.48, 32.34, 301.57)},
            {ped = nil, coords = vector4(549.13, 2670.85, 42.16, 99.39)},
            {ped = nil, coords = vector4(2677.47, 3279.76, 55.24, 335.08)},
            {ped = nil, coords = vector4(2556.66, 380.84, 108.62, 356.67)},
            {ped = nil, coords = vector4(372.66, 326.98, 103.57, 253.73)}
        }
    },
    {
        name = "Market",
        label = "LTD Gasoline",
        type = "normal",
        blip = true,
        blipSprite = 59,
        radius = 1.5,
        blipColor = 2,
        blipScale = 0.5,
        categories = {
            [1] = {
                name = "General",
                description = "24/7",
                items = {
                    {name = "water_bottle", label = "Water", perPrice = 150, description = "Drinks"},
                    {name = "sandwich", label = "Sandwich", perPrice = 150, description = "Food"},
                    {name = "snikkel_candy", label = "Snikkel Candy", perPrice = 150, description = "General"},
                    {name = "tosti", label = "Tosti", perPrice = 150, description = "General"},
                    {name = "beer", label = "Beer", perPrice = 150, description = "General"},
                    {name = "cola", label = "Cola", perPrice = 150, description = "General"},
                    {name = "twerks_candy", label = "Twerks Candy", perPrice = 150, description = "General"},
                    {name = "whiskey", label = "Whiskey", perPrice = 150, description = "General"}
                }
            },
        },
        pedHash = 'mp_m_shopkeep_01',
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        coords = {
            {ped = nil, coords = vector4(-47.02, -1758.23, 29.42, 45.05)},
            {ped = nil, coords = vector4(-706.06, -913.97, 19.22, 88.04)},
            {ped = nil, coords = vector4(-1820.02, 794.03, 138.09, 135.45)},
            {ped = nil, coords = vector4(1164.71, -322.94, 69.21, 101.72)},
            {ped = nil, coords = vector4(1697.87, 4922.96, 42.06, 324.71)}
        }
    },
    {
        name = "Market",
        label = "Rob's Liqour",
        type = "normal",
        blip = true,
        blipSprite = 59,
        radius = 1.5,
        blipColor = 2,
        blipScale = 0.5,
        categories = {
            [1] = {
                name = "General",
                description = "24/7",
                items = {
                    {name = "water_bottle", label = "Water", perPrice = 150, description = "Drinks"},
                    {name = "sandwich", label = "Sandwich", perPrice = 150, description = "Food"},
                    {name = "snikkel_candy", label = "Snikkel Candy", perPrice = 150, description = "General"},
                    {name = "tosti", label = "Tosti", perPrice = 150, description = "General"},
                    {name = "beer", label = "Beer", perPrice = 150, description = "General"},
                    {name = "cola", label = "Cola", perPrice = 150, description = "General"},
                    {name = "twerks_candy", label = "Twerks Candy", perPrice = 150, description = "General"},
                    {name = "whiskey", label = "Whiskey", perPrice = 150, description = "General"}
                }
            },
        },
        pedHash = 'mp_m_shopkeep_01',
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        coords = {
            {ped = nil, coords = vector4(-1221.58, -908.15, 12.33, 35.49)},
            {ped = nil, coords = vector4(-1486.59, -377.68, 40.16, 139.51)},
            {ped = nil, coords = vector4(-2966.39, 391.42, 15.04, 87.48)},
            {ped = nil, coords = vector4(1165.17, 2710.88, 38.16, 179.43)},
            {ped = nil, coords = vector4(1134.2, -982.91, 46.42, 277.24)},
            {ped = nil, coords = vector4(45.68, -1749.04, 29.61, 53.13)},
            {ped = nil, coords = vector4(2747.71, 3472.85, 55.67, 255.08)},
        }
    },
    {
        name = "Job Market",
        label = "LSPD Ammunation",
        type = "job",
        blip = false,
        categories = {
            [1] = {
                name = "General",
                description = "24/7",
                items = {
                    {name = "pistol_ammo", label = "Pistol Ammo", perPrice = 150, description = "PD Items"},
                    {name = "smg_ammo", label = "SMG Ammo", perPrice = 150, description = "PD Items"},
                    {name = "rifle_ammo", label = "Rifle Ammo", perPrice = 150, description = "PD Items"},
                    {name = "taserammo", label = "Taser Ammo", perPrice = 150, description = "PD Items"},
                    {name = "handcuffs", label = "Handcuffs", perPrice = 150, description = "PD Items"},
                    {name = "empty_evidence_bag", label = "Empty Evidence Bag", perPrice = 150, description = "PD Items"},
                    {name = "police_stormram", label = "Storm Arm", perPrice = 150, description = "PD Items"},
                    {name = "armor", label = "Armor", perPrice = 150, description = "PD Items"},
                    {name = "radio", label = "Radio", perPrice = 150, description = "PD Items"},
                    {name = "policespikes", label = "Spikes", perPrice = 150, description = "PD Items"},
                    {name = "gps", label = "GPS", perPrice = 150, description = "PD Items"},
                    {name = "body_cam", label = "Body Cam", perPrice = 150, description = "PD Items"},
                    {name = "ifaks", label = "Ifak", perPrice = 150, description = "PD Items"},
                    {name = "bandage", label = "Bandage", perPrice = 150, description = "PD Items"}
                }
            },
            [2] = {
                name = "Weapon",
                description = "24/7",
                items = {
                    {name = "weapon_stungun", label = "Stun Gun", perPrice = 150, description = "PD Items"},
                    {name = "weapon_glock", label = "Glock", perPrice = 150, description = "PD Items"},
                    {name = "weapon_smg", label = "SMG", perPrice = 150, description = "PD Items"},
                    {name = "weapon_combatpdw", label = "Combat PDW", perPrice = 150, description = "PD Items"},
                    {name = "weapon_m4", label = "M4", perPrice = 150, description = "PD Items"},
                    {name = "weapon_specialcarbine_mk2", label = "ScarL", perPrice = 150, description = "PD Items"},
                    {name = "weapon_nightstick", label = "Nightstick", perPrice = 150, description = "PD Items"},
                    {name = "weapon_flashlight", label = "FlashLight", perPrice = 150, description = "PD Items"},

                }
            },
        },
        pedHash = 'ig_andreas',
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        coords = {
            {ped = nil, coords = vector4(485.56, -995.19, 30.69, 180.13)}
        }
    },
}