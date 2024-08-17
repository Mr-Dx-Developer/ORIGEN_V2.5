Config = Config or {}

Config.requiredItem = "advancedlockpick" -- required item to start stealing, set it to false if you don't want it
Config.DebugPoly = false -- for debug purpose
Config.policeCall = true -- set to false if you don't want to notify police 
Config.boxDistance = 1.5 -- distance from box
Config.requiredCopsCount = 0 -- required cops count to start stealing
Config.searchTime = 5000 -- searchTime before getting items
Config.cooldownTimer = 1000 * 60 * 60 -- 1000 = 1s // box cooldown

Config.ammuVitrines = { -- vitrines conf every stealable vitrine is an object
    vitrine1 = { -- preferable to set vitrinekey as name
        coords = vector3(20.55, -1105.46, 29.8), -- vitrine coords
        name = "vitrine1",
        target_icon = "fas fa-search-dollar",
        target_label = "ammurobbery.vitine_target_label", -- label is translatble.. you can change it in locales/en.lua
        heading = 250, -- vitrine heading
        length = 1.5, -- box length
        width = 1, -- box width
        looted = false,
        items = { -- items that can be found in vitine
            { -- chance is between 1 and 100, every item has his own chance to get and quantity
                minChance = 1,
                maxChance = 30,
                minQuantity = 1,
                maxQuantity = 1,
                item = "weapon_knife",
            },
            {
                minChance = 31,
                maxChance = 40,
                minQuantity = 1,
                maxQuantity = 1,
                item = "weapon_pistol",
            },
            {
                minChance = 41,
                maxChance = 50,
                minQuantity = 1,
                maxQuantity = 1,
                item = "weapon_pistol50",
            },
        }
    },
    vitrine2 = {
        coords = vector3(22.31, -1106.15, 29.8),
        name = "vitrine2",
        target_icon = "fas fa-search-dollar",
        target_label = "ammurobbery.vitine_target_label",
        heading = 70,
        length = 1.5,
        width = 1,
        looted = false,
        items = {
            {
                minChance = 1,
                maxChance = 30,
                minQuantity = 1,
                maxQuantity = 1,
                item = "weapon_knife",
            },
            {
                minChance = 31,
                maxChance = 40,
                minQuantity = 1,
                maxQuantity = 1,
                item = "weapon_pistol",
            },
            {
                minChance = 41,
                maxChance = 50,
                minQuantity = 1,
                maxQuantity = 1,
                item = "weapon_pistol50",
            },
        }
    },
    vitrine3 = {
        coords = vector3(23.32, -1107.87, 29.8),
        name = "vitrine3",
        target_icon = "fas fa-search-dollar",
        target_label = "ammurobbery.vitine_target_label",
        heading = 340,
        length = 1.5,
        width = 1,
        looted = false,
        items = {
            {
                minChance = 1,
                maxChance = 50,
                minQuantity = 1,
                maxQuantity = 1,
                item = "weapon_knife",
            },
            {
                minChance = 51,
                maxChance = 90,
                minQuantity = 1,
                maxQuantity = 1,
                item = "weapon_pistol",
            },
            {
                minChance = 91,
                maxChance = 100,
                minQuantity = 1,
                maxQuantity = 1,
                item = "weapon_pistol50",
            },
        }
    },
    vitrine4 = {
        coords = vector3(23.15, -1109.43, 29.8),
        name = "vitrine4",
        target_icon = "fas fa-search-dollar",
        target_label = "ammurobbery.vitine_target_label",
        heading = 25,
        length = 1.5,
        width = 1,
        looted = false,
        items = {
            {
                minChance = 1,
                maxChance = 50,
                minQuantity = 1,
                maxQuantity = 1,
                item = "weapon_knife",
            },
            {
                minChance = 51,
                maxChance = 90,
                minQuantity = 1,
                maxQuantity = 1,
                item = "weapon_pistol",
            },
            {
                minChance = 91,
                maxChance = 100,
                minQuantity = 1,
                maxQuantity = 1,
                item = "weapon_pistol50",
            },
        }
    },
    vitrine5 = {
        coords = vector3(17.8, -1109.83, 29.8),
        name = "vitrine5",
        target_icon = "fas fa-search-dollar",
        target_label = "ammurobbery.vitine_target_label",
        heading = 340,
        length = 1.5,
        width = 1,
        looted = false,
        items = {
            {
                minChance = 1,
                maxChance = 50,
                minQuantity = 1,
                maxQuantity = 1,
                item = "weapon_knife",
            },
            {
                minChance = 51,
                maxChance = 90,
                minQuantity = 1,
                maxQuantity = 1,
                item = "weapon_pistol",
            },
            {
                minChance = 91,
                maxChance = 100,
                minQuantity = 1,
                maxQuantity = 1,
                item = "weapon_pistol50",
            },
        }
    },
    vitrine6 = {
        coords = vector3(16.96, -1111.67, 29.8),
        name = "vitrine6",
        target_icon = "fas fa-search-dollar",
        target_label = "ammurobbery.vitine_target_label",
        heading = 340,
        length = 1.5,
        width = 1,
        looted = false,
        items = {
            {
                minChance = 1,
                maxChance = 50,
                minQuantity = 1,
                maxQuantity = 1,
                item = "weapon_knife",
            },
            {
                minChance = 51,
                maxChance = 90,
                minQuantity = 1,
                maxQuantity = 1,
                item = "weapon_pistol",
            },
            {
                minChance = 91,
                maxChance = 100,
                minQuantity = 1,
                maxQuantity = 1,
                item = "weapon_pistol50",
            },
        }
    },
    balas1 = {
        coords = vector3(20.9, -1103.71, 29.8),
        name = "balas1",
        target_icon = "fas fa-shield",
        target_label = "ammurobbery.shelf_target_label",
        heading = 70,
        length = 1.5,
        width = 0.5,
        looted = false,
        items = {
            {
                minChance = 1,
                maxChance = 30,
                minQuantity = 1,
                maxQuantity = 2,
                item = "pistol_ammo",
            },
            {
                minChance = 31,
                maxChance = 50,
                minQuantity = 1,
                maxQuantity = 2,
                item = "smg_ammo",
            },
        }
    },
    balas2 = {
        coords = vector3(24.6, -1105.03, 29.8),
        name = "balas2",
        target_icon = "fas fa-shield",
        target_label = "ammurobbery.shelf_target_label",
        heading = 70,
        length = 1.5,
        width = 0.5,
        looted = false,
        items = {
            {
                minChance = 1,
                maxChance = 30,
                minQuantity = 1,
                maxQuantity = 2,
                item = "pistol_ammo",
            },
            {
                minChance = 31,
                maxChance = 50,
                minQuantity = 1,
                maxQuantity = 2,
                item = "smg_ammo",
            },
        }
    },
    balas3 = {
        coords = vector3(22.8, -1104.42, 29.8),
        name = "balas3",
        target_icon = "fas fa-shield",
        target_label = "ammurobbery.shelf_target_label",
        heading = 70,
        length = 1.5,
        width = 0.5,
        looted = false,
        items = {
            {
                minChance = 1,
                maxChance = 30,
                minQuantity = 1,
                maxQuantity = 2,
                item = "pistol_ammo",
            },
            {
                minChance = 31,
                maxChance = 50,
                minQuantity = 1,
                maxQuantity = 2,
                item = "smg_ammo",
            },
        }
    },
    coletes = {
        coords = vector3(16.36, -1109.5, 29.8),
        name = "coletes",
        target_icon = "fas fa-shield",
        target_label = "ammurobbery.shelf_target_label",
        heading = 340,
        length = 1.5,
        width = 0.5,
        looted = false,
        items = {
            {
                minChance = 1,
                maxChance = 30,
                minQuantity = 1,
                maxQuantity = 1,
                item = "armor",
            },
        }
    }
}
