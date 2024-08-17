-- ElixirFW

local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('3ddo:shareDisplay')
AddEventHandler('3ddo:shareDisplay', function(text, name)
    TriggerClientEvent('3ddo:shareDisplay', -1, text, source, name)
end)

QBCore.Functions.CreateCallback('3ddo:sex', function(playerId, data) -- super
    local Player = QBCore.Functions.GetPlayer(playerId)
    
    data({
        first = Player.PlayerData.charinfo.firstname,
        last = Player.PlayerData.charinfo.lastname
    })
end)
-- ElixirFW
