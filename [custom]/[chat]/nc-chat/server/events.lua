RegisterServerEvent("chat:init")
RegisterServerEvent("chat:addTemplate")
RegisterServerEvent("chat:addMessage")
RegisterServerEvent("chat:addSuggestion")
RegisterServerEvent("chat:removeSuggestion")
RegisterServerEvent("_chat:messageEntered")
RegisterServerEvent("chat:clear")
RegisterServerEvent("__cfx_internal:commandFallback")

AddEventHandler("playerDropped", function()
    local src = source
    if gMusics[src] then
        gMusics[src] = false
        TriggerClientEvent("nc-chat:DestroyMusic", src, src)
    end
end)

Koci.Server:RegisterServerCallback("nc-chat:getCommands", function(source, data, cb)
    local commandList = {}
    for _, command in ipairs(GetRegisteredCommands()) do
        if IsPlayerAceAllowed(source, ("command.%s"):format(command.name)) then
            table.insert(commandList, {
                name = command.name,
                description = command.description or "..."
            })
        end
    end
    cb(commandList)
end)

Koci.Server:RegisterServerCallback("nc-chat:registerRPText", function(source, data, cb)
    local src = source
    local xPlayer = Koci.Server:GetPlayer(src)

    xPlayer.name = (Koci.FrameworkName == "esx") and xPlayer.name or
        (xPlayer.PlayerData.charinfo.firstname .. " " .. xPlayer.PlayerData.charinfo.lastname)

    local _editedNameData = Koci.Server.Players[src] and Koci.Server.Players[src].editedName or nil
    if _editedNameData and _editedNameData.tag and type(_editedNameData.tag) == "string" then
        xPlayer.name = xPlayer.name .. " " .. _editedNameData.tag
    end
    local _meDoPP = Koci.Server.Players[src] and Koci.Server.Players[src].meDoPP or ""

    if data.haveMask then
        xPlayer.name = "Anonymous"
    end

    for _, player in ipairs(GetPlayers()) do
        if #(GetEntityCoords(GetPlayerPed(src)) - GetEntityCoords(GetPlayerPed(player))) < 10 then
            TriggerClientEvent("nc-chat:registerRPText", player, {
                source = src,
                type = data.type,
                text = data.text,
                meDoPP = _meDoPP,
                message = {
                    type = data.type,
                    color = data.color,
                    borderColor = data.borderColor,
                    header = xPlayer.name,
                    args = { data.text },
                    sourceId = data.sourceId,
                    channel = data.channel,
                },
                timeout = 7000
            })
        end
    end
end)

Koci.Server:RegisterServerCallback("nc-chat:RollTheDice", function(source, data, cb)
    local src = source
    local xPlayer = Koci.Server:GetPlayer(src)

    xPlayer.name = (Koci.FrameworkName == "esx") and xPlayer.name or
        (xPlayer.PlayerData.charinfo.firstname .. " " .. xPlayer.PlayerData.charinfo.lastname)

    local _editedNameData = Koci.Server.Players[src] and Koci.Server.Players[src].editedName or nil
    if _editedNameData and _editedNameData.tag and type(_editedNameData.tag) == "string" then
        xPlayer.name = xPlayer.name .. " " .. _editedNameData.tag
    end

    if data.haveMask then
        xPlayer.name = "Anonymous"
    end

    for _, player in ipairs(GetPlayers()) do
        if #(GetEntityCoords(GetPlayerPed(src)) - GetEntityCoords(GetPlayerPed(player))) < 10 then
            TriggerClientEvent("nc-chat:registerRPText", player, {
                source = src,
                type = "roll-the-dice",
                text = "roll-the-dice",
                diceValue = data.diceValue,
                message = {
                    type = "roll-the-dice",
                    color = nil,
                    borderColor = nil,
                    header = xPlayer.name,
                    args = { "roll-the-dice" },
                    sourceId = src,
                    channel = "local",
                    specialMessage = "roll-the-dice",
                    diceValue = data.diceValue
                },
                timeout = 7000
            })
        end
    end
    cb(true)
end)

Koci.Server:RegisterServerCallback("nc-chat:RPS", function(source, data, cb)
    local src = source
    local xPlayer = Koci.Server:GetPlayer(src)

    xPlayer.name = (Koci.FrameworkName == "esx") and xPlayer.name or
        (xPlayer.PlayerData.charinfo.firstname .. " " .. xPlayer.PlayerData.charinfo.lastname)

    local _editedNameData = Koci.Server.Players[src] and Koci.Server.Players[src].editedName or nil
    if _editedNameData and _editedNameData.tag and type(_editedNameData.tag) == "string" then
        xPlayer.name = xPlayer.name .. " " .. _editedNameData.tag
    end

    if data.haveMask then
        xPlayer.name = "Anonymous"
    end

    for _, player in ipairs(GetPlayers()) do
        if #(GetEntityCoords(GetPlayerPed(src)) - GetEntityCoords(GetPlayerPed(player))) < 10 then
            TriggerClientEvent("nc-chat:registerRPText", player, {
                source = src,
                type = "rps",
                text = "rps",
                rpsValue = data.rpsValue,
                message = {
                    type = "rps",
                    color = nil,
                    borderColor = nil,
                    header = xPlayer.name,
                    args = { "rps" },
                    sourceId = src,
                    channel = "local",
                    specialMessage = "rps",
                    rpsValue = data.rpsValue
                },
                timeout = 7000
            })
        end
    end
    cb(true)
end)

Koci.Server:RegisterServerCallback("nc-chat:showIdentity", function(source, data, cb)
    for _, player in ipairs(GetPlayers()) do
        if #(GetEntityCoords(GetPlayerPed(source)) - GetEntityCoords(GetPlayerPed(player))) < 3 then
            TriggerClientEvent("chat:addMessage", player, {
                type = data.type,
                color = data.color,
                borderColor = data.borderColor,
                header = data.header,
                args = { data.text },
                sourceId = data.sourceId,
                channel = data.channel,
            })
        end
    end
end)

Koci.Server:RegisterServerCallback("nc-chat:sendJobMessages", function(source, data, cb)
    for _, playerId in ipairs(GetPlayers()) do
        local player = Koci.Server:GetPlayer(tonumber(playerId))

        if player then
            if data.job and player.job.name ~= data.job then
                cb(false)
                return
            end
            if data.jobs and not data.jobs[player.job.name] then
                cb(false)
                return
            end
            TriggerClientEvent("chat:addMessage", playerId, {
                type = data.message.type,
                color = data.message.color,
                borderColor = data.message.borderColor,
                header = data.message.header,
                args = { data.message.text },
                sourceId = data.sourceId,
                channel = data.channel,
            })
        end
    end
end)

Koci.Server:RegisterServerCallback("nc-chat:getCharacterInfo", function(source, data, cb)
    local src = source
    local xPlayer = Koci.Server:GetPlayer(src)
    local _PlayerData = {
        job = (Koci.FrameworkName == "esx") and xPlayer.job or xPlayer.PlayerData.job,
        name = (Koci.FrameworkName == "esx") and xPlayer.name or
            (xPlayer.PlayerData.charinfo.firstname .. " " .. xPlayer.PlayerData.charinfo.lastname),
        birth = (Koci.FrameworkName == "esx") and xPlayer.get("dateofbirth") or xPlayer.PlayerData.charinfo.birthdate,
        gender = (Koci.FrameworkName == "esx") and xPlayer.get("sex") or xPlayer.PlayerData.gender,
        accounts = {
            bank = (Koci.FrameworkName == "esx") and xPlayer.getAccount("bank").money or xPlayer.PlayerData.money.bank,
            cash = (Koci.FrameworkName == "esx") and xPlayer.getAccount("money").money or xPlayer.PlayerData.money.cash,
        },
    }
    local _editedNameData = Koci.Server.Players[src] and Koci.Server.Players[src].editedName or nil
    if _editedNameData and _editedNameData.tag and type(_editedNameData.tag) == "string" then
        _PlayerData.name = _PlayerData.name .. " " .. _editedNameData.tag
    end
    cb(_PlayerData)
end)

Koci.Server:RegisterServerCallback("nc-chat:sendWhisperMessage", function(source, data, cb)
    local src = source
    local xPlayer = Koci.Server:GetPlayer(src)
    local targetPlayer = Koci.Server:GetPlayer(tonumber(data.target))

    if xPlayer and targetPlayer then
        xPlayer.name = (Koci.FrameworkName == "esx") and xPlayer.name or
            (xPlayer.PlayerData.charinfo.firstname .. " " .. xPlayer.PlayerData.charinfo.lastname)
        local _editedNameData = Koci.Server.Players[src] and Koci.Server.Players[src].editedName or nil
        if _editedNameData and _editedNameData.tag and type(_editedNameData.tag) == "string" then
            xPlayer.name = xPlayer.name .. " " .. _editedNameData.tag
        end

        if #(GetEntityCoords(GetPlayerPed(src)) - GetEntityCoords(GetPlayerPed(tonumber(data.target)))) < 3 then
            TriggerClientEvent("chat:addMessage", src, {
                type = data.message.type,
                color = data.color,
                borderColor = data.borderColor,
                header = xPlayer.name,
                args = { data.message.text },
                sourceId = data.sourceId,
                channel = data.channel,
            })

            TriggerClientEvent("chat:addMessage", data.target, {
                type = data.message.type,
                color = data.color,
                borderColor = data.borderColor,
                header = xPlayer.name,
                args = { data.message.text },
                sourceId = data.sourceId,
                channel = data.channel,
            })
        end
    else
        TriggerClientEvent("chat:addMessage", src, {
            type = "ERROR",
            color = data.color,
            borderColor = data.borderColor,
            header = "SYSTEM ERROR",
            args = { "An error occured while trying to gather character information!" },
            channel = data.channel,
        })
    end
end)

Koci.Server:RegisterServerCallback("nc-chat:sendMessages", function(source, data, cb)
    local src = source
    local xPlayer = Koci.Server:GetPlayer(src)

    if xPlayer then
        xPlayer.name = (Koci.FrameworkName == "esx") and xPlayer.name or
            (xPlayer.PlayerData.charinfo.firstname .. " " .. xPlayer.PlayerData.charinfo.lastname)
        local _editedNameData = Koci.Server.Players[src] and Koci.Server.Players[src].editedName or nil
        if _editedNameData and _editedNameData.tag and type(_editedNameData.tag) == "string" then
            xPlayer.name = xPlayer.name .. " " .. _editedNameData.tag
        end

        for _, player in ipairs(GetPlayers()) do
            TriggerClientEvent("chat:addMessage", player, {
                type = data.type,
                color = data.color,
                borderColor = data.borderColor,
                header = xPlayer.name,
                args = { data.text },
                sourceId = data.sourceId,
                channel = data.channel,
            })
        end
    end
end)

Koci.Server:RegisterServerCallback("nc-chat:sendYellowPages", function(source, data, cb)
    local src = source
    local xPlayer = Koci.Server:GetPlayer(src)
    local PlayerBankBalance = Koci.FrameworkName == "esx" and xPlayer.getAccount("bank").money or
        xPlayer.PlayerData.money.bank
    if xPlayer then
        xPlayer.name = (Koci.FrameworkName == "esx") and xPlayer.name or
            (xPlayer.PlayerData.charinfo.firstname .. " " .. xPlayer.PlayerData.charinfo.lastname)
        local _editedNameData = Koci.Server.Players[src] and Koci.Server.Players[src].editedName or nil
        if _editedNameData and _editedNameData.tag and type(_editedNameData.tag) == "string" then
            xPlayer.name = xPlayer.name .. " " .. _editedNameData.tag
        end
        if PlayerBankBalance >= Config.YellowPageFee then
            if Koci.FrameworkName == "esx" then
                xPlayer.removeAccountMoney("bank", Config.YellowPageFee)
            elseif Koci.FrameworkName == "qb" then
                xPlayer.Functions.RemoveMoney("cash", Config.YellowPageFee)
            end
            for _, player in ipairs(GetPlayers()) do
                TriggerClientEvent("chat:addMessage", player, {
                    type = data.type,
                    color = data.color,
                    borderColor = data.borderColor,
                    header = xPlayer.name,
                    args = { data.text },
                    sourceId = data.sourceId,
                    channel = data.channel,
                })
            end
        end
    end
end)

Koci.Server:RegisterServerCallback("nc-chat:sendAdminMessages", function(source, data, cb)
    local src = source
    if IsPlayerAceAllowed(src, "command") then
        for _, player in ipairs(GetPlayers()) do
            if IsPlayerAceAllowed(player, "command") then
                TriggerClientEvent("chat:addMessage", player, {
                    type = data.type,
                    color = data.color,
                    borderColor = data.borderColor,
                    header = data.header,
                    args = { data.text },
                    sourceId = data.sourceId,
                    channel = data.channel,
                })
            end
        end
    end
end)

Koci.Server:RegisterServerCallback("nc-chat:sendAdminAnnounce", function(source, data, cb)
    local src = source
    if IsPlayerAceAllowed(src, "command") then
        for _, player in ipairs(GetPlayers()) do
            TriggerClientEvent("chat:addMessage", player, {
                type = data.type,
                color = data.color,
                borderColor = data.borderColor,
                header = data.header,
                args = { data.text },
                sourceId = data.sourceId,
                channel = data.channel,
            })
        end
    end
end)

Koci.Server:RegisterServerCallback("nc-chat:playMusicWithUrl", function(source, data)
    local src = source
    local xPlayer = Koci.Server:GetPlayer(src)
    local data = {
        url = data.url,
        isPaused = false,
        volume = 0.5,
    }
    if xPlayer and data.url then
        if not gMusics[src] then
            gMusics[src] = {}
        else
            data.volume = gMusics[src].volume
        end
        gMusics[src] = data
        TriggerClientEvent("nc-chat:SynchronizeMusics", src, data, src)
    else
        TriggerClientEvent("chat:addMessage", source, {
            type = "ERROR",
            color = Config.TypeColors["error"].color,
            borderColor = Config.TypeColors["error"].background,
            header = "SYSTEM ERROR",
            args = { "An error occured. Music Url !" },
            channel = "server",
        })
    end
end)

Koci.Server:RegisterServerCallback("nc-chat:stopMusic", function(source)
    local src = source
    local xPlayer = Koci.Server:GetPlayer(src)
    if xPlayer then
        if gMusics[src] then
            gMusics[src] = nil
            TriggerClientEvent("nc-chat:DestroyMusic", -1, src)
        end
    end
end)

Koci.Server:RegisterServerCallback("nc-chat:setMusicVolume", function(source, data)
    local src = source
    local xPlayer = Koci.Server:GetPlayer(src)
    if xPlayer then
        if gMusics[src] then
            local volume = data.volume >= 1 and data.volume / 100 or data.volume
            gMusics[src].volume = volume
            TriggerClientEvent("nc-chat:SynchronizeMusics", src, gMusics[src], src)
        end
    end
end)

Koci.Server:RegisterServerCallback("nc-chat:updateNameValue", function(source, data)
    local src = source
    local xPlayer = Koci.Server:GetPlayer(src)
    if xPlayer then
        if Koci.Server.Players[src] then
            Koci.Server.Players[src].editedName = data
        else
            Koci.Server.Players[src] = {
                editedName = data,
                meDoPP = nil
            }
        end
    end
end)

Koci.Server:RegisterServerCallback("nc-chat:updateMeDoPP", function(source, data)
    local src = source
    local xPlayer = Koci.Server:GetPlayer(src)
    if xPlayer then
        if Koci.Server.Players[src] then
            Koci.Server.Players[src].meDoPP = data
        else
            Koci.Server.Players[src] = {
                editedName = nil,
                meDoPP = data
            }
        end
    end
end)

Koci.Server:RegisterServerCallback("nc-chat:sendBalanceInfoMessage", function(source)
    local src = source
    local xPlayer = Koci.Server:GetPlayer(src)
    if xPlayer then
        local PlayerName = (Koci.FrameworkName == "esx") and
            xPlayer.getName() or
            (PlayerData.charinfo.firstname .. " " .. PlayerData.charinfo.lastname)

        local bankBalance = Koci.Server:GetPlayerBalance("bank", xPlayer)
        local moneyBalance = Koci.Server:GetPlayerBalance("cash", xPlayer)

        TriggerClientEvent("nc-chat:BalanceInfoMessage", src, {
            sourceId = src,
            header = PlayerName,
            balance = {
                bank = bankBalance,
                money = moneyBalance
            }
        })
    end
end)

RegisterNetEvent("nc-chat:Server:HandleCallback", function(key, payload)
    local src = source
    if Koci.Callbacks[key] then
        Koci.Callbacks[key](src, payload, function(cb)
            TriggerClientEvent("nc-chat:Client:HandleCallback", src, key, cb)
        end)
    end
end)
