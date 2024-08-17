if Config.ESX.enabled then
    ESX = nil

    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
elseif Config.QB.enabled then
    QBdata = {}

    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
        QBdata = exports['qb-core']:GetCoreObject().Functions.GetPlayerData() 
    end)

    RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
        QBdata.job = JobInfo
    end)
end

function verifyJobPlayer()
    if Config.ESX.enabled then
        local ESXdata = ESX.GetPlayerData()
        for i = 1, #Config.ESX.jobs do
            if ESXdata.job ~= nil then
                if ESXdata.job.name == Config.ESX.jobs[i] then
                    return true
                end
            end
        end
    elseif Config.QB.enabled then
        for i = 1, #Config.QB.jobs do
            if QBdata.job and QBdata.job.name == Config.QB.jobs[i] then
                return true
            end
        end
    else
        return true
    end

    return false
end

if Config.CommandEnabled then
    RegisterCommand(Config.GrabCommand, function(_, args)
        if verifyJobPlayer() then
            fGrab(true)
        end
    end)

    RegisterCommand(Config.PutCarCommand, function(_, args)
        if verifyJobPlayer() then
            fPutCar(true)
        end
    end)

    RegisterCommand(Config.ExitCarCommand, function(_, args)
        if verifyJobPlayer() then
            fExitCar(true)
        end
    end)
else
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(5)
            if jobPlayer and pedInFront ~= 0 or grab ~= nil then
                if IsControlJustPressed(1, Config.Keys.GrabAndDropKey) then
                    fGrab()
                end
            end
        end
    end)
end

function Hint(message)
    SetTextComponentFormat("STRING")
    AddTextComponentString(message)
    DisplayHelpTextFromStringLabel(0, 0, 0, -1)
end