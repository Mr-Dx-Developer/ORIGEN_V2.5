--[[	LIST OF POSSIBLE VEHICLE MODIFIERS   ]]--
-- Using these will change how each vehicle spawns
-- This can be used for making sure the vehicles comes out exactly how you want it to

-- CustomName = "Police Car", this will show a custom override name for your vehicles so you don't need to add them to your vehicles.lua
-- rank = { 2, 4 }, -- This specifes which grades can see it, and only these grades
-- grade = 4, -- This specifies the lowest grade and above that can see the vehicle
-- colors = { 136, 137 }, -- This is the colour index id of the vehicle, Primary and Secondary in that order
-- bulletproof = true, -- This determines if the tyres are bullet proof (don't ask me why, I was asked to add this)
-- livery = 1, -- This sets the livery id of the vehicle, (most mod menus would number them or have them in number order) 0 = stock
-- extras = { 1, 5 }, -- This enables the selected extras on the vehicle
-- performance = "max", this sets the stats to max if available
-- performance = { 2, 3, 3, 2, 4, true }, -- This allows more specific settings for each upgrade level, in order: engine, brakes, suspension, transmission, armour, turbo
-- trunkItems = { }, -- Use this to add items to the trunk of the vehicle when it is spawned

-- ANY VEHICLE, BOATS, POLICE CARS, EMS VEHICLES OR EVEN PLANES CAN BE ADDED.

Config = {
	Debug = false,  -- Enable to use debug features
	Notify = "qb",
	CarDespawn = false, -- Sends the vehicle to hell
	Locations = {
		{ 	zoneEnable = true,
			job = "police",
			garage = {
				spawn = vector4(435.17, -976.05, 25.7, 88.71),
				out = vector4(441.39, -974.68, 25.7, 181.07),
				list = {
					["clrgc8"] = {
						CustomName = "CL Corvette C8",
						livery = 0,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							{ name = "heavyarmor", amount = 2, info = {}, type = "item", slot = 1, },
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},
					["clrgcamaro"] = {
						CustomName = "CL Camaro",
						livery = 0,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							{ name = "heavyarmor", amount = 2, info = {}, type = "item", slot = 1, },
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},
					["clrgtahoe"] = {
						CustomName = "CL Tahoe",
						livery = 0,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							{ name = "heavyarmor", amount = 2, info = {}, type = "item", slot = 1, },
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},["clrgdurango18"] = {
						CustomName = "CL Durango 18",
						livery = 0,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							{ name = "heavyarmor", amount = 2, info = {}, type = "item", slot = 1, },
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},["clrgr1200"] = {
						CustomName = "CL R1200",
						livery = 0,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							{ name = "heavyarmor", amount = 2, info = {}, type = "item", slot = 1, },
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},["clrgtaurus"] = {
						CustomName = "CL Taurus",
						livery = 0,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							{ name = "heavyarmor", amount = 2, info = {}, type = "item", slot = 1, },
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},["polraptor"] = {
						CustomName = "Pol Raptor",
						livery = 0,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							{ name = "heavyarmor", amount = 2, info = {}, type = "item", slot = 1, },
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},
					-- ["polchar"] = {
					-- 	CustomName = "Pol Char 14",
					-- 	livery = 0,
					-- 	extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
					-- 	performance = "max",
					-- 	trunkItems = {
					-- 		{ name = "heavyarmor", amount = 2, info = {}, type = "item", slot = 1, },
					-- 		{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
					-- 		{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
					-- 	},
					-- },["npolchar"] = {
					-- 	CustomName = "Pol Char 18",
					-- 	livery = 0,
					-- 	extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
					-- 	performance = "max",
					-- 	trunkItems = {
					-- 		{ name = "heavyarmor", amount = 2, info = {}, type = "item", slot = 1, },
					-- 		{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
					-- 		{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
					-- 	},
					-- },
					--["poltah"] = {
					-- 	CustomName = "Pol Tahoe",
					-- 	livery = 0,
					-- 	extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
					-- 	performance = "max",
					-- 	trunkItems = {
					-- 		{ name = "heavyarmor", amount = 2, info = {}, type = "item", slot = 1, },
					-- 		{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
					-- 		{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
					-- 	},
					-- },
					-- ["poltaurus"] = {
					-- 	CustomName = "Pol Taurus",
					-- 	livery = 0,
					-- 	extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
					-- 	performance = "max",
					-- 	trunkItems = {
					-- 		{ name = "heavyarmor", amount = 2, info = {}, type = "item", slot = 1, },
					-- 		{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
					-- 		{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
					-- 	},
					-- },
					["polvic"] = {
						CustomName = "Pol Vic",
						livery = 0,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							{ name = "heavyarmor", amount = 2, info = {}, type = "item", slot = 1, },
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},
					-- ["npolvic"] = {
					-- 	CustomName = "Pol Vic",
					-- 	livery = 0,
					-- 	extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
					-- 	performance = "max",
					-- 	trunkItems = {
					-- 		{ name = "heavyarmor", amount = 2, info = {}, type = "item", slot = 1, },
					-- 		{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
					-- 		{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
					-- 	},
					-- },
					["npolvette"] = {
						CustomName = "Pol Corvette C7",
						livery = 0,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							{ name = "heavyarmor", amount = 2, info = {}, type = "item", slot = 1, },
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},["npolstang"] = {
						CustomName = "Pol Mustang",
						livery = 4,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							{ name = "heavyarmor", amount = 2, info = {}, type = "item", slot = 1, },
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},["npolexp"] = {
						CustomName = "Pol Explorer",
						livery = 0,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							{ name = "heavyarmor", amount = 2, info = {}, type = "item", slot = 1, },
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					},["npolchal"] = {
						CustomName = "Pol Challenger",
						livery = 0,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
						trunkItems = {
							{ name = "heavyarmor", amount = 2, info = {}, type = "item", slot = 1, },
							{ name = "empty_evidence_bag", amount = 10, info = {}, type = "item", slot = 2, },
							{ name = "police_stormram", amount = 1, info = {}, type = "item", slot = 3, },
						},
					}
				},
			},
		},
			{    zoneEnable = true, -- disable if you want to hide this temporarily
			job = "police", -- set this to required job grade
			garage = {
				spawn = vector4(447.65, -981.21, 43.69, 93.61),  -- Where the vehicle will spawn
				out = vector4(463.93, -980.53, 43.69, 97.02),  -- Where you select the vehicles from
				list = {  -- The list of cars that will spawn
					["polmav"] = {
						CustomName = "Polmav Super",
						livery = 0,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					}
				},
			},    
		},
		{    zoneEnable = true, -- disable if you want to hide this temporarily
			job = "ambulance", -- set this to required job grade
			garage = {
				spawn = vector4(351.58, -587.45, 74.16, 160.5),  -- Where the vehicle will spawn
				out = vector4(337.3927, -586.7730, 74.1617, 250.08),  -- Where you select the vehicles from
				list = {  -- The list of cars that will spawn
					["emsaw139"] = {
						CustomName = "EMS Airone",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					}
				},
			},
		},
		{    zoneEnable = true, -- disable if you want to hide this temporarily
			job = "ambulance", -- set this to required job grade
			garage = {
				spawn = vector4(332.93, -590.5, 28.8, 339.46),  -- Where the vehicle will spawn
				out = vector4(341.29, -578.74, 28.8, 161.3),  -- Where you select the vehicles from
				list = {  -- The list of cars that will spawn
					["emsc"] = {
						CustomName = "Challenger 14",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["emsnspeedo"] = {
						CustomName = "N-Speedo",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["emst"] = {
						CustomName = "Tahoe",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["emsf"] = {
						CustomName = "Ford Truck",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["emscharger"] = {
						CustomName = "Charger 16",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["emstahoe"] = {
						CustomName = "Tahoe 18",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["emsfpiu"] = {
						CustomName = "Ford Explorer",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					},
					["s500"] = {
						CustomName = "Chief Car",
						livery = 1,
						extras = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
						performance = "max",
					}
				},
			},
		},
	},
}
