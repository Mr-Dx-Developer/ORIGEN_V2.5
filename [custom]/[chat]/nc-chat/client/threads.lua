Citizen.CreateThread(function()
    while not CommandList do
        Koci.Client:TriggerServerCallback("nc-chat:getCommands", {}, function(commands)
            CommandList = commands
            for _, command in ipairs(GetRegisteredCommands()) do
                if IsAceAllowed(("command.%s"):format(command.name)) and command.name ~= "toggleChat" then
                    table.insert(CommandList, {
                        name = command.name,
                        description = command.description or "..."
                    })
                end
            end
        end)
        Citizen.Wait(250)
    end
end)

CreateThread(function()
    while true do
        for src, data in pairs(gMusics) do
            if data then
                local player = GetPlayerFromServerId(src)
                if player ~= -1 then
                    local ped = GetPlayerPed(player)
                    local vehicle = GetVehiclePedIsIn(ped)
                    if not xSound:soundExists("chat-music-" .. src) then
                        xSound:PlayUrlPos("chat-music-" .. src, data.url, data.volume, GetEntityCoords(ped))
                        xSound:setVolumeMax("chat-music-" .. src, 1.0)
                    else
                        local url = xSound:getLink("chat-music-" .. src)
                        if url ~= data.url then
                            xSound:Destroy("chat-music-" .. src)
                            xSound:PlayUrlPos("chat-music-" .. src, data.url, data.volume, GetEntityCoords(ped))
                            xSound:setVolumeMax("chat-music-" .. src, 1.0)
                            if xSound:isPaused("chat-music-" .. src) then
                                xSound:Resume("chat-music-" .. src)
                            end
                        end
                        xSound:setVolume("chat-music-" .. src, data.volume)
                        xSound:Position("chat-music-" .. src, GetEntityCoords(ped))
                        if data.isPaused then
                            xSound:Pause("chat-music-" .. src)
                        elseif not data.isPaused then
                            xSound:Resume("chat-music-" .. src)
                        end
                        xSound:Distance("chat-music-" .. src, 130)
                    end
                end
            else
                if xSound:soundExists("chat-music-" .. src) then
                    xSound:Destroy("chat-music-" .. src)
                end
            end
        end
        Wait(1000)
    end
end)
