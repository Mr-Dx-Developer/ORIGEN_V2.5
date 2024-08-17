local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('police:server:takeoffmask')
AddEventHandler('police:server:takeoffmask', function(playerId)
    local MaskedPlayer = QBCore.Functions.GetPlayer(playerId)
    TriggerClientEvent("police:client:takeoffmaskc", MaskedPlayer.PlayerData.source)
end)