RegisterCommand("police", function(source, args, rawCommand)
    local text = ""

    for _, v in ipairs(args) do
        text = text .. " " .. v
    end

    if text:len() == 0 then
        return
    end

    Koci.Server:TriggerCallback("nc-chat:getCharacterInfo", source, {}, function(character)
        if character then
            if character.job.name == "police" then
                Koci.Server:TriggerCallback("nc-chat:sendJobMessages", source, {
                    job = "police",
                    message = {
                        type = "POLICE",
                        header = "[" .. character.job.name .. "] " .. character.name,
                        color = Config.TypeColors["police"].color,
                        borderColor = Config.TypeColors["police"].background,
                        text = text,
                        sourceId = source,
                        channel = "police",
                    }
                })
            else
                TriggerClientEvent("chat:addMessage", source, {
                    type = "ERROR",
                    color = Config.TypeColors["error"].color,
                    borderColor = Config.TypeColors["error"].background,
                    header = "PERMISSON ERROR",
                    args = { "You don\"t have enough permissions to use this command!" },
                    channel = "server",
                })
            end
        else
            TriggerClientEvent("chat:addMessage", source, {
                type = "ERROR",
                color = Config.TypeColors["error"].color,
                borderColor = Config.TypeColors["error"].background,
                header = "SYSTEM ERROR",
                args = { "An error occured while trying to gather character information!" },
                channel = "server",
            })
        end
    end)
end)

local QBCore = exports['qb-core']:GetCoreObject()
RegisterCommand('clearall', function()
    TriggerClientEvent('chat:clear', -1)
end, "admin")

QBCore.Commands.Add('crypto', 'Check Crypto Balance', {}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    local cryptoamount = Player.PlayerData.money.crypto
    TriggerClientEvent('QBCore:Notify', source, "You Have: " ..cryptoamount.. ' Coins Of Crypto', 'success')
end)

RegisterCommand("ems", function(source, args, rawCommand)
    local text = ""

    for _, v in ipairs(args) do
        text = text .. " " .. v
    end

    if text:len() == 0 then
        return
    end

    Koci.Server:TriggerCallback("nc-chat:getCharacterInfo", source, {}, function(character)
        if character then
            if character.job.name == "ambulance" then
                Koci.Server:TriggerCallback("nc-chat:sendJobMessages", source, {
                    job = "ambulance",
                    message = {
                        type = "EMS",
                        header = "[" .. character.job.name .. "] " .. character.name,
                        color = Config.TypeColors["ems"].color,
                        borderColor = Config.TypeColors["ems"].background,
                        text = text,
                        sourceId = source,
                        channel = "ems",
                    }
                })
            else
                TriggerClientEvent("chat:addMessage", source, {
                    type = "ERROR",
                    color = Config.TypeColors["error"].color,
                    borderColor = Config.TypeColors["error"].background,
                    header = "PERMISSON ERROR",
                    args = { "You don\"t have enough permissions to use this command!" },
                    channel = "server",
                })
            end
        else
            TriggerClientEvent("chat:addMessage", source, {
                type = "ERROR",
                color = Config.TypeColors["error"].color,
                borderColor = Config.TypeColors["error"].background,
                header = "SYSTEM ERROR",
                args = { "An error occured while trying to gather character information!" },
                channel = "local",
            })
        end
    end)
end)

RegisterCommand("grove", function(source, args, rawCommand)
    local text = ""

    for _, v in ipairs(args) do
        text = text .. " " .. v
    end

    if text:len() == 0 then
        return
    end

    Koci.Server:TriggerCallback("nc-chat:getCharacterInfo", source, {}, function(character)
        if character then
            if character.job.name == "grove" then
                Koci.Server:TriggerCallback("nc-chat:sendJobMessages", source, {
                    job = "grove",
                    message = {
                        type = "GROVE",
                        header = "[" .. character.job.name .. "] " .. character.name,
                        color = Config.TypeColors["gang"].color,
                        borderColor = Config.TypeColors["gang"].background,
                        text = text,
                        sourceId = source,
                        channel = "grove",
                    }
                })
            else
                TriggerClientEvent("chat:addMessage", source, {
                    type = "ERROR",
                    color = Config.TypeColors["error"].color,
                    borderColor = Config.TypeColors["error"].background,
                    header = "PERMISSON ERROR",
                    args = { "You don\"t have enough permissions to use this command!" },
                    channel = "server",
                })
            end
        else
            TriggerClientEvent("chat:addMessage", source, {
                type = "ERROR",
                color = Config.TypeColors["error"].color,
                borderColor = Config.TypeColors["error"].background,
                header = "SYSTEM ERROR",
                args = { "An error occured while trying to gather character information!" },
                channel = "server",
            })
        end
    end)
end)

RegisterCommand("adminwhisper", function(source, args, rawCommand)
    local text = ""

    for _, v in ipairs(args) do
        text = text .. " " .. v
    end

    if text:len() == 0 then
        return
    end

    if IsPlayerAceAllowed(source, "command") then
        Koci.Server:TriggerCallback("nc-chat:sendAdminMessages", source,
            {
                type = "ADMIN WHISPER",
                color = Config.TypeColors["whisper"].color,
                borderColor = Config.TypeColors["whisper"].background,
                header = GetPlayerName(source),
                text = text,
                sourceId = source,
                channel = "admin-whisper",
            })
    else
        TriggerClientEvent("chat:addMessage", source, {
            type = "ERROR",
            color = Config.TypeColors["error"].color,
            borderColor = Config.TypeColors["error"].background,
            header = "SYSTEM ERROR",
            args = { "An error occured while trying to gather character information!" },
            channel = "server",
        })
    end
end)

RegisterCommand("announce", function(source, args, rawCommand)
    local text = ""
    for _, v in ipairs(args) do
        text = text .. " " .. v
    end

    if text:len() == 0 then
        return
    end

    if IsPlayerAceAllowed(source, "command") then
        Koci.Server:TriggerCallback("nc-chat:sendAdminAnnounce", source,
            {
                type = "Announcement",
                color = Config.TypeColors["announcement"].color,
                borderColor = Config.TypeColors["announcement"].background,
                header = "ANNOUNCEMENT",
                text = text,
                channel = "announce",
            })
    else
        TriggerClientEvent("chat:addMessage", source, {
            type = "ERROR",
            color = Config.TypeColors["error"].color,
            borderColor = Config.TypeColors["error"].background,
            header = "SYSTEM ERROR",
            args = { "An error occured while trying to gather character information!" },
            channel = "server",
        })
    end
end)

RegisterCommand("ooc", function(source, args, rawCommand)
    local text = ""
    for _, v in ipairs(args) do
        text = text .. " " .. v
    end

    if text:len() == 0 then
        return
    end

    Koci.Server:TriggerCallback("nc-chat:sendMessages", source,
        {
            type = "OOC",
            color = Config.TypeColors["ooc"].color,
            borderColor = Config.TypeColors["ooc"].background,
            text = text,
            sourceId = source,
            channel = "local",
        })
end)

RegisterCommand("tweet", function(source, args, rawCommand)
    local text = ""
    for _, v in ipairs(args) do
        text = text .. " " .. v
    end

    if text:len() == 0 then
        return
    end

    Koci.Server:TriggerCallback("nc-chat:sendMessages", source,
        {
            type = "TWEET",
            color = Config.TypeColors["tweet"].color,
            borderColor = Config.TypeColors["tweet"].background,
            text = text,
            channel = "local",
        })
end)

RegisterCommand("showidentity", function(source, args, rawCommand)
    Koci.Server:TriggerCallback("nc-chat:getCharacterInfo", source, {}, function(character)
        if character then
            Koci.Server:TriggerCallback("nc-chat:showIdentity", source, {
                type = "CHARACTER INFO",
                color = Config.TypeColors["charinfo"].color,
                borderColor = Config.TypeColors["charinfo"].background,
                header = character.name,
                sourceId = source,
                channel = "local",
                text = "Gender: " ..
                    Koci.Server:Capitalize(character.gender) ..
                    "\nDate of birth: " .. character.birth .. "\nJob: " .. character.job.label
            })
        else
            TriggerClientEvent("chat:addMessage", source, {
                type = "ERROR",
                color = "#de4949",
                header = "SYSTEM ERROR",
                args = { "An error occured while trying to gather character information." },
                channel = "server",
            })
        end
    end)
end)

RegisterCommand("yellowpages", function(source, args, rawCommand)
    local text = ""
    for _, v in ipairs(args) do
        text = text .. " " .. v
    end

    if text:len() == 0 then
        return
    end
    Koci.Server:TriggerCallback("nc-chat:sendYellowPages", source,
        {
            type = "YELLOW PAGES",
            color = Config.TypeColors["yellow_pages"].color,
            borderColor = Config.TypeColors["yellow_pages"].background,
            text = text,
            channel = "local",
        })
end)

RegisterCommand("charinfo", function(source)
    Koci.Server:TriggerCallback("nc-chat:getCharacterInfo", source, {}, function(character)
        if character then
            TriggerClientEvent("chat:addMessage", source, {
                type = "CHARACTER INFO",
                color = Config.TypeColors["charinfo"].color,
                borderColor = Config.TypeColors["charinfo"].background,
                header = character.name,
                sourceId = source,
                channel = "local",
                args = {
                    "Name: " .. character.name ..
                    " | " ..
                    "Gender: " ..
                    Koci.Server:Capitalize(character.gender) ..
                    " | " ..
                    "Date of birth: " ..
                    character.birth ..
                    "\nJob: " ..
                    character.job.label ..
                    "\nBank balance: $" .. character.accounts.bank ..
                    "\nCash amount: $" .. character.accounts.cash
                }
            })
        else
            TriggerClientEvent("chat:addMessage", source, {
                type = "ERROR",
                color = "#de4949",
                header = "SYSTEM ERROR",
                args = { "An error occured while trying to gather character information." },
                channel = "server",
            })
        end
    end)
end)

RegisterCommand("whisper", function(source, args, rawCommand)
    local targetId = args[1]
    local text = ""

    for k, v in ipairs(args) do
        if k == 1 then
        else
            text = text .. " " .. v
        end
    end

    if tostring(source) == tostring(targetId) then
        TriggerClientEvent("chat:addMessage", source, {
            type = "ERROR",
            color = "#de4949",
            header = "SYSTEM ERROR",
            args = { "You cannot whipser to yourself!" },
            channel = "server",
        })

        return
    end

    Koci.Server:TriggerCallback("nc-chat:sendWhisperMessage", source,
        {
            target = targetId,
            message = {
                type = "WHISPER",
                color = Config.TypeColors["whisper"].color,
                borderColor = Config.TypeColors["whisper"].background,
                text = text,
                channel = "local",
            }
        })
end)

RegisterCommand("playmusic", function(source, args, rawCommand)
    local url = args[1]
    local text = ""
    for k, v in ipairs(args) do
        text = text .. " " .. v
    end
    text = text:gsub("%s+", " ")
    if #text == 0 then
        return
    end
    if not url or not tostring(url) then
        TriggerClientEvent("chat:addMessage", source, {
            type = "ERROR",
            color = "#de4949",
            header = "Invalid Url",
            args = { "Invalid url !" },
            channel = "server",
        })
        return
    end
    Koci.Server:TriggerCallback("nc-chat:playMusicWithUrl", source,
        {
            url = url,
        }
    )
end)

RegisterCommand("stopmusic", function(source, args, rawCommand)
    Koci.Server:TriggerCallback("nc-chat:stopMusic", source)
end)

RegisterCommand("musicvolume", function(source, args, rawCommand)
    local volume = args[1]
    Koci.Server:TriggerCallback("nc-chat:setMusicVolume", source,
        {
            volume = tonumber(volume) or 1
        }
    )
end)

if Config.DarkChat.active then
    RegisterCommand(Config.DarkChat.command, function(source, args, rawCommand)
        local text = ""
        for _, v in ipairs(args) do
            text = text .. " " .. v
        end
        if text:len() == 0 then
            return
        end
        Koci.Server:TriggerCallback("nc-chat:getCharacterInfo", source, {}, function(character)
            if character then
                if Config.DarkChat.jobs[character.job.name] then
                    Koci.Server:TriggerCallback("nc-chat:sendJobMessages", source, {
                        jobs = Config.DarkChat.jobs,
                        message = {
                            type = "darkchat",
                            header = "[" .. Config.DarkChat.tag .. "] " .. character.name,
                            color = Config.TypeColors["darkchat"].color,
                            borderColor = Config.TypeColors["darkchat"].background,
                            text = text,
                            sourceId = source,
                            channel = "local",
                        }
                    })
                end
            end
        end)
    end)
end

if Config.SendImage.active then
    RegisterCommand(Config.SendImage.command, function(source, args, rawCommand)
        local url = args[1]
        if url and tostring(url) then
            Koci.Server:TriggerCallback("nc-chat:getCharacterInfo", source, {}, function(character)
                if character then
                    for _, player in ipairs(GetPlayers()) do
                        if #(GetEntityCoords(GetPlayerPed(source)) - GetEntityCoords(GetPlayerPed(player))) < 10 then
                            TriggerClientEvent("chat:addMessage", player, {
                                type = "image",
                                color = Config.TypeColors["image"].color,
                                borderColor = Config.TypeColors["image"].background,
                                header = "[" .. Config.SendImage.tag .. "] " .. character.name,
                                args = { url },
                                sourceId = source,
                                channel = "local",
                            })
                        end
                    end
                end
            end)
        end
    end)
end
