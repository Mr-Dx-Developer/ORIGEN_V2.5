local isNuiOpen = false
local myData = {}
local myCoords = {}
local myDistance = 0

function closeNui()
    isNuiOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "close"
    })
end

function openTextUi(data,coords,distance)
    isNuiOpen = true
    myData = data
    myCoords = coords
    myDistance = distance
    if not isNuiOpen then
        closeNui()
        return
    end
    
    local playerCoords = GetEntityCoords(PlayerPedId())
    local itemCoords = coords
    
    if IsControlJustReleased(0, 177) then
        closeNui()
        return
    elseif IsControlJustReleased(0, 300) then
        SendNUIMessage({
            action = "key",
            key = "up"
        })
    elseif IsControlJustReleased(0, 299) then
        SendNUIMessage({
            action = "key",
            key = "down"
        })
    elseif IsControlJustReleased(0, 38) then
        SendNUIMessage({
            action = "key",
            key = "enter"
        })
    end

        SendNUIMessage({
            action = "open",
            data = data
        })
end
exports("openTextUi", openTextUi)


function closeTextUi()
    closeNui()
end
exports("closeTextUi", closeTextUi)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isNuiOpen then
            local playerCoords = GetEntityCoords(PlayerPedId())
            local itemCoords = myCoords

            local dist = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, itemCoords.x, itemCoords.y, itemCoords.z)
            if dist > myDistance then
                closeNui()
            end
        end
    end
end)


RegisterNUICallback("enter",function(data,cb)
    TriggerEvent(myData["item"][data.currentIndex+1].event,myData["item"][data.currentIndex+1].eventData)
end)
