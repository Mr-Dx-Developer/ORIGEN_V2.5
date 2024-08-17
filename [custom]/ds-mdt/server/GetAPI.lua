
--GET REQUESTS TO SERVER (CALLBACKS)
QBCore.Functions.CreateCallback("mdt:server:getPersons", function(source, cb, search)
    oxmysql:execute("SELECT CONCAT(JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.firstname')),' ', JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.lastname'))) AS name, citizenid FROM players WHERE CONCAT(JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.firstname')),' ', JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.lastname'))) LIKE @search LIMIT 100", {
        ["@search"] = "%"..EscapeSqli(search).."%"
    }, function(result) checkNSend(result, cb) end, true)
end)

QBCore.Functions.CreateCallback("mdt:server:getOfficers", function(source, cb, search)
    oxmysql:execute("SELECT CONCAT('[',JSON_UNQUOTE(JSON_EXTRACT(job, '$.grade.level')),'] ', JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.firstname')),' ', JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.lastname'))) AS name, citizenid FROM players WHERE CONCAT(JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.firstname')),' ', JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.lastname'))) LIKE @search AND (JSON_UNQUOTE(JSON_EXTRACT(job, '$.name'))) LIKE '%police%' LIMIT 100", {
        ["@search"] = "%"..EscapeSqli(search).."%"
    }, function(result) checkNSend(result, cb) end, true)
end)

QBCore.Functions.CreateCallback("mdt:server:getPersonDetail", function(source, cb, search)
    oxmysql:execute("SELECT mdt_profiles.image, CONCAT(JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, '$.firstname')),' ', JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, '$.lastname'))) AS name, players.citizenid FROM players LEFT JOIN mdt_profiles ON mdt_profiles.citizenid = players.citizenid WHERE CONCAT(JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.firstname')),' ', JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.lastname'))) LIKE @search LIMIT 1", {
        ["@search"] = "%"..EscapeSqli(search).."%"
    }, function(result) checkNSend(result, cb) end, true)
end)

QBCore.Functions.CreateCallback("mdt:server:getEvidenceById", function(source, cb, id)
    oxmysql:execute("SELECT * FROM `mdt_evidences` WHERE id = @id LIMIT 1", {
        ["@id"] = EscapeSqli(id)
    }, function(result) checkNSend(result, cb) end, true)
end)

QBCore.Functions.CreateCallback("mdt:server:getVehicleByPlate", function(source, cb, plate)
    oxmysql:execute("SELECT player_vehicles.citizenid, player_vehicles.plate, player_vehicles.vehicle, CONCAT(JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, '$.firstname')),' ', JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, '$.lastname'))) AS owner FROM player_vehicles INNER JOIN players ON players.citizenid = player_vehicles.citizenid WHERE player_vehicles.plate LIKE @plate LIMIT 1", {
        ["@plate"] = EscapeSqli(plate).."%"
    }, function(result) checkNSend(result, cb) end, true)
end)

QBCore.Functions.CreateCallback("mdt:server:getVehicleForProfile", function(source, cb, plate)
    oxmysql:execute("SELECT player_vehicles.citizenid, player_vehicles.plate, player_vehicles.vehicle, mdt_vehicles.notes, mdt_vehicles.image, CONCAT( JSON_UNQUOTE( JSON_EXTRACT (players.charinfo, '$.firstname') ), ' ', ( JSON_UNQUOTE( JSON_EXTRACT (players.charinfo, '$.lastname') ) ) ) AS owner FROM player_vehicles INNER JOIN players ON players.citizenid = player_vehicles.citizenid LEFT JOIN mdt_vehicles ON mdt_vehicles.plate = player_vehicles.plate WHERE player_vehicles.plate = @plate LIMIT 1", {
        ["@plate"] = EscapeSqli(plate)
    }, function(vehicleInfo)
        oxmysql:execute("SELECT vehicles, id FROM `mdt_incidents` WHERE JSON_EXTRACT(vehicles, '$[*].plate') LIKE @plate", {
            ["@plate"] = "%"..EscapeSqli(plate).."%"
        }, function(involvedIncidents)
            oxmysql:execute("SELECT vehicles, id FROM `mdt_reports` WHERE JSON_EXTRACT(vehicles, '$[*].plate') LIKE @plate", {
                ["@plate"] = "%"..EscapeSqli(plate).."%"
            }, function(involvedReports)
                local vehiclesInIncidents = {}
                local vehiclesInReports = {}
                --Vehicles In Incidents
                for k,v in pairs(involvedIncidents) do
                    local vehicles = json.decode(v.vehicles)
                    for kV, vV in pairs(vehicles) do
                        if vV.plate == plate then table.insert(vehiclesInIncidents, {id = v.id, seize = vV.seize, fine = vV.fine, plate = vV.plate}) end
                    end
                end
                --Vehicles In Reports
                for k,v in pairs(involvedReports) do
                    local vehicles = json.decode(v.vehicles)
                    for kV, vV in pairs(vehicles) do
                        if vV.plate == plate then table.insert(vehiclesInReports, {id = v.id, seize = vV.seize, fine = vV.fine, plate = vV.plate}) end
                    end
                end
                cb({vehicleInfo = vehicleInfo[1], vehiclesInIncidents = vehiclesInIncidents , vehiclesInReports = vehiclesInReports})
            end, true)
        end, true)
    end, true)
end)

QBCore.Functions.CreateCallback("mdt:server:getProfile", function(source, cb, citizenid)
    local escCitizenId = EscapeSqli(citizenid)
    oxmysql:execute("SELECT mdt_profiles.notes, mdt_profiles.image, players.citizenid, players.metadata, CONCAT( JSON_UNQUOTE( JSON_EXTRACT (players.charinfo, '$.firstname') ), ' ', ( JSON_UNQUOTE( JSON_EXTRACT (players.charinfo, '$.lastname') ) ) ) AS name, CONCAT(JSON_UNQUOTE(JSON_EXTRACT(players.job, '$.label')),' (' ,JSON_UNQUOTE(JSON_EXTRACT(players.job, '$.grade.level')),')') AS job, JSON_UNQUOTE(JSON_EXTRACT(players.job, '$.grade.name')) AS jobgrade FROM mdt_profiles RIGHT JOIN players ON players.citizenid = mdt_profiles.citizenid WHERE players.citizenid = @citizenid LIMIT 1", {
        ["@citizenid"] = escCitizenId
    }, function(profile)
        oxmysql:execute("SELECT vehicle, plate FROM player_vehicles WHERE citizenid = @citizenid", {
            ["@citizenid"] = escCitizenId
        }, function(vehicles)
            oxmysql:execute("SELECT criminals, id FROM `mdt_incidents` WHERE JSON_EXTRACT(criminals, '$[*].citizenid') LIKE @citizenid", {
                ["@citizenid"] = "%"..escCitizenId.."%"
            }, function(criminals)
                local priors = {}
                for k,v in pairs(criminals) do
                    local criminalsInIncident = json.decode(v.criminals)
                    for kC, vC in pairs(criminalsInIncident) do
                        if vC.citizenid == citizenid then
                            for kCC, vCC in pairs(vC.charges) do
                                print(vCC.name)
                                if not contains(priors, vCC.name) then table.insert(priors, vCC.name) end
                            end
                        end
                    end
                end
                cb({info = profile[1], priors = priors, vehicles = vehicles})
            end, true)
        end, true)
    end, true)
end)

--Listings
QBCore.Functions.CreateCallback("mdt:server:ListWarrants", function(source, cb, search)
    oxmysql:execute(ListData.Query["warrants"], ListData.QueryParam("warrants", search), function(result) checkNSend(result, cb) end, true)
end)

QBCore.Functions.CreateCallback("mdt:server:ListReports", function(source, cb, search)
    oxmysql:execute(ListData.Query["reports"], ListData.QueryParam("reports", search), function(result) checkNSend(result, cb) end, true)
end)

QBCore.Functions.CreateCallback("mdt:server:ListIncidents", function(source, cb, search)
    oxmysql:execute(ListData.Query["incidents"], ListData.QueryParam("incidents", search), function(result) checkNSend(result, cb) end, true)
end)

QBCore.Functions.CreateCallback("mdt:server:ListVehicles", function(source, cb, search)
    oxmysql:execute(ListData.Query["vehicles"], ListData.QueryParam("vehicles", search), function(result) checkNSend(result, cb) end, true)
end)

QBCore.Functions.CreateCallback("mdt:server:ListProfiles", function(source, cb, search)
    oxmysql:execute(ListData.Query["profiles"], ListData.QueryParam("profiles", search), function(result) checkNSend(result, cb) end, true)
end)

QBCore.Functions.CreateCallback("mdt:server:ListEvidences", function(source, cb, search)
    oxmysql:execute(ListData.Query["evidences"], ListData.QueryParam("evidences", search), function(result) checkNSend(result, cb) end, true)
end)


--Loading Data
QBCore.Functions.CreateCallback("mdt:server:LoadData", function(source, cb, id, type)
    local typeLower = string.lower(type)
    local citizenid = QBCore.Functions.GetPlayer(source).PlayerData.citizenid;
    oxmysql:execute(LoadData.Query[typeLower], LoadData.QueryParam(id), function(result)
        local edit = result[1].createdby == citizenid
        cb({result = result[1], edit = edit})
    end, true)
end)

QBCore.Functions.CreateCallback("mdt:server:GetConfig", function(source, cb)
    local citizenid = QBCore.Functions.GetPlayer(source).PlayerData.citizenid;
    oxmysql:execute("SELECT * FROM `mdt_config` WHERE citizenid  = @citizenid LIMIT 1", {
        ["@citizenid"] = citizenid
    }, function(result)
        if result[1] ~= nil then
            cb(result[1].theme, result[1].sidebar)
        else
            cb(0,1)
        end
    end, true)
end)

EscapeSqli = function(str)
    local replacements = { ['"'] = '\\"', ["'"] = "\\'" }
    return str:gsub( "['\"]", replacements ) -- or string.gsub( source, "['\"]", replacements )
end

