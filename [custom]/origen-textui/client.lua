local peds = {}
local loaded = false

local function Open(x, y, key, text)
    SendNUIMessage({
        action = 'open',
        post = {
            x = x,
            y = y,
            key = key,
            text = text
        }
    })
end exports('Open', Open)

local function Close()
    SendNUIMessage({
        action = 'close'
    })
end exports('Close', Close)

local function AddClassic(vector, key, text, distance)
    peds[#peds+1] = {
        pedid = PlayerPedId(),
        coords = vector,
        key = key,
        text = text,
        distance = distance,
        insert = false,
        use = false
    }
end exports('AddTextUI', AddClassic)

local function AddClassicPed(ped, vector, key, text, distance)
    peds[#peds+1] = {
        pedid = ped,
        coords = vector,
        key = key,
        text = text,
        distance = distance,
        insert = false,
        use = true
    }
end exports('AddTextUIPed', AddClassicPed)

local function OpenC(x, y, k)
    SendNUIMessage({
        action = 'opencircle',
        post = {
            x = x,
            y = y,
            id = k
        }
    })
end exports('OpenC', OpenC)

local function CloseC(id)
    SendNUIMessage({
        action = 'closecircle',
        post = {id=id}
    })
end exports('CloseC', CloseC)

function GetCurrentEntityCoords(entity, bool)
    if bool then
        local entityCoord = GetEntityCoords(entity)
        local min, max = GetModelDimensions(GetEntityModel(entity))
        local height = (max.y - min.y) / 2
        local onScreen, coordX, coordY = GetHudScreenPositionFromWorldPosition(entityCoord.x, entityCoord.y + height, entityCoord.z)
        return onScreen, coordX-.035, coordY-.08
    else
        local entityCoord = GetEntityCoords(entity)
        local min, max = GetModelDimensions(GetEntityModel(entity))
        local height = (max.y - min.y) / 2
        local onScreen, coordX, coordY = GetHudScreenPositionFromWorldPosition(entityCoord.x, entityCoord.y + height, entityCoord.z)
        return onScreen, coordX-.01, coordY-0.01
    end
end

CreateThread(function()
    for k,v in pairs(Config.Peds) do
        while not HasModelLoaded(GetHashKey(v.ped)) do
            RequestModel(GetHashKey(v.ped))
            Wait(0) 
        end
        local ped2 = CreatePed(4, GetHashKey(v.ped), v.coords.x, v.coords.y, v.coords.z, v.coords.w, false, true)
        FreezeEntityPosition(ped2, true)
        SetEntityInvincible(ped2, true)
        SetBlockingOfNonTemporaryEvents(ped2, true)
        SetModelAsNoLongerNeeded(GetHashKey(v.ped))
        peds[#peds+1] = {
            pedid = NetworkGetNetworkIdFromEntity(ped2),
            coords = v.coords,
            key = v.key,
            text = v.text,
            distance = v.distance,
            insert = false,
            use = true
        }
    end

    for k,v in pairs(Config.Classic) do
        peds[#peds+1] = {
            pedid = PlayerPedId(),
            coords = v.coords,
            key = v.key,
            text = v.text,
            distance = v.distance,
            insert = false,
            use = false
        }
    end
    Wait(1000)
    loaded = true
end)

CreateThread(function()
    while true do
        local ms = 1000
        local indist = false

        if loaded then
            for k,v in pairs(peds) do
                local dist = #(GetEntityCoords(PlayerPedId()) - vector3(v.coords.x, v.coords.y, v.coords.z))

                if dist <= v.distance then
                    v.insert = false
                    CloseC(k)
                    indist = true
                    ms = 0
                    local _, x, y = GetCurrentEntityCoords(v.pedid, true)
                    Open(x, y, v.key, v.text)
                end
            end

            if not indist then
                Close()
            end
        end
        Wait(ms)
    end
end)

CreateThread(function()
    while true do
        local ms = 1000

        if loaded then
            for k,v in pairs(peds) do
                if v.use then
                    local dist = #(GetEntityCoords(PlayerPedId()) - vector3(v.coords.x, v.coords.y, v.coords.z))

                    if dist > v.distance and dist < v.distance+4.5 then
                        ms = 0
                        if not v.insert then
                            Wait(300)
                            v.insert = true
                            local _, x, y = GetCurrentEntityCoords(v.pedid, false)
                            OpenC(x, y, k)
                        else
                            local _, x2, y2 = GetCurrentEntityCoords(v.pedid, false)
                            SendNUIMessage({
                                action = 'updatecircle',
                                post = {
                                    id = k,
                                    x = x2,
                                    y = y2,
                                }
                            })
                        end
                    else
                        v.insert = false
                        CloseC(k)
                    end
                end
            end
        end
        Wait(ms)
    end
end)

local function drawText(key, text)
    SendNUIMessage({
        action = 'drawText',
        post = {
            key = key,
            text = text
        }
    })
end exports("drawText", drawText)

local function changeText(key, text)
    SendNUIMessage({
        action = 'changeText',
        post = {
            key = key,
            text = text
        }
    })
end exports("changeText", changeText)

local function drawTextClose()
    SendNUIMessage({
        action = 'drawTextClose',
    })
end exports("drawTextClose", drawTextClose)

local function drawTextPress()
    SendNUIMessage({
        action = 'drawTextPress',
    })
end exports("drawTextPress", drawTextPress)