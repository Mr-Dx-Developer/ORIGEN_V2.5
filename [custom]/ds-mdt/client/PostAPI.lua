
--NUI POST REQUESTS EVENTS
RegisterNUICallback("CloseMDT", function(data, cb)
    SetNuiFocus(false, false)
    MDTOpen = false
    cb(json.encode({success = true}))
    tabletProp(false)
end)

RegisterNUICallback("SaveEvidence", function(data, cb)
    print("saveEvidence")
    QBCore.Functions.TriggerCallback('mdt:server:saveEvidence', function(result, id)
        cb(json.encode({success = result, id = id}))
    end, data)
end)

RegisterNUICallback("SaveIncident", function(data, cb)
    print("1")
    QBCore.Functions.TriggerCallback('mdt:server:saveIncident', function(response, id)
        print("2")
        cb(json.encode({success = response, id = id}))
    end, data)
end)

RegisterNUICallback("SaveReport", function(data, cb)
    QBCore.Functions.TriggerCallback('mdt:server:SaveReport', function(response, id)
        cb(json.encode({success = response, id = id}))
    end, data)
end)

RegisterNUICallback("SaveVehicleProfile", function(data, cb)
    QBCore.Functions.TriggerCallback('mdt:server:SaveVehicleProfile', function(result)
        cb(json.encode({success = result}))
    end, data)
end)

RegisterNUICallback("SaveProfile", function(data, cb)
    QBCore.Functions.TriggerCallback('mdt:server:SaveProfile', function(result)
        cb(json.encode({success = result}))
    end, data)
end)

RegisterNUICallback("warrantAction", function(data, cb)
    QBCore.Functions.TriggerCallback('mdt:server:warrantAction', function(result)
        cb(json.encode({success = result}))
    end, data)
end)


RegisterNUICallback("SaveConfig", function(data, cb)
    QBCore.Functions.TriggerCallback('mdt:server:SaveConfig', function(result)
        if result then
            theme = data.theme
            sidebar = data.sidebar
        end
            cb(json.encode({success = result}))
    end, data)
end)

RegisterNUICallback("RemoveLicense", function(data, cb)
    QBCore.Functions.TriggerCallback('mdt:server:RemoveLicense', function(result, id)
        cb(json.encode({success = result, id = id}))
    end, data.citizenid, data.id)
end)

