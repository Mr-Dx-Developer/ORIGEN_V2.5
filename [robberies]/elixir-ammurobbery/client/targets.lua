local QBCore = exports['qb-core']:GetCoreObject()

local ped = PlayerPedId()
Citizen.CreateThread(function ()
    -- if IsPedArmed(ped, 4) then
    for vitrineKey, vitrine in pairs(Config.ammuVitrines) do
        exports['qb-target']:AddBoxZone(vitrine.name, vitrine.coords, vitrine.length, vitrine.width, {
            name = vitrine.name,
            heading = vitrine.heading,
            debugPoly = Config.DebugPoly,
        }, {
            options = {
                {
                    type = "client",
                    action = function(entity)
                        if IsPedAPlayer(entity) then return false end
                        TriggerEvent("mt-ammurobbery:client:startStealing", vitrineKey, entity)
                    end,
                    canInteract = function(entity, distance, data)      
                        if IsPedArmed(ped, 4) then return true end
                        return false
                    end,
                    icon = vitrine.target_icon,
                    label = Lang:t(vitrine.target_label)
                },
            },
            distance = Config.boxDistance
        })
    end
    -- end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= 'ammurobbery') then
      return
    end
    for vitrineKey, vitrine in pairs(Config.ammuVitrines) do
    exports['qb-target']:RemoveZone('vitrine.name')
    print('The resource ' .. resourceName .. ' was stopped and all targets were removed.')
    end
end)