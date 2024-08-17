QBCore = nil
MDTOpen = false

--tablet prop
isVisible = false
tabletObject = nil

theme = nil
sidebar = nil

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    getConfig(function(t, s)
        theme = t
        sidebar = s
    end)
end)

QBCore = exports['qb-core']:GetCoreObject()


RegisterCommand(Config.MDTCommand, function()
  TriggerEvent("mdt:client:OpenMDT")
end, false)

RegisterNetEvent("mdt:client:OpenMDT")
AddEventHandler("mdt:client:OpenMDT", function()
    local pData = QBCore.Functions.GetPlayerData()
    local isPolice = false
    for k,v in pairs(Config.Policejobs) do
        if not isPolice then
            isPolice = string.find(pData.job.name, v)
        end
    end
    local isPoliceAndOnDuty =  isPolice and pData.job.onduty
    local isLawyer = string.find(pData.job.name, Config.LawyerJob)
    if not isPolice and not isLawyer then
        return QBCore.Functions.Notify("This command is for emergency services", "error")
    elseif not isLawyer and not isPoliceAndOnDuty then
        return QBCore.Functions.Notify("You need to be ON Duty", "error")
    elseif isPoliceAndOnDuty or isLawyer then
        local name = pData.charinfo.firstname.." "..pData.charinfo.lastname
        tabletProp(true)
            SendNUIMessage({
                action = "open",
                theme = theme,
                sidebar = sidebar,
                lawyer = isLawyer,
                actOnWarrant = isLawyer and pData.job.grade.level > Config.Judgegrade-1,
                job = { name = name, grade = pData.job.grade.name, level = pData.job.grade.level }
            })
        SetNuiFocus(true, true)
        MDTOpen = true
    end
end)

function tabletProp(open)
    local playerPed = PlayerPedId()
    if not isVisible and open then
        local dict = "amb@world_human_seat_wall_tablet@female@base"
        RequestAnimDict(dict)
        if tabletObject == nil then
            tabletObject = CreateObject(GetHashKey('prop_cs_tablet'), GetEntityCoords(playerPed), 1, 1, 1)
            AttachEntityToEntity(tabletObject, playerPed, GetPedBoneIndex(playerPed, 28422), 0.0, 0.0, 0.03, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
        end
        while not HasAnimDictLoaded(dict) do Citizen.Wait(100) end
        if not IsEntityPlayingAnim(playerPed, dict, 'base', 3) then
            TaskPlayAnim(playerPed, dict, "base", 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
        end
    elseif not open then
        DeleteEntity(tabletObject)
        ClearPedTasks(playerPed)
        tabletObject = nil
    end
end

function getConfig(cb)
    QBCore.Functions.TriggerCallback('mdt:server:GetConfig', function(theme, sidebar)
        cb(theme, sidebar)
    end)
end