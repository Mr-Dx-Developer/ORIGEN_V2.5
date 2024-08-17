ESX, QBCore = nil, nil


if Config.Framework == 'ESX' then
    TriggerEvent(Config.FrameworkTriggers.main, function(obj) ESX = obj end)
elseif Config.Framework == 'QBCORE' then
    TriggerEvent(Config.FrameworkTriggers.main, function(obj) QBCore = obj end)
    if QBCore == nil then
        QBCore = exports[Config.FrameworkTriggers.resource_name]:GetCoreObject()
    end
end


if Config.Framework == 'ESX' then
    for k,_ in pairs (Config.Items) do
        ESX.RegisterUsableItem(k, function(source)
            TriggerClientEvent('fc_rendermenu:checkmenu', source, k)
        end)
    end
else
    for k,_ in pairs (Config.Items) do
        QBCore.Functions.CreateUseableItem(k, function(source, item)
            local Player = QBCore.Functions.GetPlayer(source)
            if not Player.Functions.GetItemByName(item.name) then return end
            TriggerClientEvent('fc_rendermenu:checkmenu', source, k)
        end)
    end
end
