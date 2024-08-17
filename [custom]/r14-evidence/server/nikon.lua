local QBCore = exports['qb-core']:GetCoreObject()

local ImageSpaces = {} -- for future functionality
local removeInProgress = false -- for future functionality


-----------------------------------------------------------------------------------------------------------
------------------------------------        Camera Webhooks         ---------------------------------------
-----------------------------------------------------------------------------------------------------------

local Webhooks = { -- these webhooks keys MUST MATCH your config keys
    [1] = 'https://discord.com/api/webhooks/1058428023336083466/jzMPmUEndV_cJvSdX_20X-snTn-ej3S6KSkZzzNvhltWU26QjJfuSxOG0cWmWIwbp_IE',--LSPD Discord
    [2] = 'https://discord.com/api/webhooks/1060559253187858442/US_WtUFEvfZTflNHXI6RGEQiozS9DbhFFUT5mtkK7JIRw6sfOH6bapO4qPppKqB4-eaZ',-- Staff Logs
    --[[[3] = '',
    [4] = '',
    [5] = '',
    [6] = '',
    [7] = '', ]]
}

-----------------------------------------------------------------------------------------------------------
------------------------------------         Initialization         ---------------------------------------
-----------------------------------------------------------------------------------------------------------

for k, v in pairs(Config.Camera) do
    local initialize = true

    if type(v) ~= 'table' then print(('Nikon initialization for %s has failed, please follow the camera guide and create a table, current data type is %s.'):format(k, type(v))) initialize = false end   
    if type(v.Path) ~= 'string' then print(('Nikon initialization for %s has failed, Path subfield is not a string, current data type is %s'):format(k, type(v.Path)))  initialize = false end
    if v.path == '' then print(('Nikon initialization for %s has failed, Path subfield is not a string, current data type is %s'):format(k, type(v.Path))) initialize = false end
    if Webhooks[k] == '' then print(('Nikon initialization for %s has failed, webhook is blank, please update your server-side webhooks table'):format(k)) initialize = false end

    if initialize then
        ImageSpaces[v.Path] = {}      
    end
end

-----------------------------------------------------------------------------------------------------------
------------------------------------        Camera Functions        ---------------------------------------
-----------------------------------------------------------------------------------------------------------

function RemovePhoto(imageSpace, photoId, photoTime) -- future functionality
    removeInProgress = true
    local count = 0
    local newphotos = table.clone(ImageSpaces[imageSpace])
    ImageSpaces[imageSpace] = {}

    for k, v in pairs(newphotos) do
        if k ~= photoId and v.time ~= photoTime then
            count = count + 1
            ImageSpaces[imageSpace][count] = v 
        end
    end
    removeInProgress = false
end

-----------------------------------------------------------------------------------------------------------
------------------------------------        Camera Events           ---------------------------------------
-----------------------------------------------------------------------------------------------------------

RegisterNetEvent('evidence:server:updateimagespace', function(photo, remove) -- for future functionality
    if not remove then
        local imageSpace = Config.Camera[photo.uploadPath].Path
        local imageSpaceSize = #ImageSpaces[imageSpace]

        ImageSpaces[imageSpace][imageSpaceSize + 1] = photo
    else -- for future functionality
        if removeInProgress then -- server already processing delete, cancel delete and have user try again
            TriggerClientEvent('nikon:client:canceldelete', source, 'System is already processing delete, please try again!')
            return
        else
            if not ImageSpaces[remove.imageSpace] or not ImageSpaces[remove.imageSpace][remove.photoId] then 
               TriggerClientEvent('nikon:client:canceldelete', source, 'System could not locate photo, please try again!') -- something has gone wrong, 
               return
            else
                RemovePhoto(Config.Camera[remove.imageSpace].Path, remove,photoId, remove.photoTime)
            end
        end
    end
end)

RegisterNetEvent('evidence:server:fetchnetphotos', function(data) -- for future functionality
    local imageSpace = Config.Camera[data.imageSpace].Path

    if Config.Camera[data.imageSpace].Password and data.password ~= Config.Camera[data.imageSpace].Password then return else end

    local sendpackage = {}
    local page = data.page - 1 or 0
    local amount = data.amount - 1 or 19
    local imageSpaceSize = #ImageSpaces[imageSpace]
    local loopStart = imageSpaceSize - (page * amount)
    local loopEnd = imageSpaceSize - (page * amount) - amount

    if ImageSpaces[imageSpace] and next(ImageSpaces[imageSpace]) then
        for i = loopStart, loopEnd , -1 do
            if ImageSpaces[imageSpace][i] then
                local v = table.clone(ImageSpaces[imageSpace][i])
                v.photoId = i
                sendpackage[#sendpackage + 1] = v
            end
        end
    end
  
    TriggerClientEvent('evidence:client:receivenetphotos', source, sendpackage, loopEnd > 1)
end)

RegisterNetEvent('evidence:server:uploadphoto', function(uploadPath, photo)
    if uploadPath == 1 or photo.uploadPath == 1 then print(("%s attempted to upload image to local storage via %s??? %s "):format(source, GetInvokingResource() or 'client', json.encode(photo))) return end

    local imageSpace = Config.Camera[uploadPath].Path

    local imageSpaceSize = #ImageSpaces[imageSpace]

    ImageSpaces[imageSpace][imageSpaceSize + 1] = photo

    PerformHttpRequest(Webhooks[uploadPath], function(err, text, headers) end, 'POST', json.encode({content = photo.url}), { ['Content-Type'] = 'application/json' })
end)

RegisterNetEvent("evidence:server:updatecamerainfo", function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player.PlayerData.items[data.slot] then
        Player.PlayerData.items[data.slot].info = data.info

        Player.Functions.SetInventory(Player.PlayerData.items, true)
    end
end)

RegisterNetEvent("evidence:server:updateSDcard", function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player.PlayerData.items[data.slot] then
        Player.PlayerData.items[data.slot].info.name = data.name

        Player.Functions.SetInventory(Player.PlayerData.items, true)
    end
end)

RegisterNetEvent('evidence:server:setinvbusy', function(bool) -- this disables inventory while in the camera
    Player(source).state.inv_busy = bool
end)

RegisterNetEvent('evidence:server:sdcard', function(data) -- this event handles giving and taking SD cards from the camera 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if data.info then
        if Player.Functions.AddItem("sdcard", 1, false, data.info) then
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["sdcard"], "add")
            TriggerClientEvent("evidence:client:confirmeject", src)
        else
            Config.Functions.ServerNotify(src, 'Something went wrong!', "error")
        end
    elseif data.slot then
        local photos = Player.PlayerData.items[data.slot].info.photos
        local name = Player.PlayerData.items[data.slot].info.name

        if Player.Functions.RemoveItem("sdcard", 1, data.slot) then
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["sdcard"], "remove")
            TriggerClientEvent("evidence:client:confirminsert", src, {name = name, photos = photos or {}})
        else
            Config.Functions.ServerNotify(src, 'Something went wrong!', "error")
        end
    end
end)

-----------------------------------------------------------------------------------------------------------
------------------------------------     Create Useable Items       ---------------------------------------
-----------------------------------------------------------------------------------------------------------

QBCore.Functions.CreateUseableItem("nikon", function(source, item)
    local src = source
    TriggerClientEvent("nikon:Toggle", src, item.slot, item.id)
end)

QBCore.Functions.CreateUseableItem("sdcard", function(source, item)
    local src = source
    TriggerClientEvent("nikon:useSDCard", src, item.slot)
end)

-----------------------------------------------------------------------------------------------------------
------------------------------------       Create Callbacks         ---------------------------------------
-----------------------------------------------------------------------------------------------------------

QBCore.Functions.CreateCallback('nikon:GetWebhook', function(source, cb, uploadPath)
    local webhook = false

    if uploadPath then       
        if not Webhooks[uploadPath] then print(('%s attempted to access a camera webhook for image space %s that does not exist, please ensure your main config and server webhooks table match.'):format(source, uploadPath)) webhook = 'missing' cb(webhook) return end
        if Webhooks[uploadPath] == '' then print(('%s attempted to access a blank camera webhook for image space %s, please check your server webhooks table.'):format(source, uploadPath)) webhook = 'blank' cb(webhook) return end

        webhook = Webhooks[uploadPath]
    else
        webhook = 'nopath'
        print(('%s attempted to access a camera webhook but supplied no upload path information, please check your config.'):format(source, uploadPath))       
    end

    cb(webhook)
end)
