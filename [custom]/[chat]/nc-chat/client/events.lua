RegisterNetEvent('chat:addMode')
RegisterNetEvent('chat:removeMode')
RegisterNetEvent('chat:removeSuggestion')
RegisterNetEvent('__cfx_internal:serverPrint')
RegisterNetEvent('_chat:messageEntered')

RegisterNetEvent("chat:show")
AddEventHandler("chat:show", function()
    Koci.Client:SendReactMessage("ui:showChat")
    SetNuiFocus(true, true)
end)

RegisterNetEvent("chat:hide")
AddEventHandler("chat:hide", function()
    Koci.Client:SendReactMessage("ui:hideChat")
    SetNuiFocus(false, false)
end)

RegisterNetEvent("chat:addMessage")
AddEventHandler("chat:addMessage", function(data)
    Koci.Client:SendReactMessage("ui:addMessage", {
        message = data
    })
end)

RegisterNetEvent("chat:addSuggestion")
AddEventHandler("chat:addSuggestion", function(command, help, params)
    Koci.Client:SendReactMessage("ui:addSuggestion", {
        command     = string.gsub(command, "/", ""),
        description = help,
        args        = params
    })
end)

RegisterNetEvent("chat:addSuggestions")
AddEventHandler("chat:addSuggestions", function(suggestions)
    for k, v in ipairs(suggestions) do
        Koci.Client:SendReactMessage("ui:addSuggestion", {
            command     = string.gsub(v.name, "/", ""),
            description = v.help,
            args        = v.params
        })
    end
end)

RegisterNetEvent("chat:clear")
AddEventHandler("chat:clear", function(data)
    Koci.Client:SendReactMessage("ui:clear")
end)

RegisterCommand('clear', function()
    TriggerEvent("chat:clear")
end)

AddEventHandler('__cfx_internal:serverPrint', function(msg)
    Koci.Client:SendReactMessage("ui:addMessage", {
        message = {
            templateId = 'print',
            multiline = true,
            args = { msg },
            mode = '_global'
        }
    })
end)

RegisterNetEvent("nc-chat:registerRPText")
AddEventHandler("nc-chat:registerRPText", function(data)
    TriggerEvent("chat:addMessage", data.message)
    UpdateOrAddRPText(data.source, data)
    StartRpTextsThread()
    Citizen.Wait(data.timeout)
    for k, v in ipairs(RPTexts) do
        if v.source == data.source and v.type == data.type and v.text == data.text then
            table.remove(RPTexts, k)
            Koci.Client:SendReactMessage("ui:Show3DText", {
                source = v.source,
                remove = true
            })
            break
        end
    end
end)

RegisterNetEvent("nc-chat:SynchronizeMusics", function(data, src)
    gMusics[src] = data
    if src == GetPlayerServerId(PlayerId()) then
        Koci.Client:SendReactMessage("ui:setSongInfo",
            {
                url = data.url
            }
        )
    end
end)

RegisterNetEvent("nc-chat:DestroyMusic", function(src)
    gMusics[src] = nil
    if xSound:soundExists("chat-music-" .. src) then
        xSound:Destroy("chat-music-" .. src)
        if src == GetPlayerServerId(PlayerId()) then
            Koci.Client:SendReactMessage("ui:setSongInfo",
                {
                    off = true
                }
            )
        end
    end
end)

RegisterNetEvent("nc-chat:BalanceInfoMessage", function(data)
    Koci.Client:SendReactMessage("ui:addMessage", {
        message = {
            sourceId = data.sourceId,
            header = data.header,
            balance = data.balance,
            type = "BALANCE",
            specialMessage = "balance",
            args = { "Bank Balance" },
        }
    })
end)

RegisterNetEvent("nc-chat:Client:HandleCallback", function(key, data)
    if Koci.Callbacks[key] then
        Koci.Callbacks[key](data)
        Koci.Callbacks[key] = nil
    end
end)

AddEventHandler("onResourceStart", function(resource)
    if resource == GetCurrentResourceName() then
        Wait(1000)
        UpdateChatSettings()
    end
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    Wait(1000)
    UpdateChatSettings()
end)

RegisterNetEvent("esx:playerLoaded", function()
    Wait(1000)
    UpdateChatSettings()
end)
