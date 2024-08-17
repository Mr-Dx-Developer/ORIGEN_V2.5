-- Citizen.CreateThread(function()
--     while true do
--         sleep = 1000
--         for i, pos in ipairs(Pos) do
--             local playerPed = GetPlayerPed(-1)
--             local playerCoords = GetEntityCoords(playerPed)
--             local distance = GetDistanceBetweenCoords(playerCoords, pos.x, pos.y, pos.z, true)
--             if distance < 3.0 then
--                 sleep = 5
--                 if AC[i].job == "" or AC[i].job == " " then 
--                     DrawText3D(pos.x, pos.y, pos.z, "" .. AC[i].name .. " Press [E]")
--                         if IsControlJustReleased(0, 38) then
--                             SendNUIMessage({
--                                 action = "OPEN",
--                                 data = {
--                                     marketName = AC[i].name,
--                                     marketCategory = AC[i].category,
--                                     marketItemList = AC[i].itemList,
--                                     marketCategoryList = AC[i].categoryList,
--                                     marketJob = AC[i].job,
--                                 }
--                             })
--                             SetNuiFocus(true, true)
--                             sleep = 1000
--                         end
--                     else
--                         if AC[i].job ~= nil then
--                             local playerJob = QBCore.Functions.GetPlayerData().job.name
--                             if playerJob == AC[i].job then
--                                 DrawText3D(pos.x, pos.y, pos.z, "" .. AC[i].name .. " Press [E]")
--                                 if IsControlJustReleased(0, 38) then
--                                     SendNUIMessage({
--                                         action = "OPEN",
--                                         data = {
--                                             marketName = AC[i].name,
--                                             marketCategory = AC[i].category,
--                                             marketItemList = AC[i].itemList,
--                                             marketCategoryList = AC[i].categoryList,
--                                             marketJob = AC[i].job,
--                                         }
--                                     })
--                                     SetNuiFocus(true, true)
--                                     sleep = 1000
--                                 end
--                             end
--                         end
--                     end
--                 end      
--             end
--         Citizen.Wait(sleep)
--     end
-- end)

-- local drawText = false
-- if Config.UseTextUI then
--     Citizen.CreateThread(function()
--         while true do
--             local sleep = 1000 -- Initialize sleep to 1000 milliseconds
--             local playerCoords = GetEntityCoords(PlayerPedId())
--             local nearShop = false -- Flag to indicate if the player is near a shop
--             for k, v in pairs(Config.Shops) do
--                 for a, b in pairs(v.coords) do
--                     local dist = #(playerCoords - vector3(b.coords.x, b.coords.y, b.coords.z))
--                     if dist <= 5 then
--                         nearShop = true
--                         if not drawText then
--                             drawText = true
--                             exports['origen-textui']:drawText('E', 'Open Shop')
--                         end
--                         sleep = 0 -- Set sleep to 0 if 'E' key is pressed
--                         if IsControlPressed(0, 38) then
--                             exports['origen-textui']:drawTextPress()
--                             openShop(v.name, v.label, v.categories, v.type)
--                         end
--                     end
--                 end
--             end
--             if not nearShop then
--                 drawText = false
--                 exports['origen-textui']:drawTextClose()
--             end
--             Citizen.Wait(sleep) -- Wait for the specified duration
--         end
--     end)
-- end







-- local pedSpawned = false
-- function createPeds()
--     if pedSpawned then return end
--     for k, v in pairs(Config.Shops) do
--         local pedHash2 = type(v.pedHash) == "number" and v.pedHash or joaat(v.pedHash)
--         RequestModel(pedHash2)
--         while not HasModelLoaded(pedHash2) do
--             Citizen.Wait(0)
--         end
--         for a, b in pairs(v.coords) do
--             b.ped = CreatePed(0, pedHash2, b.coords.x, b.coords.y, b.coords.z - 1, b.coords.w, false, false)
--             TaskStartScenarioInPlace(b.ped, v.scenario, 0, true)
--             FreezeEntityPosition(b.ped, true)
--             SetEntityInvincible(b.ped, true)
--             SetBlockingOfNonTemporaryEvents(b.ped, true)
--             pedSpawned = true
--             if Config.UseTextUI == false then
--                 exports['qb-target']:AddTargetEntity(b.ped, {
--                     options = {
--                         {
--                             label = v.name .. ' | ' .. v.label,
--                             icon = 'fa-solid fa-basket-shopping',
--                             action = function()
--                                 openShop(v.name, v.label, v.categories, v.type)
--                             end
--                         }
--                     },
--                     distance = 3.0
--                 })
--             end
--         end
--     end
-- end

if Config.UseTextUI then
    Citizen.CreateThread(function()
        while true do
            local sleep = 1000
            local playerCoords = GetEntityCoords(PlayerPedId())
            for k, v in pairs(Config.Shops) do
                for a, b in pairs(v.coords) do
                    local dist = #(playerCoords - vector3(b.coords.x, b.coords.y, b.coords.z))
                    if dist <= 3 then
                        sleep = 0
                        if IsControlJustPressed(0, 38) then
                            openShop(v.name, v.label, v.categories, v.type)
                        end
                    end
                end
            end
            Citizen.Wait(sleep)
        end
    end)
end

local pedSpawned = false
function createPeds()
    if pedSpawned then return end
    for k, v in pairs(Config.Shops) do
        local pedHash2 = type(v.pedHash) == "number" and v.pedHash or joaat(v.pedHash)
        RequestModel(pedHash2)
        while not HasModelLoaded(pedHash2) do
            Citizen.Wait(0)
        end
        for a, b in pairs(v.coords) do
            b.ped = CreatePed(0, pedHash2, b.coords.x, b.coords.y, b.coords.z - 1, b.coords.w, false, true)
            TaskStartScenarioInPlace(b.ped, v.scenario, 0, true)
            FreezeEntityPosition(b.ped, true)
            SetEntityInvincible(b.ped, true)
            SetBlockingOfNonTemporaryEvents(b.ped, true)
            SetModelAsNoLongerNeeded(pedHash2)
            pedSpawned = true
            if Config.UseTextUI == false then
                exports['qb-target']:AddTargetEntity(b.ped, {
                    options = {
                        {
                            label = v.name .. ' | ' .. v.label,
                            icon = 'fa-solid fa-basket-shopping',
                            action = function()
                                openShop(v.name, v.label, v.categories, v.type)
                            end
                        }
                    },
                    distance = 3.0
                })
            else
                exports['origen-textui']:AddTextUIPed(ObjToNet(b.ped), vector3(b.coords.x, b.coords.y, b.coords.z), 'E', 'Open Shop', 2.5)
            end
        end
    end
end

function deletePeds()
    if not pedSpawned then return end
    for k, v in pairs(Config.Shops) do
        for a, b in pairs(v.coords) do
            DeletePed(b.ped)
            pedSpawned = false
        end
    end
end

function createBlips()
    for k, v in pairs(Config.Shops) do
        if v.blip == true then
            for a, b in pairs(v.coords) do
                local StoreBlip = AddBlipForCoord(b.coords.x, b.coords.y, b.coords.z)
                SetBlipSprite(StoreBlip, v.blipSprite)
                SetBlipScale(StoreBlip, v.blipScale)
                SetBlipDisplay(StoreBlip, 4)
                SetBlipColour(StoreBlip, v.blipColor)
                SetBlipAsShortRange(StoreBlip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentSubstringPlayerName(v.name)
                EndTextCommandSetBlipName(StoreBlip)
            end
        end
    end
end

Citizen.CreateThread(function()
    createBlips()
    createPeds()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    deletePeds()
end)

RegisterNUICallback("close",function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback("pay",function(data)
    TriggerServerEvent("origen-shop:pay", data)
end)

basket = {}
basketJob = {}
function openShop(name, label, category, type)
    basket = {}
    basketJob = {}
    local categories = {}
    for k, v in pairs(category) do
        table.insert(categories, {
            id = k,
            name = v.name,
            items = v.items,
            description = v.description
        })
    end
    SetNuiFocus(true, true)
    SendNUIMessage({action = "openShop", name = name, label = label, categories = categories, type = type, resourceName = GetCurrentResourceName()})
end

RegisterNUICallback('addToBasket', function(data)
    if json.encode(basket) == "{}" or json.encode(basket) == "[]" then
        table.insert(basket, {
            name = data.name,
            perPrice = tonumber(data.price),
            totalPrice = tonumber(data.price),
            amount = 1,
            label = data.label
        })
        SendNUIMessage({action = "updateBasket", basket = basket})
    else
        local napacaz = napacaz(data.name)
        if napacaz == "insert" then
            table.insert(basket, {
                name = data.name,
                perPrice = tonumber(data.price),
                totalPrice = tonumber(data.price),
                amount = 1,
                label = data.label
            })
            SendNUIMessage({action = "updateBasket", basket = basket})
        end
    end
end)

RegisterNUICallback('addBasketJob', function(data)
    if json.encode(basketJob) == "{}" or json.encode(basketJob) == "[]" then
        table.insert(basketJob, {
            name = data.name,
            perPrice = tonumber(data.price),
            totalPrice = tonumber(data.price),
            amount = 1,
            label = data.label
        })
        SendNUIMessage({action = "updateBasketJob", basket = basketJob})
    else
        local napacazJob = napacazJob(data.name)
        if napacazJob == "insert" then
            table.insert(basketJob, {
                name = data.name,
                perPrice = tonumber(data.price),
                totalPrice = tonumber(data.price),
                amount = 1,
                label = data.label
            })
            SendNUIMessage({action = "updateBasketJob", basket = basketJob})
        end
    end
end)

function napacaz(name)
    for k, v in pairs(basket) do
        if v.name == name then
            basket[k].amount = basket[k].amount + 1
            basket[k].totalPrice = basket[k].perPrice * basket[k].amount
            SendNUIMessage({action = "updateBasket", basket = basket})
            return "update"
        end
    end
    return "insert"
end

function napacazJob(name)
    for k, v in pairs(basketJob) do
        if v.name == name then
            basketJob[k].amount = basketJob[k].amount + 1
            basketJob[k].totalPrice = basketJob[k].perPrice * basketJob[k].amount
            SendNUIMessage({action = "updateBasketJob", basket = basketJob})
            return "update"
        end
    end
    return "insert"
end

RegisterNUICallback('addBasketMore', function(data)
    for k, v in pairs(basket) do
        if v.name == data.name then
            basket[k].amount = basket[k].amount + 1
            basket[k].totalPrice = basket[k].perPrice * basket[k].amount
            SendNUIMessage({action = "updateBasket", basket = basket})
        end
    end
end)

RegisterNUICallback('addBasketMoreJob', function(data)
    for k, v in pairs(basketJob) do
        if v.name == data.name then
            basketJob[k].amount = basketJob[k].amount + 1
            basketJob[k].totalPrice = basketJob[k].perPrice * basketJob[k].amount
            SendNUIMessage({action = "updateBasketJob", basket = basketJob})
        end
    end
end)

RegisterNUICallback('removeOneBasket', function(data)
    for k, v in pairs(basket) do
        if v.name == data.name then
            if basket[k].amount > 1 then
                basket[k].amount = basket[k].amount - 1
                basket[k].totalPrice = basket[k].perPrice * basket[k].amount
                SendNUIMessage({action = "updateBasket", basket = basket})
            else
                basket[k] = nil
                SendNUIMessage({action = "updateBasket", basket = basket})
            end
        end
    end
end)

RegisterNUICallback('removeOneBasketJob', function(data)
    for k, v in pairs(basketJob) do
        if v.name == data.name then
            if basketJob[k].amount > 1 then
                basketJob[k].amount = basketJob[k].amount - 1
                basketJob[k].totalPrice = basketJob[k].perPrice * basketJob[k].amount
                SendNUIMessage({action = "updateBasketJob", basket = basketJob})
            else
                basketJob[k] = nil
                SendNUIMessage({action = "updateBasketJob", basket = basketJob})
            end
        end
    end
end)

RegisterNUICallback('deleteItemFromBasket', function(data)
    for k, v in pairs(basket) do
        if v.name == data.name then
            basket[k] = nil
            SendNUIMessage({action = "updateBasket", basket = basket})
        end
    end
end)

RegisterNUICallback('deleteItemFromBasketJob', function(data)
    for k, v in pairs(basketJob) do
        if v.name == data.name then
            basketJob[k] = nil
            SendNUIMessage({action = "updateBasketJob", basket = basketJob})
        end
    end
end)

RegisterNUICallback('makePayment', function(data)
    TriggerServerEvent('origen-shop:makePayment', data.type, data.price, basket)
end)

RegisterNUICallback('makePaymentJob', function(data)
    TriggerServerEvent('origen-shop:makePayment', data.type, data.price, basketJob)
end)