cacheData = {}
objId = {}
obj = nil

-- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
--                                                        EVENT                                                        
-- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛

RegisterNetEvent('pa-props:dataPostClient')
AddEventHandler('pa-props:dataPostClient',function()
    TriggerClientEvent('pa-props:setClient',source,cacheData)
end)

RegisterNetEvent('pa-props:createUser')
AddEventHandler('pa-props:createUser', function(xPlayer,identifier)
    if not cacheData then
        cacheData = {}
    end

    for _, v in ipairs(cacheData) do
        if v.identifier == identifier then
            return  
        end
    end
     
    MySQL.Async.execute('INSERT INTO pa_props (`identifier`, `props`) VALUES (@identifier,@props)',
    {
        ['@identifier'] = identifier, 
        ['@props'] = json.encode({}), 
    })

    Wait(2000)

    MySQL.Async.fetchAll('SELECT * FROM pa_props WHERE identifier = @identifier', {['@identifier'] = identifier}, function(result)
        for k, v in pairs(result) do
            data = {
                id = v.id,
                identifier = v.identifier,
                props = v.props and json.decode(v.props) or {},
            }
            table.insert(cacheData, data)
        end
    end)

    TriggerClientEvent('pa-props:setClient', -1, cacheData)
    
end)

RegisterNetEvent('pa-props:createProp')
AddEventHandler('pa-props:createProp',function(prop,id)
    local src = source
    local xPlayer = GetPlayer(src)
    local identifier = GetPlayerCid(src)
    local propData = {} 
    local flag = false
    if cacheData == nil or #cacheData < 1 then
            
            TriggerEvent('pa-props:createUser', xPlayer,identifier)
    
            Wait(5000)
    
            table.insert(propData, prop)
            updateCacheDataForIdentifier(identifier, "props", propData)
            MySQL.Async.execute('UPDATE pa_props SET `props` = @props WHERE identifier = @identifier', 
            {
                ['@props'] = json.encode(propData), 
                ['@identifier'] = identifier
            })
            TriggerClientEvent('pa-props:setClient', -1, cacheData)
            return
    end


    for k,v in pairs(cacheData) do 
        if v.identifier == identifier then
            flag = true
            propData = type(v.props) == 'string' and json.decode(v.props) or v.props or {}
        end
    end

    for k , v in pairs(cacheData) do 
        if flag then 
            for x , y in pairs(v.props) do
                local coords1 = y.position
                local coords2 = prop.position
                    Notify(src,PA.Notify["notify"]["text"],PA.Notify["notify"]["msgType"],PA.Notify["notify"]["length"])
                    table.insert(propData, prop)
                    updateCacheDataForIdentifier(identifier, "props", propData)
                    MySQL.Async.execute('UPDATE pa_props SET `props` = @props WHERE identifier = @identifier', 
                    {
                        ['@props'] = json.encode(propData), 
                        ['@identifier'] = identifier
                    })
                    TriggerClientEvent('pa-props:setClient', -1, cacheData)
                    return
            end
        end
    end
end)

RegisterNetEvent('pa-money:addLastProp')
AddEventHandler('pa-money:addLastProp', function(item)
    local xPlayer =  GetPlayer(source)
    if item == nil then return end
    AddItem(source, item, 1, {})
end)

function NotifyClient(src, message, data)
    TriggerClientEvent(message, src, data)
end


AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then 
        return
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then 
        TriggerEvent('pa-props:getData')
        return
    end
end)


RegisterNetEvent('pa-props:getData')
AddEventHandler('pa-props:getData', function()

    local function fetchData(callback)
        MySQL.Async.fetchAll('SELECT * FROM pa_props', {}, function(result)
            callback(result)
        end)
    end

    fetchData(function(result)
        for k, v in pairs(result) do
            local data = {
                id = v.id,
                identifier = v.identifier,
                props = v.props and json.decode(v.props) or {},
            }
            table.insert(cacheData, data)
        end
    end)
end)


-- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
--                                                        FUNCTION                                                    
-- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛


function updateCacheData(id, property, value)
    for k, v in pairs(cacheData) do
        if v.id == id then
            v[property] = value
        end
    end
end

function updateCacheDataForIdentifier(identifier, property, value)
    for k, v in pairs(cacheData) do
        if v.identifier == identifier then
            v[property] = value
        end
    end
end




-- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
--                                                        CALLBACK                                                    
-- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛


CreateCallback('pa-props:getInventory', function(source,cb,searchItem)
    local xPlayer =  GetPlayer(source)
    local items = GetInventory(source)
    local itemArr = {}
    for k, v in pairs(items) do
        for x , y in pairs(searchItem) do 
        if v.name == y.itemName  then
                table.insert(itemArr, v)
            end 
        end
    end
    cb(itemArr)
end)


CreateCallback('pa-props:propItemControl', function(source,cb,data)
    local xPlayer =  GetPlayer(source)
    local item = GetItem(source, data.itemName)
    if item ~= nil then 
        if ItemCountControl(source, data.itemName,1) then
            RemoveItem(source, data.itemName, 1, {})
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end

end)




-- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛
--                                                        THREAD                                                    
-- ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛


