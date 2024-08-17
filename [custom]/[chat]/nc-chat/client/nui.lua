RegisterNUICallback("nui:hideChat", function(data, cb)
    Koci.Client:SendReactMessage("ui:hideChat")
    SetNuiFocus(false, false)
    cb(true)
end)

RegisterNUICallback("nui:processInput", function(command, cb)
    if command == Config.JobInfoCommand then
        Koci.Client:LearnPlayerJob()
    elseif command == Config.MoneyInfoCommand then
        Koci.Client:LearnPlayerBalance()
    else
        ExecuteCommand(command)
    end
    cb(true)
end)

RegisterNUICallback("nui:setNuiFocus", function(status, cb)
    SetNuiFocus(status, status)
    cb(true)
end)

RegisterNUICallback("nui:updateNameColor", function(newColor, cb)
    if Config.CustomNameColor then
        Koci.Client.Name.color = newColor
    end
    onUpdateAnyNameValue()
    cb(true)
end)

RegisterNUICallback("nui:updateNameTag", function(newTag, cb)
    if Config.CustomNameTag then
        Koci.Client.Name.tag = newTag
    end
    onUpdateAnyNameValue()
    cb(true)
end)

RegisterNUICallback("nui:updateMeDoPP", function(newPP, cb)
    Koci.Client.MeDoPP = newPP
    onUpdateMeDoPP()
    cb(true)
end)

RegisterNUICallback("nui:RollTheDice", function(data, cb)
    Koci.Client:RollTheDice()
    cb(true)
end)
RegisterNUICallback("nui:RPS", function(data, cb)
    Koci.Client:RPS()
    cb(true)
end)
