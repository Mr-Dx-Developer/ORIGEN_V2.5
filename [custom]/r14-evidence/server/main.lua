local QBCore = exports['qb-core']:GetCoreObject()

local Evidence, CarEvidence, NetImpactEvidence, PlayerPedImpacts, NetPedImpacts = {}, {}, {}, {}, {}
local AddPacket = {}
local PlayerGSR, PlayerBAC, PlayerStatus, PlayerDrugs = {}, {}, {}, {}
local LoadedCars, Update, Models = {}, {}, {}
local VehicleExtTampers, VehicleInteriorTampers = {}, {}
local AddPackage, RemovePackage = {}, {}
local ActivePlayers = {}

------------------------------------------------------------------------------------------------------------
--------------------------------------------    VERSION CHECK   --------------------------------------------
------------------------------------------------------------------------------------------------------------

PerformHttpRequest('https://raw.githubusercontent.com/regalonefour/r14-versions/main/r14-evidence.txt', function(err, version, headers)
    local curVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')

    if not version then print('Could not complete version request.') return end

    if utf8.codepoint(version:sub(#version, #version)) == 10 then version = version:sub(1, #version - 1) end -- controls for data link escape character at the end of string from github, removes it if found

    if version ~= curVersion then
        print(('^3Current Version: %s, Latest Version: %s'):format(curVersion, version))
        print('Please download the latest version of r14-evidence from your keymaster!^0')
    end
end)

----------- functions ------------------

local function AddEvidence(evidenceId, info)
    AddPackage[evidenceId] = info
    AddPackage[evidenceId].evidenceId = evidenceId
end

local function RemoveEvidence(evid, handler)
    if not Evidence[evid] then print(('Evidence ID %s not found in database while trying to remove %s'):format(evid, handler)) return end

    RemovePackage[evid] = {remove = true, type = Evidence[evid].evtype}

    if Evidence[evid].net then 
        RemovePackage[evid].net = true 
        if Evidence[evid].evtype == 'netimpact' then
            NetImpactEvidence[Evidence[evid].netid][evid] = nil
        else
            if Evidence[evid].cid then
                PlayerPedImpacts[Evidence[evid].cid][evid] = nil
            else
                NetPedImpacts[Evidence[evid].netid][evid] = nil
            end
        end        
    end

    if Evidence[evid].plate and Evidence[evid].evtype ~= 'fragment'  then 
        CarEvidence[Evidence[evid].plate][evid] = nil
        RemovePackage[evid].plate = Evidence[evid].plate 
    end

    Evidence[evid] = nil
end

local function DnaHash(s)
    local h = string.gsub(s, ".", function(c)
        return string.format("%02x", string.byte(c))
    end)
    return h
end

local function CreateEvidenceId()
    local evidenceId = math.random(100000, 999999)
    while Evidence[evidenceId] do
        evidenceId = math.random(100000, 999999)
    end
    return evidenceId
end

function IsVehicleOwned(plate)
    local retval = false
    local result = MySQL.Sync.fetchScalar('SELECT '.. Config.DB.Plate ..' FROM '.. Config.DB.Vehicle ..' WHERE '.. Config.DB.Plate ..' = ?', {plate})

    if result then
        retval = true
    end
    return retval
end

function LoadCarEvidence(plate)
    if not LoadedCars[plate] then        
        LoadedCars[plate] = true
        Update[plate] = {time = 5000, evtable = {}}

        local result = MySQL.Sync.fetchAll('SELECT evidence FROM '.. Config.DB.Vehicle ..' WHERE '.. Config.DB.Plate ..' = ?', {plate})
        
        if result[1] then
            evtable = json.decode(result[1].evidence)
        
            if Config.Debug.Database.enabled then print(('Vehicle evidence called for %s, following evidence loaded from database: %s'):format(plate, json.encode(evtable))) end

            if not CarEvidence[plate] then CarEvidence[plate] = {} end

            if evtable and next(evtable) then
                for k, v in pairs(evtable) do
                    if not v.time or v.time - os.time() >= 0 then
                        local data = {}

                        for a, b in pairs(v) do
                            data[a] = b
                        end

                        data.noupdate = true

                        if data.evtype == 'carblood' then
                            TriggerEvent('evidence:server:CreateCarBlood', data)
                        elseif data.evtype == 'carfingerprint' then -- don't want to rewrite carfingerpint function, adding logic here, make sure to update if car fingerpints change
                            local evidenceId = CreateEvidenceId()

                            Evidence[evidenceId] = {
                                evtype = 'carfingerprint',
                                fingerprint = v.fingerprint,
                                plate = v.plate,
                                location = v.location,
                                time = v.time,
                            }

                            CarEvidence[v.plate][evidenceId] = {
                                evtype = 'carfingerprint',
                                fingerprint = v.fingerprint,
                                plate = v.plate,
                                location = v.location,
                                time = v.time,
                            }

                            AddEvidence(evidenceId, Evidence[evidenceId])
                        elseif data.evtype == 'carcasing' then
                            TriggerEvent('evidence:server:CreateCarCasing', data)
                        end
                    end
                end
            end
        end

        Update[plate] = nil
    else
        if Config.Debug.Database.enabled then print(('No evidence found server side for %s, setting blank table'):format(plate, json.encode(evtable))) end 

        if not CarEvidence[plate] then CarEvidence[plate] = {} end
    end  
end

local function UpdateDB(vehplate)
    if not LoadedCars[vehplate] then return end

    if not Update[vehplate] then
        Update[vehplate] = {time = 5000, evtable = {}}

        CreateThread(function()
            local plate = vehplate

            while Update[vehplate].time > 0 do               
                Update[plate].time = Update[plate].time - 1000 
                Wait(1000)
            end

            for evid, info in pairs(CarEvidence[plate]) do
                Update[plate].evtable[#Update[plate].evtable+1] = info
            end

            MySQL.Async.execute('UPDATE '.. Config.DB.Vehicle ..' SET evidence = ? WHERE '.. Config.DB.Plate ..' = ?', {json.encode(Update[plate].evtable), plate})

            if Config.Debug.Database.enabled or true then print(('Vehicle evidence for %s updated with following evidence: %s'):format(plate, json.encode(Update[plate].evtable))) end     
            
            Update[plate].evtable = nil

        end)
    else
        Update[vehplate].time = 5000 
    end    
end

local function SendEvidence()
    local sendpackage = table.clone(AddPackage)
    AddPackage = {}

    TriggerClientEvent("evidence:client:AddEvidence", -1, sendpackage)
end

local function SendRemove()
    local removepackage = table.clone(RemovePackage)
    RemovePackage = {}

    if next(removepackage) then
        TriggerClientEvent("evidence:client:RemoveEvidence", -1, removepackage)
    end
end

----------- general events -------------------

RegisterNetEvent('evidence:server:bagitem', function(data)
    local Player = QBCore.Functions.GetPlayer(source)
    local item = table.clone(Player.PlayerData.items[data.slot])

    if Player.PlayerData.items[data.slot] then       
        if Player.Functions.RemoveItem("empty_evidence_bag", 1) then
            if Player.Functions.RemoveItem(item.name, 1, data.slot) then
                local description = ''

                if item.info.serie then description = ('%s <p><strong>%s: </strong><span> %s </span></p>'):format(description, 'Serial Number', item.info.serie) end
                if item.info.ammo then description = ('%s <p><strong>%s: </strong><span> %s </span></p>'):format(description, 'Loaded Ammo', item.info.ammo) end
                if item.info.quality then description = ('%s <p><strong>%s: </strong><span> %s </span></p>'):format(description, 'Durability', item.info.quality) end

                local info = {
                    label = item.label,
                    type = "item",
                    item = item,
                    iteminfo = description or 'Ha hahaha',
                    date = os.date("%m/%d/%y @ %I:%M"),
                    street = data.street,
                    tracking = CreateEvidenceId(),
                }
                if Player.Functions.AddItem("filled_evidence_bag", 1, data.slot, info) then
                    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item.name], "remove")
                    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["filled_evidence_bag"], "add")  
                end
            else
                Player.Functions.AddItem("empty_evidence_bag", 1, false, info)
            end
        else
            Config.Functions.ServerNotify(source, Config.Notification.NoBag, "error")
        end
    else
        Config.Functions.ServerNotify(source, 'Something went wrong!', "error")
    end
end)

RegisterNetEvent('evidence:server:unbagitem', function(data)
    local Player = QBCore.Functions.GetPlayer(source)
    local item = table.clone(Player.PlayerData.items[data.slot] and Player.PlayerData.items[data.slot])

    if item and item.name == 'filled_evidence_bag' then
        if Player.Functions.RemoveItem("filled_evidence_bag", 1, data.slot) then
            if Player.Functions.AddItem(item.info.item.name, 1, data.slot, item.info.item.info) then
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[item.info.item.name], "add")
                TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['filled_evidence_bag'], "remove")
                if not Config.AuthorizedJobs.LEO.Check(source) then
                    print(('%s %s (%s) unbagged a %s.'):format(Player.PlayerData.charinfo.firstname, Player.PlayerData.charinfo.lastname, source, item.info.item.info.name))
                    TriggerEvent('qb-log:server:CreateLog', 'anticheat', 'Civilian unbagged evidence (r14-evidence)', 'red', ('%s %s (%s) unbagged a %s.'):format(Player.PlayerData.charinfo.firstname, Player.PlayerData.charinfo.lastname, source, item.info.item.info.name), false) 
                end
            end
        else
            Player.Functions.AddItem("empty_evidence_bag", 1, false, info)
        end
    else
        Config.Functions.ServerNotify(source, 'Something went wrong!', "error")
    end
end)

RegisterNetEvent('evidence:server:notifytarget', function(target, notify)
    local src = source
    Config.Functions.ServerNotify(target, (notify):format(src))
end)

RegisterNetEvent('evidence:server:FetchEv', function()
    local src = source

    local evtable = table.clone(Evidence)

    while next(evtable) do
        local count = 1000
        local evpackage = {}

        for k, v in pairs(evtable) do
            if count > 0 then
                evpackage[k] = v
                evtable[k] = nil
                count = count - 1
            end
        end

        TriggerClientEvent('evidence:client:LoadEvidence', src, evpackage)   
        Wait(500)
    end
end)

RegisterNetEvent('evidence:server:LoadCarEvidence', function(plate)
    if IsVehicleOwned(plate) then LoadCarEvidence(plate) else CarEvidence[plate] = {} end
end)

RegisterNetEvent('evidence:server:UpdateStatus', function(data)
    local src = source
    local cid = QBCore.Functions.GetPlayer(src).PlayerData.citizenid
    PlayerStatus[cid] = data
end)

RegisterNetEvent('evidence:server:IncreaseBAC', function(data)
    local src = source
    local cid = QBCore.Functions.GetPlayer(src).PlayerData.citizenid
    
    if not PlayerBAC[cid] then
        PlayerBAC[cid] = data
    else
        PlayerBAC[cid] = PlayerBAC[cid] + data
    end
end)

RegisterNetEvent('evidence:server:DecreaseBAC', function(data)
    local src = source
    local cid = QBCore.Functions.GetPlayer(src).PlayerData.citizenid

    if PlayerBAC[cid] then
        PlayerBAC[cid] = PlayerBAC[cid] - data

        if PlayerBAC[cid] <= 0 then PlayerBAC[cid] = nil end
    end
end)

RegisterNetEvent('evidence:server:SetGSR', function(bool)
    local src = source
    local cid = QBCore.Functions.GetPlayer(src).PlayerData.citizenid
    
    if bool then
        PlayerGSR[cid] = {status = bool, time = 0}
    elseif PlayerGSR[cid] then
        PlayerGSR[cid] = nil
    end
end)

RegisterNetEvent('evidence:server:SetExteriorTamper', function(bool, plate)
    local src = source  

    if bool then
        VehicleExtTampers[plate] = {status = bool, time = Config.EvidenceFadeTime.VehTampers}
    elseif VehicleExtTampers[plate] then
        VehicleExtTampers[plate] = nil
    end
end)

RegisterNetEvent('evidence:server:SetIgnitionTamper', function(bool, plate)
    local src = source  
    
    if bool then
        VehicleInteriorTampers[plate] = {status = bool, time = Config.EvidenceFadeTime.VehTampers}
    elseif VehicleInteriorTampers[plate] then
        VehicleInteriorTampers[plate] = nil
    end
end)

RegisterNetEvent('evidence:server:useaccesstool', function(item) -- manages access tool uses if enabled
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local slot = nil

    for k, v in pairs(Player.PlayerData.items) do
        if v.name == 'accesstool' then
            slot = k
        end
    end

    if not slot then return end

    if Config.Consume.AccessTool then
        if not Player.PlayerData.items[slot].info.uses then Player.PlayerData.items[slot].info.uses = Config.Consume.AccessTool end

        if Player.PlayerData.items[slot].info.uses - 1 == 0 then
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['accesstool'], "remove")
            Player.Functions.RemoveItem('accesstool', 1, slot)
        else
            Player.PlayerData.items[slot].info.uses = Player.PlayerData.items[slot].info.uses - 1
            Player.Functions.SetInventory(Player.PlayerData.items)
        end
    end
end)

----------- drug testing events --------------------------

if Config.DrugTesting.Enabled then
    if Config.DrugTesting.UsingQBSR then
        RegisterNetEvent('consumables:server:useMeth', function()
            local cid = QBCore.Functions.GetPlayer(source).PlayerData.citizenid
            if not PlayerDrugs[cid] then PlayerDrugs[cid] = {} end
            PlayerDrugs[cid]['meth'] = os.time() + (60 * 60 * Config.DrugTesting.DefaultPositiveTime)   
        end)

        RegisterNetEvent('consumables:server:useOxy', function()
            local cid = QBCore.Functions.GetPlayer(source).PlayerData.citizenid
            if not PlayerDrugs[cid] then PlayerDrugs[cid] = {} end
            PlayerDrugs[cid]['oxycodone'] = os.time() + (60 * 60 * Config.DrugTesting.DefaultPositiveTime)   
        end)

        RegisterNetEvent('consumables:server:useXTCBaggy', function()
            local cid = QBCore.Functions.GetPlayer(source).PlayerData.citizenid
            if not PlayerDrugs[cid] then PlayerDrugs[cid] = {} end
            PlayerDrugs[cid]['ecstacy'] = os.time() + (60 * 60 * Config.DrugTesting.DefaultPositiveTime)   
        end)

        RegisterNetEvent('consumables:server:useCrackBaggy', function()
            local cid = QBCore.Functions.GetPlayer(source).PlayerData.citizenid
            if not PlayerDrugs[cid] then PlayerDrugs[cid] = {} end
            PlayerDrugs[cid]['cocaine'] = os.time() + (60 * 60 * Config.DrugTesting.DefaultPositiveTime)   
        end)

        RegisterNetEvent('consumables:server:useCokeBaggy', function()
            local cid = QBCore.Functions.GetPlayer(source).PlayerData.citizenid
            if not PlayerDrugs[cid] then PlayerDrugs[cid] = {} end
            PlayerDrugs[cid]['cocaine'] = os.time() + (60 * 60 * Config.DrugTesting.DefaultPositiveTime)   
        end)
    end

    if Config.DrugTesting.EventTriggers then
        for k, v in pairs(Config.DrugTesting.EventTriggers) do
            if not v.type or (v.type and v.type == 'server') then
                CreateThread(function()
                    RegisterNetEvent(v.event, function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg9, arg10)
                        local args = {[1] = arg1, [2] = arg2, [3] = arg3, [4] = arg4, [5] = arg5, [6] = arg6, [7] = arg7, [8] = arg8, [9] = arg9, [10] = arg10}
                        local src = source
                        local cid = nil

                        if not src and v.sourceArgPos then 
                            if args[v.sourceArgPos] then
                                if v.sourceArgSubfield then 
                                    src = args[v.sourceArgPos][v.sourceArgSubfield]
                                else 
                                    src = args[v.sourceArgPos]
                                end
                            end
                        end

                        if not src then print(('Failed to find source in %s, please check config to ensure your config settings are correct.'):format(v.event)) return end

                        local cid = src and QBCore.Functions.GetPlayer(src)
                        local cid = cid and cid.PlayerData and cid.PlayerData.citizenid

                        if not cid and v.cidArgPos then 
                            if args[v.cidArgPos] then
                                if v.cidArgSubfield then 
                                    cid = args[v.cidArgPos][v.cidArgSubfield]
                                else 
                                    cid = args[v.cidArgPos]
                                end
                            end
                        end

                        if not cid then print(('Failed to find cid in %s, please check config to ensure your config settings are correct.'):format(v.event)) return end

                        checkArg = v.drugArgPos and v.drugArgSubfield and args[v.drugArgPos][v.drugArgSubfield] or v.drugArgPos and args[v.drugArgPos]
                        checkValue = v.drugArgPos and v.drugArgValue and v.drugArgValue

                        if (not checkArg and not checkValue) or (checkArg and not checkValue) or (checkArg and checkValue and checkArg == checkValue) then
                            TriggerEvent('evidence:server:SetDrugStatus', {drug = v.drugType, cid = cid, hours = v.positiveTime})
                        end
                    end)
                end)
            end
        end
    end
end

RegisterNetEvent('evidence:server:SetDrugStatus', function(data, remove)
    local src = source
    local Player = src and QBCore.Functions.GetPlayer(src)
    local cid = data.cid or Player.PlayerData.citizenid 
    local time = data.hours or Config.DrugTesting.DefaultPositiveTime

    if data.hours and not time or type(time) ~= 'number' then print('evidence:server:SetDrugStatus was rejected due to recieving data.hours field that was not a number') return end
    if not data.hours and not time or type(time) ~= 'number' then print('evidence:server:SetDrugStatus was rejected due to DefaultPositiveTime not being a number') return end
    if not data.drug then print('evidence:server:SetDrugStatus was rejected due to being triggered without a specified drug, please check your code!') return end
    if not src and not data.cid then print('evidence:server:SetDrugStatus was rejected due to being triggered without source or data.cid defined, please check your code!') return end

    if remove and PlayerDrugs[cid] then
        if Config.Debug.ConfirmDrugPositive.enabled then print(('%s set negative for %s'):format(cid, data.drug)) end
        PlayerDrugs[cid][data.drug] = nil
    else
        if Config.Debug.ConfirmDrugPositive.enabled then print(('%s set positive for %s for %s hours'):format(cid, data.drug, time or Config.DrugTesting.DefaultPositiveTime)) end

        if not PlayerDrugs[cid] then PlayerDrugs[cid] = {} end
        PlayerDrugs[cid][data.drug] = os.time() + (60 * 60 * time)   
    end   
end)

----------- evidence creation events --------------------------

RegisterNetEvent('evidence:server:CreateEvidence', function(data) -- security vulnerability patched 11/26/2022   
    for k, v in pairs(data) do
        v.src = source
        TriggerEvent(('evidence:server:Create%s'):format(v.event), v)
    end
end)

RegisterNetEvent('evidence:server:CreateCasing', function(data)
    if type(data) ~= 'table' then print('Received casing from outdated event trigger. Please check your resources for duplicated code containing the \'evidence:server:CreateCasing\' event.') return end

    local src = data.src or source
    local Player = QBCore.Functions.GetPlayer(src)
    local evidenceId = CreateEvidenceId()
    local bucket = GetPlayerRoutingBucket(tostring(src))
    local time = os.time() + (Config.EvidenceFadeTime.Casings * 60)    
    local serialNumber = nil

    if data.curserial and data.weapon == curwephash then
        serialNumber = data.curserial
    else
        local weaponInfo = QBCore.Shared.Weapons[data.weapon]
        if weaponInfo then
            local weaponItem = Player.Functions.GetItemByName(weaponInfo["name"])
            if weaponItem then
                if weaponItem.info and weaponItem.info ~= "" then
                    serialNumber = weaponItem.info.serie
                end
            end
        end
    end

    Evidence[evidenceId] = {
        bucket = bucket,
        evtype = 'casing',
        weapon = data.weapon,
        serial = serialNumber,
        coords = data.coords,
        time = time,
    }

    AddEvidence(evidenceId, Evidence[evidenceId])
end)

RegisterNetEvent('evidence:server:CreateBulletImpact', function(data)
    local src = data.src or source
    local evidenceId = CreateEvidenceId()
    local bucket = GetPlayerRoutingBucket(tostring(src))
    local time = os.time() + (Config.EvidenceFadeTime.Impact * 60)

    Evidence[evidenceId] = {
        bucket = bucket,
        evtype = 'impact',
        ammotype = data.ammotype,
        coords = data.coords,
        norm = data.norm,
        time = time,
    }
    AddEvidence(evidenceId, Evidence[evidenceId])
end)  

RegisterNetEvent('evidence:server:CreateVehicleFragment', function(data)
    local src = data.src or source
    local evidenceId = CreateEvidenceId()
    local bucket = GetPlayerRoutingBucket(tostring(src))
    local time = os.time() + (Config.EvidenceFadeTime.Fragment * 60)

    Evidence[evidenceId] = {
        bucket = bucket,
        evtype = 'fragment',
        vehcolor = data.vehcolor,
        vehname = data.vehname,
        plate = data.plate,
        coords = data.coords,
        time = time,
    }

    AddEvidence(evidenceId, Evidence[evidenceId])
end)

RegisterNetEvent('evidence:server:CreateNetworkedBulletImpact', function(data)
    local src = data.src or source
    local evidenceId = CreateEvidenceId()
    local model = GetEntityModel(NetworkGetEntityFromNetworkId(data.netid))
    local time = os.time() + (Config.EvidenceFadeTime.NetImpact * 60)

    Evidence[evidenceId] = {
        evtype = 'netimpact',
        ammotype = data.ammotype,
        netid = data.netid,
        offset = data.offset,
        normoffset = data.normoffset,
        model = model,
        time = time,
        net = true,
    }

    AddEvidence(evidenceId, Evidence[evidenceId])

    if not NetImpactEvidence[data.netid] then NetImpactEvidence[data.netid] = {} end

    NetImpactEvidence[data.netid][evidenceId] = true
    Models[data.netid] = model
end)  

RegisterNetEvent('evidence:server:CreateNetworkedPedBulletImpact', function(data)
    local src = data.src or source
    local evidenceId = CreateEvidenceId()
    local model = GetEntityModel(NetworkGetEntityFromNetworkId(data.netid))
    local time = os.time() + (Config.EvidenceFadeTime.NetPedImpact* 60)
    local cid = nil
    if player then cid = QBCore.Functions.GetPlayer(data.player).PlayerData.citizenid end

    Evidence[evidenceId] = {
        evtype = 'netpedimpact',
        ammotype = data.ammotype,
        netid = data.netid,
        boneindex = data.boneindex,
        model = model,
        time = time,
        cid = cid,
        net = true,
    }

    AddEvidence(evidenceId, Evidence[evidenceId])

    if player then
        if not PlayerPedImpacts[cid] then PlayerPedImpacts[cid] = {} end

        PlayerPedImpacts[cid][evidenceId] = true
        Evidence[evidenceId].cid = cid
    else
        if not NetPedImpacts[data.netid] then NetPedImpacts[data.netid] = {} end

        NetPedImpacts[data.netid][evidenceId] = model
        Models[data.netid] = model
    end
end)  

RegisterNetEvent('evidence:server:CreateBloodDrop', function()
    local src = source
    TriggerClientEvent('evidence:client:GetBloodInfo', src)
end)

RegisterNetEvent('evidence:server:CreateBlood', function(data)
    local src = data.src or source
    local evidenceId = CreateEvidenceId()
    local bucket = GetPlayerRoutingBucket(tostring(src))
    local Player = src and QBCore.Functions.GetPlayer(src) 
    local time = os.time() + (Config.EvidenceFadeTime.Blood * 60)
    Evidence[evidenceId] = {
        bucket = bucket, 
        evtype = 'blood',
        citizenid = data.citizenid or Player.PlayerData.citizenid,
        bloodtype = data.bloodtype or Player.PlayerData.metadata["bloodtype"],
        coords = data.coords,
        time = time,
    }

    AddEvidence(evidenceId, Evidence[evidenceId])
end)

RegisterNetEvent('evidence:server:CreateFingerDrop', function(coords)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local evidenceId = CreateEvidenceId()
    local bucket = GetPlayerRoutingBucket(tostring(src))
    local time = os.time() + (Config.EvidenceFadeTime.Fingerprint * 60)
    Evidence[evidenceId] = {
        bucket = bucket,
        evtype = 'fingerprint',
        fingerprint = Player.PlayerData.metadata["fingerprint"],
        coords = coords,
        time = time,
    }

    AddEvidence(evidenceId, Evidence[evidenceId])
end)

RegisterNetEvent('evidence:server:CreateLockTampering', function(coords)
    local src = source
    local evidenceId = CreateEvidenceId()
    local time = os.time()
    local bucket = GetPlayerRoutingBucket(tostring(src))
    local time = os.time() + (Config.EvidenceFadeTime.Tampering * 60)
    Evidence[evidenceId] = {
        bucket = bucket,
        evtype = 'tampering',
        time = time,
        coords = coords,
        time = time,
    }

    AddEvidence(evidenceId, Evidence[evidenceId])
end)

RegisterNetEvent('evidence:server:CreateCarCasing', function(data)
    local src = data.src or source
    local Player = QBCore.Functions.GetPlayer(src)
    local evidenceId = CreateEvidenceId()
    local weaponInfo = QBCore.Shared.Weapons[data.weapon]
    local serialNumber = nil
    local time = data.time or os.time() + (Config.EvidenceFadeTime.VehCasings * 60 * 60 * 24)

    if data.serial or (data.curserial and data.weapon == curwephash) then
        serialNumber = data.serial or data.curserial
    else
        local weaponInfo = QBCore.Shared.Weapons[data.weapon]
        if weaponInfo then
            local weaponItem = Player.Functions.GetItemByName(weaponInfo["name"])
            if weaponItem then
                if weaponItem.info and weaponItem.info ~= "" then
                    serialNumber = weaponItem.info.serie
                end
            end
        end
    end

    Evidence[evidenceId] = {
        evtype = 'carcasing',
        weapon = data.weapon,
        serial = serialNumber,
        plate = data.plate,
        time = time, 
    }

    if IsVehicleOwned(data.plate) then LoadCarEvidence(data.plate) else CarEvidence[data.plate] = {} end

    CarEvidence[data.plate][evidenceId] = {
        evtype = 'carcasing',
        type = data.weapon,
        serial = serialNumber,
        plate = data.plate,
        time = time,
    }

    if not data.noupdate then print('updating') UpdateDB(data.plate) end
    AddEvidence(evidenceId, Evidence[evidenceId])
end)

RegisterNetEvent('evidence:server:CreateCarFingerprint', function(plate, location)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local evidenceId = CreateEvidenceId()
    local fingerprint = Player.PlayerData.metadata["fingerprint"]
    local time = os.time() + (Config.EvidenceFadeTime.VehFingerprints * 60 * 60 * 24)
    Evidence[evidenceId] = {
        evtype = 'carfingerprint',
        fingerprint = fingerprint,
        plate = plate,
        location = location,
        time = time,
    }

    if IsVehicleOwned(plate) then LoadCarEvidence(plate) else CarEvidence[plate] = {} end

    CarEvidence[plate][evidenceId] = {
        evtype = 'carfingerprint',
        fingerprint = fingerprint,
        plate = plate,
        location = location,
        time = time,
    }

    UpdateDB(plate)
    AddEvidence(evidenceId, Evidence[evidenceId])
end)

RegisterNetEvent('evidence:server:CreateCarBlood', function(data)
    if not data.seat then print('Rejected car blood with no seat information! Following data recieved from client:', json.encode(data)) return end

    local src = data.src or source
    local Player = src and QBCore.Functions.GetPlayer(src) 
    local evidenceId = CreateEvidenceId()
    local time = data.time or os.time() + (Config.EvidenceFadeTime.VehBlood * 60 * 60 * 24)
    local seat = data.seat

    Evidence[evidenceId] = {
        evtype = 'carblood',
        citizenid = data.citizenid or Player.PlayerData.citizenid,
        bloodtype = data.bloodtype or Player.PlayerData.metadata["bloodtype"],
        plate = data.plate,
        seat = seat, 
        time = time,
    }

    if IsVehicleOwned(data.plate) then LoadCarEvidence(data.plate) else CarEvidence[data.plate] = {} end

    CarEvidence[data.plate][evidenceId] = {
        evtype = 'carblood',
        citizenid = data.citizenid or Player.PlayerData.citizenid,
        bloodtype = data.bloodtype or Player.PlayerData.metadata["bloodtype"],
        plate = data.plate,
        seat = seat,
        time = time,        
    }

    if not data.noupdate then UpdateDB(data.plate) end 
    AddEvidence(evidenceId, Evidence[evidenceId])
end)

------- events that link into qb-garages --------------

RegisterNetEvent(Config.VehInAndOut.InEvent, function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10) -- this saves the evidence table to the database when a car is put into a garage
    local src = source
    local args = {[1] = arg1, [2] = arg2, [3] = arg3, [4] = arg4, [5] = arg5, [6] = arg6, [7] = arg7, [8] = arg8, [9] = arg9, [10] = arg10}
    
    local state = args[Config.VehInAndOut.InStateVar]
    local plate = args[Config.VehInAndOut.InPlateVar]

    -- verify state

    if type(state) == 'table' then print('Expecting number or string for vehicle state, received table when attempting to load vehicle from garage. Please check your event for an arguemnt mismatch.') return end

    -- verify plate

    if type(plate) == 'table' then print('Expecting string for vehicle plate, received table when attempting to put vehicle in garage. Please check your event for an arguemnt mismatch.') return end
    if type(plate) == 'string' and #plate > 8 then print('Expecting string for vehicle plate, receieved unknown string '.. plate ..' instead. Please check your event for an agument mismatch.') return end

    if state == Config.VehInAndOut.InState then
        local evtable = {}

        if not LoadedCars[plate] then LoadCarEvidence(plate) end

        if CarEvidence[plate] and next(CarEvidence[plate]) then
            for k, v in pairs(CarEvidence[plate]) do
                evtable[#evtable+1] = Evidence[k]
                RemoveEvidence(k, 'putting vehicle away')
            end

            if Config.Debug.Database.enabled then print(('Vehicle %s put into garage with following evidence: %s'):format(plate, json.encode(evtable))) end

            CarEvidence[plate] = nil
        else
            if Config.Debug.Database.enabled then print(('No evidence in table, vehicle %s put into garage with blank evidence table: %s'):format(plate, json.encode(evtable))) end
        end

        MySQL.Async.execute('UPDATE '.. Config.DB.Vehicle ..' SET evidence = ? WHERE '.. Config.DB.Plate ..' = ?', {json.encode(evtable), plate})

        if LoadedCars[plate] then LoadedCars[plate] = nil end
    end
end)

RegisterNetEvent(Config.VehInAndOut.OutEvent, function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10) -- this loads the evidence table to the database when a car is taken out of a garage
    local src = source
    local args = {[1] = arg1, [2] = arg2, [3] = arg3, [4] = arg4, [5] = arg5, [6] = arg6, [7] = arg7, [8] = arg8, [9] = arg9, [10] = arg10}
    
    local state = args[Config.VehInAndOut.OutStateVar]
    local plate = args[Config.VehInAndOut.OutPlateVar]

    -- verify state

    if type(state) == 'table' then print('Expecting number or string for vehicle state, received table when attempting to load vehicle from garage. Please check your event for an arguemnt mismatch.') return end

    -- verify plate

    if type(plate) == 'table' then print('Expecting string for vehicle plate, received table when attempting to load vehicle from garage. Please check your event for an arguemnt mismatch.') return end
    if type(plate) == 'string' and #plate > 8 then print('Expecting string for vehicle plate, receieved unknown string '.. plate ..' instead. Please check your event for an agument mismatch.') return end

    if state == Config.VehInAndOut.OutState then
        LoadCarEvidence(plate)
    end
end)

------------- evidence gathering events ---------------

RegisterNetEvent('evidence:server:AddEvidenceToInventory', function(evidenceId, info)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem("empty_evidence_bag", 1) then
        if Player.Functions.AddItem("filled_evidence_bag", 1, false, info) then
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["filled_evidence_bag"], "add")
            RemoveEvidence(evidenceId, 'adding evidence to inventory')
        else
            Config.Functions.ServerNotify(src, Config.Notification.Overweight, "error")
        end
    else
        Config.Functions.ServerNotify(src, Config.Notification.NoBag, "error")
    end
end)

RegisterNetEvent('evidence:server:AddGSRToInventory', function(gsrInfo)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    gsrInfo.tracking = CreateEvidenceId()

    if Config.Consume.GSR then 
        Player.Functions.RemoveItem('gsrtestkit', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["gsrtestkit"], "remove") 
    end

    if Player.Functions.RemoveItem("empty_evidence_bag", 1) then
        if Player.Functions.AddItem("filled_evidence_bag", 1, false, gsrInfo) then
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["filled_evidence_bag"], "add")
        else
            Config.Functions.ServerNotify(src, Config.Notification.Overweight, "error")
        end
    else
        Config.Functions.ServerNotify(src, Config.Notification.NoBag, "error")
    end
end)

RegisterNetEvent('evidence:server:AddBACToInventory', function(BACInfo)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    BACInfo.tracking = CreateEvidenceId()

    if Player.Functions.RemoveItem("empty_evidence_bag", 1) then
        if Player.Functions.AddItem("filled_evidence_bag", 1, false, BACInfo) then
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["filled_evidence_bag"], "add")
        else
            Config.Functions.ServerNotify(src, Config.Notification.Overweight, "error")
        end
    else
        Config.Functions.ServerNotify(src, Config.Notification.NoBag, "error")
    end
end)

RegisterNetEvent('evidence:server:AddDrugTestToInventory', function(drugInfo)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local otherPlayerDNA = DnaHash(QBCore.Functions.GetPlayer(drugInfo.player).PlayerData.citizenid)

    drugInfo.dnalabel = otherPlayerDNA

    drugInfo.result = ('<p><strong>DNA: </strong><span> %s </span></p>%s'):format(otherPlayerDNA, drugInfo.result)
    
    drugInfo.tracking = CreateEvidenceId()
    
    if Player.Functions.RemoveItem("empty_evidence_bag", 1) then
        if Player.Functions.AddItem("filled_evidence_bag", 1, false, drugInfo) then
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["filled_evidence_bag"], "add")
        else
            Config.Functions.ServerNotify(src, Config.Notification.Overweight, "error")
        end
    else
        Config.Functions.ServerNotify(src, Config.Notification.NoBag, "error")
    end
end)

RegisterNetEvent('evidence:server:AddDNAToInventory', function(playerId, collection, street)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local OtherPlayer = QBCore.Functions.GetPlayer(playerId)

    if Config.Consume.DNA then
        Player.Functions.RemoveItem('dnatestkit', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["dnatestkit"], "remove") 
    end

    if Player.Functions.RemoveItem("empty_evidence_bag", 1) then
        local info = {
            label = "DNA Sample",
            type = "dna",
            dnalabel = DnaHash(OtherPlayer.PlayerData.citizenid),
            date = collection,
            street = street,
            tracking = CreateEvidenceId(),
        }
        if Player.Functions.AddItem("filled_evidence_bag", 1, false, info) then
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["filled_evidence_bag"], "add")
        end
    else
        Config.Functions.ServerNotify(src, Config.Notification.NoBag, "error")
    end
end)

RegisterNetEvent('evidence:server:AddCarEvToInventory', function(evidenceId, evinfo, plate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem("empty_evidence_bag", 1) then
        if Player.Functions.AddItem("filled_evidence_bag", 1, false, evinfo) then
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["filled_evidence_bag"], "add")
            RemoveEvidence(evidenceId, 'adding car evidence to inventory')

            UpdateDB(plate)
        else
            Config.Functions.ServerNotify(src, Config.Notification.Overweight, "error")
        end
    else
        Config.Functions.ServerNotify(src, Config.Notification.NoBag, "error")
    end
end)

------------------------ misc events ----------------------------------

RegisterNetEvent('evidence:server:UpdateBag', function(slot, info)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem("empty_evidence_bag", 1, slot)
    Player.Functions.AddItem("filled_evidence_bag", 1, slot, info)
end)

RegisterNetEvent('evidence:server:ChangePlayerNetID', function(netid)
    local src = source
    local cid = QBCore.Functions.GetPlayer(src).PlayerData.citizenid
    local evtable = {}

    if PlayerPedImpacts[cid] and next(PlayerPedImpacts[cid]) then
        for k, v in pairs(PlayerPedImpacts[cid]) do
            Evidence[k].netid = netid
            evtable[k] = v
            evtable[k].netid = netid
        end
        
        TriggerClientEvent('evidence:client:UpdatePlayerID', -1, evtable)
    end
end)

---------------------------- qb-target events --------------------------------

RegisterNetEvent('evidence:server:frisk', function(playerId)
    local src = source
    local items = QBCore.Functions.GetPlayer(playerId).PlayerData.items
    local foundweapon, foundcontraband = false

    for k, v in pairs(items) do
        if v.type == 'weapon' or (v.name == 'filled_evidence_bag' and v.info.item and v.info.item.type == 'weapon') then
            foundweapon = true
        elseif Config.FriskContrabandItems[v.name] then
            foundcontraband = true
        end
    end

    if Config.Debug.PrintTest.enabled then
        local itemlist = {}
        for k, v in pairs(items) do
            table.insert(itemlist, v.label)            
        end
        print(('Frisk result for %s returns %s, items in pocket: %s'):format(QBCore.Functions.GetPlayer(playerId).PlayerData.source, found, json.encode(itemlist))) 
    end 


    if foundweapon then
        Config.Functions.ServerNotify(src, 'You detect something that may be a weapon')
    end

    if foundcontraband then
        Config.Functions.ServerNotify(src, 'You detect something that may be contraband.')
    end

    if not foundweapon and not foundcontraband then     
        Config.Functions.ServerNotify(src, 'You do not detect anything suspicious.')
    end
end)

---- evidence clearing events -------------------

RegisterNetEvent('evidence:server:ClearEvidence', function(pos)
    for k, v in pairs(Evidence) do
        if v.coords and #(vector3(v.coords.x, v.coords.y, v.coords.z) - pos) < 20 then          
            RemoveEvidence(k, 'using clear evidence command')
        else
            local evcoords = GetEntityCoords(NetworkGetEntityFromNetworkId(v.netid))
            if #(evcoords - pos) < 20 then
                RemoveEvidence(k, 'using clear evidence command for networked entity')
            end
        end
    end
end)

RegisterNetEvent('evidence:server:RemoveCarEvidence', function(plate)
    if CarEvidence[plate] and next(CarEvidence[plate]) then
        for k, v in pairs(CarEvidence[plate]) do           
            RemoveEvidence(k, 'removing car evidence')    
        end
        CarEvidence[plate] = nil
    end

    if Config.Debug.Database.enabled then print('Vehicle cleaned, blank table uploaded to plate:', plate) end 

    MySQL.Async.execute('UPDATE '.. Config.DB.Vehicle ..' SET evidence = ? WHERE '.. Config.DB.Plate ..' = ?', {json.encode({}), plate})
    TriggerClientEvent("evidence:client:RemoveCarEvidence", -1, plate)
end)

RegisterNetEvent('evidence:server:RemoveNetPedImpacts', function()
    local src = source
    local cid = QBCore.Functions.GetPlayer(src).PlayerData.citizenid

    if PlayerPedImpacts[cid] and next(PlayerPedImpacts[cid]) then
        for k, v in pairs(PlayerPedImpacts[cid]) do
            RemoveEvidence(k, 'removing network ped impacts')
        end

        PlayerPedImpacts[cid] = nil
    end
end)  

RegisterNetEvent('evidence:server:RemoveNetImpacts', function(netid)
    local src = source

    if NetImpactEvidence[netid] and next(NetImpactEvidence[netid]) then
        for k, v in pairs(NetImpactEvidence[netid]) do
            RemoveEvidence(k, 'removing network entity impacts')
        end

        NetImpactEvidence[netid] = nil
    end
end)  

RegisterNetEvent('evidence:server:fingerprint', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)    

    local info = {
        label = 'Fingerprint Reader Printout',
        tracking = CreateEvidenceId(),
        type = 'fingerprint',
        street = data.street,
        fingerprint = QBCore.Functions.GetPlayer(data.player).PlayerData.metadata.fingerprint,
        date = data.date,
    }

    if Player.Functions.RemoveItem("empty_evidence_bag", 1) then
        if Player.Functions.AddItem("filled_evidence_bag", 1, false, info) then
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["filled_evidence_bag"], "add")
        else
            Config.Functions.ServerNotify(src, Config.Notification.Overweight, "error")
        end
    else
        Config.Functions.ServerNotify(src, Config.Notification.NoBag, "error")
    end
end)

--------- commands -------------

QBCore.Commands.Add("clearevidence", "Clear Area of Evidence (Police Only)", {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.AuthorizedJobs.LEO.Check(source) then
        TriggerClientEvent('evidence:client:ClearEvidenceInArea', src)
    else
        Config.Functions.ServerNotify(src, Config.Notification.IncorrectJob, 'error')
    end
end)

if Config.Debug.DebugCommand then
    QBCore.Commands.Add("r14debug", "Set debug variables in runtime (Admin Only)", {}, false, function(source)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)

        TriggerClientEvent('evidence:client:debugmenu', src)
    end)
end

RegisterNetEvent('evidence:server:SetServerDebugVariable', function(data)
    Config.Debug[data.var].enabled = not data.bool
    
    TriggerClientEvent('evidence:client:setdebugvariable', -1, data)
end)

QBCore.Commands.Add("bagevidence", "Bag evidence from inventory", {}, false, function(source)
    if Config.AuthorizedJobs.LEO.Check(source) then
        TriggerClientEvent('evidence:client:bagevidence', source)
    else
        Config.Functions.ServerNotify(source, Config.Notification.IncorrectJob, 'error')
    end
end)

QBCore.Commands.Add("bagev", "Bag evidence from inventory", {}, false, function(source)
    if Config.AuthorizedJobs.LEO.Check(source) then
        TriggerClientEvent('evidence:client:bagevidence', source)
    else
        Config.Functions.ServerNotify(source, Config.Notification.IncorrectJob, 'error')
    end
end)

QBCore.Commands.Add("19622", "Don't you dare do it.", {}, false, function(source, args)
    local target = args[1]

	local message = args
	table.remove(message, 1)
	local message = table.concat(args, ' ')
    local message = '        ' .. message .. '        '
    local targetveh = GetVehiclePedIsIn(GetPlayerPed(target))
    local original = GetVehicleNumberPlateText(targetveh)

    for i = 1, #message, 1 do
        local plate = string.sub(message, i, i + 8)
        SetVehicleNumberPlateText(targetveh, plate)
        Wait(100)
    end

    SetVehicleNumberPlateText(targetveh, original)
end, "admin")

-- callbacks ----

QBCore.Functions.CreateCallback('evidence:GetDate', function(source, cb)
    local date = os.date("%m/%d/%y @ %I:%M")
    cb(date)
end)

QBCore.Functions.CreateCallback('evidence:GetTime', function(source, cb)
    local time = os.time()
    cb(time)
end)


QBCore.Functions.CreateCallback('evidence:GetCamDate', function(source, cb)
    local date = os.date("%m / %d / %y   %I : %M : %S")
    cb(date)
end)

QBCore.Functions.CreateCallback('police:GetPlayerStatus', function(source, cb, playerId)
    local cid = QBCore.Functions.GetPlayer(playerId).PlayerData.citizenid
    local statList = {}
    if cid then
        if PlayerStatus[cid] and next(PlayerStatus[cid]) then
            for k, v in pairs(PlayerStatus[cid]) do
                statList[k] = v.text
            end
        end
    end

    if Config.Debug.PrintTest.enabled then print(('Investigate Result for %s returns %s'):format(cid, json.encode(statList))) end 

    cb(statList)
end)

QBCore.Functions.CreateCallback('police:GetPlayerGSR', function(source, cb, playerId)
    local cid = QBCore.Functions.GetPlayer(playerId).PlayerData.citizenid
    local gsrpos = false

    if cid then
        if PlayerGSR[cid] and PlayerGSR[cid].status then
            gsrpos = true
        end
    end

    if Config.Debug.PrintTest.enabled then print(('GSR Test Result for %s returns %s'):format(cid, gsrpos)) end 

    cb(gsrpos)
end)

QBCore.Functions.CreateCallback('police:GetExteriorTampering', function(source, cb, plate)
    local tamper = false

    if plate then
        if VehicleExtTampers[plate] and VehicleExtTampers[plate].status then
            tamper = true
        end
    end

    if Config.Debug.PrintTest.enabled then print(('Vehicle exterior tampering inspection for %s returns %s'):format(plate, tamper)) end 

    cb(tamper)
end)

QBCore.Functions.CreateCallback('police:GetIgnitionTampering', function(source, cb, plate)
    local tamper = false

    if plate then
        if VehicleInteriorTampers[plate] and VehicleInteriorTampers[plate].status then
            tamper = true
        end
    end

    if Config.Debug.PrintTest.enabled then print(('Vehicle ignition tampering inspection for %s returns %s'):format(plate, tamper)) end 

    cb(tamper)
end)

if Config.Breathalyzer then
    QBCore.Functions.CreateCallback('police:GetPlayerBAC', function(source, cb, playerId)
        local cid = QBCore.Functions.GetPlayer(playerId).PlayerData.citizenid
        local BAC = "0.0"

        if cid then
            if PlayerBAC[cid] then
                if PlayerBAC[cid] > 1000 then BAC = 1000 else BAC = PlayerBAC[cid] / 1000 end
                BAC = string.format("%.2f", BAC)
            end
        end

        print('here 1')

        if Config.Debug.PrintTest.enabled then print(('BAC Test Result for %s returns %s'):format(cid, BAC)) end 

        print("now here")

        cb(BAC)
    end)
end

if Config.DrugTesting.Enabled then
    QBCore.Functions.CreateCallback('police:GetDrugTestResults', function(source, cb, playerId)
        local src = source
        local cid = QBCore.Functions.GetPlayer(playerId).PlayerData.citizenid
        local TestResults = {}

        local Player = QBCore.Functions.GetPlayer(source)

        if Player.Functions.RemoveItem('drugtestkit', 1) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["drugtestkit"], "remove") 
        else
            Config.Functions.ServerNotify(src, "You do not have a drug test kit!", "error") return
        end

        if cid then
            if PlayerDrugs[cid] then
                for k, v in pairs(Config.DrugTesting.Drugs) do
                    if PlayerDrugs[cid][k] and PlayerDrugs[cid][k] - os.time() > 0 then
                        TestResults[k] = 'POSITIVE'
                    else
                        TestResults[k] = 'Negative'
                    end
                end
            else
                for k, v in pairs(Config.DrugTesting.Drugs) do
                    TestResults[k] = 'Negative'
                end
            end
        end

        if Config.Debug.PrintTest.enabled then print(('Drug Test Result for %s returns %s'):format(cid, json.encode(TestResults))) end 

        cb(TestResults)
    end)
end

--- create usable items ---

QBCore.Functions.CreateUseableItem("accesstool", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)    

    TriggerClientEvent('evidence:client:accesstool', src)
end)

QBCore.Functions.CreateUseableItem("filled_evidence_bag", function(source, item)
    local src = source

    local data = {
        item = item, 
        info = {}
    }
    
    if item.info then 
        if item.info.type == 'casing' then
            data.info = {
                [1] = {label = 'Tracking ID', copy = item.info.tracking},
                [2] = {label = 'Serial Number', copy = string.upper(item.info.serie)},
                [3] = {label = 'Caliber', copy = item.info.ammolabel},
            }
        elseif item.info.type == 'fingerprint' then
            data.info = {
                [1] = {label = 'Tracking ID', copy = item.info.tracking},
                [2] = {label = 'Fingerprint ID', copy = item.info.fingerprint},
            }
        elseif item.info.type == 'blood' then
            data.info = {
                [1] = {label = 'Tracking ID', copy = item.info.tracking},
                [2] = {label = 'DNA ID', copy = item.info.dnalabel},
                [3] = {label = 'Blood Type', copy = item.info.bloodtype},
            }
        elseif item.info.type == 'dna' then
            data.info = {
                [1] = {label = 'DNA', copy = item.info.dnalabel},
            }
        elseif item.info.type == 'fragment' then
            data.info = {
                [1] = {label = 'Tracking ID', copy = item.info.tracking},
                [2] = {label = 'Make and Model', copy = item.info.vehname},
                [3] = {label = 'Color', copy = item.info.vehcolor},
                [4] = {label = 'VIN Match', copy = item.info.plate},
            }
        elseif item.info.type == 'drugtest' then
            data.info = {
                [1] = {label = 'Tracking ID', copy = item.info.tracking},
                [2] = {label = 'DNA', copy = item.info.dnalabel},
            }

            for k, v in pairs(item.info.drugs) do
                data.info[#data.info + 1] = {label = Config.DrugTesting.Drugs[k].label, copy = ('%s: %s'):format(Config.DrugTesting.Drugs[k].label, v)}
            end
        elseif item.info.type == 'item' then
            previtem = table.clone(item.info.item)
            data.info = {
                [1] = {label = 'Tracking ID', copy = item.info.tracking},
                [2] = {label = 'Item Type', copy = item.info.item.label},
            }

            if previtem.info.serie then data.info[#data.info + 1] = {label = 'Serial Number', copy = string.upper(previtem.info.serie)} end

            if previtem.info.quality then 
                local qual = math.ceil(previtem.info.quality)

                if math.ceil(previtem.info.quality) - previtem.info.quality < 0.5 then qual = tostring(math.floor(previtem.info.quality)) end

                data.info[#data.info + 1] = {label = 'Weapon Durability', copy = qual..'%'} 
            end

            if previtem.info.ammo then 
                data.info[#data.info + 1] = {label = 'Loaded Ammunition', copy = previtem.info.ammo} 
            end

            data.info[#data.info + 1] = {retrieve = true, label = item.info.item.label}
        end

        TriggerClientEvent('evidence:client:BagMenu', src, data)

        data = nil
    else       
        Config.Functions.ServerNotify(src, "Something went terribly wrong!", "error")
    end
end)

---- server threads --------

CreateThread(function()
    while true do
        local date = os.date("%m/%d/%y @ %I:%M")
        local time = os.time()
        local camdate = os.date("%m / %d / %y   %I : %M : %S")

        TriggerClientEvent('evidence:client:time', -1, date, time, camdate)

        SendEvidence()
        SendRemove()
        Wait(1000)
    end
end)

CreateThread(function() -- this thread checks for expired evidence drops and removes them
    while true do
        Wait(60000)
        for k, v in pairs(Evidence) do
            if not CarEvidence[k] and v.time then
                if v.time - os.time() <= 0 then
                    RemoveEvidence(k, ('fading %s %s'):format(v.evtype, k))  
                    if Config.Debug.PrintFade.enabled then print(('Evidence %s has been removed from table, type was: %s'):format(k, v.evtype)) end
                end
            end
        end 
    end
end)

CreateThread(function() -- this thread decreases player BAC's over time if enabled
    while Config.Breathalyzer do
        Wait(300000)        
        if next(PlayerBAC) then    
            for k, v in pairs(PlayerBAC) do
                PlayerBAC[k] = v - 10
                if PlayerBAC[k] <= 0 then PlayerBAC[k] = nil end
            end
        end    
        if Config.Debug.PrintBAC.enabled then print(('Player BAC loop updated: %s'):format(json.encode(PlayerBAC))) end 
    end
end)

CreateThread(function() -- this thread decreases removes vehicle tampers
    while true do
        Wait(60000)        
        if next(VehicleExtTampers) then    
            for k, v in pairs(VehicleExtTampers) do
                VehicleExtTampers[k].time = v.time - 10
                if VehicleExtTampers[k].time <= 0 then VehicleExtTampers[k] = nil end
            end
        end    
        if Config.Debug.PrintTamperLoop.enabled then print(('Vehicle exterior tampering loop updated: %s'):format(json.encode(VehicleExtTampers))) end 
        if next(VehicleInteriorTampers) then    
            for k, v in pairs(VehicleInteriorTampers) do
                VehicleInteriorTampers[k].time = v.time - 10
                if VehicleInteriorTampers[k].time <= 0 then VehicleInteriorTampers[k] = nil end
            end
        end    
        if Config.Debug.PrintTamperLoop.enabled then print(('Vehicle interior tampering loop updated: %s'):format(json.encode(VehicleInteriorTampers))) end 
    end
end)

CreateThread(function() --- this thread clears GSR statuses over time
    while true do
        Wait(60000)  
        if next(PlayerGSR) then
            for k, v in pairs(PlayerGSR) do
                local newtime = v.time + 1
                if newtime >= Config.GSR.FadeTime then
                    PlayerGSR[k] = nil
                    local target = QBCore.Functions.GetPlayerByCitizenId(k)
                    if target then 
                        target = target.PlayerData.source
                        TriggerClientEvent('evidence:client:SetGSR', target, false)
                        target = nil
                    end
                else
                    PlayerGSR[k].time = newtime
                end
            end
        end     
        if Config.Debug.PrintGSR.enabled then print(('Player GSR loop updated: %s'):format(json.encode(PlayerGSR))) end 
    end
end)

CreateThread(function() -- this thread keeps track of netids for 
    while true do
        Wait(2000)
        if NetImpactEvidence and next(NetImpactEvidence) then
            for k, v in pairs(NetImpactEvidence) do
                 if not DoesEntityExist(NetworkGetEntityFromNetworkId(k)) or GetEntityModel(NetworkGetEntityFromNetworkId(k)) ~= Models[k] then
                    for i, e in pairs(v) do
                        RemoveEvidence(i, 'removing net impact from reused net id')
                    end
                    Models[k] = nil
                    NetImpactEvidence[k] = nil
                    if Config.Debug.PrintFade.enabled then print(('Evidence for netid %s has been removed from table, table as follows: %s'):format(k, v)) end
                end
            end
        end
        if NetPedImpacts and next(NetPedImpacts) then
            for k, v in pairs(NetPedImpacts) do
                if not DoesEntityExist(NetworkGetEntityFromNetworkId(k)) or GetEntityModel(NetworkGetEntityFromNetworkId(k)) ~= Models[k] then
                    for i, e in pairs(v) do
                        RemoveEvidence(i, 'removing net ped impact from reused net ped id')
                    end
                    NetPedImpacts[k] = nil
                    Models[k] = nil
                    if Config.Debug.PrintFade.enabled then print(('Evidence for networked ped with netid %s has been removed from table, table as follows: %s'):format(k, v)) end
                end
            end
        end
    end
end)

CreateThread(function()
    while true do
        local serverplayers = GetPlayers()
        local srclist = {}

        for k, v in pairs(serverplayers) do
            srclist[v] = true   
        end

        for k, v in pairs(srclist) do
            local src = k
            local bucket = GetPlayerRoutingBucket(tostring(src))

            if ActivePlayers[src] and bucket ~= ActivePlayers[src] then
                TriggerClientEvent('evidence:client:SetBucket', src, bucket)
            end

            ActivePlayers[src] = bucket
        end 

        for k, v in pairs(ActivePlayers) do
            if not srclist[k] then
                ActivePlayers[k] = nil
            end
        end

        Wait(1000)
    end
end)
