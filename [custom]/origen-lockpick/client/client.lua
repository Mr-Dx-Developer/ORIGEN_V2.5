dataReturn = nil 
t = 0

RegisterNUICallback("complete", function()
    SetNuiFocus(false, false)
    TriggerEvent("chatMessage", "SYSTEM", "error", "You completed the minigame!")
    dataReturn = true
end)

RegisterNetEvent("ac:lockpick:client:openLockpick")
AddEventHandler("ac:lockpick:client:openLockpick", function(header, text)
    exports['origen-lockpick']:acLockPick(150,"Car Robbery","You have 10 seconds to complete the minigame!")
end)

RegisterNUICallback("close", function()
    SetNuiFocus(false, false)
    dataReturn = false
end)

function acLockPick(duration, title, text)
    local result = nil

    SendNUIMessage({
        action = "MENU_OPEN",
        time = duration,
        title = title,
        text = text
    })
    SetNuiFocus(true, true)

    while true do 
        Wait(1000)
        t = t + 1
        
        if t == duration then
            return false
        end

        if dataReturn ~= nil then 
            return dataReturn
        end

    end

end

exports('acLockPick', acLockPick)

