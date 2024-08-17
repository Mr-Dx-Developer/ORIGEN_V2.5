local QBCore = exports['qb-core']:GetCoreObject()
local camPlayers = {}

QBCore.Functions.CreateUseableItem("body_cam", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    --local bcam = ison
    TriggerClientEvent("messy:camtoggle", source)--, item.info.img)
    
end)

RegisterNetEvent('messy:camstatus')
AddEventHandler('messy:camstatus', function(ison)
    local src = source
	if camPlayers[source] == nil then
        camPlayers[source] = true 	
        TriggerClientEvent('QBCore:Notify',src, "Bodycam Turned On", "success")
        TriggerClientEvent("bcam:UpdateWatch",-1, camPlayers)
    else
        camPlayers[source] = not camPlayers[source]
        if camPlayers[source] then
            TriggerClientEvent('QBCore:Notify',src, "Bodycam Turned On", "success")
            TriggerClientEvent("bcam:UpdateWatch",-1,  camPlayers)
        else
            TriggerClientEvent('QBCore:Notify',src, "Bodycam Turned Off", "success")
            TriggerClientEvent("bcam:UpdateWatch",-1,  camPlayers)
        end
    end
end)

exports['qb-core']:AddItem('body_cam', {
    name = 'body_cam',
    label = 'Bodycam',
    weight = 1,
    type = 'item',
    image = 'bcam.png',
    unique = true,
    useable = false,
    shouldClose = false,
    combinable = false,
    description = "It's a bodycam"
})

QBCore.Functions.CreateCallback('bcam:getplayers', function(source, cb, arg)
    cb( QBCore.Functions.GetPlayers() )
end)

QBCore.Functions.CreateCallback('bcam:getplayer', function(source, cb, arg)
    local tped = GetPlayerPed(arg)
    cb({targetped = tped,coords = GetEntityCoords(tped), pednid = NetworkGetNetworkIdFromEntity(tped)})
end)

QBCore.Functions.CreateCallback('bcam:getpopos', function(source, cb)
    local popos = {}
    local players = QBCore.Functions.GetQBPlayers()
    for k, v in pairs(players) do
        --print(QBCore.Debug(v.source))
        if v and v.PlayerData.job.name == "police" then
            popos[#popos+1] = {
                name = v.PlayerData.name,
                fname = v.PlayerData.charinfo.firstname,
                lname = v.PlayerData.charinfo.lastname,
                source = v.PlayerData.source,
                label = v.PlayerData.metadata["callsign"],
                job = v.PlayerData.job.name,
                camon = camPlayers[v.PlayerData.source]
            }
        end
    end
    cb(popos)
end)

RegisterNetEvent('inventory:server:SaveInventory')
AddEventHandler('inventory:server:SaveInventory', function(t,i)
    local src = source
    if camPlayers[src] ~= nil then
        if QBCore.Functions.HasItem(src, "body_cam", 1) then
            
        else
            
            camPlayers[src] = false
        end
      else
        
      end
    	
end)