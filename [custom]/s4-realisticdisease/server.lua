if Config.Framework == "ESX" then
    ESX = exports['es_extended']:getSharedObject()

    ESX.RegisterUsableItem(Config.ItemSelfTreatment, function(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getInventoryItem(Config.ItemSelfTreatment).count >= 1 then
            xPlayer.removeInventoryItem(Config.ItemSelfTreatment, 1)
            TriggerClientEvent("s4-realisticdisease:stopBlooding", source)
        end
    end)

else
    QBCore = exports['qb-core']:GetCoreObject()

    QBCore.Functions.CreateUseableItem(Config.ItemSelfTreatment, function(source)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer.Functions.GetItemByName(Config.ItemSelfTreatment) ~= nil then
            xPlayer.Functions.RemoveItem(Config.ItemSelfTreatment, 1)
            TriggerClientEvent("s4-realisticdisease:stopBlooding", source)
        end
    end)
end


Players = {}
 
RegisterNetEvent("s4-realisticdisease:hitPlayer")
AddEventHandler("s4-realisticdisease:hitPlayer", function(t_pid, bone, damage)

    local source = source
    local damage = damage
 
    if not Players[t_pid] then 
        Players[t_pid] = {}
        Players[t_pid].injures = {}
        Players[t_pid].info = {}
        Players[t_pid].hitdate = os.time()
    end 
 
    if not Players[t_pid].injures[bone] then 
        Players[t_pid].injures[bone] = 0
    end

    if not Players[t_pid].info[damage.name] then 
        Players[t_pid].info[damage.name] = {
            name = damage.name,
            label = damage.label,
            bone = bone,
            count = 1
        }
    else 
        Players[t_pid].info[damage.name].count = Players[t_pid].info[damage.name].count + 1
    end

    Players[t_pid].hitdate = os.time()

    -- damage.bone = bone

    -- table.insert(Players[t_pid].info[bone], damage)

    Players[t_pid].injures[bone] = Players[t_pid].injures[bone] + 1

    table.shift(Players[t_pid].injures)
 
 
    TriggerClientEvent("s4-realisticdisease:hitRecieve", t_pid, bone, Players[t_pid])
 
    if Config.DebguMode == true then 
        TriggerClientEvent("s4-realisticdisease:hitRecieve", source, bone, Players[t_pid])
    end

end)
 
AddEventHandler('playerDropped', function(reason)
    local source = source
    Players[source] = nil
    -- table.shift(Players)
end)

RegisterNetEvent("s4-realisticdisease:removeAllInjures")
AddEventHandler("s4-realisticdisease:removeAllInjures", function()
    local source = source
    Players[source] = nil
    -- table.shift(Players)
end)

RegisterNetEvent("s4-realisticdisease:qbrev")
AddEventHandler("s4-realisticdisease:qbrev", function(pid)
    TriggerClientEvent('hospital:client:Revive', pid)
end)

RegisterNetEvent("s4-realisticdisease:brutalrev")
AddEventHandler("s4-realisticdisease:brutalrev", function(pid)
    TriggerClientEvent('brutal_ambulancejob:revive', pid)
end)

RegisterNetEvent("s4-realisticdisease:checkTreatment")
AddEventHandler("s4-realisticdisease:checkTreatment", function(data)
    local source = source
    if data.cacheid == nil then 
        print("s4-realisticdisease:checkTreatment - cacheid is nil")
        return 
    end
    pid = data.cacheid
    if Config.Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getInventoryItem(data.item).count >= 1 then 
            if CheckTreatReqItems(data.item, data.area) then 
                Players[data.cacheid].injures[data.bone] = nil
                Players[data.cacheid].info[data.bone] = nil
                if IsInjuresEmpty(data.cacheid) then 
                    Players[data.cacheid].hitdate = nil
                end
                -- table.shift(Players)
                TriggerClientEvent("s4-realisticdisease:docStatus", source, "success")  
            else 
                TriggerClientEvent("s4-realisticdisease:docStatus", source, "wrong") 
            end
        else
            TriggerClientEvent("s4-realisticdisease:docStatus", source, "no_item") 
        end
        TriggerClientEvent("s4-realisticdisease:updateInjures", source, Players[pid])    
    else
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer.Functions.GetItemByName(data.item) ~= nil then
            if CheckTreatReqItems(data.item, data.area) then 
                Players[data.cacheid].injures[data.bone] = nil
                Players[data.cacheid].info[data.bone] = nil
                if IsInjuresEmpty(data.cacheid) then 
                    Players[data.cacheid].hitdate = nil
                end
                -- table.shift(Players)
                TriggerClientEvent("s4-realisticdisease:docStatus", source, "success")  
            else 
                TriggerClientEvent("s4-realisticdisease:docStatus", source, "wrong") 
            end
        else
            TriggerClientEvent("s4-realisticdisease:docStatus", source, "no_item") 
        end
        TriggerClientEvent("s4-realisticdisease:updateInjures", source, Players[pid])   
    end
 
end)

function IsInjuresEmpty(cacheid)
    return next(Players[cacheid].injures) == nil
end


CheckTreatReqItems = function(item, area)
    x = false
    for k,v in pairs(Config.ItemsForHeal[area]) do
        if item == v then 
            x = true
        end
    end
    return x
end

RegisterNetEvent("s4-realisticdisease:fastTreatPlayer")
AddEventHandler("s4-realisticdisease:fastTreatPlayer", function(pid)
    Players[pid].injures = {}
    TriggerClientEvent("s4-realisticdisease:updateInjures", pid, Players[pid])
end)

RegisterNetEvent("s4-realisticdisease:treatPlayer")
AddEventHandler("s4-realisticdisease:treatPlayer", function(cachedTreat, bool)
    if bool then return end
    local source = source
    if Config.Framework == "ESX" then
        xplayer = ESX.GetPlayerFromId(source)
        for k,v in pairs(Config.Treatment[cachedTreat.clvl]) do
            if xplayer.getInventoryItem(v).count >= 1 then 
                xplayer.removeInventoryItem(v, 1)
            end
        end
    else
        xplayer = QBCore.Functions.GetPlayer(source)
        for k,v in pairs(Config.Treatment[cachedTreat.clvl]) do
            if xplayer.Functions.GetItemByName(v) ~= nil then 
                xplayer.Functions.RemoveItem(v, 1)
            end
        end
    end
    Players[cachedTreat.pid].injures[cachedTreat.v] = nil
    table.shift(Players)
end)

 
if Config.DebguMode == true then 
    RegisterCommand("needitems", function(src) 
        if Config.Framework == "ESX" then 
            local xPlayer = ESX.GetPlayerFromId(src)
            for k,v in pairs(Config.Treatment["Critical"]) do
                if xPlayer.getInventoryItem(v).count < 1 then 
                xPlayer.addInventoryItem(v, 1)
                end
            end
        else 
            local xPlayer = QBCore.Functions.GetPlayer(src)
            for k,v in pairs(Config.Treatment["Critical"]) do
                if xPlayer.Functions.GetItemByName(v) == nil then 
                xPlayer.Functions.AddItem(v, 1)
                end
            end
        end
    end)
end
 
function table.shift(t)
    local first = t[1]
    for i=1, #t-1 do
        t[i] = t[i+1]
    end
    t[#t] = nil
    return first
end
 
if Config.Framework == "ESX" then
    ESX.RegisterServerCallback("s4-realisticdisease:getPlayerInfo", function(source, cb, data)
        local pid = data
        local xPlayer = ESX.GetPlayerFromId(pid)

        if not Players[pid] then 
            Players[pid] = {}
            Players[pid].injures = {}
            Players[pid].info = {}
            Players[pid].name = "Unknown"
        end 

        if Players[pid].name == "Unknown" then 
            Players[pid].name = xPlayer.getName()
            if Config.GetNameFromSQL == true then 
                result = {}
                result = MySQL.Sync.fetchAll("SELECT * FROM `users` WHERE identifier = '"..xPlayer.identifier.."' ")
                Players[pid].name = result[1].firstname.." "..result[1].lastname
            end
        end

        return cb({
            pid = pid,
            name = Players[pid].name,
            injures = Players[pid].injures,
            info = Players[pid].info,
            identifier = xPlayer.identifier,
            hitdate = Players[pid].hitdate
        })
    end)
else
    QBCore.Functions.CreateCallback('s4-realisticdisease:getplayerinfo', function(source, cb, data)
        local pid = data
        local xPlayer = QBCore.Functions.GetPlayer(pid)
       
        if not Players[pid] then 
            Players[pid] = {}
            Players[pid].injures = {}
            Players[pid].info = {}
            Players[pid].name = "Unknown"
        end 

        if Players[pid].name == "Unknown" then 
            Players[pid].name = xPlayer.PlayerData.charinfo.firstname.." "..xPlayer.PlayerData.charinfo.lastname
        end

     
        return cb({
            pid = pid,
            name = Players[pid].name,
            injures = Players[pid].injures,
            info = Players[pid].info,
            identifier = xPlayer.PlayerData.citizenid,
            hitdate = Players[pid].hitdate
        })

        
    end)
end
 


if Config.Framework == "ESX" then
    ESX.RegisterServerCallback("s4-realisticdisease:fastTreatment", function(source, cb, data)
        local source = source
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getMoney() >= Config.FastTreatmentPrice then 
            xPlayer.removeMoney(Config.FastTreatmentPrice)
            return cb(true)
        else
            return cb(false)
        end
    end)
else 
    QBCore.Functions.CreateCallback('s4-realisticdisease:fastTreatment', function(source, cb, data)
        local source = source
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer.Functions.GetMoney('cash') >= Config.FastTreatmentPrice then 
            xPlayer.Functions.RemoveMoney('cash', Config.FastTreatmentPrice)
            return cb(true)
        else
            return cb(false)
        end
    end)
end

if Config.Framework == "ESX" then
    ESX.RegisterServerCallback("s4-realisticdisease:checkItems", function(source, cb, data)
        local xPlayer = ESX.GetPlayerFromId(source)
        local itemlist = {}
        for k,v in pairs(Config.items) do
            local item = xPlayer.getInventoryItem(k)
            if item then
                if item.count >= 1 then 
                    itemlist[item.name] = item
                end
            end
        end
        return cb(itemlist)
    end)
else 
    QBCore.Functions.CreateCallback('s4-realisticdisease:checkItems', function(source, cb, data)
        local xPlayer = QBCore.Functions.GetPlayer(source)
        local itemlist = {}
        for k,v in pairs(Config.items) do
            local item = xPlayer.Functions.GetItemByName(k)
            if item ~= nil then 
                if item.amount >= 1 then 
                     item.count = item.amount
                     itemlist[item.name] = item
                end
            end
        end
        return cb(itemlist)
    end)
     
end


 
-- function checkallplayersjobs()
--     if Config.Framework == "ESX" then 
--         local players = esx.getplayers()  
--         havedoc = false
--         for _, playerid in ipairs(players) do
--             local xplayer = esx.getplayerfromid(playerid)
--             if xplayer.job.name == Config.Job then 
--                 havedoc = true
--             end
--         end
--         return havedoc
--     else 
--         local players = QBCore.Functions.GetPlayers()  
--         havedoc = false
--         for _, playerid in ipairs(players) do
--             local xplayer = QBCore.Functions.GetPlayer(playerid)
--             if xplayer.PlayerData.job.name == Config.Job then 
--                 havedoc = true
--             end
--         end
--         return havedoc
--     end
-- end


