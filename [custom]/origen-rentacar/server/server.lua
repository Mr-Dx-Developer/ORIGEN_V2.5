QBCore = exports["qb-core"]:GetCoreObject()
AC = {}
ped = nil

RegisterNetEvent('origen-rentacar:createCar')
AddEventHandler('origen-rentacar:createCar', function(vehicle, model, plate, day)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    local daysToAdd = day 
    local rentFinishDate = os.date('%Y-%m-%d', os.time() + daysToAdd * 24 * 60 * 60)  

    local props = json.encode(prop)

    MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state, rentfinish) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
        xPlayer.PlayerData.license,
        xPlayer.PlayerData.citizenid,
        model, 
        GetHashKey(model),
        props,
        plate,
        0,
        rentFinishDate
    }) 
end)

RegisterNetEvent('origen-rentacar:createPed')
AddEventHandler('origen-rentacar:createPed',function()
    if AC.NPC["NpcCreate"] and ped == nil then 
        ped = CreatePed(4, AC.NPC["NpcHash"], AC.NPC["NpcCoords"]["x"], AC.NPC["NpcCoords"]["y"], AC.NPC["NpcCoords"]["z"], AC.NPC["NpcHeading"], false, true)
        FreezeEntityPosition(ped, true)
        SetPedCanRagdoll(ped, true)
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then 
        -- if ped ~= nil then
        --     DeletePed(ped)
        --     ped = nil
        -- end
        -- TriggerEvent('origen-rentacar:createPed')
        MySQL.Async.execute("DELETE FROM player_vehicles WHERE rentfinish < NOW()", {})
    end
end)

QBCore.Functions.CreateCallback('origen-rentacar:rent', function(source, cb, data)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local price = data.carPrice
    local moneyType = data.paytype == "cash" and 'cash' or 'bank'
    if xPlayer.PlayerData.money[moneyType] >= price then
        xPlayer.Functions.RemoveMoney(moneyType, tonumber(price))
        cb(true)
    else
        cb(false)
    end
end)
