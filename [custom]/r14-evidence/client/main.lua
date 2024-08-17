local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData() -- get player data on resource restart
local loaded = false -- this variable is changed once when flying in to load evidence in city

-- add qb-target to check player ID
-- add health status check

-- evidence tables

local CurrentStatusList = {}
local Evidence, NetEvidence, CarEvidence, EvGrid = {}, {}, {}, {}
local AreaEvidence, CamEvidence, AreaNetEvidence, AreaNetEvidenceCache = {}, {}, {}, {}
local CurrentEvidence, SendPacket = nil, {}

-- random variables

local vehlookup = {}
local gsr, shotAmount, gsrpos, freeaiming, lplayer, isfreeaiming, selectedwep, gsrwashoff = 0, 0, false, false, nil, nil, nil, 0 -- gsr related variables
local inmenu, newmenu = false, false
local JustBled = false
local lastdamaged, lastwep, boneindex = nil, nil, nil
local gsrtimeout, bloodtimeout, casingtimeout, impacttimeout = false, false, false, false
local damagetypes = {[2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [8] = true, [11] = true, [14] = true} -- damage types that produce blood, do not touch unless you have researched the native
local AuthorizedJobs, ActiveLEO, ActiveEMS, ActiveFR = Config.AuthorizedJobs, false, false, false
local meleetimeout, drivebytimeout, explosivestimeout, fireworkstimeout, shotsfiredtimeout = nil, nil, nil, nil, nil

-- flashlight configs

local usingflashlight = false -- do not touch
local curopac = 200 -- opacity of current pickup
local cursize = 0.1
local flashdist = 8 -- distance flashlight reveals evidence
local curdist = 2 -- distance current evidence drop is visible
local areadist = 20 -- distance that evidence is cached, larger radius will decrease preformance but be less 'choppy' moving with a flashlight
local areanetdist = 100 -- distance that evidence attached to networked entities will be cached
local pudist = 1.5 -- distance the player must be within to have a current evidence pickup
local curbucket = 0
local collection = nil -- used to set time of collection for evidence
local time = nil -- used to compare time

-- Camera Config

local camlim = 20 -- limits how many 3D text tags are drawn by the camera, due to fivem limitations, only 32 tags can be drawn at a time, any more will appear in the top left corner of the screen
local camdist = 10 -- distance camera reveals evidence
local cammin = 2 -- distance evidence has to be away from ped to be tagged
local camopac = 170 -- opacity of evidence markers drawn by camera
local markersize = {
    ['blood'] = 0.045, -- size of blood marker
    ['casing'] = 0.045, -- size of casing marker
    ['fingerprint'] = 0.045, -- size of fingerprint marker
    ['impact'] = 0.030, -- size of impact marker
    ['netimpact'] = 0.030, -- size of net impact marker
    ['netpedimpact'] = 0.045, -- size of net impact marker
    ['tampering'] = 0.030, -- size of tampering marker
    ['fragment'] = 0.045, -- size of vehicle fragment
}

local markercolor = {
    ['blood'] = {r = 214, g = 48, b = 36}, -- blood marker color
    ['casing'] = {r = 97, g = 230, b = 87}, -- casings marker color
    ['fingerprint'] = {r = 67, g = 209, b = 166}, -- fingerprint marker color 
    ['impact'] = {r = 197, g = 197, b = 197}, -- impact marker color
    ['netimpact'] = {r = 197, g = 197, b = 197}, -- net impact marker color
    ['netpedimpact'] = {r = 214, g = 48, b = 36}, -- blood marker color
    ['tampering'] = {r = 197, g = 197, b = 197}, -- tampering marker color
    ['fragment'] = {r = 235, g = 52, b = 213}, -- fragment marker color
}

-------------- initalization ------------------

for k, v in pairs(QBCore.Shared.Vehicles) do
    vehlookup[v.hash or joaat(k)] = ('%s %s'):format(v.brand, v.name)
    if not v.hash then print(('%s vehicle is missing a hash in your QBShared.Vehicles table, hashed name temporarily'):format(k)) end
end

if not loaded then TriggerServerEvent('evidence:server:FetchEv') loaded = true end

if PlayerData and PlayerData.job then
    ActiveLEO = AuthorizedJobs.LEO.Check()
    ActiveEMS = AuthorizedJobs.EMS.Check()
    ActiveFR = AuthorizedJobs.FirstResponder.Check()
end

RegisterNetEvent('evidence:client:LoadEvidence', function(evtable)
    TriggerEvent('evidence:client:AddEvidence', evtable)               
end)

------------- base qb-events -----------------------

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()

    ActiveLEO = AuthorizedJobs.LEO.Check()
    ActiveEMS = AuthorizedJobs.EMS.Check()
    ActiveFR = AuthorizedJobs.FirstResponder.Check()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData = QBCore.Functions.GetPlayerData()

    ActiveLEO = AuthorizedJobs.LEO.Check()
    ActiveEMS = AuthorizedJobs.EMS.Check()
    ActiveFR = AuthorizedJobs.FirstResponder.Check()
end)

------------------- general functions

local function DrawText3D(x, y, z, text)
    SetTextScale(0.3, 0.3)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextOutline(3, 0, 0, 0, 255)
    SetTextEntry('STRING')
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z + .1, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

local function DnaHash(s)
    if not s then return end
    local h = string.gsub(s, '.', function(c)
        return string.format('%02x', string.byte(c))
    end)
    return h
end

local function GetStreet()
    local street = nil
    local pos = GetEntityCoords(ped)

    local s1, s2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
    
    if s2 then
        street = tostring(GetStreetNameFromHashKey(s1)) .. ' | ' .. tostring(GetStreetNameFromHashKey(s2))
    else
        street = tostring(GetStreetNameFromHashKey(s1))
    end

    return street:gsub("%'", "")
end

local function SendEvidence()
    evpack = table.clone(SendPacket)
    SendPacket = {}
    TriggerServerEvent('evidence:server:CreateEvidence', evpack)
end

local function SetGSR(time)
    if not gsrtimeout then
        TriggerEvent('evidence:client:SetStatus', 'gunpowder', time)
        gsrtimeout = true
        SetTimeout(1000, function()
            gsrtimeout = false
        end)
    end
end

local function CreateEvidence(event, data)
    data.event = event   
    table.insert(SendPacket, table.clone(data))
end


local function CreateVehicleFragment(type, diff)
    local vehseats = GetVehicleModelNumberOfSeats(GetEntityModel(curveh)) - 2
    local checkped = nil
    local data = {}

    for i = vehseats, -1, -1  do
        local occupant = GetPedInVehicleSeat(curveh, i)

        if IsPedAPlayer(occupant) then
            checkped = occupant
        end
    end

    if checkped ~= ped then return end
    
	local vehcolor1, vehcolor2 = GetVehicleColours(curveh)
	local plate = GetVehicleNumberPlateText(curveh)
    local vehhash = GetEntityModel(curveh)
    local vehname = nil

    if Config.Colours[tostring(vehcolor1)] then
		vehcolor = Config.Colours[tostring(vehcolor1)]
    else
		vehcolor = "Unknown"
    end

    local randX = math.random() + math.random(-1, 1)
    local randY = math.random() + math.random(-1, 1)
    local coords = GetOffsetFromEntityInWorldCoords(ped, randX, randY, 0)
    local is, groundz = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z, true)

    data.coords = vector3(coords[1], coords[2], groundz + 0.03)

    if vehlookup[vehhash] then
        vehname = vehlookup[vehhash]
    else
        if DoesTextLabelExist(GetDisplayNameFromVehicleModel(GetEntityModel(curveh))) then
            vehname = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(curveh)))
        else
            vehname = ('%s %s'):format(GetMakeNameFromVehicleModel(GetEntityModel(curveh)), GetDisplayNameFromVehicleModel(GetEntityModel(curveh)))
            vehname = string.gsub(" "..vehname, "%W%l", string.upper):sub(2)
        end
    end

    if type == 'body' then
        data.vehcolor = vehcolor
        if diff > 50 then data.vehname = vehname end
    elseif type == 'engine' then
        data.vehname = vehname
        if diff > 50 then data.plate = QBCore.Functions.GetPlate(curveh) end
    end

    CreateEvidence('VehicleFragment', data)
end

local function CreateBlood()
    local seat = -1

    if not IsPedInAnyVehicle(ped) then
        local randX = math.random() + math.random(-1, 1)
        local randY = math.random() + math.random(-1, 1)
        local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), randX, randY, 0)
        local is, groundz = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z, false)
        local coords =  vector3(coords.x, coords.y, groundz + .02)
        CreateEvidence("Blood", {coords = coords})
    else
        local vehseats = GetVehicleModelNumberOfSeats(GetEntityModel(curveh))
        for i = -1, vehseats do
            seat = seat + 1
            local occupant = GetPedInVehicleSeat(curveh, i)
            if occupant == ped and i then
                CreateEvidence('CarBlood', {citizenid = PlayerData.citizenid, bloodtype = PlayerData.metadata["bloodtype"], plate = QBCore.Functions.GetPlate(curveh) , seat = seat + 1})
            end
        end
    end
end

local function DropBulletCasing(weapon, ped)
    local data = {}
    local model = `prop_sgun_casing`
    local offx, offy, offz = -0.2, -0.2, 0.0
    local closetVeh = QBCore.Functions.GetClosestVehicle(GetEntityCoords(ped))

    -- check for left/down eject
    if Config.LeftHandEject[weapon] then offx, offy, offz = 0.0, 0.2, 0.0 end
    if Config.DownEject[weapon] then offx, offy, offz = 0.0, 0.0, -0.2 end

    local wep = GetCurrentPedWeaponEntityIndex(ped)

    local wepcoords = GetOffsetFromEntityInWorldCoords(wep, offx, offy, 0.0)

    while not HasModelLoaded(model) do
        Wait(10)
        RequestModel(model)
    end

    local casing = CreateObject(model, wepcoords.x, wepcoords.y, wepcoords.z, true, false, false)
    SetEntityVisible(casing, false)
    SetEntityNoCollisionEntity(casing, ped, false)
    SetEntityNoCollisionEntity(casing, wep, false)
    SetEntityNoCollisionEntity(casing, closetVeh, false)

    local wepvec = GetEntityForwardVector(wep)

    local randX = math.random() + math.random(50, 70)
    local randY = math.random() + math.random(50, 70)

    local randX, randY = randX * 0.1, randY * 0.1

    if Config.LeftHandEject[weapon] then 
        ApplyForceToEntity(casing, 1, (wepvec.x * randX), (wepvec.y * randY), wepvec.z, 0, 0, 0, 0, false, true, true, false, true)
    elseif Config.DownEject[weapon] then
        SetEntityCoords(casing, GetOffsetFromEntityInWorldCoords(wep, 0.0, 0.0, -0.2), true, false, false)
        ApplyForceToEntity(casing, 1, wepvec.x, wepvec.y, -wepvec.z * 3.0, 0, 0, 0, 0, false, true, true, false, true)
    else
        ApplyForceToEntity(casing, 1, (-wepvec.x * randX), (-wepvec.y * randY), -wepvec.z, 0, 0, 0, 0, false, true, true, false, true)
    end

    if Config.Debug.OutlineCasings.enabled then SetEntityDrawOutline(casing, true) end

    ActivatePhysics(casing)

    Wait(500)

    while GetEntitySpeed(casing) > 0.1 do
        Wait(200)
    end

    local createCoords = GetEntityCoords(casing)

    local is, groundz = GetGroundZFor_3dCoord(createCoords.x, createCoords.y, createCoords.z, false) -- set at groundz so casings don't get stuck on top of vehicles
    createCoords = vector3(createCoords.x, createCoords.y, groundz + 0.05)

    data = {
        coords = createCoords,
        curserial = curserial,
        weapon = weapon,
        curwephash = curwephash,
    }
    DeleteEntity(casing)

    CreateEvidence('Casing', data)
end

local function CreateBulletImpact(weapon, ped, impactcoords)
    local ammotype = GetPedAmmoTypeFromWeapon(ped, weapon)
    local wep = GetCurrentPedWeaponEntityIndex(ped)
    local muz = GetEntityBoneIndexByName(wep, 'Gun_Muzzle')       
    local coords = nil

    if muz ~= -1 then
        coords = GetWorldPositionOfEntityBone(wep, muz)
    else
        coords = GetEntityCoords(ped)
    end

    if IsPedDoingDriveby(ped) and #(impactcoords - coords) < 1 then lastdamaged, lastwep, boneindex = nil, nil, nil return end -- this ends the bullet impact creation if the impact is too close to the gun's muzzle while in a vehicle, this is the lazy of fixing weapon impacts while in first person appearing where they pass through the shooter's windshield

    local nrm = (norm(coords - impactcoords)) + impactcoords

    if lastdamaged and weapon == lastwep then
        if IsEntityAPed(lastdamaged) and boneindex then
            local isplayer = false
            if IsPedAPlayer(lastdamaged) then isplayer = GetPlayerServerId(NetworkGetPlayerIndexFromPed(lastdamaged)) end
                
            CreateEvidence('NetworkedPedBulletImpact', {ammotype = ammotype, netid = NetworkGetNetworkIdFromEntity(lastdamaged), boneindex = boneindex, isplayer = isplayer})
        else                
            local offset, normoffset = GetOffsetFromEntityGivenWorldCoords(lastdamaged, impactcoords.x, impactcoords.y, impactcoords.z), GetOffsetFromEntityGivenWorldCoords(lastdamaged, nrm.x, nrm.y, nrm.z)
            CreateEvidence('NetworkedBulletImpact', {ammotype = ammotype, netid = NetworkGetNetworkIdFromEntity(lastdamaged), offset = offset, normoffset = normoffset})
        end

        lastdamaged, lastwep, boneindex = nil, nil, nil
    else
        local data = {ammotype = ammotype, coords = impactcoords, norm = nrm}
        CreateEvidence('BulletImpact', {ammotype = ammotype, coords = impactcoords, norm = nrm})
        lastdamaged, lastwep, boneindex = nil, nil
    end 
end

local function RND10(num)
    return num - (num % 10)
end

local function ImportNeighbor(key)
    if EvGrid[key] then
        for k, v in pairs(EvGrid[key]) do
            local tag = Evidence[k].tag 
            if viewev then
                tag = Evidence[k].civtag 
            end

            if not (viewev and not Evidence[k].civtag) then
                AreaEvidence[k] = table.clone(Evidence[k])
                AreaEvidence[k].distance = #(pos - Evidence[k].coords)
                AreaEvidence[k].tag = tag
            end    
        end
    end
end

local function GetNeighbors(keypos)
    AreaEvidence = {}

    for i = keypos[1] - 10, keypos[1] + 10, 10 do 
        for k = keypos[2] - 10, keypos[2] + 10, 10 do
            ImportNeighbor(json.encode({i, k}))
        end
    end
end

local CurEvLoopRunning = false

local function CurEvLoop()
    if not CurEvLoopRunning then
        CurEvLoopRunning = true
        CreateThread(function() -- this thread allows police to pick up the currently selected evidence drop and create the evidence bag item
            while CurrentEvidence do
                Wait(0)      
                local pos = GetEntityCoords(ped)
                local coords = nil
                if CurrentEvidence then coords = CurrentEvidence.coords else CurEvLoopRunning = false break end
                local dist = #(pos - CurrentEvidence.coords)
                if dist < curdist then
                    DrawMarker(23, CurrentEvidence.coords.x, CurrentEvidence.coords.y, CurrentEvidence.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, cursize, cursize, cursize, CurrentEvidence.color.r, CurrentEvidence.color.g, CurrentEvidence.color.b, curopac, false, false, 2, nil, nil, false)
                    DrawText3D(CurrentEvidence.coords.x, CurrentEvidence.coords.y, CurrentEvidence.coords.z, '~g~G~w~ - ' .. CurrentEvidence.tag)
                    if IsControlJustReleased(0, 47) then
                        local info = {}
                        if CurrentEvidence.evtype == 'casing' then
                            info = {
                                label = 'Spent Casing',
                                tracking = CurrentEvidence.evidenceId,
                                type = 'casing',
                                street = GetStreet(),
                                ammolabel = Evidence[CurrentEvidence.evidenceId].caliber,
                                serie = Evidence[CurrentEvidence.evidenceId].serie,
                                date = collection
                            }
                        elseif CurrentEvidence.evtype == 'blood' then
                            info = {
                                label = 'Blood Sample',
                                tracking = CurrentEvidence.evidenceId,
                                type = 'blood',
                                street = GetStreet(),
                                dnalabel = Evidence[CurrentEvidence.evidenceId].dna,
                                bloodtype = Evidence[CurrentEvidence.evidenceId].bloodtype,
                                date = collection
                            }
                        elseif CurrentEvidence.evtype == 'fingerprint' then
                            info = {
                                label = 'Fingerprint',
                                tracking = CurrentEvidence.evidenceId,
                                type = 'fingerprint',
                                street = GetStreet(),
                                fingerprint = Evidence[CurrentEvidence.evidenceId].fingerprint,
                                date = collection
                            }
                        elseif CurrentEvidence.evtype == 'fragment' then
                            info = {
                                label = 'Vehicle Fragment',
                                tracking = CurrentEvidence.evidenceId,
                                type = 'fragment',
                                street = GetStreet(),
                                vehcolor = Evidence[CurrentEvidence.evidenceId].vehcolor or 'Unknown',
                                vehname = Evidence[CurrentEvidence.evidenceId].vehname or 'Unknown',
                                plate = Evidence[CurrentEvidence.evidenceId].plate or 'No Match',
                                date = collection
                            }
                        end                  
                        TriggerServerEvent('evidence:server:AddEvidenceToInventory', CurrentEvidence.evidenceId, info)                    
                        AreaEvidence[CurrentEvidence.evidenceId] = nil
                        CurrentEvidence = nil
                        CurEvLoopRunning = false
                        break
                    end
                else
                    CurrentEvidence = nil
                end
            end
            CurEvLoopRunning = false
        end)
    end
end

local function GSRLogic()
    if IsEntityInWater(ped) then 
        gsrwashoff = gsrwashoff + 1
        if IsPedSwimming(ped) then
            gsrwashoff = gsrwashoff + 1
        end
    end 
    if gsrwashoff > 90 then TriggerEvent('evidence:client:SetGSR', false) gsrwashoff = 0 end
end

------------------- event listeners for other scripts

RegisterNetEvent('weapons:client:SetCurrentWeapon', function(data, bool) -- this listens for events from qb-weapons
    if data and next(data)then    
        curserial = data.info.serie
        curwephash = joaat(data.name)
    else
        curserial = nil
        curwephash = nil
    end
end)

RegisterNetEvent(Config.Emote.Event, function(arg1, arg2, arg3, arg4, arg5, arg6) -- this event listens for emotes so civlians can view evidence
    local args = {arg1, arg2, arg3, arg4, arg5, arg6}
    local name = args[Config.Emote.Arg]

    if Config.Emote.Array then name = name[Config.Emote.Key] end

    if Config.Emote.Activate[name] then 
        CreateThread(function()
            local curdict = Config.Emote.Activate[name].dict
            local curanim = Config.Emote.Activate[name].anim
            local curscenario = Config.Emote.Activate[name].scenario

            Wait(500)

            CamEvidence = {} -- clear cam evidence to bring in new civtags
            AreaEvidence = {}
            AreaNetEvidence = {}
            viewev = true      

            while viewev do 
                if curscenario then
                    if not IsPedUsingScenario(ped, curscenario) then
                        viewev = false
                        CamEvidence = {}
                        AreaEvidence = {}
                        AreaNetEvidence = {}                
                        return
                    end
                else
                    if not IsEntityPlayingAnim(ped, curdict, curanim, 3) then
                        viewev = false
                        CamEvidence = {}
                        AreaEvidence = {}
                        AreaNetEvidence = {}
                        return
                    end
                end
                Wait(200)
            end       
        end)
    else
        viewev = false
        CamEvidence = {}
        AreaEvidence = {}
        AreaNetEvidence = {}
    end
end)

RegisterNetEvent('hospital:client:Revive', function() -- listens to the ambulance job script for when the player is revived, and removes any networked impacts from them
    TriggerServerEvent('evidence:server:RemoveNetPedImpacts')
end)

------ game event handlers

AddEventHandler('CEventGunShotBulletImpact', function(_, shooter, _) -- this event listens for bullet impacts using a base game event
    if not impacttimeout and shooter == ped then

        local is, impactcoords = GetPedLastWeaponImpactCoord(ped)
        impactweap = GetSelectedPedWeapon(ped)

        impacttimeout = true

        SetTimeout(1, function() 
            impacttimeout = false 
        end)

        if not Config.NoImpactWeapon[impactweap] and GetWeaponDamageType(impactweap) == 3 then
            CreateBulletImpact(impactweap, ped, impactcoords)
        end
    end
end)

AddEventHandler('CEventGunShot', function(_, shooter, args) -- this event listens for gun shots using a base game event
    local dist = #(GetEntityCoords(shooter) - GetEntityCoords(ped))
    local checkwep = GetSelectedPedWeapon(shooter)

    if dist < 6.0 then 
        if not Config.NoGSRWeapon[checkwep] then
            if gsr then
                gsr = gsr + 1
                if gsr > Config.GSR.MinShotsStatus then SetGSR(200) end
            else
                gsr = 1
            end
        end
    end

    if not casingtimeout and shooter == ped then
        casingtimeout = true
        local weapon = GetSelectedPedWeapon(ped)
        if not Config.NoGSRWeapon[weapon] and GetWeaponDamageType(weapon) == 3 then
            shotAmount = shotAmount + 1
            if shotAmount > Config.GSR.MinShotsPositive then
                local chance = math.random(0, 100)
                if not Config.GSR.ShootingChance then
                    TriggerEvent('evidence:client:SetGSR', true)
                elseif chance <= Config.GSR.ShootingChance then
                    TriggerEvent('evidence:client:SetGSR', true)
                end
            end
        end
        if not Config.NoCasingWeapon[weapon] then
            local caseveh = GetVehiclePedIsIn(ped, false)
            local casevehmodel = GetEntityModel(caseveh)

            CreateThread(function()
                if IsPedInAnyVehicle(ped) and (not IsThisModelABicycle(casevehmodel) or not IsThisModelABike(casevehmodel)) then
                    local chance = math.random(1, 100)
                    if chance > Config.VehCasingChance then
                        DropBulletCasing(weapon, ped)                         
                    else
                        CreateEvidence('CarCasing', {weapon = weapon, plate = QBCore.Functions.GetPlate(caseveh), curwephash = curwephash, curserial = curserial})
                    end
                else
                    DropBulletCasing(weapon, ped)                       
                end
            end)
        end

        SetTimeout(1, function() 
            casingtimeout = false 
        end)
       
        if not Config.NoAlertWeapon[weapon] then
            if Config.ExplosiveDevice[weapon] then
				if Config.Alerts.Active then Config.Alerts.ExplosiveDevice() end
            elseif weapon == `weapon_firework` then
                if Config.Alerts.Active then Config.Alerts.IllegalFireworks() end
            else
                if IsPedInAnyVehicle(ped) then
                    if Config.Alerts.Active then Config.Alerts.DriveBy() end
                elseif not IsPedInAnyVehicle(ped) then
                    if Config.Alerts.Active then Config.Alerts.ShotsFired() end
                end
            end
        end
    end
end)

AddEventHandler('gameEventTriggered', function (name, args) -- listens for network entity damage events for vehicle fragment generation and to assign bullet impacts to network entities
    if name == 'CEventNetworkEntityDamage' then
        if args[1] == curveh or args[2] == curveh then
            local newbody = GetVehicleBodyHealth(curveh)
            local neweng = GetVehicleEngineHealth(curveh)

            local diffbody = curbody - newbody
            local diffeng = cureng - neweng

            if diffbody > 20 then
                CreateVehicleFragment('body', diffbody)
            end

            if diffeng > 20 then
                CreateVehicleFragment('engine', diffeng)
            end

            curbody = newbody
        end

        if args[1] ~= ped then
            lastdamaged = args[1]
            lastwep = args[7]

            if lastdamaged then
                if IsEntityAPed(lastdamaged) then
                    local _, bone = GetPedLastDamageBone(lastdamaged)
                    boneindex = GetPedBoneIndex(lastdamaged, bone)
                end
            end
                
            if args[7] == `weapon_unarmed` then
                if Config.Alerts.Active then Config.Alerts.Melee() end
            end
        elseif args[1] == ped and (args[7] == -842959696 or damagetypes[GetWeaponDamageType(args[7])]) and not bloodtimeout then
            local chance = math.random(0, 100)

            if chance > Config.Bleed.DamageChance then CreateBlood() end

            bloodtimeout = true
            
            SetTimeout(1000, function() 
                bloodtimeout = false 
            end)
        end
    end
end)

-- general events

RegisterNetEvent('evidence:client:time', function(curdate, curtime)
    collection = curdate
    time = curtime
end)

RegisterNetEvent('evidence:client:GetBloodInfo', function()
    CreateBlood()
end)

RegisterNetEvent('evidence:client:SetBucket', function(plybucket)
    curbucket = plybucket
end)

RegisterNetEvent('evidence:client:CopyEvidence', function(data)
    Config.Functions.Notify((Config.Notification.Clipboard):format(data.text), 'success')
    SendNUIMessage({
        copy = data.text,
        type = 'copy',
    })
end)

RegisterNetEvent('evidence:client:UpdatePlayerID', function(evtable)
    for k, v in pairs(evtable) do
        if NetworkedPedBulletImpacts[k] then
            NetworkedPedBulletImpacts[k].netid = v
        end
    end
end)

RegisterNetEvent('evidence:client:accesstool', function(data)
    local accessing = true
    local inventory = QBCore.Functions.GetPlayerData().items
    local found = false
    local veh = nil

    for k, v in pairs(inventory) do
        if v.name == 'accesstool' then
            found = true
        end
    end

    if IsPedInAnyVehicle(ped, false) then return end
    if not found then return end -- cancel out if no access tool found in inventory

    if not data then veh = QBCore.Functions.GetClosestVehicle(pos) else veh = data.entity end

    if not veh or not data and #(GetEntityCoords(veh) - pos) > 3 then Config.Functions.Notify('No nearby vehicle!', "error") return end -- break function if no nearby vehicle
    if GetVehicleDoorLockStatus(veh) < 2 then Config.Functions.Notify('This vehicle is not locked!', "error") return end

	TaskTurnPedToFaceEntity(ped, veh, 1000) Wait(1000)

    while (not HasAnimDictLoaded("veh@break_in@0h@p_m_one@")) do
        RequestAnimDict("veh@break_in@0h@p_m_one@")
        Wait(0)
    end

    CreateThread(function()
        while accessing do
            TaskPlayAnim(ped, "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3.0, 3.0, -1, 16, 0, 0, 0, 0) 
            Wait(1000)
        end
    end)

    if not ActiveFR then if Config.Alerts.Active then Config.Alerts.VehicleTheft(veh) end end

    QBCore.Functions.Progressbar("slimjim", "Accessing vehicle...", 2500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
		animDict = "veh@break_in@0h@p_m_one@",
		anim = "low_force_entry_ds",
        flags = 16,
    }, {}, {}, function() -- Done
        accessing = false
        plate = QBCore.Functions.GetPlate(veh)

		ClearPedTasks(ped)                        

        TriggerEvent('qb-vehiclekeys:client:UpdateLastPicked', veh)
        TriggerServerEvent('qb-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(veh), 1)
        NetworkRequestControlOfEntity(veh)
        SetVehicleDoorsLocked(veh, 1)

        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "lock", 0.3)
	    TriggerServerEvent('evidence:server:SetExteriorTamper', true, plate)

        Config.Functions.Notify(Config.Notification.Unlock, "success")
        if Config.Consume.AccessTool then TriggerServerEvent('evidence:server:useaccesstool') end
    end, function() -- Cancel
        accessing = false

		ClearPedTasks(ped)
    end)
    accessing = false
end)

------------------- events related to statuses and blood alcohol -------------------------

RegisterNetEvent('police:client:CheckStatus', function() --- this is so qb-radial menu works the same way as the target function
    QBCore.Functions.GetPlayerData(function(PlayerData)       
        if ActiveFR then
            local player, distance = GetClosestPlayer()
            if player ~= -1 and distance < 5.0 then
                local playerId = GetPlayerServerId(player)
                QBCore.Functions.TriggerCallback('police:GetPlayerStatus', function(result)
                    local status = ''
                    if result then
                        for k, v in pairs(result) do
                            if status == '' then status = v else status = ("%s, %s"):format(status, v) end
                        end
                    end
                    if status == "" then
                        Config.Functions.Chat({
                            color = { 255, 0, 0},
                            multiline = false,
                            args = {("You notice nothing unusual about "), playerId}
                        })
                    else
                        Config.Functions.Chat({
                            color = { 255, 0, 0},
                            multiline = false,
                            args = {("You notice %s: "):format(playerId), status}
                        })
                    end
                end, playerId)
            else
                Config.Functions.Notify(Config.Notification.NoTarget, "error")
            end
        end
    end)
end)

RegisterNetEvent('evidence:client:investigate', function(data)
    local target = GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))

    if Config.Debug.PrintTestC.enabled then print(("Investigate event triggered for %s: %s"):format(target, json.encode(data))) end

    QBCore.Functions.Progressbar("investigating", "Investigating person...", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@amb@board_room@whiteboard@",
        anim = "examine_close_01_amy_skater_01",
        flags = 16,
    }, {}, {}, function() -- Done
        ClearPedTasks(ped)
        
        if #(GetEntityCoords(ped) - GetEntityCoords(data.entity)) < 4 then
            TriggerEvent('evidence:client:investigateresult', data)
        else
            Config.Functions.Notify(Config.Notification.Evading, 'error')                    
        end
        
    end, function() -- Cancel
        ClearPedTasks(ped)
    end)
end)

RegisterNetEvent('evidence:client:investigateresult', function(data)
    local playerId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))
    QBCore.Functions.TriggerCallback('police:GetPlayerStatus', function(result)
        local status = ''
        if result then
            for k, v in pairs(result) do
                if status == '' then status = v else status = ("%s, %s"):format(status, v) end
            end
        end
        if status == "" then
            Config.Functions.Chat({
                color = { 255, 0, 0},
                multiline = false,
                args = {("You notice nothing unusual about "), playerId}
            })
        else
            Config.Functions.Chat({
                color = { 255, 0, 0},
                multiline = false,
                args = {("You notice %s: "):format(playerId), status}
            })
        end
    end, playerId)
end)

CreateThread(function() -- initialize drug testing events

end)

RegisterNetEvent('evidence:client:SetStatus', function(statusId, time, abv)
    if Config.Breathalyzer and (statusId == 'alcohol' or statusId == 'heavyalcohol') then
        TriggerServerEvent('evidence:server:IncreaseBAC', abv or 15) -- increases BAC by .015 or by abv if a third argument is supplied
    end

    if Config.DrugTesting.Enabled and Config.DrugTesting.UsingQBSR and statusId == 'weedsmell' then
        TriggerServerEvent('evidence:server:SetDrugStatus', {drug = 'weed'})
    end

    if time > 0 and Config.StatusList[statusId] then
        if (CurrentStatusList == nil or CurrentStatusList[statusId] == nil) or (CurrentStatusList[statusId] and CurrentStatusList[statusId].time < 20) then
            CurrentStatusList[statusId] = {
                text = Config.StatusList[statusId],
                time = time
            }
            Config.Functions.Notify(''..CurrentStatusList[statusId].text..'')
        end
    elseif Config.StatusList[statusId] then
        CurrentStatusList[statusId] = nil
    end
    TriggerServerEvent('evidence:server:UpdateStatus', CurrentStatusList)
end)


if Config.DrugTesting.Enabled and Config.DrugTesting.EventTriggers then
    for k, v in pairs(Config.DrugTesting.EventTriggers) do
        if v.type == 'client' then
            RegisterNetEvent(v.event, function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg9, arg10)

                local args = {[1] = arg1, [2] = arg2, [3] = arg3, [4] = arg4, [5] = arg5, [6] = arg6, [7] = arg7, [8] = arg8, [9] = arg9, [10] = arg10}
              
                checkArg = v.drugArgPos and v.drugArgSubfield and args[v.drugArgPos] and args[v.drugArgPos][v.drugArgSubfield] or v.drugArgPos and args[v.drugArgPos]
                checkValue = v.drugArgPos and v.drugArgValue and v.drugArgValue

                if (not checkArg and not checkValue) or (checkArg and not checkValue) or (checkArg and checkValue and checkArg == checkValue) then
                    TriggerServerEvent('evidence:server:SetDrugStatus', {drug = v.drugType, hours = v.positiveTime})
                end                
            end)            
        end
    end
end

RegisterNetEvent('evidence:client:breathalyze', function(data)
    local target = GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))

    TriggerServerEvent('evidence:server:notifytarget', target, 'Someone is attempting to breathalyze you.')

    if Config.Debug.PrintTestC.enabled then print(("Breathalyzer event triggered for %s: %s"):format(target, json.encode(data))) end

    QBCore.Functions.Progressbar("breathalyzing", "Using Breathalyzer...", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = nil,
        anim = nil,
        flags = nil,
    }, {}, {}, function() -- Done
        ClearPedTasks(ped)

        if #(GetEntityCoords(ped) - GetEntityCoords(data.entity)) < 4 then
            TriggerEvent('evidence:client:BACresult', data)
        else
            Config.Functions.Notify(Config.Notification.Evading, 'error')                    
        end    
    end, function() -- Cancel
        ClearPedTasks(ped)
    end)
end)

RegisterNetEvent('evidence:client:BACresult', function(data)
    local playerId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))
    QBCore.Functions.TriggerCallback('police:GetPlayerBAC', function(result)
        if result ~= "0.0" then
            Config.Functions.Chat({
                color = { 255, 0, 0},
                multiline = false,
                args = {"Breathalyzer Result:", ("%s has blew %s"):format(playerId, result)}
            })

            local info = {
                result = result,
                date = collection,
                street = GetStreet(),
                type = 'bac',
                label = 'Breathalyzer Printout',
            }

            TriggerServerEvent('evidence:server:AddBACToInventory', info)
        else
            Config.Functions.Chat({
                color = { 255, 0, 0},
                multiline = false,
                args = {"Breathalyzer Result:", ("%s blew 0.0"):format(playerId)}
            })
        end
        
    end, playerId)
end)

RegisterNetEvent('evidence:client:drugtest', function(data)
    local target = GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))

    TriggerServerEvent('evidence:server:notifytarget', target, 'Someone is attempting to drug test you.')

    if Config.Debug.PrintTestC.enabled then print(("Drug test event triggered for %s: %s"):format(target, json.encode(data))) end

    QBCore.Functions.Progressbar("drugtesting", "Administring Multipanel Oral Drug Test...", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = nil,
        anim = nil,
        flags = nil,
    }, {}, {}, function() -- Done
        ClearPedTasks(ped)

        if #(GetEntityCoords(ped) - GetEntityCoords(data.entity)) < 4 then
            TriggerEvent('evidence:client:DrugTestResult', data)
        else
            Config.Functions.Notify(Config.Notification.Evading, 'error')                    
        end    
    end, function() -- Cancel
        ClearPedTasks(ped)
    end)
end)

RegisterNetEvent('evidence:client:DrugTestResult', function(data)
    local playerId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))
    QBCore.Functions.TriggerCallback('police:GetDrugTestResults', function(result)
        local template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br> '
        local count = 1
        local message = {[0] = ("Multipanel Oral Drug Test Results (%s)"):format(playerId)}

        for k, v in pairs(Config.DrugTesting.Drugs) do
            template = ('%s<strong>%s:</strong> {%s} <br>'):format(template, v.label, count)
            message[count] = result[k]
            count = count + 1
        end

        template = template .. '</div></div>'

        Config.Functions.Chat({
				template = template,
				args = message
        })

        local description = nil

        for k, v in pairs(result) do
            if description then 
                description = ('%s <p><strong>%s: </strong><span> %s '):format(description, Config.DrugTesting.Drugs[k].label, result[k])
            else
                description = ('</span></p><p><strong>%s: </strong><span> %s '):format(Config.DrugTesting.Drugs[k].label, result[k])
            end
        end

        local drugInfo = {
            result = description .. '</span></p>',
            street = GetStreet(),
            type = 'drugtest',
            label = 'Multipanel Oral Drug Test',
            date = collection,
            player = playerId,
            drugs = result,
        }
        
        TriggerServerEvent('evidence:server:AddDrugTestToInventory', drugInfo)
    end, playerId)
end)

RegisterNetEvent('evidence:client:fingerprint', function(data)
    local target = GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))

    TriggerServerEvent('evidence:server:notifytarget', target, 'Someone is attempting to fingerprint you.')

    if Config.Debug.PrintTestC.enabled then print(("Fingerprint event triggered for %s: %s"):format(target, json.encode(data))) end

    QBCore.Functions.Progressbar("fingerprinting", "Taking Fingerprint...", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = nil,
        anim = nil,
        flags = nil,
    }, {}, {}, function() -- Done
        ClearPedTasks(ped)

        local targetcoords = GetEntityCoords(data.entity)

        if #(GetEntityCoords(ped) - GetEntityCoords(data.entity)) < 4 then

            TriggerServerEvent('evidence:server:fingerprint', {player = GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)), street = GetStreet(), date = collection}) -- Triggers a client event called testing:event and sends the argument 'test' with it
        else
            Config.Functions.Notify(Config.Notification.Evading, 'error')                    
        end    
    end, function() -- Cancel
        ClearPedTasks(ped)
    end)
end)


RegisterNetEvent('evidence:client:inspectvehicle', function(data)
    if Config.Debug.PrintTestC.enabled then print(("Inspect vehicle event triggered for %s: %s"):format(QBCore.Functions.GetPlate(data.entity), json.encode(data))) end

    QBCore.Functions.Progressbar("inspecting", "Inspecting vehicle...", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@amb@board_room@whiteboard@",
        anim = "examine_close_01_amy_skater_01",
        flags = 16,
    }, {}, {}, function() -- Done
        ClearPedTasks(ped)       

        if #(GetEntityCoords(ped) - GetEntityCoords(data.entity)) < 10 then
            TriggerEvent('evidence:client:inspectvehicleresult', data)
        else
            Config.Functions.Notify(Config.Notification.Evading, 'error')                    
        end
    end, function() -- Cancel
        ClearPedTasks(ped)
    end)
end)

RegisterNetEvent('evidence:client:inspectvehicleresult', function(data)
    local target = QBCore.Functions.GetPlate(data.entity)
    local vehseats = GetVehicleModelNumberOfSeats(GetEntityModel(data.entity))
    local occupants = {}
    local status = {}
    local text = nil
    local tamper = nil
    local complete = nil
    local count = 1

    for i = -1, vehseats do
        local occupant = GetPedInVehicleSeat(data.entity, i)

        if occupant and IsPedAPlayer(occupant) then
            occupants[GetPlayerServerId(NetworkGetPlayerIndexFromPed(occupant))] = true
            count = count + 1
        end
    end

    if next(occupants) then
        for k, v in pairs(occupants) do
            QBCore.Functions.TriggerCallback('police:GetPlayerStatus', function(result)
                if result then
                    for k, v in pairs(result) do
                        if not status[k] then
                            if count == 1 then  
                                 status[k] = Config.StatusList[k]
                            else
                                status[k] = Config.CarStatusList[k]
                            end   
                        end
                    end
                end
                occupants[k] = nil
            end, k) 
        end
    end

    while next(occupants) do
        Wait(10)
    end

    if next(status) then
        for k, v in pairs(status) do
            if text then text = ('%s, %s'):format(text, string.lower(v)) else text = v end
        end

        if text then
            Config.Functions.Chat({
                color = { 255, 0, 0},
                multiline = false,
                args = {("Inspection of %s:"):format(target), ('Occupants appear to %s'):format(text)}
            })
        end
    end    

    if ActiveLEO then
        QBCore.Functions.TriggerCallback('police:GetExteriorTampering', function(result)
            if result then
                Config.Functions.Chat({
                    color = { 255, 0, 0},
                    multiline = false,
                    args = {"Vehicle Inspection:", ("%s appears to have been forcibly entered"):format(target)}
                })
                tamper = true
            end
            complete = true
        end, target)

        while not complete do
            Wait(10)
        end
    end

    if not tamper and not text then
        Config.Functions.Notify((Config.Notification.NoTamper):format(target))
    end
end)

------------------- GSR events -----------------------------

RegisterNetEvent('evidence:client:SetGSR', function(bool)
    if bool then
        if not gsrpos then 
            TriggerServerEvent('evidence:server:SetGSR', bool) 
            gsrpos = bool
        end
    else
        if gsrpos then 
            TriggerServerEvent('evidence:server:SetGSR', bool) 
            gsrpos = bool 
        end
    end
end)

RegisterNetEvent('evidence:client:GSRtest', function(data)
    local target = GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))

    TriggerServerEvent('evidence:server:notifytarget', target, 'Someone is attempting to GSR test you.')


    if Config.Debug.PrintTestC.enabled then print(("GSR test event triggered for %s: %s"):format(target, json.encode(data))) end

    QBCore.Functions.Progressbar("gsrtest", "Preforming GSR test...", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mp_arresting",
        anim = "a_uncuff",
        flags = 16,
    }, {}, {}, function() -- Done
        ClearPedTasks(ped)

        if #(GetEntityCoords(ped) - GetEntityCoords(data.entity)) < 4 then
            TriggerEvent('evidence:client:GSRresult', data)
        else
            Config.Functions.Notify(Config.Notification.Evading, 'error')                    
        end
    end, function() -- Cancel
        ClearPedTasks(ped)
    end)
end)

RegisterNetEvent('evidence:client:GSRresult', function(data)
    local playerId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))
    QBCore.Functions.TriggerCallback('police:GetPlayerGSR', function(result)
        if result then
            Config.Functions.Chat({
                color = { 255, 0, 0},
                multiline = false,
                args = {"GSR Field Test:", ("%s has returned positive"):format(playerId)}
            })

            local info = {
                label = 'Positive GSR Field Test',
                type = 'gsr',
                street = GetStreet(),
                date = collection
            }
            TriggerServerEvent('evidence:server:AddGSRToInventory', info) 
        else
            Config.Functions.Chat({
                color = { 255, 0, 0},
                multiline = false,
                args = {"GSR Field Test:", ("%s has returned negative"):format(playerId)}
            })
        end
    end, playerId)
end)

------------------------- events related to DNA and frisks -----------------------------------

RegisterNetEvent('evidence:client:DNAswab', function(data)
    local target = GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))

    TriggerServerEvent('evidence:server:notifytarget', target, 'Someone is attempting to DNA swab you.')

    if Config.Debug.PrintTestC.enabled then print(("DNA Swab event triggered for %s: %s"):format(target, json.encode(data))) end

    QBCore.Functions.Progressbar("dnaswab", "Preforming DNA Swab...", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mp_arresting",
        anim = "a_uncuff",
        flags = 16,
    }, {}, {}, function() -- Done
        local coords = GetEntityCoords(ped)

        ClearPedTasks(ped)

        TriggerServerEvent('evidence:server:AddDNAToInventory', target, collection, GetStreet())
    end, function() -- Cancel
        ClearPedTasks(ped)
    end)
end)

RegisterNetEvent('evidence:client:frisk', function(data)
    local target = GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))

    if Config.Debug.PrintTestC.enabled then print(("Frisk event triggered on %s: %s"):format(target, json.encode(data))) end

    TriggerServerEvent('evidence:server:notifytarget', target, 'Someone is attempting to frisk you.')

    QBCore.Functions.Progressbar("frisk", "Preforming Terry Frisk...", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mp_arresting",
        anim = "a_uncuff",
        flags = 16,
    }, {}, {}, function() -- Done
        ClearPedTasks(ped)

        if #(GetEntityCoords(ped) - GetEntityCoords(data.entity)) < 4 then
            TriggerServerEvent('evidence:server:frisk', target)
        else
            Config.Functions.Notify(Config.Notification.Evading, 'error')                    
        end
    end, function() -- Cancel
        ClearPedTasks(ped)
    end)
end)

-- Events that add evidence to evidence tables

AddEvidence = { -- this table contains the functions that create evidence
    Standard = {
        ['casing'] = function(data) 
            local caliber = nil
            local serie = data.serial
        
            if serie then serie = string.upper(serie) else serie = 'Unknown' end

            if QBCore.Shared.Weapons[data.weapon] then 
                caliber = QBCore.Shared.Weapons[data.weapon]['caliber']    
            else
                caliber = 'Unknown'
            end

            local civtag = ('%s Casing'):format(caliber)
            if Config.NonCasingWeapon[data.weapon] then civtag = QBCore.Shared.Weapons[data.weapon]['caliber'] end

            Evidence[data.evidenceId] = {
                evtype = data.evtype,
                bucket = data.bucket,
                caliber = caliber,
                serie = data.serial,
                coords = data.coords,
                tag = ('Casing %s | Tracking ID: %s'):format(serie, data.evidenceId),
                civtag = civtag,
                color = markercolor[data.evtype],
                size = markersize[data.evtype],
                pickup = true,
            }    
        end,
        ['fingerprint'] = function(data) 
            Evidence[data.evidenceId] = {
                evtype = data.evtype,
                bucket = data.bucket,
                fingerprint = data.fingerprint,
                coords = data.coords,
                tag = ('Fingerprint %s | Tracking ID %s'):format(string.upper(data.fingerprint), data.evidenceId),
                color = markercolor[data.evtype],
                size = markersize[data.evtype],
                pickup = true,
            }    
        end,
        ['blood'] = function(data)    
            Evidence[data.evidenceId] = {
                evtype = data.evtype,
                bucket = data.bucket,
                dna = DnaHash(data.citizenid),
                bloodtype = data.bloodtype,
                coords = data.coords,
                tag = ('Blood %s | Tracking ID: %s'):format(string.upper(DnaHash(data.citizenid)), data.evidenceId),
                civtag = 'Blood Splatter',
                color = markercolor[data.evtype],
                size = markersize[data.evtype],
                pickup = true,
            }    
        end,
        ['impact'] = function(data) 
            Evidence[data.evidenceId] = {
                evtype = data.evtype,
                bucket = data.bucket,
                ammotype = data.ammotype,
                coords = data.coords,
                norm = data.norm,
                tag = ('%s Impact'):format(Config.ImpactLabels[data.ammotype] or 'Unknown'),
                civtag = 'Bullet Impact',
                color = markercolor[data.evtype],
                size = markersize[data.evtype],
            }       
        end,
        ['tampering'] = function(data) 
            Evidence[data.evidenceId] = {
                evtype = data.evtype,
                bucket = data.bucket,
                coords = data.coords,
                tag = 'Evidence of Lock Tampering',
                civtag = 'Possible Lock Tampering',
                color = markercolor[data.evtype],
                size = markersize[data.evtype],
            }       
        end,
        ['fragment'] = function(data) 
            local fragment = nil
            local civfragment = nil

            if data.vehcolor and data.vehname then
                fragment = ('%s %s Fragment | Tracking ID: %s'):format(data.vehcolor, data.vehname, data.evidenceId)
                civfragment = ('%s %s Fragment'):format(data.vehcolor, data.vehname)
            else
                fragment = ('%s Vehicle Fragment | Tracking ID: %s'):format(data.vehname or data.vehcolor, data.evidenceId)
                civfragment = ('%s Vehicle Fragment'):format(data.vehname or data.vehcolor)
            end

            Evidence[data.evidenceId] = {
                evtype = data.evtype,
                bucket = data.bucket,
                vehcolor = data.vehcolor,
                vehname = data.vehname,
                plate = data.plate,
                coords = data.coords,
                tag = fragment,
                civtag = civfragment,
                color = markercolor[data.evtype],
                size = markersize[data.evtype],
                pickup = true,
            }    
        end,
    },
    Net = {
        ['netimpact'] = function(data)
            NetEvidence[data.evidenceId] = {
                evtype = data.evtype,
                ammotype = data.ammotype,
                netid = data.netid,
                tag = ('%s Impact'):format(Config.ImpactLabels[data.ammotype] or 'Unknown'),
                civtag = 'Bullet Impact',
                offset = data.offset,
                norm = data.normoffset,
                model = data.model,
                color = markercolor[data.evtype],
                size = markersize[data.evtype],
            }       
        end,
        ['netpedimpact'] = function(data)
            NetEvidence[data.evidenceId] = {
                evtype = data.evtype,
                ammotype = data.ammotype,
                netid = data.netid,
                boneindex = data.boneindex,
                model = data.model,
                color = markercolor[data.evtype],
                size = markersize[data.evtype],
            }
        end,    
    },
    Car = {
        ['carcasing'] = function(data) 
            local caliber = nil

            if QBCore.Shared.Weapons[data.weapon] then 
                caliber = QBCore.Shared.Weapons[data.weapon]['caliber']    
            else
                caliber = 'Unknown'
            end

            CarEvidence[data.plate][data.evidenceId] = {
                evtype = "carcasing",
                type = caliber,
                serial = data.serial or 'Unknown',
            }    
        end,
        ['carfingerprint'] = function(data)
            CarEvidence[data.plate][data.evidenceId] = {
            evtype = "carfingerprint",
            fingerprint = data.fingerprint,
            location = data.location,
            }
        end,
        ['carblood'] = function(data)
            CarEvidence[data.plate][data.evidenceId] = {
                evtype = "carblood",
                dna = DnaHash(data.citizenid),
                bloodtype = data.bloodtype,
                seat = data.seat,
            }
        end,    
    },
}

RegisterNetEvent('evidence:client:AddEvidence', function(data)
    for k, v in pairs(data) do
        if Config.Debug.Evidence.enabled then print(('Created %s %s, data as follows: %s'):format(v.evtype, v.evidenceId, json.encode(v))) end

        if AddEvidence.Standard[v.evtype] then
            local add = AddEvidence.Standard[v.evtype]
            local rndcoords = json.encode({RND10(v.coords.x), RND10(v.coords.y)})

            add(v)
            Evidence[v.evidenceId].grid = rndcoords

            if EvGrid[rndcoords] then
                EvGrid[rndcoords][v.evidenceId] = true
            else
                EvGrid[rndcoords] = {}
                EvGrid[rndcoords][v.evidenceId] = true
            end
        elseif AddEvidence.Net[v.evtype] then
            local add = AddEvidence.Net[v.evtype]
            add(v)
        elseif AddEvidence.Car[v.evtype] then
            if not CarEvidence[v.plate] then CarEvidence[v.plate] = {} end
            local add = AddEvidence.Car[v.evtype]
            add(v)
        end
    end
end)

RegisterNetEvent('evidence:client:RemoveEvidence', function(data)
    for k, v in pairs(data) do
        if Config.Debug.Evidence.enabled then print(("Removing %s %s, data as follows: %s"):format(v.type, k, json.encode(v))) end
        if not Evidence[k] and not NetEvidence[k] and not (v.plate and v.type ~= 'fragment' and CarEvidence[v.plate] and CarEvidence[v.plate][k]) then print("Attempted to remove evidence that does not exist:", k, json.encode(v)) return end

        if v.plate and CarEvidence[v.plate] and CarEvidence[v.plate][k] then
            CarEvidence[v.plate][k] = nil
        elseif v.net then
            NetEvidence[k] = nil
            AreaNetEvidenceCache[k] = nil

            if data.type == 'netpedimpact' then
                local key = tostring(NetworkGetEntityFromNetworkId(NetEvidence[k].netid))..tostring(NetEvidence[k].boneindex)
                AreaNetEvidenceCache[key] = nil
                AreaNetEvidence[key] = nil
            else
                AreaNetEvidence[k] = nil
            end
        else
            if CurrentEvidence and CurrentEvidence.evidenceId == k then CurrentEvidence = nil end
            if Evidence[k].grid and EvGrid[Evidence[k].grid] and EvGrid[Evidence[k].grid][k] then EvGrid[Evidence[k].grid][k] = nil end
            Evidence[k] = nil
            AreaEvidence[k] = nil
        end
    end
end)

RegisterNetEvent('evidence:client:RemoveCarEvidence', function(plate)
    CarEvidence[plate] = nil
end)

RegisterNetEvent('evidence:client:ClearEvidenceInArea', function()
    QBCore.Functions.Progressbar('clear_casings', 'Cleaning up crime scene...', 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('evidence:server:ClearEvidence', pos)
    end, function() -- Cancel
        Config.Functions.Notify(Config.Notification.CancelEvidenceClear, 'error')
    end)
end)

-------------------- bag evidence menu

RegisterNetEvent('evidence:client:bagevidence', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local foundWeapon = false

    SetCurrentPedWeapon(ped, `weapon_unarmed`, true)
    TriggerEvent('weapons:client:SetCurrentWeapon', false, false)

    local bagMenu = {
        {
            header = 'Bag Evidence In Inventory',
            isMenuHeader = true,
        }
    }

    for k, v in pairs(PlayerData.items) do
        if v.type == 'weapon' then
            local serial = v.info and v.info.serie and string.upper(v.info.serie)
            local ammo = v.info.ammo and (', Ammo: %s'):format(v.info.ammo) or ''
            local qual = v.info and v.info.quality and math.ceil(v.info.quality)

            if qual and qual - v.info.quality < 0.5 then qual = tostring(math.floor(v.info.quality)) end

            local durability = qual and (', Durability: %s'):format(qual) or ''

            local text = ('Slot: %s'):format(k) .. ammo .. durability
            
            bagMenu[#bagMenu+1] = {
                header = ('%s (%s)'):format(v.label, serial),
                text = text,
                params = {
                    isServer = true,
                    event = 'evidence:server:bagitem',
                    args = {
                        slot = k,
                        street = GetStreet(),
                    }
                }
            }
            if not foundWeapon then foundWeapon = true end
        end
    end

    if not foundWeapon then
        Config.Functions.Notify('You do not have any weapons in your inventory to bag!', 'error')
        return
    end


    bagMenu[#bagMenu+1] = {
        header = "Close (ESC)",
        params = {
            event = 'qb-menu:client:closeMenu',
        }
    }
    exports['qb-menu']:openMenu(bagMenu)
end)

-------------------- evidence bag menu


local function UnbagEv(data)
    while (not HasAnimDictLoaded("anim@amb@business@weed@weed_inspecting_high_dry@")) do
        RequestAnimDict("anim@amb@business@weed@weed_inspecting_high_dry@")
        Wait(0)
    end

    local unbagging = true

    CreateThread(function()
        while unbagging do
            TaskPlayAnim(ped, "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 3.0, 3.0, -1, 16, 0, 0, 0, 0) 
            Wait(1000)
        end
    end)

    QBCore.Functions.Progressbar("unbagev", "Unbagging evidence...", 60000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('evidence:server:unbagitem', {slot = data.item.slot})
        unbagging = false
		ClearPedTasks(ped)
    end, function() -- Cancel
        unbagging = false
		ClearPedTasks(ped)
    end)   
end

local function ConfirmNoExploit(data)
    if not ActiveLEO then
        exports['qb-menu']:openMenu({
            {
                header = 'Please Confirm You Are Not Exploiting',
                isMenuHeader = true,
            },
            {
                header = 'Proceed. I am not exploiting the evidence bag mechanic to reduce my carry weight or get a weapon somewhere I should not have it.',
                params = {
                    isAction = true,
                    event = UnbagEv,
                    args = data,
                }
            },
            {
                header = 'Cancel. I have rethought this action, I should not have been able to carry this weapon to where I am.',
                params = {
                    event = 'qb-menu:client:closeMenu',
                }
            },
            {
                header = "Close (ESC)",
                params = {
                    event = 'qb-menu:client:closeMenu',
                }
            }
        })
    else
        UnbagEv(data)
    end
end

RegisterNetEvent('evidence:client:BagMenu', function(data)
    data.history = {{event = 'evidence:client:BagMenu', data = table.clone(data)}}

    local retrieveItem = false
    local hdr = 'Evidence Information'

    if not next(data.info) then hdr = 'Evidence Notes' end

    local bagMenu = {
        {
            header = hdr,
            isMenuHeader = true,
        }
    }

    for k, v in pairs(data.info) do
        if not v.retrieve then
            bagMenu[#bagMenu+1] = {
                header = v.copy,
                text = v.label,
                params = {
                    event = 'evidence:client:CopyEvidence',
                    args = {
                        text = v.copy
                    }
                }
            }
        else
            retrieveItem = v.label
        end
    end

    if retrieveItem then
        bagMenu[#bagMenu+1] = {
            header = 'Retrieve Item From Evidence Bag',
            isMenuHeader = true,
        }

        bagMenu[#bagMenu+1] = {
            header = ('Unbag %s'):format(retrieveItem),
            params = {
                isAction = true,
                event = ConfirmNoExploit,
                args = data,
            }
        }
    end


    if next(data.info) then
        bagMenu[#bagMenu+1] = {
            header = 'Evidence Notes',
            isMenuHeader = true,
        }
    end

    if data.item.info.notes and next(data.item.info.notes) then
        for k, v in pairs(data.item.info.notes) do
            data.note = k
            
            local txt = ('Created By: %s, Timestamp: %s'):format(v.created.name, v.created.timestamp)

            if v.edited then txt = ('Last Edited: %s, Timestamp: %s'):format(v.edited.name, v.edited.timestamp) end

            bagMenu[#bagMenu+1] = {
                header = v.text,
                text = txt,
                params = {
                    event = 'evidence:client:EditNotes',
                    args = table.clone(data),
                }
            }
        end       
    
        data.note = nil
    end  

    bagMenu[#bagMenu+1] = {
        header = 'Add Note',
        params = {
            event = 'evidence:client:NoteInput',
            args = table.clone(data)
        }
    }

    bagMenu[#bagMenu+1] = {
        header = "Close (ESC)",
        params = {
            event = 'qb-menu:client:closeMenu',
        }
    }
    exports['qb-menu']:openMenu(bagMenu)
end)

RegisterNetEvent('evidence:client:EditNotes', function(data)
    data.history[2] = {event = 'evidence:client:EditNotes', data = table.clone(data)}

    local bagMenu = {
        {
            header = ('%s Notes'):format(data.item.info.tracking),
            isMenuHeader = true,
        }
    }
    
    bagMenu[#bagMenu+1] = {
        header = ('<big>%s</big>'):format(data.item.info.notes[data.note].text),
        disabled = true,
    }

    bagMenu[#bagMenu+1] = {
        header = ('Created: %s'):format(data.item.info.notes[data.note].created.name),
        txt = data.item.info.notes[data.note].created.timestamp,
        disabled = true,
    }


    if data.item.info.notes[data.note].edited then
        bagMenu[#bagMenu+1] = {
            header = ('Last Edited: %s'):format(data.item.info.notes[data.note].edited.name),
            txt = data.item.info.notes[data.note].edited.timestamp,
            disabled = true,
        }
    end

    bagMenu[#bagMenu+1] = {
        header = 'Edit Note',
        params = {
            event = 'evidence:client:NoteInput',
            args = table.clone(data)
        }
    }

    bagMenu[#bagMenu+1] = {
        header = 'Delete Note',
        params = {
            event = 'evidence:client:DeleteNote',
            args = table.clone(data)
        }
    }

    local prev = #data.history - 1

    bagMenu[#bagMenu+1] = {
        header = "<- Back",
        params = {
            event = data.history[prev].event,
            args = data.history[prev].data,
        }
    }
    exports['qb-menu']:openMenu(bagMenu)
end)

RegisterNetEvent('evidence:client:DeleteNote', function(data)
    
    data.item.info.notes[data.note] = 'remove'

    local temp = {}

    for k, v in ipairs(data.item.info.notes) do
        if type(v) == 'table' then
            temp[#temp+1] = v
        end
    end        

    data.item.info.notes = temp

    TriggerServerEvent('evidence:server:UpdateBag', data.item.slot, data.item.info)

    local prev = #data.history - 1

    data.history[prev].data.item.info = data.item.info

    TriggerEvent(data.history[prev].event, data.history[prev].data)
end)

RegisterNetEvent('evidence:client:NoteInput', function(data)
    data.history[#data.history+1] = {event = 'evidence:client:EditNotes', data = table.clone(data)}

    if not data.item.info.notes then data.item.info.notes = {} end

    local preexisting = nil

    if data.note then preexisting = data.item.info.notes[data.note].text end

    local noteinput = exports['qb-input']:ShowInput({
        header = ('Create Note for %s'):format(data.item.info.tracking),
        submitText = "Submit",
        inputs = {
            {
                text = 'Text',
                name = "text", 
                type = "text",
                isRequired = true,
                default = preexisting,
            },
        },
    })

    if noteinput ~= nil then
        if not data.note then 
            data.item.info.notes[#data.item.info.notes+1] = {
                text = noteinput.text,
                created = {name = ('%s %s'):format(PlayerData.charinfo.firstname, PlayerData.charinfo.lastname), timestamp = collection},
            }
        else
            data.item.info.notes[data.note].text = noteinput.text
            data.item.info.notes[data.note].edited = {name = ('%s %s'):format(PlayerData.charinfo.firstname, PlayerData.charinfo.lastname), timestamp = collection}
        end

        TriggerServerEvent('evidence:server:UpdateBag', data.item.slot, data.item.info)

        local prev = #data.history - 1       

        data.history[prev].data.item.info = data.item.info

        TriggerEvent('evidence:client:BagMenu', data.history[prev].data)
    end
end)

-- car evidence menu

local function CarEvidenceMenu(evtable, plate)
    local tamper1, tamper2 = nil
    inmenu = true

    if not (CarEvidence[plate] or ignition or exterior) then ClearPedTasks(ped) Config.Functions.Notify((Config.Notification.NoEvidence):format(plate)) return end

    CreateThread(function()
        while inmenu do
            Wait(200)
            if not newmenu and not IsNuiFocused() then
                ClearPedTasks(ped)
                inmenu = false
            end
        end   
    end)

    local evMenu = {
        {
            header = ('Collect Evidence from %s'):format(plate),
            isMenuHeader = true,
        }
    }

    QBCore.Functions.TriggerCallback('police:GetIgnitionTampering', function(result)
        if result then
            evMenu[#evMenu+1] = {
                header = 'Vehicle ignition may have been tampered with.',
                disabled = true,
            }
        end
        tamper1 = true
    end, plate)

    QBCore.Functions.TriggerCallback('police:GetExteriorTampering', function(result)
        if result then
            evMenu[#evMenu+1] = {
                header = 'Vehicle may have been forcibly entered.',
                disabled = true,
            }
        end
        tamper2 = true
    end, plate)

    while not (tamper1 and tamper2) do
        Wait(10)
    end

    for k, v in pairs(evtable) do
        if not v.ignore then
            if v.evtype == 'carcasing' then
                evMenu[#evMenu+1] = {
                    header = ('Casing %s, Tracking ID: %s'):format(string.upper(v.serial), k),
                    params = {
                        event = 'evidence:client:collectcarevidence',
                        args = {
                            evidenceId = k,
                            plate = plate,
                        }
                    }
                }
            elseif v.evtype == "carfingerprint" then
                evMenu[#evMenu+1] = {
                    header = ('Fingerprint %s, Tracking ID: %s'):format(string.upper(v.fingerprint), k),
                    text = ('Found on %s'):format(v.location),
                    params = {
                        event = 'evidence:client:collectcarevidence',
                        args = {
                            evidenceId = k,
                            plate = plate,
                            location = v.location
                        }
                    }
                }
            elseif v.evtype == 'carblood' then
                evMenu[#evMenu+1] = {
                    header = ('Blood %s, Tracking ID: %s'):format(string.upper(v.dna), k),
                    text = ('Found near Seat %s'):format(v.seat),
                    params = {
                        event = 'evidence:client:collectcarevidence',
                        args = {
                            evidenceId = k,
                            plate = plate,
                            seat = v.seat,
                        }
                    }
                }
            end
        end
    end

    evMenu[#evMenu+1] = {
        header = "Close (ESC)",
        params = {
            event = 'qb-menu:client:closeMenu',
        }
    }
    exports['qb-menu']:openMenu(evMenu)
end

RegisterNetEvent('evidence:client:checkcarevidence', function(data)  
    local plate = QBCore.Functions.GetPlate(data.entity)

    if not CarEvidence[plate] then TriggerServerEvent('evidence:server:LoadCarEvidence', plate) end
    
    TaskTurnPedToFaceEntity(ped, data.entity, 1000)
    Wait(1000)
    
    local doors = GetNumberOfVehicleDoors(data.entity)
    for i = -1, doors, 1 do SetVehicleDoorOpen(data.entity, i, false, false) end
    QBCore.Functions.Progressbar("checkingcar", "Investigating vehicle..", 10000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        anim = "machinic_loop_mechandplayer",
        flags = 1,
    }, {}, {}, function() -- Done
        CarEvidenceMenu(CarEvidence[plate], plate)
    end, function() -- Cancel
        ClearPedTasks(ped)
    end)
end)

RegisterNetEvent('evidence:client:collectcarevidence', function(data)
    newmenu = true
    if not CarEvidence[data.plate] then print('Attempted to collect evidence that does not exists in:', data.plate) return end

    if CarEvidence[data.plate][data.evidenceId].evtype == 'carcasing' then
        local info = {
            label = 'Spent Casing',
            tracking = data.evidenceId,
            type = 'casing',
            street = ("Vehicle %s"):format(data.plate),
            ammolabel = CarEvidence[data.plate][data.evidenceId].type,
            serie = CarEvidence[data.plate][data.evidenceId].serial,
            date = collection
        }
        TriggerServerEvent('evidence:server:AddCarEvToInventory', data.evidenceId, info, data.plate)                        
    elseif CarEvidence[data.plate][data.evidenceId].evtype == 'carblood' then
        local info = {
            label = 'Blood Sample',
            tracking = data.evidenceId,
            type = 'blood',
            street = ("%s, Seat %s"):format(data.plate, data.seat),
            dnalabel = CarEvidence[data.plate][data.evidenceId].dna,
            bloodtype = CarEvidence[data.plate][data.evidenceId].bloodtype,
            date = collection
        }
        TriggerServerEvent('evidence:server:AddCarEvToInventory', data.evidenceId, info, data.plate)
    elseif CarEvidence[data.plate][data.evidenceId].evtype == 'carfingerprint' then
        local info = {
            label = 'Fingerprint',
            tracking = data.evidenceId,
            type = 'fingerprint',
            street = ("%s, %s"):format(data.plate, data.location),
            fingerprint = CarEvidence[data.plate][data.evidenceId].fingerprint,
            date = collection
        }
        TriggerServerEvent('evidence:server:AddCarEvToInventory', data.evidenceId, info, data.plate)                        
    end

    CarEvidence[data.plate][data.evidenceId].ignore = true

    if next(CarEvidence[data.plate]) then
        Wait(500)
        CarEvidenceMenu(CarEvidence[data.plate], data.plate) 
        newmenu = false
    else
        inmenu = false
        newmenu = false
    end    
end)

----------------- Debug Menu and other Debug Events --------------------------

RegisterNetEvent('evidence:client:debugmenu', function() -- this event is triggered by the debug command
    local debugMenu = {
        {
            header = ('r14-evidence Debug Menu'):format(plate),
            isMenuHeader = true,
        }
    }

    local debugOptions = {}
    local count = 0

    for k, v in pairs(Config.Debug) do
        if k ~= 'DebugCommand' then
            count = count + 1

            debugOptions[v.order] = {var = k, label = v.label, enabled = v.enabled}
        end
    end

    debugOptions.DebugCommand = nil

    for k, v in pairs(debugOptions) do
        if not v.server then
            debugMenu[#debugMenu+1] = {
                header = ('%s'):format(v.label),
                text = ('Current State: %s'):format(string.upper(tostring(v.enabled))),
                params = {
                    event = 'evidence:client:setdebugvariable',
                    args = {
                        var = v.var,
                        bool = v.enabled,
                    }
                }
            }
        else
            debugMenu[#debugMenu+1] = {
                header = ('%s'):format(v.label),
                text = ('Current State: %s'):format(string.upper(tostring(v.enabled))),
                params = {
                    isServer = true,
                    event = 'evidence:server:SetServerDebugVariable',
                    args = {
                        var = v.var,
                        bool = v.enabled,
                    }
                }
            }
        end
    end

    debugMenu[#debugMenu+1] = {
        header = "Close (ESC)",
        params = {
            event = 'qb-menu:client:closeMenu',
        }
    }
    exports['qb-menu']:openMenu(debugMenu)
end)

RegisterNetEvent('evidence:client:setdebugvariable', function(data)
    Config.Debug[data.var].enabled = not data.bool
end)

if Config.Debug.DebugCommand then -- debug commands for testing target options when no one is around
    RegisterCommand('selfinvestigate', function()
        local data = {entity = PlayerPedId()}
        TriggerEvent('evidence:client:investigate', data)
    end)

    RegisterCommand('selfgsrtest', function()
        local data = {entity = PlayerPedId()}
        TriggerEvent('evidence:client:GSRtest', data)
    end)

    RegisterCommand('selfdnaswab', function()
        local data = {entity = PlayerPedId()}
        TriggerEvent('evidence:client:DNAswab', data)
    end) 

    RegisterCommand('selffrisk', function()
        local data = {entity = PlayerPedId()}
        TriggerEvent('evidence:client:frisk', data)
    end)

    RegisterCommand('selfbreathalyze', function()
        if not Config.Breathalyzer then Config.Functions.Notify('The breathalyzer is not enabled in your config!', 'error') print('The breathalyzer is not enabled in your config!') end

        local data = {entity = PlayerPedId()}
        TriggerEvent('evidence:client:breathalyze', data)
    end) 

    RegisterCommand('selfdrugtest', function()
        local data = {entity = PlayerPedId()}
        TriggerEvent('evidence:client:drugtest', data)
    end)

    RegisterCommand('selfinspectveh', function()
        local data = {entity = GetVehiclePedIsIn(PlayerPedId())}
        TriggerEvent('evidence:client:inspectvehicle', data)
    end)

    RegisterCommand('selffingerprint', function()
        local data = {entity = PlayerPedId()}
        TriggerEvent('evidence:client:fingerprint', data)
    end)
end

--------------------------- bleed command 

if Config.Bleed.EnableCommand then
    RegisterCommand("bleed", function(source, args) -- this command allows players to create blood evidence during rp situations that may not generate actual blood evidence
        if JustBled or QBCore.Functions.GetPlayerData().metadata['inlaststand'] or QBCore.Functions.GetPlayerData().metadata['isdead'] then return end

        JustBled = true

        local currentHealth = GetEntityHealth(ped)
        SetEntityHealth(ped, currentHealth - math.random(5, 10))

        AnimpostfxPlay("MP_corona_switch" , 1000, false)

        Config.Functions.Notify(Config.Notification.Bleed, 'error')

        CreateBlood()

        Wait(Config.Bleed.Cooldown * 1000)

        JustBled = false
    end, false)
end


---------------------------- qb-target exports to define target interactions for this script

exports['qb-target']:AddGlobalPlayer({
    options = {
        { 
            type = "client", 
            event = 'evidence:client:GSRtest',
            icon = 'fas fa-gun',
            label = 'Perform Field GSR Test',
            entity = entity,
            canInteract = function(entity)
                local PlyData = QBCore.Functions.GetPlayerData()          
                local auth = table.clone(Config.AuthorizedJobs)
                local hasItem = false

                for k, v in pairs(PlyData.items) do
                    if v.name == 'gsrtestkit' then hasItem = true end
                end
                
                if not hasItem then return false end  
                if not auth.LEO.Check() then return false end
                if PlyData.metadata['inlaststand'] or PlyData.metadata['isdead'] then return false end
                if GetEntitySpeed(entity) > 0.5 then return false end 
                return true
            end,
        },
        { 
            type = "client", 
            event = 'evidence:client:frisk',
            icon = 'fas fa-gun',
            label = 'Frisk Person',
            entity = entity,
            canInteract = function(entity)
                local PlyData = QBCore.Functions.GetPlayerData()
                local auth = table.clone(Config.AuthorizedJobs)

                if not auth.Frisk.Check() then return false end
                if PlyData.metadata['inlaststand'] or PlyData.metadata['isdead'] then return false end
                if GetEntitySpeed(entity) > 0.5 then return false end 
                return true
             end,
        },
        { 
            type = "client", 
            event = 'evidence:client:DNAswab',
            icon = 'fas fa-dna',
            label = 'Collect DNA',
            entity = entity,
            canInteract = function(entity)
                local PlyData = QBCore.Functions.GetPlayerData()
                local auth = table.clone(Config.AuthorizedJobs)
                local hasItem = false

                for k, v in pairs(PlyData.items) do
                    if v.name == 'dnatestkit' then hasItem = true end
                end
                
                if not hasItem then return false end               
                if not auth.FirstResponder.Check() then return false end
                if PlyData.metadata['inlaststand'] or PlyData.metadata['isdead'] then return false end
                if GetEntitySpeed(entity) > 0.5 then return false end 
                return true
            end,
        },
        { 
            type = "client", 
            event = 'evidence:client:investigate',
            icon = 'fas fa-magnifying-glass',
            label = 'Investigate Person',
            entity = entity,
            canInteract = function(entity)
                local PlyData = QBCore.Functions.GetPlayerData()
                local auth = table.clone(Config.AuthorizedJobs)

                if not auth.FirstResponder.Check() then return false end

                if PlyData.metadata['inlaststand'] or PlyData.metadata['isdead'] then return false end
                if GetEntitySpeed(entity) > 0.5 then return false end 

                return true
            end,
        },
        { 
            type = "client", 
            event = 'evidence:client:breathalyze',
            icon = 'fas fa-dna',
            label = 'Breathalyze Person',
            entity = entity,
            canInteract = function(entity)
                local PlyData = QBCore.Functions.GetPlayerData()
                local auth = table.clone(Config.AuthorizedJobs)
                local hasItem = false

                for k, v in pairs(PlyData.items) do
                    if v.name == 'breathalyzer' then hasItem = true end
                end
                
                if not hasItem then return false end                  
                if not auth.FirstResponder.Check() then return false end
                if PlyData.metadata['inlaststand'] or PlyData.metadata['isdead'] then return false end
                if GetEntitySpeed(entity) > 0.5 then return false end 
                return true
            end,
        },
        { 
            type = "client", 
            event = 'evidence:client:drugtest',
            icon = 'fas fa-cannabis',
            label = 'Drug Test Person',
            entity = entity,
            canInteract = function(entity)
                local PlyData = QBCore.Functions.GetPlayerData()
                local auth = table.clone(Config.AuthorizedJobs)
                local hasItem = false

                for k, v in pairs(PlyData.items) do
                    if v.name == 'drugtestkit' then hasItem = true end
                end
                
                if not hasItem then return false end              
                if not auth.FirstResponder.Check() then return false end
                if PlyData.metadata['inlaststand'] or PlyData.metadata['isdead'] then return false end
                if GetEntitySpeed(entity) > 0.5 then return false end 
                return true
            end,
        },
        { 
            type = "client", 
            event = 'evidence:client:fingerprint',
            icon = 'fas fa-fingerprint',
            label = 'Fingerprint Person',
            entity = entity,
            canInteract = function(entity)
                local PlyData = QBCore.Functions.GetPlayerData()
                local auth = table.clone(Config.AuthorizedJobs)
                local hasItem = false

                for k, v in pairs(PlyData.items) do
                    if v.name == 'fingerprintreader' then hasItem = true end
                end
                
                if not hasItem then return false end           
                if not auth.FirstResponder.Check() then return false end
                if PlyData.metadata['inlaststand'] or PlyData.metadata['isdead'] then return false end
                if GetEntitySpeed(entity) > 0.5 then return false end 
                return true
            end,
        },
    },
    distance = 2.5, 
})

-- exports['qb-target']:AddGlobalVehicle({
--     options = {
--         { 
--             type = "client",
--             event = 'evidence:client:checkcarevidence',
--             icon = "fas fa-gun",
--             label = "Conduct Evidence Sweep",
-- 			entity = entity,
--             canInteract = function(entity, _, data)
--                 local PlyData = QBCore.Functions.GetPlayerData()
--                 local auth = table.clone(Config.AuthorizedJobs)
--                 local vehlocks = GetVehicleDoorLockStatus(entity)

--                 if not auth.LEO.Check() then return false end
--                 if PlyData.metadata['inlaststand'] or PlyData.metadata['isdead'] then return false end
--                 if vehlocks > 1 then return false end
--                 if GetEntitySpeed(entity) > 0.5 then return false end 
                
--                 return true
--             end,
--         },
--         { 
--             type = "client",
--             event = 'evidence:client:inspectvehicle',
--             icon = "fas fa-car-side",
--             label = "Inspect Vehicle",
-- 			entity = entity,
--                 canInteract = function(entity, _, data)
--                 local PlyData = QBCore.Functions.GetPlayerData()
--                 local auth = table.clone(Config.AuthorizedJobs)

--                 if not auth.FirstResponder.Check() then return false end
--                 if PlyData.metadata['inlaststand'] or PlyData.metadata['isdead'] then return false end
--                 if GetEntitySpeed(entity) > 0.5 then return false end 

--                 return true
--             end,
--         },
--         { 
--             type = "client",
--             event = 'evidence:client:accesstool',
--             icon = "fas fa-key",
--             label = "Use Access Tool",
-- 			entity = entity,
--             canInteract = function(entity)
--                 local PlyData = QBCore.Functions.GetPlayerData()
--                 local vehlocks = GetVehicleDoorLockStatus(entity)
--                 local hasItem = false

--                 for k, v in pairs(PlyData.items) do
--                     if v.name == 'accesstool' then hasItem = true end
--                 end
                
--                 if not hasItem then return false end
--                 if PlyData.metadata['inlaststand'] or PlyData.metadata['isdead'] then return false end
--                 if vehlocks == 1 or vehlocks == 0 then return false end
--                 if IsThisModelABicycle(GetEntityModel(entity)) then return false end
--                 if GetEntitySpeed(entity) > 0.5 then return false end 

--                 return true
--             end,
--         },
--         { 

--             icon = 'fas fa-fingerprint',
--             label = "Leave Fingerprint",
-- 			entity = entity,
--             action = function(entity)
--                 TriggerServerEvent('evidence:server:CreateCarFingerprint', QBCore.Functions.GetPlate(entity), "Vehicle Exterior")
--             end,
--             canInteract = function(entity)
--                 local PlyData = QBCore.Functions.GetPlayerData()
--                 local vehlocks = GetVehicleDoorLockStatus(entity)
--                 local auth = table.clone(Config.AuthorizedJobs)

--                 if not auth.LEO.Check() then return false end
--                 if IsPedInAnyVehicle(ped, true) then return false end
--                 if PlyData.metadata['inlaststand'] or PlyData.metadata['isdead'] then return false end
--                 if GetEntitySpeed(entity) > 0.5 then return false end 

--                 return true
--             end,
--         },
--     },
--     distance = 3.0, 
-- })

---------------------- threads --------------------------------

CreateThread(function() --- this thread occasionally reminds occupants with too much car evidence in their vehicle to clean it
    while true do
        Wait(1800000)
        if LocalPlayer.state.isLoggedIn then
            if IsPedInAnyVehicle(ped) then
                local count = 0
                local plate = QBCore.Functions.GetPlate(GetVehiclePedIsIn(ped))
                
                if CarEvidence[plate] then
                    for _ in pairs(CarEvidence[plate]) do count = count + 1 end
                end

                if count > 5 then
                    Config.Functions.Notify(Config.Notification.ClutterReminder, 'error')
                end
            end
        end
    end
end)
 
CreateThread(function() -- thread applies statuses to player and removes them after a certain amount of time
    while true do
        Wait(10000)
        if LocalPlayer.state.isLoggedIn then
            gsr = 0
            if CurrentStatusList and next(CurrentStatusList) then
                for k, v in pairs(CurrentStatusList) do
                    if CurrentStatusList[k].time > 10 then
                        CurrentStatusList[k].time = CurrentStatusList[k].time - 10
                    else
                        CurrentStatusList[k] = nil
                    end
                end
                TriggerServerEvent('evidence:server:UpdateStatus', CurrentStatusList)
            end
            if shotAmount > 0 then
                shotAmount = 0
            end
        end
    end
end)

CreateThread(function() --- this thread gets our current ped's entity handle, position, and routing bucket
	while true do
        if LocalPlayer.state.isLoggedIn then
            if ped and ped ~= PlayerPedId() then TriggerServerEvent('evidence:server:UpdatePlayerNetId', NetworkGetNetworkIdFromEntity(PlayerPedId())) end

	        ped = PlayerPedId()

            curveh = GetVehiclePedIsIn(ped)
            curbody = GetVehicleBodyHealth(curveh)
            cureng = GetVehicleEngineHealth(curveh)
            pos = GetEntityCoords(ped)
            lplayer = PlayerId()
            isfreeaiming = GetPedConfigFlag(ped, 78)
            selectedwep = GetSelectedPedWeapon(ped)

            if isfreeaiming and selectedwep == `WEAPON_FLASHLIGHT` then usingflashlight = true else usingflashlight = false end

            if viewev or usingflashlight or nikon or Config.Debug.ViewEvidence.enabled then AreaEvidence = {} GetNeighbors({RND10(pos.x), RND10(pos.y)}) end

            if Config.GSR.WashOff and gsrpos then GSRLogic() end 
            if Config.Debug.Bucket.enabled then print('Current routing bucket:', curbucket) end

            if next(SendPacket) then SendEvidence() end
        end
        Wait(1000)
	end
end)

CreateThread(function() --- this thread, if enabled, will set GSR if a player is aiming a firearm
    while Config.GSR.WhileAiming do
        if freeaiming then
            local chance = math.random(0, 100)
            if not Config.GSR.AimingChance then
                TriggerEvent('evidence:client:SetGSR', true)
            elseif chance <= Config.GSR.AimingChance then
                TriggerEvent('evidence:client:SetGSR', true)
            end
        end
        if IsPlayerFreeAiming(lplayer) and GetWeaponDamageType(GetSelectedPedWeapon(ped)) == 3 then freeaiming = true end
        Wait(1000 * Config.GSR.AimingTime)
    end
end)

CreateThread(function()  -- networked evidence caching, checks if the networked entity exists and supplies its evidence to the cache
    while true do
        Wait(2000)
        if LocalPlayer.state.isLoggedIn then
            if Config.Debug.ViewEvidence.enabled or nikon or usingflashlight or viewev then
                AreaNetEvidenceCache = {}
                pos = GetEntityCoords(ped, true)
                for k, v in pairs(NetEvidence) do
                    if NetworkDoesEntityExistWithNetworkId(v.netid) and GetEntityModel(NetworkGetEntityFromNetworkId(v.netid)) == v.model then
                        local netentity = NetworkGetEntityFromNetworkId(v.netid)
                        local distance = #(pos - vector3(GetEntityCoords(netentity)))
                        local tag = v.tag if viewev then tag = v.civtag end
                        if distance < areanetdist then
                            if v.boneindex then
                                local impactsize = Config.ImpactLabels[v.ammotype] or 'Unknown'
                                local key = tostring(netentity)..tostring(v.boneindex)
                                if AreaNetEvidenceCache[key] and not AreaNetEvidenceCache[key].ammotypes[v.ammotype] then                             
                                    AreaNetEvidenceCache[key] = {
                                        tag = ('%s, %s'):format(impactsize, AreaNetEvidenceCache[key].tag),
                                        color = v.color,
                                        size = v.size,
                                        entity = netentity,
                                        boneindex = v.boneindex,
                                        bucket = v.bucket,
                                    }
                                elseif not AreaNetEvidenceCache[key] then
                                    AreaNetEvidenceCache[key] = {
                                        ammotypes = {[v.ammotype] = true},
                                        tag = impactsize .. ' Wound',
                                        color = v.color,
                                        size = v.size,
                                        entity = netentity,
                                        boneindex = v.boneindex,
                                        bucket = v.bucket,
                                    }
                                end
                            else
                                AreaNetEvidenceCache[k] = {
                                    bucket = v.bucket,
                                    tag = tag,
                                    color = v.color,
                                    size = v.size,
                                    entity = netentity,
                                    coords = v.offset,
                                    norm = v.norm,
                                }
                            end
                        end
                    end
                end
            end
        end
    end
end)

 CreateThread(function() -- this loop brings networked entity evidence out of cache to feed into the flashlight/camera
    while true do
        Wait(500)
        if (usingflashlight or nikon or viewev or Config.Debug.ViewEvidence.enabled) and next(AreaNetEvidenceCache) then
            pos = GetEntityCoords(ped)
            for k, v in pairs(AreaNetEvidenceCache) do
                local coords = GetEntityCoords(v.entity)
                local dist = #(pos - coords)
                if dist < areadist then
                    AreaNetEvidence[k] = {
                        bucket = v.bucket,
                        tag = v.tag,
                        distance = dist,
                        netev = true,
                        entity = v.entity,
                        color = v.color,
                        size = isize,
                        boneindex = v.boneindex,
                        coords = v.coords,
                        norm = v.norm,
                    }
                else
                    AreaNetEvidence[k] = nil
                end
            end
        end
    end
end)

CreateThread(function() -- optmized camera thread, pulls evidence from the cached area evidence and performs distance checking to reduce load on the camera
    while true do
        Wait(1000)
        if LocalPlayer.state.isLoggedIn then
            if Config.Debug.ViewEvidence.enabled or ActiveLEO or viewev then
                if (Config.Debug.ViewEvidence.enabled or nikon or viewev) and (Config.Debug.ViewEvidence.enabled or not IsPedInAnyVehicle(ped)) then
                    CamEvidence = {}
                    local camId = 1
                    for k, v in pairs(AreaEvidence) do
                        if v.distance < camdist then
                            CamEvidence[camId] = {
                                evidenceId = k,
                                distance = v.distance,
                                tag = v.tag,
                                color = v.color,
                                size = v.size,
                                coords = v.coords,
                                norm = v.norm,
                                bucket = v.bucket,
                            }
                            camId = camId + 1
                        end
                    end
                    for k, v in pairs(AreaNetEvidence) do
                        if v.distance < camdist then
                            CamEvidence[camId] = {
                                evidenceId = k,
                                distance = v.distance,
                                tag = v.tag,
                                color = v.color,
                                netev = v.netev,
                                entity = v.entity,
                                size = v.size,
                                boneindex = v.boneindex,
                                coords = v.coords,
                                norm = v.norm,
                            }
                            camId = camId + 1
                        end
                    end
                    table.sort(CamEvidence, function(a, b)
                        return a.distance < b.distance
                    end)
                end
            else
                Wait(2000)
            end
        else
            Wait(5000)
        end
    end
end)

CreateThread(function() -- optimized camera script, draws the evidence markers and labels
    while true do
        Wait(0)
        if nikon or viewev or Config.Debug.ViewEvidence.enabled then
            local i = 1
            for k, v in pairs(CamEvidence) do
                local drawcoords = v.coords

                if v.boneindex then drawcoords = GetWorldPositionOfEntityBone(v.entity, v.boneindex) elseif v.netev then drawcoords = GetOffsetFromEntityInWorldCoords(v.entity, drawcoords.x, drawcoords.y, drawcoords.z) end

                local isOnScreen = IsSphereVisible(drawcoords.x, drawcoords.y, drawcoords.z, 0.50)

                if (not v.bucket or (v.bucket and curbucket == v.bucket)) and isOnScreen and (not CurrentEvidence or v.evidenceId ~= CurrentEvidence.evidenceId) then

                    if not v.boneindex then DrawMarker(28, drawcoords.x, drawcoords.y, drawcoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.size, v.size, v.size, v.color.r, v.color.g, v.color.b, camopac, false, false, 2, nil, nil, false) end

                    if v.norm then
                        if not v.netev then
                            DrawLine(drawcoords.x, drawcoords.y, drawcoords.z, v.norm.x, v.norm.y, v.norm.z, v.color.r, v.color.g, v.color.b, camopac)
                        else
                            local normoffset = GetOffsetFromEntityInWorldCoords(v.entity, v.norm.x, v.norm.y, v.norm.z)

                            DrawLine(drawcoords.x, drawcoords.y, drawcoords.z, normoffset.x, normoffset.y, normoffset.z, v.color.r, v.color.g, v.color.b, camopac)
                        end
                    end
                    if  i ~= camlim + 1 and v.distance > cammin then
                        DrawText3D(drawcoords.x, drawcoords.y, drawcoords.z, v.tag)
                        i = i + 1
                    end
                end
            end
        else    
            Wait(700)
        end
    end
end)

CreateThread(function() -- optimized flashlight thread, enables police to use flashlight to reveal and pickup evidence
    while true do
        Wait(0)
        if LocalPlayer.state.isLoggedIn then
            if ActiveLEO then
                if usingflashlight then
                    pos = GetEntityCoords(ped)
                    if next(AreaEvidence) then
                        local CurEv = nil
                        local CurEvId = nil
                        for k, v in pairs(AreaEvidence) do
                            local dist = #(pos - vector3(v.coords.x, v.coords.y, v.coords.z))

                            if (dist < pudist and v.pickup) then
                                if not CurEv or (CurEv and dist < CurEv) then
                                    CurEv = dist
                                    CurEvId = k
                                end
                            end
                        end

                        if CurEv then
                            if not CurEvLoopRunning then CurEvLoop() end
                            CurrentEvidence = table.clone(AreaEvidence[CurEvId])
                            CurrentEvidence.evidenceId = CurEvId
                        else
                            CurrentEvidence = nil
                        end

                        for k, v in pairs(AreaEvidence) do
                            local dist = #(pos - vector3(v.coords.x, v.coords.y, v.coords.z))
                            if (not v.bucket or (v.bucket and curbucket == v.bucket)) and dist < flashdist and (not CurrentEvidence or k ~= CurrentEvidence.evidenceId) then
                                DrawMarker(28, v.coords.x, v.coords.y, v.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.size, v.size, v.size, v.color.r, v.color.g, v.color.b, camopac, false, false, 2, nil, nil, false)
                                if v.norm then
                                    DrawLine(v.coords.x, v.coords.y, v.coords.z, v.norm.x, v.norm.y, v.norm.z, v.color.r, v.color.g, v.color.b, camopac)
                                end
                            end
                        end 
                        for k, v in pairs(AreaNetEvidence) do
                            local drawcoords = v.coords

                            if v.boneindex then drawcoords = GetWorldPositionOfEntityBone(v.entity, v.boneindex) elseif v.netev then drawcoords = GetOffsetFromEntityInWorldCoords(v.entity, drawcoords.x, drawcoords.y, drawcoords.z) end

                            local dist = #(pos - vector3(drawcoords.x, drawcoords.y, drawcoords.z))
                            if (not v.bucket or (v.bucket and curbucket == v.bucket)) and dist < flashdist and (not CurrentEvidence or k ~= CurrentEvidence.evidenceId) then
                                if not v.boneindex then DrawMarker(28, drawcoords.x, drawcoords.y, drawcoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.size, v.size, v.size, v.color.r, v.color.g, v.color.b, camopac, false, false, 2, nil, nil, false) end
                                if v.norm then
                                    if not v.netev then
                                        DrawLine(drawcoords.x, drawcoords.y, drawcoords.z, v.norm.x, v.norm.y, v.norm.z, v.color.r, v.color.g, v.color.b, camopac)
                                    else
                                        local normoffset = GetOffsetFromEntityInWorldCoords(v.entity, v.norm.x, v.norm.y, v.norm.z)
                                        DrawLine(drawcoords.x, drawcoords.y, drawcoords.z, normoffset.x, normoffset.y, normoffset.z, v.color.r, v.color.g, v.color.b, camopac)
                                    end
                                end
                            end
                        end  
                    end
                else
                    Wait(1000) -- checks once per second if ped is aiming flashlight 
                end
            else
                Wait(5000) -- checks every five seconds if ped has police job
            end
        end
    end
end)
