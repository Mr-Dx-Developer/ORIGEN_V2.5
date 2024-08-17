QBCore = exports["qb-core"]:GetCoreObject()
Framework = nil
PlayerData = {}
Koci = {}
myLevel = 0
myExp = 0
myPhoto = "profile_1"
myCompletedTasks = {}
isTextUIOpen = false
textUIMessages = {}
Citizen.CreateThread(function()
    if Config.Framework == "esx" then
        Framework = exports["es_extended"]:getSharedObject()
        PlayerData = Framework.GetPlayerData()
    elseif Config.Framework == "oldesx" then
        while Framework == nil do
            TriggerEvent("esx:getSharedObject", function(obj) Framework = obj end)
            Citizen.Wait(0)
        end
        PlayerData = Framework.GetPlayerData()
    elseif Config.Framework == "oldqb" then
        while Framework == nil do
            TriggerEvent("QBCore:GetObject", function(obj) Framework = obj end)
            Citizen.Wait(200)
        end
        PlayerData = Framework.Functions.GetPlayerData()
    elseif Config.Framework == "qbcore" then
        Framework = exports["qb-core"]:GetCoreObject()
        PlayerData = Framework.Functions.GetPlayerData()
    else
        for i = 1, 10 do
            print("[ElixirFW] - The selected framework could not be found.")
        end
    end
end)
Koci.addTarget            = function(data)
    if Config.Target == "ox-target" then
        exports.ox_target:addLocalEntity(data.handle, {
            {
                icon = "fa-solid fa-truck-pickup",
                label = Koci.getPhrase("get-truck"),
                groups = data.jobName ~= "none" or nil,
                onSelect = function()
                    toggleJob(data)
                end,
                distance = 2.0
            }
        })
    elseif Config.Target == "qb-target" then
        exports["qb-target"]:AddTargetEntity(data.handle, {
            options = {
                {
                    icon = "fa-solid fa-truck-pickup",
                    label = Koci.getPhrase("get-truck"),
                    job = data.jobName ~= "none" or nil,
                    action = function()
                        toggleJob(data)
                    end,
                },
            },
            distance = 2.0
        })
    end
end
Koci.requestModel         = function(model)
    if HasModelLoaded(model) then
        return
    end
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(10)
    end
end
Koci.requestAnim          = function(animDict)
    if HasAnimDictLoaded(animDict) then
        return
    end
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(10)
    end
end
local oldText             = nil
Koci.showHelpNotification = function(text)
    local msg = text
    if oldText ~= nil and oldText ~= text then
        text = oldText .. "\n" .. msg
    end
    oldText = msg
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

Koci.showNotification     = function(msg)
    if Config.UseOxLib then
        -- return lib.notify({
        --     title = "Notification",
        --     description = msg,
        --     type = "inform"
        -- })
        return QBCore.Functions.Notify(msg, 'success', 4000)
    end
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandThefeedPostTicker(false, 1)
end

local lastTextUpdateTick  = -1
function Koci.showHelpText(text, together)
    if string.lower(Config.Target) == "drawtext" then
        Koci.showHelpNotification(text)
    else
        local updateTick = GetGameTimer()
        local debounceInterval = 1500
        if lastTextUpdateTick == -1 or updateTick - lastTextUpdateTick > debounceInterval then
            lastTextUpdateTick = updateTick
            local isOpen = lib.isTextUIOpen()
            if isOpen and not together then
                oldText = text
                lib.hideTextUI()
                lib.showTextUI(text)
            elseif isOpen and together then
                text = oldText .. " | " .. text
                lib.hideTextUI()
                lib.showTextUI(text)
            elseif not isTextUIOpen then
                oldText = text
                lib.showTextUI(text)
                isTextUIOpen = true
            end
        end
    end
end

RegisterNetEvent("origen-towtruck:client:notification", function(msg)
    Koci.showNotification(msg)
end)
Koci.getPhrase = function(text)
    return Config.Locales[text] or ("%s - locale not found."):format(text)
end
Koci.giveVehicleKey = function(vehicle)
    -- add trigger
    TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
end
Koci.getClearSpawnPoint = function(coords)
    for k, v in pairs(coords) do
        local retval = IsAnyVehicleNearPoint(v.x, v.y, v.z, 1.0)
        if not retval then
            return v
        end
    end
    return false
end
Koci.drawText = function(x, y, z, scale, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextDropshadow(0)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
        local factor = (string.len(text)) / 490
    end
end
Koci.triggerCallback = function(cbName, cb, data)
    if Config.Framework == "esx" or Config.Framework == "oldesx" then
        Framework.TriggerServerCallback(cbName, function(output)
            if cb then cb(output) else return output end
        end, data)
    elseif Config.Framework == "qbcore" or Config.Framework == "oldqb" then
        Framework.Functions.TriggerCallback(cbName, function(output)
            if cb then cb(output) else return output end
        end, data)
    end
end
RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function()
    Wait(1000)
    PlayerData = Framework.GetPlayerData()
    Koci.triggerCallback("origen-towtruck:server:getData", function(data)
        if data then
            myLevel = data.level
            myExp = data.exp
            myPhoto = data.photo
        end
        StartUI()
    end)
end)
RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    Wait(1000)
    PlayerData = Framework.Functions.GetPlayerData()
    Koci.triggerCallback("origen-towtruck:server:getData", function(data)
        if data then
            myLevel = data.level
            myExp = data.exp
            myPhoto = data.photo
        end
        StartUI()
    end)
end)
RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
    PlayerData.job = job
end)
RegisterNetEvent("QBCore:Client:OnJobUpdate")
AddEventHandler("QBCore:Client:OnJobUpdate", function(job)
    PlayerData.job = job
end)
RegisterNetEvent("origen-towtruck:client:updateData", function(data)
    myLevel = data.level
    myExp = data.exp
    myPhoto = data.photo
    myCompletedTasks = data.completedTasks
end)
exports("getCore", function()
    return Koci
end)
