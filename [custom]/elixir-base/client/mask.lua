local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('police:client:takeoffmask')
AddEventHandler('police:client:takeoffmask', function()
    local player, distance = QBCore.Functions.GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        QBCore.Functions.GetPlayerData(function(PlayerData)
            if PlayerData.job.name == "police" or PlayerData.job.name == "bcso" then
                TriggerServerEvent("police:server:takeoffmask", playerId)
            end
        end)
    else
        QBCore.Functions.Notify("No one nearby!", "error")
    end
end)

RegisterNetEvent('police:client:takeoffmaskc')
AddEventHandler('police:client:takeoffmaskc', function()
    local ad = "missheist_agency2ahelmet"
    loadAnimDict(ad)
    RequestAnimDict(dict)
    TaskPlayAnim(PlayerPedId(), ad, "take_off_helmet_stand", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
    Wait(600)
    ClearPedSecondaryTask(PlayerPedId())
    SetPedComponentVariation(PlayerPedId(), 1, 0, 0, 2)
    QBCore.Functions.Notify("Taken your mask off", "error")
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end