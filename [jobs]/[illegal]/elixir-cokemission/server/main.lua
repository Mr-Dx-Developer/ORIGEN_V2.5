-- ElixirFW

local QBCore = exports['qb-core']:GetCoreObject()

local Cooldown = false
local Cooldown2 = false
local packagerecieved = false
players = {}
entities = {}

-- Usable Item

QBCore.Functions.CreateUseableItem('coke_brick', function(source) 
	TriggerClientEvent('elixir-cokemission:client:checkcoke', source) 
end) 

-- Syncing Server Side Events

RegisterNetEvent('sd-blackout:server:blackoutsync', function()
    TriggerClientEvent('sd-blackout:client:blackoutsync', -1)
end)

RegisterNetEvent('sd-blackout:server:interactionsync', function()
    TriggerClientEvent('sd-blackout:client:interactionsync', -1)
end)

RegisterNetEvent('sd-blackout:server:lightsoff', function()
    TriggerClientEvent('sd-blackout:client:lightsoff', -1)
end)

-- Breaking down Coke

RegisterServerEvent('coke:breakdownCoke', function()
    local src = source
    local ply = QBCore.Functions.GetPlayer(source)

	ply.Functions.RemoveItem(Config.CokeMainItem, 1)

    ply.Functions.AddItem(Config.CokeBaggyItem, Config.CokeAmount, false) --Edit this line so it suits your economy.
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cokebaggy"], 'add')
end)

-- Package Unboxing

RegisterServerEvent('coke:processCoke', function()
    local src = source
    local ply = QBCore.Functions.GetPlayer(source)

	ply.Functions.RemoveItem('sealedpackage', 1)

    TriggerClientEvent('QBCore:Notify', src, "Please wait while processing a package..", "error", 2500)
    TriggerClientEvent('elixir-cokemission:client:removetarget2', src)

	Wait(15000) --15 sn
	TriggerClientEvent('elixir-cokemission:now-can-collect-package', ply.PlayerData.source)
end)

-- Packaging Reward

RegisterServerEvent("elixir-cokemission:server:packagereward", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not packagerecieved then
        packagerecieved = false

        Player.Functions.AddItem(Config.CokeMainItem, 3, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["coke_brick"], 'add')
		TriggerClientEvent('QBCore:Notify', src, "Please!", "success", 2500)

		TriggerClientEvent('elixir-cokemission:client:removetarget', src)

    else
        TriggerClientEvent('QBCore:Notify', src, "Error!", "error", 2500)
    end
end)	

-- Starting Cooldown

RegisterServerEvent('elixir-cokemission:server:startr', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player.PlayerData.money['cash'] >= Config.RunCost then
		Player.Functions.RemoveMoney('cash', Config.RunCost)
        TriggerEvent('elixir-cokemission:server:coolout')
        TriggerClientEvent("elixir-cokemission:server:runactivate", src)
        TriggerClientEvent("elixir-cokemission:client:boatactivate", src)
        TriggerClientEvent('elixir-cokemission:client:signoff', src)
        TriggerClientEvent('elixir-cokemission:client:targetexport', src)
        TriggerClientEvent('elixir-cokemission:client:email', src)
        TriggerClientEvent('elixir-cokemission:client:information', src)

        TriggerClientEvent('QBCore:Notify', source, 'No return!', 'error')
	else
        TriggerClientEvent('QBCore:Notify', source, "You have not enough money", 'error')
	end
end)

RegisterServerEvent('sd-blackout:server:startr', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)

        TriggerEvent('sd-blackout:server:coolout')
	end)

-- Minimum Cop Callback

QBCore.Functions.CreateCallback('sd-blackout:server:getCops', function(source, cb)
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for _, Player in pairs(players) do
        if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)

QBCore.Functions.CreateCallback('elixir-cokemission:server:getCops', function(source, cb)
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for _, Player in pairs(players) do
        if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)

-- Particles 

RegisterNetEvent('elixir-cokemission:particles', function(method)
	TriggerClientEvent('elixir-cokemission:ptfxparticle', -1, method)
end)

RegisterNetEvent('elixir-cokemission:particles2', function(method)
	TriggerClientEvent('elixir-cokemission:ptfxparticle2', -1, method)
end)

RegisterNetEvent('elixir-cokemission:particles3', function(method)
	TriggerClientEvent('elixir-cokemission:ptfxparticle3', -1, method)
end)

-- Selling Packages

RegisterNetEvent("elixir-cokemission:SellPackages", function()
	local src = source;
	local Player = QBCore.Functions.GetPlayer(src);
	local price = 0;
	
	for k, v in next, Player.PlayerData.items do
		for i=1, #Config.SellInfo do
			local data = Config.SellInfo[i];
			if data.item == v.name then
				price = price + (data.price * v.amount);
				Player.Functions.RemoveItem(v.name, v.amount, k);
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[v.name], 'remove')
				break
			end
		end
	end

    Player.Functions.AddMoney("cash", price);
    TriggerClientEvent('elixir-cokemission:client:removetarget3', src)
	TriggerClientEvent('QBCore:Notify', source, 'You sold your packages.', 'success')
end) 

-- Ped Cooldown

RegisterServerEvent('elixir-cokemission:server:coolout', function()
    Cooldown2 = true
    local timer = Config.PedCooldown * 1000
    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
            print('cooldown finished')
			TriggerClientEvent('elixir-cokemission:client:endRun', -1)
            Cooldown2 = false
        end
    end
end)

QBCore.Functions.CreateCallback("elixir-cokemission:server:coolc",function(source, cb)
    if Cooldown2 then
        cb(true)
    else
        cb(false) 
    end
end)

-- Blackout Cooldown

RegisterServerEvent('sd-blackout:server:coolout', function()
    Cooldown = true
    print('cooldown started')
    local timer = Config.BlackoutRestoration * 60000
    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
            print('cooldown finished')
            TriggerClientEvent('sd-blackout:client:lightson', -1)
            Cooldown = false
        end
    end
end)

QBCore.Functions.CreateCallback("sd-blackout:server:coolc",function(source, cb)
    if Cooldown then
        cb(true)
    else
        cb(false) 
    end
end)
