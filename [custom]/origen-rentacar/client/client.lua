QBCore = exports["qb-core"]:GetCoreObject()

if AC.NPC["NpcCreate"] then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1)
            SpawnNPC()
            break
        end
    end)
end

SpawnNPC = function()
    CreateThread(function()
        RequestModel(GetHashKey(AC.NPC["NpcHash"]))
        while not HasModelLoaded(GetHashKey(AC.NPC["NpcHash"])) do
            Wait(1)
        end
        CreateNPC()   
    end)
end


CreateNPC = function()
    created_ped = CreatePed(5, GetHashKey(AC.NPC["NpcHash"]), AC.NPC["NpcCoords"]["x"], AC.NPC["NpcCoords"]["y"], AC.NPC["NpcCoords"]["z"]-1, AC.NPC["NpcHeading"], false, true)
    FreezeEntityPosition(created_ped, true)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, 'WORLD_HUMAN_CLIPBOARD', 0, true)
end


RegisterNUICallback('close', function()
    SetNuiFocus(0, 0)
end)

RegisterNUICallback('rent', function(data)
    QBCore.Functions.TriggerCallback('origen-rentacar:rent', function(status)
        if status then
            print("You have enough money!")
            createCar(data)
        else
            print("You don't have enough money!")
        end
    end, data)
end)

function createCar(data)
    local coords = AC.CarSpawnCoords
    local heading = AC.CarSpawnHeading
    local vehicle = GetHashKey(data.carName)

    RequestModel(vehicle)
    while not HasModelLoaded(vehicle) do
        Citizen.Wait(0)
    end

    local vehicleObject = CreateVehicle(vehicle, coords, heading, true, false)

    SetEntityAsMissionEntity(vehicleObject, true, true)
    SetVehicleColours(vehicleObject, 12, 12)
    SetVehicleWindowTint(vehicleObject, 1)
    SetPedIntoVehicle(PlayerPedId(), vehicleObject, -1)
    SetEntityAsNoLongerNeeded(vehicleObject)
    SetModelAsNoLongerNeeded(vehicleName)
    TriggerServerEvent('origen-rentacar:createCar', QBCore.Functions.GetVehicleProperties(vehicleObject), data.carName, GetVehicleNumberPlateText(vehicleObject), data.carDay)
end

local textShown = false
local lastCheck = 0
local interval = 100 -- Adjust the interval as needed

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) -- Yield to prevent hogging the CPU

        local currentTime = GetGameTimer()
        if currentTime - lastCheck > interval then
            lastCheck = currentTime

            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            local textCoords = AC.NPC["NpcCoords"]
            local distance = GetDistanceBetweenCoords(coords, textCoords["x"], textCoords["y"], textCoords["z"], true)

            
            if distance < 21.0 and distance < 2.0 then
                if not textShown then
                    if AC.OrigenTextUI then
                        exports['origen-textui']:drawText('E', 'Car Rental')
                    else
                        exports['qb-core']:DrawText('[E] Car Rental')
                    end
                    textShown = true
                end

                if IsControlPressed(0, 38) then
                    if AC.OrigenTextUI then
                    exports['origen-textui']:drawTextPress()
                    else
                        exports['qb-core']:KeyPressed()
                    end
                    SendNUIMessage({
                        action = "OPEN",
                        data = AC
                    })
                    SetNuiFocus(1, 1)
                end
            else
                if textShown then
                    if AC.OrigenTextUI then
                    exports['origen-textui']:drawTextClose()
                    else
                        exports['qb-core']:HideText()
                    end
                    textShown = false
                end
            end
        end
    end
end)