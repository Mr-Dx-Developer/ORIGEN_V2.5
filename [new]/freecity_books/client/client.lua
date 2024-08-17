ESX, QBCore = nil, nil
local isOpen = false
local tablet = false

Citizen.CreateThread(function()
    if Config.Framework == 'ESX' then
        while ESX == nil do
            TriggerEvent(Config.FrameworkTriggers.main, function(obj) ESX = obj end)
            Citizen.Wait(100)
            PlayerData = ESX.GetPlayerData()
        end
        if ESX ~= nil and PlayerData then
            if Config.spawnMarker then
                createBlip()
            end
            if Config.spawnPed then
                createPed()
            end
            if Config.usePolyZones then
                createPolyZones() -- validar
            end
        end
        RegisterNetEvent(Config.FrameworkTriggers.load)
        AddEventHandler(Config.FrameworkTriggers.load, function(xPlayer)
            PlayerData = xPlayer
        end)
    end

    if Config.Framework == 'QBCORE' then
        while QBCore == nil do
            TriggerEvent(Config.FrameworkTriggers.main, function(obj) QBCore = obj end)
            if QBCore == nil then
                QBCore = exports[Config.FrameworkTriggers.resource_name]:GetCoreObject()
            end
            Citizen.Wait(100)
        end
        PlayerData = QBCore.Functions.GetPlayerData()
        if QBCore ~= nil and PlayerData then
            if Config.spawnMarker then
                createBlip()
            end
            if Config.spawnPed then
                createPed()
            end
            if Config.usePolyZones then
              createPolyZones()
            end
        end
        RegisterNetEvent(Config.FrameworkTriggers.load)
        AddEventHandler(Config.FrameworkTriggers.load, function()
            PlayerData = QBCore.Functions.GetPlayerData()
        end)
    end
end)

RegisterNetEvent('fc_rendermenu:checkmenu')
AddEventHandler('fc_rendermenu:checkmenu', function(item)
	SendNUIMessage ({
		action = "open_"..item,
		menuItem = item,
		pages = Config.Items[item].numberOfPages,
		SetNuiFocus(true, true)
	})
		isOpen = true
		menuEvent()
end)

RegisterNUICallback(
    "close",
    function(data)
        TriggerScreenblurFadeOut(1000)
        SetNuiFocus(false, false)
		isOpen = false
        tablet = false
    end
)

function menuEvent()
    if isOpen and not tablet then
        local playerPed = PlayerPedId()
        tablet = true
        local tabletDict = "missfam4"
        local tabletAnim = "base"
        local tabletProp = `prop_drinkmenu`
        local tabletBone = 36029
        local tabletOffset = vector3(0.07, 0.05, 0.15)
        local coords = GetEntityCoords(playerPed)
        local tabletRot = vector3(360.0, 120.0, 25.20)
            RequestAnimDict(tabletDict)

            while not HasAnimDictLoaded(tabletDict) do
                Citizen.Wait(150)
            end

            RequestModel(tabletProp)

            while not HasModelLoaded(tabletProp) do
                Citizen.Wait(150)
            end

            local tabletObj = CreateObject(tabletProp, coords.x, coords.y, coords.z, true, true, false)
            local tabletBoneIndex = GetPedBoneIndex(playerPed, tabletBone)

            SetCurrentPedWeapon(playerPed, `weapon_unarmed`, true)
            AttachEntityToEntity(tabletObj, playerPed, tabletBoneIndex, tabletOffset.x, tabletOffset.y, tabletOffset.z, tabletRot.x, tabletRot.y, tabletRot.z, true, false, false, false, 2, true)
            SetModelAsNoLongerNeeded(tabletProp)

            while tablet do
                Citizen.Wait(100)
                if not IsEntityPlayingAnim(playerPed, tabletDict, tabletAnim, 3) then
                    TaskPlayAnim(playerPed, tabletDict, tabletAnim, 3.0, 3.0, -1, 49, 0, 0, 0, 0)
                end
            end

            ClearPedSecondaryTask(playerPed)

            Citizen.Wait(450)

            DetachEntity(tabletObj, true, false)
            if DoesEntityExist(tabletObj) then
                DeleteEntity(tabletObj)
            end
    elseif not isOpen and tablet then
        tablet = false
    end
end
