Framework = nil
Koci = {}
Citizen.CreateThread(function()
    if Config.Framework == "esx" then
        Framework = exports["es_extended"]:getSharedObject()
        Koci.usableItem = Framework.RegisterUsableItem
        Koci.registerCallback = Framework.RegisterServerCallback
    elseif Config.Framework == "oldesx" then
        TriggerEvent("esx:getSharedObject", function(obj) Framework = obj end)
        Koci.registerCallback = Framework.RegisterServerCallback
        Koci.usableItem = Framework.RegisterUsableItem
    elseif Config.Framework == "oldqb" then
        TriggerEvent("QBCore:GetObject", function(obj) Framework = obj end)
        Koci.registerCallback = Framework.Functions.CreateCallback
        Koci.usableItem = Framework.Functions.CreateUsableItem
    elseif Config.Framework == "qbcore" then
        Framework = exports["qb-core"]:GetCoreObject()
        Koci.registerCallback = Framework.Functions.CreateCallback
        Koci.usableItem = Framework.Functions.CreateUsableItem
    else
        for i = 1, 10 do
            print("[ElixirFW] - The selected framework could not be found.")
        end
    end
end)
Koci.getPhrase = function(text)
    return Config.Locales[text] or ("%s - locale not found."):format(text)
end
Koci.getPlayer = function(playerId)
    if Config.Framework == "esx" or Config.Framework == "oldesx" then
        local Player = Framework.GetPlayerFromId(playerId)
        if not Player then
            return nil
        end
        self = {}
        self.getIdentifier = function()
            return Player.identifier
        end
        self.getName = function()
            return Player.getName()
        end
        self.getJob = function()
            return Player.getJob()
        end
        self.showNotification = function(msg)
            return TriggerClientEvent("origen-towtruck:client:notification", playerId, msg)
        end
        self.getItem = function(itemName)
            return Player.getInventoryItem(itemName)
        end
        self.addItem = function(itemName, count)
            return Player.addInventoryItem(itemName, count)
        end

        self.removeItem = function(itemName, count)
            return Player.removeInventoryItem(itemName, count)
        end
        self.getMoney = function(moneyType)
            return Player.getAccount((moneyType or "money")).money
        end
        self.addMoney = function(amount, moneyType)
            return Player.addAccountMoney((moneyType or "money"), amount)
        end
        self.removeMoney = function(amount, moneyType)
            return Player.removeAccountMoney((moneyType or "money"), amount)
        end
        return self
    elseif Config.Framework == "qbcore" or Config.Framework == "oldqb" then
        local Player = Framework.Functions.GetPlayer(playerId)
        if not Player then
            return nil
        end
        self = {}
        self.getIdentifier = function()
            return Framework.Functions.GetIdentifier(playerId, "license")
        end
        self.getName = function()
            return Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
        end
        self.getJob = function()
            return Player.PlayerData.job
        end
        self.showNotification = function(msg)
            return TriggerClientEvent("origen-towtruck:client:notification", playerId, msg)
        end
        self.getItem = function(itemName)
            return Player.Functions.GetItemByName(itemName)
        end
        self.addItem = function(itemName, count)
            return Player.Functions.AddItem(itemName, count)
        end

        self.removeItem = function(itemName, count)
            return Player.Functions.RemoveItem(itemName, count)
        end
        self.getMoney = function(moneyType)
            return Player.PlayerData.money[moneyType or "cash"]
        end
        self.addMoney = function(amount, moneyType)
            return Player.Functions.AddMoney((moneyType or "cash"), amount)
        end
        self.removeMoney = function(amount, moneyType)
            return Player.Functions.RemoveMoney((moneyType or "cash"), amount)
        end
        return self
    end
end
local cooldowns = {}

RegisterCommand(Config.Commands.FlatBed, function(source, args, rawCommand)
    local time = os.time()
    if requests[source] and requests[source].time and requests[source].time + Config.JobOptions.callCooldown > time then
        return TriggerClientEvent("origen-towtruck:client:notification", source, Koci.getPhrase("already-called"))
    end
    if cooldowns[source] and cooldowns[source] + Config.JobOptions.commandCooldown > time then
        return
    end
    cooldowns[source] = time
    requests[source] = { status = false, time = time }
    TriggerClientEvent("origen-towtruck:client:callTowTruck", -1, source, GetEntityCoords(GetPlayerPed(source)))
end)
