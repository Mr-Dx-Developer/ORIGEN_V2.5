
--NUI GET REQUESTS EVENTS
RegisterNUICallback("GetPersons", function(data, cb)
    QBCore.Functions.TriggerCallback('mdt:server:getPersons', function(persons)
        cb(json.encode({persons = persons}))
    end, data.search)
end)

RegisterNUICallback("GetOfficers", function(data, cb)
    QBCore.Functions.TriggerCallback('mdt:server:getOfficers', function(officers)
        cb(json.encode({officers = officers}))
    end, data.search)
end)

RegisterNUICallback("GetPersonDetail", function(data, cb)
    QBCore.Functions.TriggerCallback('mdt:server:getPersonDetail', function(person)
        cb(json.encode({person = person[1]}))
    end, data.search)
end)

RegisterNUICallback("GetEvidenceById", function(data, cb)
    local id = data.id
    QBCore.Functions.TriggerCallback('mdt:server:getEvidenceById', function(evidence)
        if #evidence >=0 then cb(json.encode({success = true, evidence = evidence[1], count = count}))
        else cb(json.encode({success = false, count = -1})) end
    end, id)
end)

RegisterNUICallback("GetVehicleDetail", function(data, cb)
    local plate = data.search
    QBCore.Functions.TriggerCallback('mdt:server:getVehicleByPlate', function(vehicle)
        print(json.encode(vehicle))
        cb(json.encode({vehicle = vehicle[1]}))
    end, plate)
end)

RegisterNUICallback("GetVehicleForProfile", function(data, cb)
    QBCore.Functions.TriggerCallback('mdt:server:getVehicleForProfile', function(vehicle)
        cb(json.encode(vehicle))
    end, data.search)
end)

RegisterNUICallback("GetProfile", function(data, cb)
    QBCore.Functions.TriggerCallback('mdt:server:getProfile', function(profile)
        cb(json.encode(profile))
    end, data.search)
end)

RegisterNUICallback("ListWarrants", function(data, cb)
    QBCore.Functions.TriggerCallback('mdt:server:ListWarrants',function(results)
        cb(json.encode(results))
    end, data.search)
end)

RegisterNUICallback("ListReports", function(data, cb)
    QBCore.Functions.TriggerCallback('mdt:server:ListReports',function(results)
        cb(json.encode(results))
    end, data.search)
end)

RegisterNUICallback("ListIncidents", function(data, cb)
    QBCore.Functions.TriggerCallback('mdt:server:ListIncidents',function(results)
        cb(json.encode(results))
    end, data.search)
end)

RegisterNUICallback("ListVehicles", function(data, cb)
    QBCore.Functions.TriggerCallback('mdt:server:ListVehicles',function(results)
        cb(json.encode(results))
    end, data.search)
end)

RegisterNUICallback("ListEvidences", function(data, cb)
    QBCore.Functions.TriggerCallback('mdt:server:ListEvidences',function(results)
        cb(json.encode(results))
    end, data.search)
end)

RegisterNUICallback("ListProfiles", function(data, cb)
    QBCore.Functions.TriggerCallback('mdt:server:ListProfiles',function(results)
        cb(json.encode(results))
    end, data.search)
end)

RegisterNUICallback("LoadData", function(data, cb)
    QBCore.Functions.TriggerCallback('mdt:server:LoadData',function(loadData)
        cb(json.encode(loadData))
    end, data.id, data.type)
end)