function Koci.Client:SendReactMessage(action, data)
    SendNUIMessage({
        action = action,
        data = data
    })
end

function IsDuplicateRPText(source, text)
    for _, rpText in ipairs(RPTexts) do
        if rpText.source == source and rpText.text == text then
            return true
        end
    end
    return false
end

function Koci.Client:TriggerServerCallback(key, payload, func)
    if not func then
        func = function() end
    end
    Koci.Callbacks[key] = func
    TriggerServerEvent("nc-chat:Server:HandleCallback", key, payload)
end

function Koci.Client:GetPlayerData()
    if Koci.FrameworkName == "esx" then
        return Koci.Framework.GetPlayerData()
    elseif Koci.FrameworkName == "qb" then
        return Koci.Framework.Functions.GetPlayerData()
    end
end

function UpdateChatSettings()
    Koci.Client:SendReactMessage("ui:UpdateChatSettings",
        {
            commandList              = CommandList or {},
            defaultSuggestions       = Config.DefaultSuggestions,
            enableEmojiMenu          = Config.EnableEmojiMenu,
            oocMessageWithoutCommand = Config.OOCMessageWithoutCommand,
            hotBarSuggestions        = Config.HotBarSuggestions,
            typeColors               = Config.TypeColors,
            customNameColor          = Config.CustomNameColor,
            customNameTag            = Config.CustomNameTag,
        }
    )
    Koci.Client:SendReactMessage("ui:setLocale", Config.Locales.ui)
    Koci.Client:SendReactMessage("ui:setVisible", true)
end

function onUpdateAnyNameValue()
    Koci.Client:TriggerServerCallback("nc-chat:updateNameValue", Koci.Client.Name)
end

function onUpdateMeDoPP()
    Koci.Client:TriggerServerCallback("nc-chat:updateMeDoPP", Koci.Client.MeDoPP)
end

function UpdateOrAddRPText(source, data)
    for k, v in ipairs(RPTexts) do
        if v.source == source then
            RPTexts[k] = data
            return
        end
    end
    table.insert(RPTexts, data)
end

function checkRpIsDiff(source, text, type, x, y)
    for k, v in ipairs(RPTexts) do
        if v.source == source then
            if v.oldText ~= text or
                v.oldType ~= type or
                v.oldScreenX ~= x or
                v.oldScreenY ~= y
            then
                return true
            end
        end
    end
    return false
end

function StartRpTextsThread()
    if not RPTextThread then
        CreateThread(function()
            RPTextThread = true
            while #RPTexts >= 1 do
                local isDiff = false
                for key, RPText in ipairs(RPTexts) do
                    local _onScreen       = false
                    local playerPed       = PlayerPedId()
                    local targetPed       = GetPlayerPed(GetPlayerFromServerId(RPText.source))
                    local playerPedCoords = GetEntityCoords(playerPed)
                    local targetPedCoords = GetEntityCoords(targetPed)
                    local distance        = Vdist2(playerPedCoords, targetPedCoords)
                    if distance < 25 then
                        local onScreen, screenX, screenY = GetHudScreenPositionFromWorldPosition(
                            targetPedCoords.x + Config.RPCoordsX,
                            targetPedCoords.y + Config.RPCoordsY,
                            targetPedCoords.z + Config.RPCoordsZ
                        )
                        if checkRpIsDiff(RPText.source, RPText.text, string.lower(RPText.type), screenX * 100, screenY * 100) then
                            _onScreen = true
                            Koci.Client:SendReactMessage("ui:Show3DText", {
                                screenX = screenX * 100,
                                screenY = screenY * 100,
                                source = RPText.source,
                                text = RPText.text,
                                type = string.lower(RPText.type),
                                meDoPP = RPText.meDoPP,
                                extra = {
                                    diceValue = RPText.diceValue,
                                    rpsValue = RPText.rpsValue,
                                }
                            })
                            RPTexts[key].oldScreenX = screenX * 100
                            RPTexts[key].oldScreenY = screenY * 100
                            RPTexts[key].oldText = RPText.text
                            RPTexts[key].oldType = RPText.type
                        end
                    else
                        if not _onScreen then
                            Koci.Client:SendReactMessage("ui:Show3DText", {
                                source = RPText.source,
                                remove = true
                            })
                        end
                    end
                end
                Citizen.Wait(1)
            end
            RPTextThread = false
        end)
    end
end

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function Koci.Client:LearnPlayerJob()
    local xPlayer = self:GetPlayerData()
    if xPlayer then
        local source = GetPlayerServerId(PlayerId())
        local jobGradeLabel = ""
        if Koci.FrameworkName == "esx" then
            jobGradeLabel = xPlayer.job.grade_name
        elseif Koci.FrameworkName == "qb" then
            jobGradeLabel = xPlayer.job.grade.name
        end
        xPlayer.name = (Koci.FrameworkName == "esx") and "Hello" or
            (xPlayer.charinfo.firstname .. " " .. xPlayer.charinfo.lastname)
        local text = Config.Locales.game.job_info:format(xPlayer.name, xPlayer.job.label, jobGradeLabel)
        self:SendReactMessage("ui:addMessage", {
            message = {
                type = "JOB",
                sourceId = source,
                channel = "local",
                args = { text },
                specialMessage = "job",
                job = xPlayer.job
            }
        })
    end
end

function Koci.Client:LearnPlayerBalance()
    local xPlayer = self:GetPlayerData()
    if xPlayer then
        self:TriggerServerCallback("nc-chat:sendBalanceInfoMessage")
    end
end

function Koci.Client:RollTheDice()
    local xPlayer = self:GetPlayerData()
    if xPlayer then
        local diceValue = math.random(6)
        loadAnimDict("anim@mp_player_intcelebrationmale@wank")
        TaskPlayAnim(PlayerPedId(),
            "anim@mp_player_intcelebrationmale@wank",
            "wank",
            8.0, 1.0, -1, 49, 0, 0, 0, 0
        )
        Citizen.Wait(1500)
        ClearPedTasks(PlayerPedId())
        self:TriggerServerCallback("nc-chat:RollTheDice", {
            diceValue = diceValue
        })
    end
end

function Koci.Client:RPS()
    local xPlayer = self:GetPlayerData()
    if xPlayer then
        function randomPick()
            local pick = math.random(1, 3)
            if pick == 1 then
                return "rock"
            elseif pick == 2 then
                return "paper"
            else
                return "scissors"
            end
        end

        local rpsValue = randomPick()
        loadAnimDict("anim@mp_player_intcelebrationmale@wank")
        TaskPlayAnim(PlayerPedId(),
            "anim@mp_player_intcelebrationmale@wank",
            "wank",
            8.0, 1.0, -1, 49, 0, 0, 0, 0
        )
        Citizen.Wait(1500)
        ClearPedTasks(PlayerPedId())
        self:TriggerServerCallback("nc-chat:RPS", {
            rpsValue = rpsValue
        })
    end
end
