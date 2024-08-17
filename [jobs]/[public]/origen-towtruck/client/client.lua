inJob, isTabletOpen, isStartJob = false
local completedTasks = {}
local lastVehicle, progress, vehicleBed, flatStatus, inVehicle = nil, false, nil, false, false
local spawnedFlatbed, hookProp, hookRope, hookInHandle, hookDropped, hookAttached = nil, nil, nil, false, false, false
local winchVehicle, vehicleHooked, createdVehicle, vehicleBlip, finishBlip, callBlip, called = nil, false, nil, nil, nil,
    nil
local baseValue = 0.0
local milCount = nil
local vehicleWinding = false
local backOffset = { vector3(0.0, -4.0, 0.0), vector3(0.0, 0.0, 0.0) }
local loweredOffset = { vector3(0.0, -0.4, -1.0), vector3(12.0, 0.0, 0.0) }
local raisedOffset = { vector3(0.0, -3.8, 0.45), vector3(0.0, 0.0, 0.0) }
local soundPlayed, deactivateSound = false, false, false, false
local ropes = {}
local entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end
        enum.destructor = nil
        enum.handle = nil
    end
}

local addVehicleBlip = function(entity)
    vehicleBlip = AddBlipForEntity(entity)
    SetBlipSprite(vehicleBlip, 225)
    SetBlipColour(vehicleBlip, 2)
    SetBlipScale(vehicleBlip, 0.8)
    SetBlipAsShortRange(vehicleBlip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Koci.getPhrase("broken-vehicle"))
    EndTextCommandSetBlipName(vehicleBlip)
    SetBlipRoute(vehicleBlip, true)
end
local addBlip = function(coords)
    finishBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(finishBlip, 1)
    SetBlipColour(finishBlip, 1)
    SetBlipScale(finishBlip, 0.8)
    SetBlipAsShortRange(finishBlip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Koci.getPhrase("finish-blip"))
    EndTextCommandSetBlipName(finishBlip)
    SetBlipRoute(finishBlip, true)
end
rotationFlatbed = function(newJob)
    local vehicleModel = Config.JobOptions.vehicleModels[math.random(1, #Config.JobOptions.vehicleModels)]
    local spawnCoords = newJob.coords
    if IsAnyVehicleNearPoint(spawnCoords.x, spawnCoords.y, spawnCoords.z, 1.0) then
        Citizen.Wait(100)
        rotationFlatbed()
        return
    end
    Koci.requestModel(vehicleModel)
    createdVehicle = CreateVehicle(vehicleModel, spawnCoords.x, spawnCoords.y, spawnCoords.z, spawnCoords.w, true, true)
    SetVehicleDoorsLocked(createdVehicle, 2)
    PlaceObjectOnGroundProperly(createdVehicle)
    addVehicleBlip(createdVehicle)
    milCount = math.floor((#(GetEntityCoords(PlayerPedId()) - vector3(spawnCoords.x, spawnCoords.y, spawnCoords.z))) /
        1000)
    Koci.showNotification(Koci.getPhrase("started-new-job"))
end
local finishFlatBed = function()
    local vehicleClass = GetVehicleClass(createdVehicle)
    if DoesEntityExist(createdVehicle) then
        DeleteEntity(createdVehicle)
    end
    if DoesBlipExist(finishBlip) then
        RemoveBlip(finishBlip)
    end
    createdVehicle = nil
    vehicleHooked = false
    local taskId = isStartJob.id
    local milPrice = milCount * Config.JobOptions.milPrice
    local basePrice = isStartJob.reward
    local exp = isStartJob.exp
    local classPrice = (Config.JobOptions.classMultiplier[vehicleClass] or 0) * basePrice
    local levelPrice = Config.JobOptions.levelPrice * myLevel
    TriggerServerEvent("origen-towtruck:server:finishFlatBed", milPrice, basePrice, classPrice, levelPrice, exp, taskId)
    isStartJob = false
    progress = false
end
local checkVehicle = function()
    if not DoesEntityExist(createdVehicle) then
        return false
    end
    if winchVehicle ~= createdVehicle then
        return false
    end
    local vehicleCoords = GetEntityCoords(createdVehicle)
    local dst = #(Config.JobOptions.finishCoords - vehicleCoords)
    if dst > 10 then
        return false
    end
    return true
end
local rotationFinish = function()
    RemoveBlip(vehicleBlip)
    addBlip(Config.JobOptions.finishCoords)
    Citizen.CreateThread(function()
        while DoesEntityExist(createdVehicle) do
            local sleep = 1000
            local playerPed = PlayerPedId()
            local pCoords = GetEntityCoords(playerPed)
            local dst = #(pCoords - Config.JobOptions.finishCoords)
            if dst <= 20 then
                sleep = 1
                DrawMarker(23, Config.JobOptions.finishCoords.x, Config.JobOptions.finishCoords.y,
                    Config.JobOptions.finishCoords.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 1.0, 255, 0, 0, 255,
                    false, false, false, false, false, false, false)
                if dst <= 3 then
                    Koci.showHelpText(Koci.getPhrase("finish-interaction"))
                    if IsControlJustPressed(0, 74) and not progress then
                        if checkVehicle() then
                            progress = true
                            finishFlatBed()
                        else
                            Koci.showNotification(Koci.getPhrase("no-broken-vehicle"))
                        end
                        if isTextUIOpen then
                            lib.hideTextUI()
                            isTextUIOpen = false
                        end
                    end
                end
            end
            Citizen.Wait(sleep)
        end
    end)
end
spawnFlatBed = function(coords)
    Koci.requestModel(Config.FlatBed.vehicleModel)
    spawnedFlatbed = CreateVehicle(Config.FlatBed.vehicleModel, coords.x, coords.y, coords.z, coords.w, true, true)
    SetVehicleOnGroundProperly(spawnedFlatbed)
    SetVehicleHasBeenOwnedByPlayer(spawnedFlatbed, true)
    SetVehicleNeedsToBeHotwired(spawnedFlatbed, false)
    SetModelAsNoLongerNeeded(Config.FlatBed.vehicleModel)
    Koci.giveVehicleKey(spawnedFlatbed)
    Wait(3000)
    Koci.showNotification(Koci.getPhrase("start-job"))
    inJob = true
end
local createPed = function()
    for _, data in pairs(Config.PedOptions) do
        if IsModelValid(data.model) then
            Koci.requestModel(data.model)
            data.handle = CreatePed(4, data.model, data.coords.x, data.coords.y, data.coords.z - 1, data.coords.w, false,
                false)
            SetPedDefaultComponentVariation(data.handle)
            SetPedDiesWhenInjured(data.handle, false)
            SetEntityInvincible(data.handle, true)
            FreezeEntityPosition(data.handle, true)
            TaskSetBlockingOfNonTemporaryEvents(data.handle, true)
            SetBlockingOfNonTemporaryEvents(data.handle, true)
            SetModelAsNoLongerNeeded(data.model)
            Koci.addTarget(data)
        end
    end
    if Config.Target == "drawText" then
        Citizen.CreateThread(function()
            while true do
                local sleep = 1000
                local playerPed = PlayerPedId()
                local pCoords = GetEntityCoords(playerPed)
                for k, v in pairs(Config.PedOptions) do
                    local npcCoords = GetEntityCoords(v.handle)
                    local dst = #(pCoords - npcCoords)
                    if v.jobName == "none" or PlayerData and PlayerData.job and PlayerData.job.name == v.jobName then
                        if dst <= 20 then
                            sleep = 1
                        end
                        if dst <= 5 then
                            if not inJob then
                                Koci.drawText(npcCoords.x, npcCoords.y, npcCoords.z + 1, 0.35,
                                    Koci.getPhrase("interact-npc"))
                            else
                                Koci.drawText(npcCoords.x, npcCoords.y, npcCoords.z + 1, 0.35,
                                    Koci.getPhrase("interact-finish-npc"))
                            end
                        end
                        if dst <= 2 then
                            if IsControlJustPressed(0, 38) and not progress then
                                if DoesEntityExist(createdVehicle) then
                                    DeleteEntity(createdVehicle)
                                end
                                if DoesEntityExist(spawnedFlatbed) then
                                    DeleteEntity(spawnedFlatbed)
                                end
                                if DoesEntityExist(vehicleBed) then
                                    DeleteEntity(vehicleBed)
                                end
                                if DoesBlipExist(vehicleBlip) then
                                    RemoveBlip(vehicleBlip)
                                end
                                if DoesBlipExist(finishBlip) then
                                    RemoveBlip(finishBlip)
                                end
                                if not inJob then
                                    local spawnPoint = Koci.getClearSpawnPoint(v.spawnCoords)
                                    if spawnPoint then
                                        progress = true
                                        spawnFlatBed(spawnPoint)
                                        progress = false
                                    else
                                        Koci.showNotification(Koci.getPhrase("not-available-spawnpoint"))
                                    end
                                else
                                    inJob = false
                                end
                            end
                        end
                    end
                end
                Citizen.Wait(sleep)
            end
        end)
    end
end
local createBed = function()
    Koci.requestModel("inm_flatbed_base")
    vehicleBed = CreateObjectNoOffset("inm_flatbed_base", GetEntityCoords(lastVehicle), true, false, false)
    AttachEntityToEntity(vehicleBed, lastVehicle, nil, 0.0, -3.8, 0.35, 0.0, 0.0, 0.0, true, false, true, false, nil,
        true)
    TriggerServerEvent("origen-towtruck:server:addData", "bedId", NetworkGetNetworkIdFromEntity(lastVehicle),
        NetworkGetNetworkIdFromEntity(vehicleBed))
end
function lerp(a, b, t)
    return a + (b - a) * t
end

local flatBedEnable = function()
    repeat
        Citizen.Wait(10)
        local offsetPos = raisedOffset[1]
        local offsetRot = raisedOffset[2]
        offsetPos = offsetPos +
            vector3(lerp(0.0, backOffset[1].x, baseValue), lerp(0.0, backOffset[1].y, baseValue),
                lerp(0.0, backOffset[1].z, baseValue))
        offsetRot = offsetRot +
            vector3(lerp(0.0, backOffset[2].x, baseValue), lerp(0.0, backOffset[2].y, baseValue),
                lerp(0.0, backOffset[2].z, baseValue))
        DetachEntity(vehicleBed, 0, 0)
        AttachEntityToEntity(vehicleBed, lastVehicle, GetEntityBoneIndexByName(lastVehicle, "chassis"), offsetPos,
            offsetRot, 0, 0, 1, 0, 0, 1)
        baseValue = baseValue + (1.0 * Timestep()) / 4.0
    until baseValue >= 1.0
    baseValue = 0.0
    repeat
        Citizen.Wait(10)
        local offsetPos = raisedOffset[1] + backOffset[1]
        local offsetRot = raisedOffset[2] + backOffset[2]
        offsetPos = offsetPos +
            vector3(lerp(0.0, loweredOffset[1].x, baseValue), lerp(0.0, loweredOffset[1].y, baseValue),
                lerp(0.0, loweredOffset[1].z, baseValue))
        offsetRot = offsetRot +
            vector3(lerp(0.0, loweredOffset[2].x, baseValue), lerp(0.0, loweredOffset[2].y, baseValue),
                lerp(0.0, loweredOffset[2].z, baseValue))
        DetachEntity(vehicleBed, 0, 0)
        AttachEntityToEntity(vehicleBed, lastVehicle, GetEntityBoneIndexByName(lastVehicle, "chassis"), offsetPos,
            offsetRot, 0, 0, 1, 0, 0, 1)
        baseValue = baseValue + (1.0 * Timestep()) / 2.0
    until baseValue >= 1.0
    baseValue = 0.0
    local offsetPos = raisedOffset[1] + backOffset[1] + loweredOffset[1]
    local offsetRot = raisedOffset[2] + backOffset[2] + loweredOffset[2]
    DetachEntity(vehicleBed, 0, 0)
    AttachEntityToEntity(vehicleBed, lastVehicle, GetEntityBoneIndexByName(lastVehicle, "chassis"), offsetPos, offsetRot,
        0, 0, 1, 0, 0, 1)
    TriggerServerEvent("origen-towtruck:server:addData", "status", NetworkGetNetworkIdFromEntity(lastVehicle), true)
    flatStatus = true
    progress = false
    SendNUIMessage({
        action = "nui:setFlatBedProgress",
        data = nil
    })
end
local flatBedDisable = function()
    repeat
        Citizen.Wait(10)
        local offsetPos = raisedOffset[1] + backOffset[1]
        local offsetRot = raisedOffset[2] + backOffset[2]
        offsetPos = offsetPos +
            vector3(lerp(loweredOffset[1].x, 0.0, baseValue), lerp(loweredOffset[1].y, 0.0, baseValue),
                lerp(loweredOffset[1].z, 0.0, baseValue))
        offsetRot = offsetRot +
            vector3(lerp(loweredOffset[2].x, 0.0, baseValue), lerp(loweredOffset[2].y, 0.0, baseValue),
                lerp(loweredOffset[2].z, 0.0, baseValue))
        DetachEntity(vehicleBed, 0, 0)
        AttachEntityToEntity(vehicleBed, lastVehicle, GetEntityBoneIndexByName(lastVehicle, "chassis"), offsetPos,
            offsetRot, 0, 0, 1, 0, 0, 1)
        baseValue = baseValue + (1.0 * Timestep()) / 2.0
    until baseValue >= 1.0
    baseValue = 0.0
    repeat
        Citizen.Wait(10)
        local offsetPos = raisedOffset[1]
        local offsetRot = raisedOffset[2]
        offsetPos = offsetPos +
            vector3(lerp(backOffset[1].x, 0.0, baseValue), lerp(backOffset[1].y, 0.0, baseValue),
                lerp(backOffset[1].z, 0.0, baseValue))
        offsetRot = offsetRot +
            vector3(lerp(backOffset[2].x, 0.0, baseValue), lerp(backOffset[2].y, 0.0, baseValue),
                lerp(backOffset[2].z, 0.0, baseValue))
        DetachEntity(vehicleBed, 0, 0)
        AttachEntityToEntity(vehicleBed, lastVehicle, GetEntityBoneIndexByName(lastVehicle, "chassis"), offsetPos,
            offsetRot, 0, 0, 1, 0, 0, 1)
        baseValue = baseValue + (1.0 * Timestep()) / 4.0
    until baseValue >= 1.0
    baseValue = 0.0
    TriggerServerEvent("origen-towtruck:server:addData", "status", NetworkGetNetworkIdFromEntity(lastVehicle), false)
    flatStatus = false
    progress = false
    SendNUIMessage({
        action = "nui:setFlatBedProgress",
        data = nil
    })
end
local putHook = function()
    local playerPed = PlayerPedId()
    Koci.requestAnim("anim@am_hold_up@male")
    TaskPlayAnim(playerPed, "anim@am_hold_up@male", "shoplift_high", 2.0, 8.0, -1, 50, 0, 0, 0, 0)
    Citizen.Wait(300)
    ClearPedTasks(playerPed)
    DeleteEntity(hookProp)
    TriggerServerEvent("origen-towtruck:server:putHook", NetworkGetNetworkIdFromEntity(vehicleBed))
    hookInHandle = false
    hookDropped = false
    progress = false
end

RegisterNetEvent("origen-towtruck:client:putHook", function(netId)
    local flatbed = NetworkGetEntityFromNetworkId(netId)
    if not ropes[flatbed] then
        return
    end
    DeleteRope(ropes[flatbed].rope)
end)
local takeHook = function(bedOffset)
    local playerPed = PlayerPedId()
    Koci.requestModel("prop_rope_hook_01")
    hookProp = CreateObjectNoOffset("prop_rope_hook_01", GetEntityCoords(PlayerPedId()), true, false, false)
    while not DoesEntityExist(hookProp) or not NetworkDoesNetworkIdExist(NetworkGetNetworkIdFromEntity(hookProp)) do
        Citizen.Wait(10)
    end
    SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(hookProp), true)
    NetworkSetNetworkIdDynamic(NetworkGetNetworkIdFromEntity(hookProp), true)
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(hookProp), false)
    AttachEntityToEntity(hookProp, playerPed, GetPedBoneIndex(playerPed, 0x49D9), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true,
        true, false, true, 1, true)
    Citizen.SetTimeout(250, function()
        TriggerServerEvent("origen-towtruck:server:takeHook", NetworkGetNetworkIdFromEntity(vehicleBed),
            NetworkGetNetworkIdFromEntity(hookProp), bedOffset)
    end)
    hookInHandle = true
    progress = false
end
local retakeHook = function()
    local playerPed = PlayerPedId()
    Koci.requestAnim("anim@mp_snowball")
    TaskPlayAnim(playerPed, "anim@mp_snowball", "pickup_snowball", 2.0, 8.0, -1, 50, 0, 0, 0, 0)
    Citizen.Wait(500)
    ClearPedTasks(playerPed)
    AttachEntityToEntity(hookProp, playerPed, GetPedBoneIndex(playerPed, 0x49D9), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true,
        true, false, true, 1, true)
    hookDropped = false
    hookInHandle = true
    progress = false
end

RegisterNetEvent("origen-towtruck:client:takeHook", function(bed, prop, offset)
    local playerPed = PlayerPedId()
    local flatbed = NetworkGetEntityFromNetworkId(bed)
    local hProp = NetworkGetEntityFromNetworkId(prop)
    ropes[flatbed] = {}
    RopeLoadTextures()
    while not RopeAreTexturesLoaded() do Citizen.Wait(10) end
    ropes[flatbed].rope = AddRope(offset.x, offset.y, offset.z, 0.0, 0.0, 0.0, 1.0, 4, 1.0, 1.0, 0, 0, 0, 0, 0, 0)
    while not ropes[flatbed].rope do Citizen.Wait(0) end
    local hookPropCoords = GetOffsetFromEntityInWorldCoords(hProp, 0.0, 0.0, 0.0)
    AttachEntitiesToRope(ropes[flatbed].rope, flatbed, hProp, offset.x, offset.y, offset.z + 0.2, hookPropCoords.x,
        hookPropCoords.y, hookPropCoords.z, 19.0, false, false, "rope_attach_a", "rope_attach_b")
end)
local dropHook = function()
    DetachEntity(hookProp, true, true)
    hookDropped = true
    hookInHandle = false
    progress = false
end
local detachVehicle = function(vehicle, bedOffset)
    DeleteEntity(hookProp)
    TriggerServerEvent("origen-towtruck:server:putHook", NetworkGetNetworkIdFromEntity(vehicleBed))
    hookAttached = false
    progress = false
end
local EnumerateEntities = function(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
        local iter, id = initFunc()
        if not id or id == 0 then
            disposeFunc(iter)
            return
        end
        local enum = { handle = iter, destructor = disposeFunc }
        setmetatable(enum, entityEnumerator)
        local next = true
        repeat
            coroutine.yield(id)
            next, id = moveFunc(iter)
        until not next
        enum.destructor, enum.handle = nil, nil
        disposeFunc(iter)
    end)
end
local EnumerateVehicles = function()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end
local getNearestVehicle = function(coords, radius)
    local closestVehicle = nil
    for vehicle in EnumerateVehicles() do
        if vehicle ~= lastVehicle and DoesEntityExist(vehicle) and not Config.FlatBed.blacklistClass[GetVehicleClass(vehicle)] then
            local vehCoords = GetEntityCoords(vehicle)
            local vehDst = #(coords - vehCoords)
            if vehDst < radius then
                closestVehicle = vehicle
            end
        end
    end
    return closestVehicle
end

attachVehicle = function(vehicle, bedOffset)
    DetachEntity(hookProp, true, true)
    if DoesEntityExist(hookProp) then
        DeleteEntity(hookProp)
    end
    TriggerServerEvent("origen-towtruck:server:attachVehicle", NetworkGetNetworkIdFromEntity(vehicleBed),
        NetworkGetNetworkIdFromEntity(vehicle), bedOffset)
    hookAttached = true
    hookInHandle = false
    progress = false
    Citizen.CreateThread(function()
        while not vehicleHooked and DoesEntityExist(vehicleBed) do
            local dst = #(GetEntityCoords(vehicleBed) - GetEntityCoords(vehicle))
            if dst >= 19 and hookAttached then
                detachVehicle(vehicle, bedOffset)
            end
            Citizen.Wait(500)
        end
    end)
end

RegisterNetEvent("origen-towtruck:client:attachVehicle", function(bed, vehicle, offset)
    local flatbed = NetworkGetEntityFromNetworkId(bed)
    local vehicle = NetworkGetEntityFromNetworkId(vehicle)
    local ropeLength = #(offset - GetEntityCoords(vehicle))
    DeleteRope(ropes[flatbed].rope)
    ropes[flatbed].rope = AddRope(GetEntityCoords(vehicle), 0.0, 0.0, 0.0, ropeLength, 4, ropeLength, 0.1, 0.5, false,
        false, true, 1.0, false)
    while not ropes[flatbed].rope do Citizen.Wait(0) end
    AttachEntitiesToRope(ropes[flatbed].rope, flatbed, vehicle, offset.x, offset.y, offset.z,
        GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "bodyshell")), ropeLength, false, false,
        0, 0)
    ActivatePhysics(ropes[flatbed].rope)
    local soundId = GetSoundId()
    PlaySoundFromEntity(soundId, "OPENED", flatbed, "DOOR_GARAGE", false, 0)
end)

RegisterNetEvent("origen-towtruck:client:windVehicle", function(bed, state)
    local flatbed = NetworkGetEntityFromNetworkId(bed)
    if not ropes[flatbed].soundId then
        ropes[flatbed].soundId = GetSoundId()
    end
    if state then
        PlaySoundFromEntity(ropes[flatbed].soundId, "CLOSING", flatbed, "DOOR_GARAGE", false, 0)
        StartRopeWinding(ropes[flatbed].rope)
        Citizen.CreateThread(function()
            while vehicleWinding do
                RopeResetLength(ropes[flatbed].rope, RopeGetDistanceBetweenEnds(ropes[flatbed].rope))
                Citizen.Wait(250)
            end
        end)
    else
        StopRopeWinding(ropes[flatbed].rope)
        StopSound(ropes[flatbed].soundId)
    end
end)

local bedControllerVisible = false

function attachVehicleLogic(vehicle, offset)
    SetVehicleBrake(vehicle, false)
    SetVehicleHandbrake(vehicle, false)
    local vehicleNetId = VehToNet(vehicle)
    SetNetworkIdExistsOnAllMachines(vehicleNetId, true)
    NetworkSetNetworkIdDynamic(vehicleNetId, true)
    SetNetworkIdCanMigrate(vehicleNetId, false)
    NetworkRequestControlOfNetworkId(vehicleNetId)
    attachVehicle(vehicle, offset)
end

Citizen.CreateThread(function()
    Wait(1000)
    createPed()
    while true do
        local sleep = 1000
        local playerPed = PlayerPedId()
        local pCoords = GetEntityCoords(playerPed)
        local playerVehicle = GetVehiclePedIsUsing(playerPed)
        if not DoesEntityExist(lastVehicle) or NetworkGetEntityOwner(lastVehicle) ~= PlayerId() then
            lastVehicle = nil
        end
        if IsPedInAnyVehicle(playerPed) and GetPedInVehicleSeat(playerVehicle, -1) == playerPed then
            if not inVehicle then
                inVehicle = true
                if isTextUIOpen then
                    lib.hideTextUI()
                    isTextUIOpen = false
                end
            end
            if playerVehicle ~= lastVehicle then
                if GetEntityModel(playerVehicle) == GetHashKey(Config.FlatBed.vehicleModel) then
                    lastVehicle = playerVehicle
                    Koci.triggerCallback("origen-towtruck:server:getVehicleStatus", function(retval)
                        if retval.vehData.bedId then
                            vehicleBed = NetworkGetEntityFromNetworkId(retval.vehData.bedId)
                        else
                            SetVehicleExtra(playerVehicle, 1, true)
                            createBed()
                        end
                        flatStatus = retval.vehData.status
                    end, { vehId = NetworkGetNetworkIdFromEntity(lastVehicle) })
                    SendNUIMessage({
                        action = "nui:setRouter",
                        data = "flatbed_control"
                    })
                    SendNUIMessage({
                        action = "nui:setVisible",
                        data = true
                    })
                end
            end
            if GetEntityModel(playerVehicle) == GetHashKey(Config.FlatBed.vehicleModel) then
                if not bedControllerVisible then
                    bedControllerVisible = true
                    SendNUIMessage({
                        action = "nui:setRouter",
                        data = "flatbed_control"
                    })
                    SendNUIMessage({
                        action = "nui:setVisible",
                        data = true
                    })
                end
                if GetEntitySpeed(playerVehicle) <= 5 then
                    sleep = 1
                    if IsControlJustPressed(0, 36) and not progress then
                        SetNuiFocus(bedControllerVisible, bedControllerVisible)
                        bedControllerVisible = not bedControllerVisible
                    end
                elseif isTextUIOpen then
                    lib.hideTextUI()
                    isTextUIOpen = false
                end
            end
        else
            if inVehicle then
                inVehicle = false
                if isTextUIOpen then
                    lib.hideTextUI()
                    isTextUIOpen = false
                end
                if bedControllerVisible then
                    bedControllerVisible = false
                    SendNUIMessage({
                        action = "nui:setVisible",
                        data = false
                    })
                    SendNUIMessage({
                        action = "nui:setRouter",
                        data = "home"
                    })
                end
            end
        end
        if flatStatus then
            sleep = 1
            local bedDimension = GetModelDimensions(GetEntityModel(vehicleBed))
            local bedOffset = GetOffsetFromEntityInWorldCoords(vehicleBed, -0.2, bedDimension["y"] + 6.75, 0.2)
            local bedDst = #(pCoords - bedOffset)
            local closestVehicle = getNearestVehicle(pCoords, 3.0)
            local vehDst = closestVehicle and #(pCoords - GetEntityCoords(closestVehicle)) or nil

            if bedDst <= 2 then
                if not hookInHandle and not hookDropped and not hookAttached and not vehicleHooked then
                    Koci.showHelpText(Koci.getPhrase("take-hook"))
                    if IsControlJustPressed(0, 38) and not progress then
                        Koci.showNotification(Koci.getPhrase("warning-take-hook"))
                        progress = true
                        takeHook(bedOffset)
                    end
                elseif hookInHandle and not hookDropped and not hookAttached and not vehicleHooked then
                    Koci.showHelpText(Koci.getPhrase("put-hook"))
                    if IsControlJustPressed(0, 38) and not progress then
                        progress = true
                        putHook()
                    end
                elseif not hookInHandle and not hookDropped and hookAttached and not vehicleHooked then
                    local ropeLength = #(bedOffset - GetEntityCoords(winchVehicle))
                    if ropeLength > 3.0 and not vehicleHooked then
                        if not vehicleWinding then
                            Koci.showHelpText(Koci.getPhrase("wind-vehicle"))
                        end
                        if IsControlJustPressed(0, 74) and not progress then
                            if not vehicleWinding then
                                vehicleWinding = true
                                TriggerServerEvent("origen-towtruck:server:windVehicle",
                                    NetworkGetNetworkIdFromEntity(vehicleBed), true)
                            end
                        end
                    else
                        if vehicleWinding then
                            vehicleWinding = false
                            TriggerServerEvent("origen-towtruck:server:windVehicle",
                                NetworkGetNetworkIdFromEntity(vehicleBed), false)
                        end
                    end
                    if ropeLength <= 3.20 and not vehicleHooked then
                        Koci.showHelpText(Koci.getPhrase("hook-vehicle"))
                        if IsControlPressed(0, 38) and not progress then
                            TriggerServerEvent("origen-towtruck:server:putHook", NetworkGetNetworkIdFromEntity(vehicleBed))
                            hookProp, hookRope, hookInHandle, hookDropped, hookAttached = nil, nil, false, false, false
                            AttachEntityToEntity(winchVehicle, vehicleBed, nil,
                                GetOffsetFromEntityGivenWorldCoords(vehicleBed, GetEntityCoords(winchVehicle)),
                                vector3(0.0, 0.0, 0.0), false, false, true, false, 0, true)
                            Citizen.Wait(250)
                            if createdVehicle == winchVehicle then
                                rotationFinish()
                            end
                            vehicleHooked = true
                            progress = false
                        end
                    end
                elseif not hookInHandle and not hookDropped and not hookAttached and vehicleHooked and not progress then
                    Koci.showHelpText(Koci.getPhrase("unhook-vehicle"))
                    if IsControlPressed(0, 38) and not progress then
                        progress = true
                        vehicleHooked = false
                        DetachEntity(winchVehicle)
                        progress = false
                    end
                end
            else
                if not hookInHandle and not hookDropped and not hookAttached and not vehicleHooked and isTextUIOpen then
                    lib.hideTextUI()
                    isTextUIOpen = false
                end
                if not hookInHandle and not hookDropped and hookAttached then
                    if isTextUIOpen then
                        lib.hideTextUI()
                        isTextUIOpen = false
                    end
                    if not vehicleHooked then
                        if vehicleWinding then
                            vehicleWinding = false
                            TriggerServerEvent("origen-towtruck:server:windVehicle",
                                NetworkGetNetworkIdFromEntity(vehicleBed), false)
                        end
                    end
                end
                if not hookInHandle and not hookDropped and not hookAttached and vehicleHooked and not progress then
                    if isTextUIOpen then
                        lib.hideTextUI()
                        isTextUIOpen = false
                    end
                end
            end
            if bedDst >= 19 and hookInHandle and not hookDropped then
                progress = true
                dropHook()
            elseif hookInHandle and not hookDropped and (not closestVehicle or (closestVehicle and vehDst > 3)) then
                Koci.showHelpText(Koci.getPhrase("drop-hook"))
                if IsControlJustPressed(0, 74) and not progress then
                    progress = true
                    dropHook()
                end
            elseif hookInHandle and not hookDropped and closestVehicle and vehDst <= 3 then
                local hookDst = #(pCoords - GetEntityCoords(hookProp))
                if closestVehicle and vehDst <= 3 and not progress and not hookAttached then
                    Koci.showHelpText(Koci.getPhrase("attach-vehicle"))
                    if IsControlJustPressed(0, 38) then
                        progress = true
                        winchVehicle = closestVehicle
                        attachVehicleLogic(closestVehicle, bedOffset)
                        lib.hideTextUI()
                        isTextUIOpen = false
                    end
                end
            elseif hookDropped and hookProp then
                local hookDst = #(pCoords - GetEntityCoords(hookProp))
                if hookDst <= 1.5 then
                    Koci.showHelpText(Koci.getPhrase("retake-hook"))
                    if IsControlJustPressed(0, 38) then
                        progress = true
                        retakeHook()
                    end
                end
            end
            if bedDst >= 19 and isTextUIOpen then
                lib.hideTextUI()
                isTextUIOpen = false
            end
        end
        Citizen.Wait(sleep)
    end
end)

local addHelpBlip = function(coords, helpId)
    callBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(callBlip, 225)
    SetBlipColour(callBlip, 67)
    SetBlipScale(callBlip, 0.8)
    SetBlipAsShortRange(callBlip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Koci.getPhrase("broken-vehicle"))
    EndTextCommandSetBlipName(callBlip)
    SetBlipRoute(callBlip, true)
    Citizen.CreateThread(function()
        local _coords = vector3(coords.x, coords.y, coords.z)
        while true do
            local sleep = 1000
            local pCoords = GetEntityCoords(PlayerPedId())
            local dst = #(pCoords - _coords)
            if dst <= 20 then
                sleep = 1
                if dst <= 15 then
                    if DoesBlipExist(callBlip) then
                        RemoveBlip(callBlip)
                    end
                    TriggerServerEvent("origen-towtruck:server:finishCall", helpId)
                    break
                end
            end
            Citizen.Wait(sleep)
        end
    end)
end

RegisterNetEvent("origen-towtruck:client:callTowTruck", function(helpId, coords)
    if not inJob then
        return
    end
    local street1, street2 = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local location = GetStreetNameFromHashKey(street1) .. " " .. GetStreetNameFromHashKey(street2)
    SendNUIMessage({
        action = "nui:addCallsForHelp",
        data = {
            helpId = helpId,
            coords = coords,
            location = location
        }
    })
    Koci.showNotification(Koci.getPhrase("call-header"))
end)

toggleJob = function(data)
    if DoesEntityExist(createdVehicle) then
        DeleteEntity(createdVehicle)
    end
    if DoesEntityExist(spawnedFlatbed) then
        DeleteEntity(spawnedFlatbed)
    end
    if DoesEntityExist(vehicleBed) then
        DeleteEntity(vehicleBed)
    end
    if DoesBlipExist(vehicleBlip) then
        RemoveBlip(vehicleBlip)
    end
    if DoesBlipExist(finishBlip) then
        RemoveBlip(finishBlip)
    end
    if not inJob then
        local spawnPoint = Koci.getClearSpawnPoint(data.spawnCoords)
        if spawnPoint then
            progress = true
            spawnFlatBed(spawnPoint)
            progress = false
        else
            Koci.showNotification(Koci.getPhrase("not-available-spawnpoint"))
        end
    else
        inJob = false
    end
end

-- aliko.
function GetCharacterName()
    if Config.Framework == "esx" then
        return PlayerData.firstName .. " " .. PlayerData.lastName
    else
        return (PlayerData.charinfo.firstname .. " " .. PlayerData.charinfo.lastname)
    end
end

function GetPlayerPhoto()
    return myPhoto
end

function GetPlayerLevel()
    return myLevel
end

function GetPlayerRep()
    return myExp
end

function GetPlayerNextLevelRep()
    return Config.JobOptions.ranks[GetPlayerLevel() + 1]
end

function SendPlayerProfile()
    SendNUIMessage({
        action = "nui:setPlayerProfile",
        data = {
            characterName = GetCharacterName(),
            photo = GetPlayerPhoto(),
            level = GetPlayerLevel(),
            exp = GetPlayerRep(),
            nextLeveLExp = GetPlayerNextLevelRep(),
            completedTasks = myCompletedTasks
        }
    })
end

function SetNuiVisible()
    SendNUIMessage({
        action = "nui:setRouter",
        data = "home"
    })
    SendNUIMessage({
        action = "nui:setVisible",
        data = true
    })
    SetNuiFocus(true, true)
end

function SendTop10()
    Koci.triggerCallback("origen-towtruck:server:getTopRanks", function(retval)
        SendNUIMessage({
            action = "nui:setTopRank",
            data = retval
        })
    end)
end

function SendAcceptableJobs()
    for i, job in ipairs(Config.AcceptableJobs) do
        job.id = i
        local street1, street2 = GetStreetNameAtCoord(job.coords.x, job.coords.y, job.coords.z)
        job.location = GetStreetNameFromHashKey(street1) .. " " .. GetStreetNameFromHashKey(street2)
    end
    SendNUIMessage({
        action = "nui:setAcceptableJobs",
        data = Config.AcceptableJobs
    })
end

function StartUI()
    SendNUIMessage({
        action = "nui:setLocale",
        data = Config.Locales.ui
    })
    Wait(1)
    SendNUIMessage({
        action = "nui:setJobSettings",
        data = {
            maxExp = Config.JobOptions.maxExp,
            ranks = Config.JobOptions.ranks
        }
    })
    Wait(1)
    SendAcceptableJobs()
    Wait(1)
    SendPlayerProfile()
end

RegisterNUICallback("ui:hideFrame", function(_, cb)
    isTabletOpen = false
    SetNuiFocus(false, false)
    cb(true)
end)

AddEventHandler("onResourceStop", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    if isTabletOpen then
        SetNuiFocus(false, false)
    end
    lib.hideTextUI()
end)
AddEventHandler("onResourceStart", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    CreateThread(function()
        while not PlayerData do
            Wait(200)
        end
        Wait(1000)
        Koci.triggerCallback("origen-towtruck:server:getData", function(data)
            if data then
                myLevel = data.level
                myExp = data.exp
                myPhoto = data.photo
            end
            StartUI()
        end)
    end)
end)

RegisterNUICallback("nui:updateProfilePhoto", function(newProfile, cb)
    myPhoto = newProfile
    TriggerServerEvent("origen-towtruck:server:updateProfilePhoto", newProfile)
    cb(true)
end)

RegisterNUICallback("nui:StartNewJob", function(data, cb)
    if isStartJob then
        Koci.showNotification(Koci.getPhrase("already-have-job"))
        cb(false)
        return
    elseif myCompletedTasks[data.id] then
        Koci.showNotification(Koci.getPhrase("already-taken-task"))
        cb(false)
        return
    end
    isStartJob = data
    rotationFlatbed(data)
    cb(true)
end)

RegisterNUICallback("nui:toggleFlatBed", function(data, cb)
    if not flatStatus then
        if not progress then
            flatBedEnable()
        end
    else
        if not progress then
            flatBedDisable()
        end
    end
    cb(true)
end)

RegisterNUICallback("nui:confirmHelpRequest", function(data, cb)
    TriggerServerEvent("origen-towtruck:server:confirm", data)
    cb(true)
end)

RegisterNUICallback("ui:setNuiFocus", function(data, cb)
    SetNuiFocus(data, data)
    cb(true)
end)

RegisterNetEvent("origen-towtruck:client:addHelpBlip", function(helpId, coords)
    addHelpBlip(coords, helpId)
end)

RegisterNetEvent("origen-towtruck:client:RemoveHelpRequest", function(helpId)
    if not inJob then return end
    SendNUIMessage({
        action = "nui:removeCallsForHelp",
        data = {
            helpId = helpId
        }
    })
end)
