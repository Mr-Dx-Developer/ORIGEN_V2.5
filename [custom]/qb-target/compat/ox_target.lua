local function exportHandler(exportName, func)
    AddEventHandler(('__cfx_export_ox_target_%s'):format(exportName), function(setCB)
        setCB(func)
    end)
end

local function convert(options)
    local distance = options.distance or 2.5

    -- People may pass options as a hashmap (or mixed, even)
    for k, v in pairs(options) do
        if type(k) ~= 'number' then
            table.insert(options, v)
        end
    end

    for id, v in pairs(options) do
        if type(id) ~= 'number' then
            options[id] = nil
            goto continue
        end

        v.action = v.onSelect
        v.distance = v.distance or distance
        v.name = v.name or v.label
        v.items = v.item
        v.icon = v.icon
        v.job = v.groups

        local groupType = type(v.job)
        if groupType == 'nil' then
            v.job = {}
            groupType = 'table'
        end
        if groupType == 'string' then
            local val = v.gang
            if type(v.gang) == 'table' then
                if table.type(v.gang) ~= 'array' then
                    val = {}
                    for k in pairs(v.gang) do
                        val[#val + 1] = k
                    end
                end
            end

            if val then
                v.job = {v.job, type(val) == 'table' and table.unpack(val) or val}
            end

            val = v.citizenid
            if type(v.citizenid) == 'table' then
                if table.type(v.citizenid) ~= 'array' then
                    val = {}
                    for k in pairs(v.citizenid) do
                        val[#val+1] = k
                    end
                end
            end

            if val then
                v.job = {v.job, type(val) == 'table' and table.unpack(val) or val}
            end
        elseif groupType == 'table' then
            local val = {}
            if table.type(v.job) ~= 'array' then
                for k in pairs(v.job) do
                    val[#val + 1] = k
                end
                v.job = val
                val = nil
            end

            val = v.gang
            if type(v.gang) == 'table' then
                if table.type(v.gang) ~= 'array' then
                    val = {}
                    for k in pairs(v.gang) do
                        val[#val + 1] = k
                    end
                end
            end

            if val then
                v.job = {table.unpack(v.job), type(val) == 'table' and table.unpack(val) or val}
            end

            val = v.citizenid
            if type(v.citizenid) == 'table' then
                if table.type(v.citizenid) ~= 'array' then
                    val = {}
                    for k in pairs(v.citizenid) do
                        val[#val+1] = k
                    end
                end
            end

            if val then
                v.job = {table.unpack(v.job), type(val) == 'table' and table.unpack(val) or val}
            end
        end

        if type(v.job) == 'table' and table.type(v.job) == 'empty' then
            v.job = nil
        end

        if v.event then
            v.event = v.event
            v.type = 'client'
            v.serverEvent = nil
        elseif v.serverEvent then
            v.event = v.serverEvent
            v.type = 'server'
            v.serverEvent = nil
        end

        v.onSelect = nil
        v.groups = nil

        ::continue::
    end

    return {options = options}
end

exportHandler('addBoxZone', function(name, center, length, width, options, targetoptions)
    local z = center.z

    if not options.minZ then
        options.minZ = -100
    end

    if not options.maxZ then
        options.maxZ = 800
    end

    if not options.useZ then
        z = z + math.abs(options.maxZ - options.minZ) / 2
        center = vec3(center.x, center.y, z)
    end

    return exports['qb-target']:AddBoxZone(name, center, length, width, options, convert(targetoptions))
end)

exportHandler('addPolyZone', function(name, points, options, targetoptions)
    return exports['qb-target']:AddPolyZone(name, points, options, convert(targetoptions))
end)

exportHandler('addSphereZone', function(name, center, radius, options, targetoptions)
    return exports['qb-target']:AddCircleZone(name, center, radius, options, convert(targetoptions))
end)

exportHandler('removeZone', function(id)
    return exports['qb-target']:RemoveZone(id)
end)

exportHandler('addGlobalVehicle', function(options)
    if type(bones) ~= 'table' then bones = { bones } end
    options = convert(options)

    for _, v in pairs(options) do
        v.bones = bones
    end

    exports['qb-target']:AddTargetBone(bones, options)
end)

exportHandler('addLocalEntity', function(entities, options)
    if type(entities) ~= 'table' then entities = { entities } end
    options = convert(options)

    exports['qb-target']:AddTargetEntity(entities, options)
end)

exportHandler('removeLocalEntity', function(entities, labels)
    if type(entities) ~= 'table' then entities = { entities } end
    exports['qb-target']:RemoveTargetEntity(entities, labels)
end)

exportHandler('addModel', function(models, options)
    exports['qb-target']:AddTargetModel(models, convert(options))
end)

exportHandler('removeModel', function(models, labels)
    exports['qb-target']:RemoveTargetModel(models, labels)
end)

exportHandler('addGlobalPed', function(options)
    exports['qb-target']:AddGlobalPed(convert(options))
end)

exportHandler('removeGlobalPed', function(labels)
    exports['qb-target']:RemoveGlobalPed(labels)
end)

exportHandler('addGlobalVehicle', function(options)
    exports['qb-target']:AddGlobalVehicle(convert(options))
end)

exportHandler('removeGlobalVehicle', function(labels)
    exports['qb-target']:RemoveGlobalVehicle(labels)
end)

exportHandler('addGlobalObject', function(options)
    exports['qb-target']:AddGlobalObject(convert(options))
end)

exportHandler('removeGlobalObject', function(labels)
    exports['qb-target']:RemoveGlobalObject(labels)
end)

exportHandler('addGlobalPlayer', function(options)
    exports['qb-target']:AddGlobalPlayer(convert(options))
end)

exportHandler('removeGlobalPlayer', function(labels)
    exports['qb-target']:RemoveGlobalPlayer(labels)
end)