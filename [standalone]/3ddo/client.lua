-- ElixirFW

local QBCore = exports['qb-core']:GetCoreObject()

local pedDisplaying = {}

function DrawText3D(coords, text)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)
    
    -- Experimental math to scale the text down
    local scale = 200 / (GetGameplayCamFov() * dist)

    -- Format the text rgba()
    SetTextColour(150, 19, 19, 0.8)
    SetTextScale(0.0, 0.5 * scale)
    SetTextFont(0)
    SetTextDropshadow(0, 0, 0, 0, 55)
    SetTextDropShadow()
    SetTextCentre(true)

    -- Diplay the text
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(coords, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()

end

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict( dict )
        Citizen.Wait(5)
    end
end

RegisterCommand('roll', function(source, args)
    local maxSayi = 1
    local randomSayi = 1

    if args[1] ~= nil then
        maxSayi = tonumber(args[1])

        if maxSayi > 90000000 then
            maxSayi = 10000000
        end
        
        randomSayi = math.random(1, maxSayi)
    else
        maxSayi = 6
        randomSayi = math.random(1, maxSayi)
    end

    local text = "Rolled "..randomSayi.."/"..maxSayi

    loadAnimDict("anim@mp_player_intcelebrationmale@wank")
    TaskPlayAnim(PlayerPedId(), "anim@mp_player_intcelebrationmale@wank", "wank", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    Wait(1500)
    ClearPedTasks(PlayerPedId())

    QBCore.Functions.TriggerCallback('3ddo:sex', function(name)
        local name =  '((' .. name.first ..' '..  name.last .. '))'
        TriggerServerEvent('3ddo:shareDisplay', text, name)
    end)
end)

RegisterCommand('do', function(source, args, raw)
    local text = string.sub(raw, 4)
    
    QBCore.Functions.TriggerCallback('3ddo:sex', function(name)
        local name = name.first ..' '..  name.last

        local mask = GetPedDrawableVariation(PlayerPedId(), 1)
        if mask > 0 then
            name = "Anonim"
        end

        name = "DO - "..name
        TriggerServerEvent('3ddo:shareDisplay', text, name)
    end)
end)

function Display(ped, text, name)

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local pedCoords = GetEntityCoords(ped)
    local dist = #(playerCoords - pedCoords)

    if dist <= 250 then
        if dist <= 10 then
            TriggerEvent('chat:addMessage', {
                color = {150, 19, 19, 0.8},
                multiline = true,
                args = {name, text}
            })
        end

        pedDisplaying[ped] = (pedDisplaying[ped] or 1) + 1

        -- Timer
        local display = true

        Citizen.CreateThread(function()
            Wait(7000)
            display = false
        end)

        -- Display
        local offset = pedDisplaying[ped] * 0.1
        while display do
            if HasEntityClearLosToEntity(playerPed, ped, 17) then
                local x, y, z = table.unpack(GetEntityCoords(ped))
                z = z + offset
                DrawText3D(vector3(x, y, z), '* '..text..' *')

            end
            Wait(0)
        end

        pedDisplaying[ped] = pedDisplaying[ped] - 1

    end
end

RegisterNetEvent('3ddo:shareDisplay')
AddEventHandler('3ddo:shareDisplay', function(text, serverId, name)
    local player = GetPlayerFromServerId(serverId)
    if player ~= -1 then
        local ped = GetPlayerPed(player)
        print(name)
        Display(ped, text, name)
    end
end)
-- ElixirFW
