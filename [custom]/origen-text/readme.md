item = {
    ["item"] = {[1] = {name = AC.HackText,event = "ac:hack-openMenu"},
    [2] = {name = AC.BuildText, event = "ac:hack:openDesk"}},
}

exports["origen-text"]:openTextUi(item,v.position,3)

Example usage is as follows. If you need to enter data in the event, do not forget to add eventData = as in line 37.

Citizen.CreateThread(function()
    local sleep = 1000  
    while true do 
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for k, v in pairs(cacheData) do
            if playerData.identifier == v.identifier then
                if props then
                    for k, v in pairs(v.props) do

                        if v.itemType == "desk" then 
                            local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, v.position.x, v.position.y, v.position.z)
                            if distance ~= -1 and distance <= 1.5 then
                                item = {["item"] = {[1] = {name = AC.HackText,event = "ac:hack-openMenu"},[2] = {name = AC.BuildText, event = "ac:hack:openDesk"}},}
                                exports["origen-text"]:openTextUi(item,v.position,3)
                                sleep = 1
                                if IsControlJustReleased(0, 38) then 
                                    openMenu()
                                elseif IsControlJustReleased(0, 23) then 
                                    openBuildPage()
                                end
                            end 
                        elseif v.itemType == "miner" then
                            local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, v.position.x, v.position.y, v.position.z)
                            if distance ~= -1 and distance <= 1.5 then
                                items = {["item"] = {[1] = {name = AC.MinerText,event = "origen-hack:openMiner",eventData=v.objId}},}
                                exports["origen-text"]:openTextUi(items,v.position,3)
                                sleep = 1
                                if IsControlJustReleased(0, 38) then 
                                    openMiner(v.objId)
                                end
                            end 
                        end
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end 
end)

RegisterNetEvent('origen-hack:openMiner')
AddEventHandler('origen-hack:openMiner',function(id)
    openMiner(id)
end)

RegisterNetEvent('ac:hack-openMenu')
AddEventHandler('ac:hack-openMenu', function()
    openMenu()
end)

RegisterNetEvent('ac:hack:openDesk')
AddEventHandler('ac:hack:openDesk', function()
    openBuildPage()
end)
