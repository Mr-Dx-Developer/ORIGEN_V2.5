### HOW TO USE

Colors:
1 - Normal
2 - Error
69 - Warning

# Event
RegisterNetEvent("np-notify:sendNotify")
AddEventHandler("np-notify:sendNotify", function(color,message,time)
    openGui(color,message,time)
end)


### Example

## Client Side
 # TriggerEvent("np-notify:sendNotify", 1, "Regular Message", 6000)

## Server Side
 # TriggerClientEvent("np-notify:sendNotify", source, 1, "Regular Message", 6000)

