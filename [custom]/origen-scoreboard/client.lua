local hasPermission = false
local is_scoreboard_open = false
local is_controls_disabled = false
function DisableControls()
    is_controls_disabled = true
    CreateThread(function()
        while is_controls_disabled do
            DisablePlayerFiring(PlayerId(), true)
            HudWeaponWheelIgnoreSelection()
            DisableControlAction(1, 1, true)
            DisableControlAction(1, 2, true)
            DisableControlAction(1, 3, true)
            DisableControlAction(1, 4, true)
            DisableControlAction(1, 5, true)
            DisableControlAction(1, 6, true)
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 270, true)
            DisableControlAction(1, 271, true)
            DisableControlAction(1, 272, true)
            DisableControlAction(1, 273, true)
            DisableControlAction(1, 290, true)
            DisableControlAction(1, 291, true)
            DisableControlAction(1, 292, true)
            DisableControlAction(1, 293, true)
            DisableControlAction(1, 294, true)
            DisableControlAction(1, 295, true)
            Wait(1)
        end
    end)
end

if Config.EnableIDAboveHead then
    function PlayAnimation(isPlay, animDict, animName, duration)
        if Config.PlayEmote then
            if isPlay then
                RequestAnimDict(animDict)
                while not HasAnimDictLoaded(animDict) do
                    Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
                RemoveAnimDict(animDict)
            else
                StopAnimTask(PlayerPedId(), animDict, animName, 1.0)
            end
        end
    end

    function TextDraw(data)
        local onScreen, _x, _y = World3dToScreen2d(data.coords.x, data.coords.y, data.coords.z)
        if onScreen then
            local camCoords = GetGameplayCamCoords()
            local distance = #(data.coords - camCoords)
            local fov = (1 / GetGameplayCamFov()) * 75
            local scale = (1 / distance) * (4) * fov * (data.fontsize)
            SetTextScale(0.0, scale)
            SetTextFont(data.fontstyle)
            SetTextProportional(true)
            SetTextColour(data.r, data.g, data.b, 255)
            SetTextOutline()
            SetTextEntry("STRING")
            SetTextCentre(true)
            AddTextComponentSubstringPlayerName(data.text)
            DrawText(_x, _y)
        end
    end

    function GetPlayers()
        local players = {}
        local activePlayers = GetActivePlayers()
        for i = 1, #activePlayers do
            local player = activePlayers[i]
            local ped = GetPlayerPed(player)
            if DoesEntityExist(ped) then
                players[#players+1] = player
            end
        end
        return players
    end

    function GetPlayersFromCoords(coords, distance)
        local players = GetPlayers()
        local closePlayers = {}
        coords = coords or GetEntityCoords(PlayerPedId())
        distance = distance or  5.0
        for i = 1, #players do
            local player = players[i]
            local target = GetPlayerPed(player)
            local targetCoords = GetEntityCoords(target)
            local targetdistance = #(targetCoords - vector3(coords.x, coords.y, coords.z))
            if targetdistance <= distance then
                closePlayers[#closePlayers+1] = player
            end
        end
        return closePlayers
    end

    function ShowID()
        local show = true
        CreateThread(function()
            while show do
                local sleep = 100
                if is_scoreboard_open then
                    for _, player in pairs(GetPlayersFromCoords(GetEntityCoords(PlayerPedId()), 10.0)) do
                        sleep = 0
                        local playerId = GetPlayerServerId(player)
                        local playerPed = GetPlayerPed(player)
                        local playerCoords = GetPedBoneCoords(playerPed, 0x796e, 0, 0, 0)
                        if IsEntityVisible(playerPed) then
                            if NetworkIsPlayerTalking(player) then
                                TextDraw({coords = vector3(playerCoords.x, playerCoords.y, playerCoords.z+0.5), fontsize = 0.5, fontstyle = 2, r = 255, g = 0, b = 57, text = playerId})
                            else
                                TextDraw({coords = vector3(playerCoords.x, playerCoords.y, playerCoords.z+0.5), fontsize = 0.5, fontstyle = 2, r = 255, g = 255, b = 255, text = playerId})
                            end
                        end
                    end
                    if Config.PlayEmote then
                        if not IsEntityPlayingAnim(PlayerPedId(), Config.AnimDict, Config.AnimEmote, 3) then
                            PlayAnimation(true, Config.AnimDict, Config.AnimEmote, -1)
                        end
                    end
                else
                    show = false
                end
                Wait(sleep)
            end
        end)
    end
end

function OpenScoreboard(data, count)
    is_scoreboard_open = true
    SetNuiFocus(true, true)
    SetNuiFocusKeepInput(true)
    DisableControls()
    ShowID()
    SendNUIMessage({
        action = 'OPEN_BOARD',
        data = data,
        count = count,
        isadmin = hasPermission,
    })
end

function CloseScoreboard()
    is_scoreboard_open = false
    is_controls_disabled = false
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
    PlayAnimation(false, Config.AnimDict, Config.AnimEmote, -1)
    SendNUIMessage({
        action = 'CLOSE_BOARD'
    })
end

RegisterNUICallback('CloseScoreboard', function(_, cb)
    is_controls_disabled = false
    is_scoreboard_open = false
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
    PlayAnimation(false, Config.AnimDict, Config.AnimEmote, -1)
    cb('ok')
end)

RegisterNetEvent("scoreboard:hasPermission", function(hasPerm)
    hasPermission = hasPerm
end)

AddEventHandler('playerSpawned', function()
    TriggerServerEvent('scoreboard:initiatedata')
    TriggerServerEvent('scoreboard:getPermission')
end)

AddEventHandler('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        TriggerServerEvent('scoreboard:getPermission')
    end
end)

Citizen.CreateThread(function()
    RegisterKeyMapping('+scoreboard', 'Scoreboard', 'keyboard', 'k')
  end)
  

RegisterCommand('+scoreboard', function()
    if is_scoreboard_open and not Config.CloseInstantly then
        CloseScoreboard()
    else
        OpenScoreboard(GlobalState.scoreplayers, GlobalState.onlineplayers)
    end
end, false)

if Config.CloseInstantly then
    RegisterCommand('-scoreboard', function()
        CloseScoreboard()
    end, false)
end