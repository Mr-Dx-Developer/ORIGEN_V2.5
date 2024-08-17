lib.callback.register("kloud-farm:callback:canStart", function(source, zoneData)
    local src = source
    local requireItem = zoneData.item.require
    if requireItem.enable then
        return GetItemCount(src, requireItem.item), locale('no_required_item', requireItem.item)
    end

    if CanCarryItem(src, zoneData.item.name, 1) then
        return true
    else
        return false, locale('cant_carry', FormatStr(zoneData.item.name))
    end
end)

lib.callback.register("kloud-farm:callback:canCarry", function(source, data)
    local src = source
    if CanCarryItem(src, data.itemResult, data.amount) then
        return true
    else
        return false, locale('cant_carry', FormatStr(data.itemResult))
    end
end)

lib.callback.register("kloud-farm:callback:uprooted", function(source, zoneData)
    local src = source
    local requireItem = zoneData.item.require
    local randomAmount = math.random(zoneData.item.min, zoneData.item.max)

    AddItem(src, zoneData.item.name, randomAmount, nil)

    if requireItem.enable and requireItem.durability.subtract then
        local itemData = GetSlotWithItem(src, requireItem.item, nil, false)
        local currentDurability = 100
        local durabilityChance = math.random(1, 100)

        if itemData.metadata.durability then
            currentDurability = itemData.metadata.durability
        end

        if durabilityChance < requireItem.durability.chance then
            SetDurability(src, itemData.slot, currentDurability - requireItem.durability.amount)
        end

        if requireItem.randomBreak then
            local randomChance = math.random(1, 100)
            if randomChance < requireItem.breakChance then
                RemoveItem(src, requireItem.item, 1, false, itemData.slot)
                SVNotify(src, locale('item_broke', FormatStr(requireItem.item)), "error")
            end
        end
    end
end)

lib.callback.register("kloud-farm:callback:washed", function(source, data)
    local src = source

    if RemoveItem(src, data.itemRequired, data.amount) then
        AddItem(src, data.itemResult, data.amount, nil)
    end
end)

lib.callback.register("kloud-farm:callback:sellItem", function(source, data)
    local src = source

    if not RemoveItem(src, data.item, data.amount) then return false end
        
    if not AddMoney(src, "cash", data.price * data.amount, "Sold Crop") then return false end

end)

lib.callback.register("kloud-farm:callback:buyItem", function(source, data)
    local src = source

    if not RemoveMoney(src, "cash", data.price * data.amount, "Buy Farming Item") then return false end

    if not AddItem(src, data.item, data.amount) then
        AddMoney(src, "cash", data.pirce * data.amount, "Give Back Money")
        return false
    end
end)

-- Version Check from https://github.com/CodineDev/cdn-fuel

local updatePath
local resourceName

CheckVersion = function(err, response, headers)
    local curVersion = LoadResourceFile(GetCurrentResourceName(), "version")
	if response == nil then print("^1"..resourceName.." check for updates failed ^7") return end
    if curVersion ~= nil and response ~= nil then
		if curVersion == response then Color = "^2" else Color = "^1" end
        print("\n^1----------------------------------------------------------------------------------^7")
        print(resourceName.."'s latest version is: ^2"..response.."!\n^7Your current version: "..Color..""..curVersion.."^7!\nIf needed, update from https://github.com"..updatePath.."")
        print("^1----------------------------------------------------------------------------------^7")
    end
end

CreateThread(function()
	updatePath = "/kloudzxc/kloud-farmjob"
	resourceName = "kloud-farmjob ("..GetCurrentResourceName()..")"
	PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/master/version", CheckVersion, "GET")
end)
