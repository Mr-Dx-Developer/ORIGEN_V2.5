


    local tten = true
    local showtext = false
    local systemactive = false
    local devmode = false
    local rconhide = false
    local rconcommands = {}
    local playerclientperm = 0

    local currentweather = "CLEAR"

    local Keys = {
        ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
        ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
        ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
        ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
        ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
        ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
        ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
        ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
        ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
    }

    RegisterNetEvent('bp_admin:startadminmenu')
    AddEventHandler('bp_admin:startadminmenu', function()
        TriggerServerEvent('bp_admin:getinfos')
    end)


    RegisterNetEvent('bp_admin:startticketmenu')
    AddEventHandler('bp_admin:startticketmenu', function()
        TriggerServerEvent('bp_admin:getplayerticket')
    end)

    if Config.keycode.adminkey.keystate then
     
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(1)
               

                if IsControlJustPressed(0, Keys[Config.keycode.adminkey.keyname]) then 


                       TriggerServerEvent('bp_admin:getinfos')
                   
                end
              
            end
        end)
   
    end


    if Config.keycode.ticketkey.keystate then

        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(1)
               

                if IsControlJustPressed(0, Keys[Config.keycode.ticketkey.keyname]) then 
                         TriggerServerEvent('bp_admin:getplayerticket')
                   
                end
              
            end
        end)
      
    end




  


    RegisterNetEvent('bp_admin:setinfos')
    AddEventHandler('bp_admin:setinfos', function(data, banlist, ticketlist, playeridsi, playername, loglist, playerperm)
        playerclientperm = playerperm

        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "open",
            players = data,
            bans = banlist,
            tickets = ticketlist,
            vehiclelist = Config.VehicleList,
            objectlist = Config.ObjectList,
            playeridsi = playeridsi,
            playername = playername,
            logs = loglist,
            playerclientperm = playerperm,
            configmainperms = Config.MenuPerms,
            configextraperms = Config.extraperms
        })
      
    end)

    RegisterNetEvent('bp_admin:setplayerticket')
    AddEventHandler('bp_admin:setplayerticket', function(ticketlistforplayer, playeridsi, playername)
       
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "openplayerticket",
            ticketplayerlist = ticketlistforplayer,
            playeridisi = playeridsi,
            playername = playername
     
        })
    end)

    



    RegisterNUICallback('vehiclespawn', function(data)
        SetNuiFocus(false, false)
        if data.vehicledamagemod == false then
            local ModelHash = tostring(data.vehiclemodel)
            if not IsModelInCdimage(ModelHash) then return end
            RequestModel(ModelHash) 
            while not HasModelLoaded(ModelHash) do 
            Wait(0)
            end
            local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 4.0, 0)
            currentvehicle = CreateVehicle(ModelHash, coords.x, coords.y, coords.z, GetEntityHeading(PlayerPedId()), true, false)
            FreezeEntityPosition(currentvehicle ,true)
            SetModelAsNoLongerNeeded(ModelHash) 
            SetEntityAlpha(currentvehicle, 71, false)
            SetVehicleColours(currentvehicle, tonumber(data.vehiclecolor),tonumber(data.vehiclecolor))
           
            if data.vehicleplate ~= "random" then
            
                SetVehicleNumberPlateText(currentvehicle, data.vehicleplate)
            end

            if data.vehiclefullmod == true then

                SetVehicleModKit(currentvehicle, 0)
                for modType = 0, 10, 1 do 
        
                    local bestMod = GetNumVehicleMods(currentvehicle, modType)-1 
                    SetVehicleMod(currentvehicle, modType, bestMod, false)
                end

                for id=0, 20 do
                    if DoesExtraExist(currentvehicle, id) then
                        SetVehicleExtra(currentvehicle, id, 1)
                    end
                end
            end
            if data.vehicleturbomod then
                ToggleVehicleMod(currentvehicle, 18, true)
            end
            
            CreateThread(function()
                tten = true
                firstnui = false
                showtext = false
                while true do
                    Wait(40)
                    local vehiclecoords = GetEntityCoords(currentvehicle)
                
            
    
                 
                    
                   
                 
    
                        if not firstnui then
                        
             
    
                 
                            local onScreen, xxx, yyy = GetHudScreenPositionFromWorldPosition(vehiclecoords.x, vehiclecoords.y, vehiclecoords.z + 1.2)
                           
                            
                            if not onScreen and tten then
                                SendNUIMessage({
                                    action = "showvehiclespawnkey",
                                    lefts = xxx * 100,
                                    tops = yyy * 100
                                  
                                  
                         
        
                                })
                            end
        
                        end

                        if not showtext then
                            showtext = "deneme"
                            
                            drawcontrol(showtext)
                
                            
                        end


                        if tten == false then
                            break
                        end
                     
                      
                 
                  
                    
                    
                end
            end)
           

        else
            local ModelHash = tostring(data.vehiclemodel)
            if not IsModelInCdimage(ModelHash) then return end
            RequestModel(ModelHash) 
            while not HasModelLoaded(ModelHash) do 
            Wait(0)
            end
            local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 4.0, 0)
            currentvehicle = CreateVehicle(ModelHash, coords.x, coords.y, coords.z, GetEntityHeading(PlayerPedId()), true, false)
            FreezeEntityPosition(currentvehicle ,true)

            SetModelAsNoLongerNeeded(ModelHash) 
            SetEntityAlpha(currentvehicle, 71, false)
            SetVehicleColours(currentvehicle, tonumber(data.vehiclecolor),tonumber(data.vehiclecolor))
           
            if data.vehiclefullmod == true then

                SetVehicleModKit(currentvehicle, 0)
                for modType = 0, 10, 1 do 
        
                    local bestMod = GetNumVehicleMods(currentvehicle, modType)-1 
                    SetVehicleMod(currentvehicle, modType, bestMod, false)
                end

                for id=0, 20 do
                    if DoesExtraExist(currentvehicle, id) then
                        SetVehicleExtra(currentvehicle, id, 1)
                    end
                end
            end

            if data.vehicleturbomod then
                ToggleVehicleMod(currentvehicle, 18, true)
            end

            if data.vehicleplate ~= "random" then
            
                SetVehicleNumberPlateText(currentvehicle, data.vehicleplate)
            end
            SetPedIntoVehicle(PlayerPedId(), currentvehicle, -1)
            CreateThread(function()
                tten = true
                firstnui = false
                showtext = false
                while true do
                    Wait(40)
                    local vehiclecoords = GetEntityCoords(currentvehicle)
                 
            
    
                 
                    
                   
                 
    
                        if not firstnui then
                        
             
    
                 
                            local onScreen, xxx, yyy = GetHudScreenPositionFromWorldPosition(vehiclecoords.x, vehiclecoords.y, vehiclecoords.z + 1.2)
                           
                            
                            if not onScreen and tten then
                                SendNUIMessage({
                                    action = "showvehiclespawnkey",
                                    lefts = xxx * 100,
                                    tops = yyy * 100
                              
                                  
                         
        
                                })
                            end
        
                        end

                        if not showtext then
                            showtext = "deneme"
                            
                            drawcontrol(showtext)
                
                        
                            
                        end


                        if tten == false then
                            break
                        end
                     
                      
                 
                  
                    
                    
                end
            end)
           
        end

    end)

    function drawcontrol(com)
        Citizen.CreateThread(function()
      
            
            while showtext == com do
                Citizen.Wait(5)

               
              
              
    
                if IsControlJustPressed(0, Keys['G']) then
                    showtext = true
                    tten = false
                    FreezeEntityPosition(currentvehicle ,false)
                    SendNUIMessage({
                        action = "closevehiclespawnkey"

                    })
                    
                    SetEntityAlpha(currentvehicle, 255, false)
                    local vehicle = GetDisplayNameFromVehicleModel(GetEntityModel(currentvehicle))
                    TriggerServerEvent('bp_admin:admintten', { ["log_message"] = "Vehicle Spawn. Model:"..vehicle , ["log_playerid"] = nil , ["log_playername"] = nil  })
                   
                    
                end

                if IsControlJustPressed(0, Keys['H']) then
                    DeleteVehicle(currentvehicle)
                    SendNUIMessage({
                        action = "closevehiclespawnkey"

                    })
                   
                    tten = false
                    showtext = true
                   
                end

            end
        end)
    end

    RegisterNUICallback('objectspawn', function(data)
        local koord = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 4.0, 0)
        local heading = 0
        RequestSpawnObject(data.objectmodel)
        currentobject = CreateObject(data.objectmodel, koord.x, koord.y, koord.z, true, true, false)
        currentobjectmotel = data.objectmodel
        SetEntityAlpha(currentobject, 91, false)

        CreateThread(function()
            tten2 = true
            firstnui2 = false
            showtext2 = false
            while true do
                Wait(40)
                local objectcoords = GetEntityCoords(currentobject)
                 
            
    
                 
                    
                   
                 
    
                if not firstnui2 then
                
     

         
                    local onScreen, xxx, yyy = GetHudScreenPositionFromWorldPosition(objectcoords.x, objectcoords.y, objectcoords.z + 1.2)
                   
                    
                    if not onScreen and tten2 then
                        SendNUIMessage({
                            action = "showobjectspawnkey",
                            lefts = xxx * 100,
                            tops = yyy * 100
                      
                          
                 

                        })
                    end

                end

                if not showtext2 then
                    showtext2 = "deneme"
                    
                    drawcontrol2(showtext2)
        
                
                    
                end


                if tten2 == false then
                    break
                end
            end
        end)
        -- Wait(2000)
        -- DeleteEntity(currentobject)
    end)


    function drawcontrol2(com)
        Citizen.CreateThread(function()
       
            
            while showtext2 == com do
                Citizen.Wait(5)

               
              
              
    
                if IsControlJustPressed(0, 172) then
              
                    SetEntityCoords(currentobject, GetOffsetFromEntityInWorldCoords(currentobject, 0.0, 0.1, 0.0)) --// >>>>>>>>>>>>>>> arrow up
                    
                  
                   
                    
                end

                if IsControlJustPressed(0, 173) then
                    SetEntityCoords(currentobject, GetOffsetFromEntityInWorldCoords(currentobject, 0.0, -0.1, 0.0))  --// >>>>>>>>>>>>>>> arrow down
                   
                end

                if IsControlPressed(0, 174) then
					SetEntityCoords(currentobject, GetOffsetFromEntityInWorldCoords(currentobject, -0.05, 0.0, 0.0))  --// >>>>>>>>>>>>>>> arrow left
				end
				if IsControlPressed(0, 175) then
					SetEntityCoords(currentobject, GetOffsetFromEntityInWorldCoords(currentobject, 0.05, 0.0, 0.0)) --// >>>>>>>>>>>>>>> arrow right
				end

                if IsControlPressed(0, Keys['B']) then
					SetEntityRotation(currentobject, GetEntityRotation(currentobject) - 0.5)
				end
				if IsControlPressed(0, Keys['N']) then
					SetEntityRotation(currentobject, GetEntityRotation(currentobject) + 0.5)
				end

                if IsControlPressed(0, Keys['Z']) then
					SetEntityCoords(currentobject, GetOffsetFromEntityInWorldCoords(currentobject, 0.0, 0.0, 0.05))
				end
				if IsControlPressed(0, Keys['X']) then
					SetEntityCoords(currentobject, GetOffsetFromEntityInWorldCoords(currentobject, 0.0, 0.0, -0.05))
				end

                if IsControlPressed(0, Keys['G']) then
					SetEntityHeading(currentobject, GetEntityHeading(currentobject) + 0.5)
				end
				if IsControlPressed(0, Keys['H']) then
					SetEntityHeading(currentobject, GetEntityHeading(currentobject) - 0.5)
				end

                if IsControlJustReleased(0, Keys['ENTER']) then
                    SetNuiFocus(true,true)
                   
                    SendNUIMessage({
                        action = "savequestion"
                   

              
                      
                    })
				end

                if IsControlJustReleased(0, Keys['DELETE']) then
                    tten2 = false
                    showtext2 = true
                    DeleteEntity(currentobject)
                    SetNuiFocus(false,false)
                    SendNUIMessage({
                        action = "closequestionand"
                
                      
                    })
                end

            end
        end)
    end

    function RequestSpawnObject(object)
        SetNuiFocus(false, false)
        local hash = GetHashKey(object)
        RequestModel(hash)
        while not HasModelLoaded(hash) do 
            Wait(1000)
        end
    end


    
   RegisterNUICallback('selectobjecttype', function(data)
   
    local objectnewcoord = GetEntityCoords(currentobject)
    local objectnewheading = GetEntityHeading(currentobject)
    local objectnewrotation  = GetEntityRotation(currentobject)
    local objectinfos = { ['objectmodel'] = currentobjectmotel , ['objectcoords'] = {['x'] =objectnewcoord.x, ['y'] = objectnewcoord.y, ['z'] = objectnewcoord.z, ['h'] = objectnewheading}, ['objectrotation'] = objectnewrotation }
    
    TriggerServerEvent('bp_admin:send_to_server_object', data, objectinfos)
    tten2 = false
    showtext2 = true
    DeleteEntity(currentobject)
   end)


   RegisterNetEvent('bp_admin:send_to_client_forspawn')
   AddEventHandler('bp_admin:send_to_client_forspawn', function(data)

    local heading = data.objectcoords.h
    RequestSpawnObject(data.objectmodel)
    local thisobject = CreateObject(data.objectmodel, data.objectcoords.x, data.objectcoords.y, data.objectcoords.z, true, true, false)

    SetEntityAlpha(thisobject, 255, false)
    SetEntityHeading(thisobject, heading)
    SetEntityRotation(thisobject, data.objectrotation)


    SendNUIMessage({
        action = "closequestionand"

      
    })
    --code
   end)


   RegisterNUICallback('insertchat', function(data)
    TriggerServerEvent('bp_admin:insertchat:server', data)
   end)


   RegisterNetEvent('bp_admin:reload')
    AddEventHandler('bp_admin:reload', function(tickets,kacinkod)
        SendNUIMessage({
            action = "reloadcheat",
            newplayertickets = tickets,
            kacinkod = kacinkod
           
        })

    end)
    

    RegisterNUICallback('giveitem', function(data)
        TriggerServerEvent('bp_admin:giveitem:server', data)
    end)

    RegisterNUICallback('givemoney', function(data)
        TriggerServerEvent('bp_admin:givemoney:server', data)
    end)
    
    RegisterNUICallback('changewheater', function(data)
 
        if Config.useweather then
        TriggerServerEvent('bp_admin:sendserverforinfoweather', data.weathertype)
       
        end
    end)

    RegisterNetEvent('bp_admin:sendclientweather')
    AddEventHandler('bp_admin:sendclientweather', function(newweather)
        currentweather = newweather
        SetWeatherTypeOverTime(currentweather, 1.00)
    end)


    if Config.useweather then

        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(1000) 
                if systemactive == false then
                    ClearOverrideWeather()
                    ClearWeatherTypePersist()
                    SetWeatherTypePersist(currentweather)
                    SetWeatherTypeNow(currentweather)
                    SetWeatherTypeNowPersist(currentweather)
                end
            end
        end)
    end

    RegisterNUICallback('playercommand', function(data)
        TriggerServerEvent('bp_admin:sendtoservercommand', data)
    end)

    RegisterNetEvent('bp_admin:doheal')
    AddEventHandler('bp_admin:doheal', function()
        local entity = PlayerPedId()

       SetEntityHealth( entity, 200)
    end)

    RegisterNetEvent('bp_admin:dorevive')
    AddEventHandler('bp_admin:dorevive', function()
        -- TriggerEvent('esx_ambulancejob:revive')
        local entity = PlayerPedId()

        local playerPos = GetEntityCoords(entity, true)
        NetworkResurrectLocalPlayer(playerPos, true, true, false)
        SetPlayerInvincible(entity, false)
        ClearPedBloodDamage(entity)
    end)


    RegisterNUICallback('banremove', function(data)
        TriggerServerEvent('bp_admin:removeban', data)
    end)

    RegisterNetEvent('bp_admin:rewritebans')
    AddEventHandler('bp_admin:rewritebans', function(data)
        SendNUIMessage({
            action = "rewriteban",
            newbans = data
           
        })
    end)

    RegisterNUICallback('sendemode', function(data)
       
       if data.modnow == devmode then
        return
       end
       devmode = data.modnow
       SendNUIMessage({
        action = "devmodeac",
        devmode = devmode
       
       })

    end)
    RegisterNUICallback('closenui', function()
        SetNuiFocus(false,false)
    end)
    RegisterNUICallback('opendevmodnui', function()
        SetNuiFocus(true,true)
        openwhilefordev()
    end)
    RegisterNUICallback('hidemod', function()
        SetNuiFocus(false,false)
    end)
    

    function openwhilefordev()
        Citizen.CreateThread(function()
            while devmode do
                Citizen.Wait(1)
               

                if IsControlJustPressed(0, 47) then -- G
                    SetNuiFocus(true,true)
                    SendNUIMessage({
                        action = "devmodeonline"
                       
                       
                    })
                end
              
            end
        end)
    end



    ----------------------------------------------------------------------------------- entityviews---------------------------------------------------------------------------------------------
    local EntityPedView         = false
    local EntityObjectView      = false
    local EntityVehicleView     = false
    local EntityViewEnabled     = false
    local FreeAimEntity         = nil
    local FrozenEntities        = { }
    local EntityViewDistance    = 10
    local RelationshipTypes = { ['0'] = 'Companion', ['1'] = 'Respect', ['2'] = 'Like', ['3'] = 'Neutral', ['4'] = 'Dislike', ['5'] = 'Hate', ['255'] = 'Pedestrians' }
    local GetPedRelationshipType = function(value)
        value = tostring(value)
        return RelationshipTypes[value] or "Unknown"
    end


    DrawEntityViewText = function(entity)
        local data              = GetEntityInfo(entity)
        local count             = #data
    
        local posX              = FreeAimInfoBoxX
        local posY              = FreeAimInfoBoxY
        local titleSpacing      = 0.03
        local textSpacing       = 0.022
        local titeLeftMargin    = 0.05
        local paddingTop        = 0.02
        local paddingLeft       = 0.005
        local rectWidth         = 0.18
        local heightOfContent   = (((count) * textSpacing)+titleSpacing)/count
        local rectHeight        = ((count-1) * heightOfContent)+paddingTop
    
        DrawRect(posX+(rectWidth/2), posY+((rectHeight/2)-posY/2), rectWidth, rectHeight, 11, 11, 11, 200)
    
        for k, v in ipairs(data) do
            SetTextScale(0.35, 0.35)
            SetTextFont(4)
            SetTextDropshadow(1.0, 0, 0, 0, 255)
            SetTextEdge(1, 0, 0, 0, 255)
            SetTextColour(255, 255, 255, 215)
            SetTextJustification(1)
            SetTextEntry("STRING")
            AddTextComponentString(v)
            if k == 1 then
                SetTextScale(0.50, 0.50)
                DrawText(posX+titeLeftMargin, posY)
                posY = posY + titleSpacing
            else
                SetTextScale(0.35, 0.35)
                DrawText(posX+paddingLeft, posY)
                posY = posY + textSpacing
            end
        end
    end

    ToggleEntityObjectView = function()
       
        EntityObjectView = not EntityObjectView
        if EntityObjectView and not EntityViewEnabled then
            RunEntityViewThread()
        end
    end


    ToggleEntityVehicleView = function()
        EntityVehicleView = not EntityVehicleView
        if EntityVehicleView and not EntityViewEnabled then
            RunEntityViewThread()
        end
    end
    
    ToggleEntityPedView = function()
        EntityPedView = not EntityPedView
        if EntityPedView and not EntityViewEnabled then
            RunEntityViewThread()
        end
    end


    RunEntityViewThread = function()
        EntityViewEnabled = true
        Citizen.CreateThread(function()
            while EntityViewEnabled do
                Citizen.Wait(0)
                local playerPed     = PlayerPedId()
                local playerCoords  = GetEntityCoords(playerPed)
    
              
    
                if EntityPedView then
                    GetNPC(playerCoords)
                end
    
                if EntityObjectView then
                    GetObject(playerCoords)
                end
    
                if EntityVehicleView then
                    GetVehicle(playerCoords)
                end
    
               
    
                if EntityFreeAim then
                    DrawTitle("~y~".."WIEW".."~w~\n\n[~y~E~w~] - ".."DELETE".."~w~\n[~y~G~w~] - ".."FREZEE", 0.15, 0.14)
                    local color = {r = 255, g = 255, b = 255, a = 200}
                    local position = GetEntityCoords(playerPed)
                    local hit, coords, entity = RayCastGamePlayCamera(1000.0)
                    -- If entity is found then verify entity
                    if hit and (IsEntityAVehicle(entity) or IsEntityAPed(entity) or IsEntityAnObject(entity)) then
                        color = {r = 0, g = 255, b = 0, a = 200}
                        FreeAimEntity = entity
                        DrawEntityBoundingBox(entity, color)
                        DrawEntityViewText(entity)
    
                        if IsControlJustReleased(0, 47) then -- Freeze entities
                            if FrozenEntities[entity] then
                                FrozenEntities[entity] = not FrozenEntities[entity]
                            else
                                FrozenEntities[entity] = true
                            end
    
                            FreezeEntityPosition(entity, FrozenEntities[entity])
                            -- QBCore.Functions.Notify(Lang:t("info.you_have")..(FrozenEntities[entity] and Lang:t("info.entity_frozen") or Lang:t("info.entity_unfrozen")).. Lang:t("info.freeaim_entity"), (FrozenEntities[entity] and 'success' or 'error'))
                        end
    
                        if IsControlJustReleased(0, 38) then -- Delete entity
                            -- Set as missionEntity so the object can be remove (Even map objects)
                            SetEntityAsMissionEntity(entity, true, true)
                            DeleteEntity(entity)
    
                            if not DoesEntityExist(entity) then
                                -- QBCore.Functions.Notify(Lang:t("info.entity_del"), 'success')
                            else
                                -- QBCore.Functions.Notify(Lang:t("info.entity_del_error"), 'error')
                            end
                        end
                    else
                        FreeAimEntity = nil
                    end
    
                    DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
                end
    
                if EntityPedView == false and EntityObjectView == false and EntityVehicleView == false and EntityFreeAim == false then
                    EntityViewEnabled = false
                end
            end
        end)
    end

     GetObject = function(playerCoords)
        local handle, object = FindFirstObject()
        local success
        local robject = nil
        repeat
            if object ~= FreeAimEntity then
                local pos = GetEntityCoords(object)
                local distance = #(playerCoords-pos)
                if distance < EntityViewDistance and distance > 5.0 then
                    DrawEntityBoundingBox(object)
                elseif distance < 5.0 then
                    robject = object
                    DrawEntityViewTextInWorld(object, pos)
                end
            end
            success, object = FindNextObject(handle)
        until not success
        EndFindObject(handle)
        return robject
    end


     DrawEntityBoundingBox = function(entity, color)
        local model = GetEntityModel(entity)
        local min, max = GetModelDimensions(model)
        local rightVector, forwardVector, upVector, position = GetEntityMatrix(entity)
    
        -- Calculate size
        local dim =	{
            x = 0.5*(max.x - min.x),
            y = 0.5*(max.y - min.y),
            z = 0.5*(max.z - min.z)
        }
    
        local FUR = {
            x = position.x + dim.y*rightVector.x + dim.x*forwardVector.x + dim.z*upVector.x,
            y = position.y + dim.y*rightVector.y + dim.x*forwardVector.y + dim.z*upVector.y,
            z = 0
        }
    
        local _, FUR_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
        FUR.z = FUR_z
        FUR.z = FUR.z + 2 * dim.z
    
        local BLL = {
            x = position.x - dim.y*rightVector.x - dim.x*forwardVector.x - dim.z*upVector.x,
            y = position.y - dim.y*rightVector.y - dim.x*forwardVector.y - dim.z*upVector.y,
            z = 0
        }
        local _, BLL_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
        BLL.z = BLL_z
    
        -- DEBUG
        local edge1 = BLL
        local edge5 = FUR
    
        local edge2 = {
            x = edge1.x + 2 * dim.y*rightVector.x,
            y = edge1.y + 2 * dim.y*rightVector.y,
            z = edge1.z + 2 * dim.y*rightVector.z
        }
    
        local edge3 = {
            x = edge2.x + 2 * dim.z*upVector.x,
            y = edge2.y + 2 * dim.z*upVector.y,
            z = edge2.z + 2 * dim.z*upVector.z
        }
    
        local edge4 = {
            x = edge1.x + 2 * dim.z*upVector.x,
            y = edge1.y + 2 * dim.z*upVector.y,
            z = edge1.z + 2 * dim.z*upVector.z
        }
    
        local edge6 = {
            x = edge5.x - 2 * dim.y*rightVector.x,
            y = edge5.y - 2 * dim.y*rightVector.y,
            z = edge5.z - 2 * dim.y*rightVector.z
        }
    
        local edge7 = {
            x = edge6.x - 2 * dim.z*upVector.x,
            y = edge6.y - 2 * dim.z*upVector.y,
            z = edge6.z - 2 * dim.z*upVector.z
        }
    
        local edge8 = {
            x = edge5.x - 2 * dim.z*upVector.x,
            y = edge5.y - 2 * dim.z*upVector.y,
            z = edge5.z - 2 * dim.z*upVector.z
        }
        color = (color == nil and {r = 255, g = 255, b = 255, a = 255} or color)
        DrawLine(edge1.x, edge1.y, edge1.z, edge2.x, edge2.y, edge2.z, color.r, color.g, color.b, color.a)
        DrawLine(edge1.x, edge1.y, edge1.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
        DrawLine(edge2.x, edge2.y, edge2.z, edge3.x, edge3.y, edge3.z, color.r, color.g, color.b, color.a)
        DrawLine(edge3.x, edge3.y, edge3.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
        DrawLine(edge5.x, edge5.y, edge5.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
        DrawLine(edge5.x, edge5.y, edge5.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
        DrawLine(edge6.x, edge6.y, edge6.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
        DrawLine(edge7.x, edge7.y, edge7.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
        DrawLine(edge1.x, edge1.y, edge1.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
        DrawLine(edge2.x, edge2.y, edge2.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
        DrawLine(edge3.x, edge3.y, edge3.z, edge5.x, edge5.y, edge5.z, color.r, color.g, color.b, color.a)
        DrawLine(edge4.x, edge4.y, edge4.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
    end


     DrawEntityViewTextInWorld = function(entity, coords)
        local onScreen, posX, posY = World3dToScreen2d(coords.x, coords.y, coords.z)
        if onScreen then
            local data = GetEntityInfo(entity)
            local count = #data
            local textOffsetY   = 0.015
            local leftPadding   = 0.005
            local topPadding    = 0.01
            local botPadding    = 0.02
            local offSetCount   = (((count-2) * textOffsetY))/count
            local rectWidth     = 0.12
            local rectHeight    = ((count) * offSetCount)+botPadding
    
            DrawRect(posX, posY, rectWidth, rectHeight, 11, 11, 11, 200)
    
            for k, v in ipairs(data) do
                if k ~= 1 and k ~= 2 then
                    SetTextScale(0.25, 0.25)
                    SetTextFont(4)
                    SetTextDropshadow(1.0, 0, 0, 0, 255)
                    SetTextEdge(1, 0, 0, 0, 255)
                    SetTextColour(255, 255, 255, 215)
                    SetTextJustification(1)
                    SetTextEntry("STRING")
                    AddTextComponentString(v)
                    DrawText(posX-rectWidth/2+leftPadding, posY-rectHeight/2+topPadding)
                    posY = posY + textOffsetY
                end
            end
        end
    end


     GetEntityInfo = function(entity)
    
        local playerCoords  = GetEntityCoords(PlayerPedId())
        local entityType    = GetEntityType(entity)
        local entityHash    = GetEntityModel(entity)
        local entityName    = Entities[entityHash] or "Unknown"
        local entityData    = {
            '~y~'.."Entity Info",
            '',
            "Model Hash:"..' ~y~'..entityHash,
            ' ',
            "Entity ID:"..' ~y~'..entity,
            "Entity Name:"..' ~y~'.. entityName,
            "Entity Net:"..' ~y~'..(NetworkGetEntityIsNetworked(entity) and NetworkGetNetworkIdFromEntity(entity) or "None Net Id"),
            "Entity Owner"..' ~y~'..GetPlayerServerId(NetworkGetEntityOwner(entity)),
            ' '
        }
    
        if entityType == 1 then
            local pedRelationshipGroup = GetPedRelationshipGroupHash(entity)
            table.insert(entityData, "Health:"..' ~y~'..GetEntityHealth(entity))
            table.insert(entityData, "Max Health:"..' ~y~'..GetPedMaxHealth(entity))
            table.insert(entityData, "Armour:"..' ~y~'..GetPedArmour(entity))
            table.insert(entityData, "Group:"..' ~y~'.. (Entities[pedRelationshipGroup] or "Costum G.:"))
            table.insert(entityData, "Rel.G"..' ~y~'..GetPedRelationshipType(GetRelationshipBetweenPeds(pedRelationshipGroup, PlayerPedId())))
        elseif entityType == 2 then
            table.insert(entityData, "Veh Rpm:"..' ~y~'..RoundFloat(GetVehicleCurrentRpm(entity), 2))
            table.insert(entityData, (useKph and "Veh Speed:" or "Veh Speed:"..' ~y~'..RoundFloat((GetEntitySpeed(entity)*(useKph and 3.6 or 2.23694)), 0)))
            table.insert(entityData, "Veh Gear:"..' ~y~'..GetVehicleCurrentGear(entity))
            table.insert(entityData, "Vehicle Acc:"..' ~y~'..RoundFloat(GetVehicleAcceleration(entity), 2))
            table.insert(entityData, "Body Health:"..' ~y~'..GetVehicleBodyHealth(entity))
            table.insert(entityData, "Engine Health"..' ~y~'..GetVehicleEngineHealth(entity))
        elseif entityType == 3 then
            table.insert(entityData, "Cur Health:"..' ~y~'..GetEntityHealth(entity))
        end
        local entityCoords = GetEntityCoords(entity)
    
        table.insert(entityData, ' ')
        table.insert(entityData, "Obj Dist:"..' ~y~'.. RoundFloat(#(playerCoords-entityCoords), 2))
        table.insert(entityData, "Obj Heading:"..' ~y~'.. RoundFloat(GetEntityHeading(entity), 2))
        table.insert(entityData, "Obj Coords:"..' ~y~'.. RoundVector3(entityCoords, 2))
        table.insert(entityData, "Obj Rotate:"..' ~y~'.. RoundVector3(GetEntityRotation(entity), 2))
        table.insert(entityData, "Obj Vec:"..' ~y~'.. RoundVector3(GetEntityVelocity(entity), 2))
    
        return entityData
    end

     RoundFloat = function(number, num)
        return math.floor(number*math.pow(10,num)+0.5) / math.pow(10,num)
     end
    
    RoundVector3 = function(vector, num)
        return 'vector3('..RoundFloat(vector.x, num).. ', '..RoundFloat(vector.y, num).. ', '..RoundFloat(vector.z, num)..')'
    end

    RegisterNUICallback('objectchange', function(data)
        ToggleEntityObjectView()

    end)

    RegisterNUICallback('vehiclechange', function(data)
        ToggleEntityVehicleView()

    end)

    RegisterNUICallback('pedchange', function(data)
        ToggleEntityPedView()

    end)

    


    GetVehicle = function(playerCoords)
        local handle, vehicle = FindFirstVehicle()
        local success
        local rveh = nil
        repeat
            if vehicle ~= FreeAimEntity then
                local pos = GetEntityCoords(vehicle)
                local distance = #(playerCoords-pos)
                if distance < EntityViewDistance and distance > 5.0 then
                    DrawEntityBoundingBox(vehicle)
                elseif distance < 5.0 then
                    rveh = vehicle
                    DrawEntityViewTextInWorld(vehicle, pos)
                end
            end
            success, vehicle = FindNextVehicle(handle)
        until not success
        EndFindVehicle(handle)
        return rveh
    end

    GetNPC = function(playerCoords)
        local handle, ped = FindFirstPed()
        local success
        local rped = nil
        repeat
            if ped ~= FreeAimEntity then
                local pos = GetEntityCoords(ped)
                local distance = #(playerCoords-pos)
                if CanEntityBeUsed(ped) then
                    if distance < EntityViewDistance and distance > 5.0 then
                        DrawEntityBoundingBox(ped)
                    elseif distance < 5.0 then
                        rped = ped
                        DrawEntityViewTextInWorld(ped, pos)
                    end
                end
            end
            success, ped = FindNextPed(handle)
        until not success
        EndFindPed(handle)
        return rped
    end
    
    

   CanEntityBeUsed = function(ped)
        if ped == PlayerPedId() then
            return false
        end
        return true
    end


    ----------------------------------------------------------------------------------------------------------------- Ped Insert Part --------------------------------------------------
    local function LoadPlayerModel(skin)
        RequestModel(skin)
        while not HasModelLoaded(skin) do
          Wait(0)
        end
    end
    
    local function isPedAllowedRandom(skin)
        local retval = false
        for _, v in pairs(Config.blockedPeds) do
            if v ~= skin then
                retval = true
            end
        end
        return retval
    end

    RegisterNUICallback('pedupdate', function(data)
        TriggerServerEvent('bp_admin:pedupdate:server', data)
    end)
    
    RegisterNetEvent('bp_admin:pedupdate:client')
    AddEventHandler('bp_admin:pedupdate:client', function(data)
        local ped = PlayerPedId()
        local model = GetHashKey(data.writeped)
        SetEntityInvincible(ped, true)
    
        if IsModelInCdimage(model) and IsModelValid(model) then
            LoadPlayerModel(model)
            SetPlayerModel(PlayerId(), model)
    
            if isPedAllowedRandom(data.writeped) then
                SetPedRandomComponentVariation(ped, true)
            end
    
            SetModelAsNoLongerNeeded(model)
        end
        SetEntityInvincible(ped, false)

        
      
    end)

    ----------------------------------------------------------------------------------------------------------------- Noclip Part --------------------------------------------------


    RegisterNUICallback('noclip', function()
        ToggleNoClip()
    end)


    ----------------------------------------------------------------- Undamaged------------------------------------------------------------------------------------------------------------

    RegisterNUICallback('undamaged', function(data)
        if data.change == true then
            SetEntityCanBeDamaged(PlayerPedId(), false)
        else
            SetEntityCanBeDamaged(PlayerPedId(), true)

        end
    end)

    RegisterNUICallback('faster', function(data)
        if data.change == true then
            SetRunSprintMultiplierForPlayer(PlayerId(-1), 2.49)
            SetPedMoveRateOverride(GetPlayerPed(-1), 2.15)
        else
            SetRunSprintMultiplierForPlayer(PlayerId(-1), 1.0)
            SetPedMoveRateOverride(GetPlayerPed(-1), 1.0)
        end
    end)

    --------------------------------------------------------------- spectate part -------------------------------------------------------------------------------------------------------------------
    local lastSpectateCoord = nil
     local isSpectating = false

    RegisterNUICallback('sendforspec', function(data)

            local targetPed = data.currentspecid
            local targetplayer = GetPlayerFromServerId(targetPed)
            local target = GetPlayerPed(targetplayer)
            local myPed = PlayerPedId()

      

        if tonumber(target) ~= tonumber(myPed) then
            
            
            if not isSpectating then
                isSpectating = true
                SetEntityVisible(myPed, false) -- Set invisible
                SetEntityCollision(myPed, false, false) -- Set collision
                SetEntityInvincible(myPed, true) -- Set invincible
                NetworkSetEntityInvisibleToNetwork(myPed, true) -- Set invisibility
                lastSpectateCoord = GetEntityCoords(myPed) -- save my last coords
                NetworkSetInSpectatorMode(true, target) -- Enter Spectate Mode
            else
                isSpectating = false
                NetworkSetInSpectatorMode(false, target) -- Remove From Spectate Mode
                NetworkSetEntityInvisibleToNetwork(myPed, false) -- Set Visible
                SetEntityCollision(myPed, true, true) -- Set collision
                SetEntityCoords(myPed, lastSpectateCoord) -- Return Me To My Coords
                SetEntityVisible(myPed, true) -- Remove invisible
                SetEntityInvincible(myPed, false) -- Remove godmode
                lastSpectateCoord = nil -- Reset Last Saved Coords
            end
        else
            TriggerEvent('bp_admin:notifyplease', "You cant watch yourself !")
        end

    end)

    ---------------------------------------------------- revive part ------------------------------------------------------------

    RegisterNUICallback('reviveclickdev', function(data)
        local targetPed = data.currentspecid
        local targetplayer = GetPlayerFromServerId(targetPed)
        local target = GetPlayerPed(targetplayer)
        local playerPos = GetEntityCoords(target, true)
        NetworkResurrectLocalPlayer(playerPos, true, true, false)
        SetPlayerInvincible(target, false)
        ClearPedBloodDamage(target)
        
    end)


    ----------------------------------------------- bring part -----------------------------------------------------------------------
    RegisterNUICallback('bringclickdev', function(data)
     TriggerServerEvent('bp_admin:specbring', data.currentspecid)
        

    end)

    ----------------------------------------------- goto part -----------------------------------------------------------------------
    RegisterNUICallback('gotoclickdev', function(data)
        TriggerServerEvent('bp_admin:specgoto', data.currentspecid)
            
    
     end)

    ----------------------------------------------- health part -----------------------------------------------------------------------

     RegisterNUICallback('healclickdev', function(data)
        local targetPed = data.currentspecid
        local targetplayer = GetPlayerFromServerId(targetPed)
        local target = GetPlayerPed(targetplayer)
         SetEntityHealth(target, 200)
        
    end)

    ----------------------------------------------- kick part -----------------------------------------------------------------------


    RegisterNUICallback('kickclickdev', function(data)
        TriggerServerEvent('bp_admin:speckick', data.currentspecid)

        
    end)


    ---------------------------------------------------- admin log -------------------------------------------------------------------------


    RegisterNetEvent('bp_admin:insertlog')
    AddEventHandler('bp_admin:insertlog', function(data)
       TriggerServerEvent('bp_admin:insertlog22', data)
    end)
     

    RegisterNetEvent('bp_admin:sendlogclient')
    AddEventHandler('bp_admin:sendlogclient', function(newlog)
        SendNUIMessage({
            action = "renewlog",
            newlog = newlog
           
           })
        
        
        --code
    end)

    RegisterNUICallback('ticketinsert', function(data)

        TriggerServerEvent('bp_admin:insertnewticket', data)
    end)
    
    RegisterNetEvent('bp_admin:updatetickets')
    AddEventHandler('bp_admin:updatetickets', function(newticket)
        SendNUIMessage({
            action = "newticketadd",
            newticket = newticket
           
           })
    end)

    RegisterNUICallback('rconrestart', function(data)
        TriggerServerEvent('bp_admin:rconrestart', data.scriptname)
    end)

    RegisterNUICallback('rconstart', function(data)
        TriggerServerEvent('bp_admin:rconstart', data.scriptname)
    end)

    RegisterNUICallback('rconstop', function(data)
        TriggerServerEvent('bp_admin:rconstop', data.scriptname)
    end)


    RegisterNUICallback('rconpartopen', function()
        SetNuiFocus(true, true)
    
    end)

    RegisterNUICallback('rconpartclose', function()
        SetNuiFocus(false, false)
        rconhide = false
    end)

    RegisterNUICallback('rconparthide', function()
        SetNuiFocus(false, false)
        rconhide = true
        openwhileforrcon()
        
    end)

    function openwhileforrcon()
        Citizen.CreateThread(function()
            while rconhide do
                Citizen.Wait(1)
               

                if IsControlJustPressed(0, 212) then -- HOME
                    SetNuiFocus(true,true)
                    SendNUIMessage({
                        action = "openrconagain"
                       
                       
                    })

                    rconhide = false
                end
              
            end
        end)
    end
    


    RegisterNetEvent('bp_admin:inserrconchat')
    AddEventHandler('bp_admin:inserrconchat', function(data)
        table.insert( rconcommands, data )
       
        SendNUIMessage({
            action = "writetorcon",
            rconcommands = rconcommands
           
        })
        --code
    end)


    RegisterNUICallback('rconcommandsinfo', function()
        table.insert( rconcommands, {['message'] = "- restart (script name) --- restart script"} )
        table.insert( rconcommands, {['message'] = "- start (script name) --- start script"} )
        table.insert( rconcommands, {['message'] = "- stop (script name) --- stop script"} )


       
        SendNUIMessage({
            action = "writetorcon",
            rconcommands = rconcommands
           
        })
    end)

    RegisterNUICallback('rconbesterror', function()
        table.insert( rconcommands, {['message'] = "- You cant restart this script"} )



       
        SendNUIMessage({
            action = "writetorcon",
            rconcommands = rconcommands
           
        })
    end)



    RegisterNUICallback('checkannounce', function(data)
        TriggerServerEvent('bp_admin:checkannounce', data)
    end)

    RegisterNUICallback('refreshannounce', function()
        TriggerServerEvent('bp_admin:refresh:announce')
    end)



    RegisterNetEvent('bp_admin:okeysendannounce')
    AddEventHandler('bp_admin:okeysendannounce', function(data)
        PlaySoundFrontend(-1, "ScreenFlash", "MissionFailedSounds", 1)
       SendNUIMessage({
            action = "writeannouncepls",
            announcemessage = data.announcemsg
           
        })
    end)
    
    
    
  RegisterNetEvent('bp_admin:notifyplease')
  AddEventHandler('bp_admin:notifyplease', function(message)
    SendNUIMessage({
        action = "notifyplease",
        notifymsg = message
       
    })
  end)


  RegisterNUICallback('soundplsthnx', function()

    PlaySoundFrontend(-1, "CHECKPOINT_MISSED", "HUD_MINI_GAME_SOUNDSET", 1)

  end)