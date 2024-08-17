function openGui(clr,msg,time)
    guiEnabled = true
    SendNUIMessage({runProgress = true, colorsent = clr, textsent = msg, fadesent = time})
end


RegisterNetEvent("origen-notify:sendNotify")
AddEventHandler("origen-notify:sendNotify", function(color,message,time)
    openGui(color,message,time)
end)



-- Un comment for testing
-- RegisterCommand("taskdemo", function()
--     openGui(1, "Regular Message", 6000)
-- end)