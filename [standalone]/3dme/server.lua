-- ElixirFW

local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('3dme:shareDisplay')
AddEventHandler('3dme:shareDisplay', function(text, name)
    TriggerClientEvent('3dme:shareDisplay', -1, text, source, name)
end)

QBCore.Functions.CreateCallback('3dme:sex', function(playerId, data) -- super
    local Player = QBCore.Functions.GetPlayer(playerId)
    
    data(Player.PlayerData.charinfo.firstname, Player.PlayerData.charinfo.lastname)
end)
-- ElixirFW
