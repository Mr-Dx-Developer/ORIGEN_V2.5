local QBCore = exports['qb-core']:GetCoreObject()
local cam = nil
local ctest = false
local watchedped = nil
local watching = false
local watchsource = nil
local popocam = false
local PlayerJob = nil
local isincar = false
local camPlayers = {}

function ShowHelpNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, 50)
end

function ShowNotification(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(0, 1)
end

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(50)
    end
end

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        PlayerJob = QBCore.Functions.GetPlayerData().job
        
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

local currAnim = nil
local currAnimDict = nil

function WatchinAnim()
    local ped = PlayerPedId()
	local pos = GetEntityCoords(ped)
	local head = GetEntityHeading(ped)
	
	dict = 'anim@amb@board_room@diagram_blueprints@'
    name = 'look_around_02_amy_skater_01'
	loadAnimDict(dict)
	
	TaskPlayAnimAdvanced(ped, dict, name, pos.x, pos.y, pos.z, 0.0,0.0, head ,1.0,1.0, -1, 1, 0.0, 0, 0)
    currAnim = name
    currAnimDict = dict
end



function StopWatchin()
    local ped = PlayerPedId()
	local pos = GetEntityCoords(ped)
	local head = GetEntityHeading(ped)
	
	dict = 'anim@amb@board_room@diagram_blueprints@'
    name = 'look_around_02_amy_skater_01'
	loadAnimDict(dict)
	
	StopAnimTask(ped, dict, name, 1.0)
end

local data = {}

function CreateACam(coords)
    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    RenderScriptCams(true, true, 0, true, false)
    SetCamCoord(cam, coords)    
    Wait(100)
end

function ShowInfo(d)
    --print(QBCore.Debug(d))
    SendNUIMessage({
        type = 'show',
        info = d
    })
end
function HideInfo()
    SendNUIMessage({
        type = 'hide'
    })
end

function CancelCam()
    HideInfo()
    DoScreenFadeOut(250)
        while not IsScreenFadedOut() do
            Wait(0)
        end
    RenderScriptCams(false, true, 0, true, false)
    DestroyCam(cam, false)
    SetFocusEntity(PlayerPedId())
    cteston = false
    
    DoScreenFadeIn(250)
end

function getpopos()	
	local tdata
	QBCore.Functions.TriggerCallback('bcam:getpopos', function(killa)
		tdata = killa
		--print(QBCore.Debug(kdata))
	end)
	while tdata == nil do
		Wait(10)
	end
	return tdata
end
function getps()	
	local tdata
	QBCore.Functions.TriggerCallback('bcam:getplayers', function(killa)
		tdata = killa
		--print(QBCore.Debug(kdata))
	end)
	while tdata == nil do
		Wait(10)
	end
	return tdata
end
function getp(daplayer)	
	local tdata
	QBCore.Functions.TriggerCallback('bcam:getplayer', function(killa)
		tdata = killa
		--print(QBCore.Debug(kdata))
	end, daplayer)
	while tdata == nil do
		Wait(10)
	end
	return tdata
end

function ShowCamMenu()
    local players = getpopos()
    local menu = {}
    menu[#menu + 1] =  {
        header = "Available Police",
        isMenuHeader = true,
    }
    for k, v in ipairs(players) do
        local nome = ""
        local text = ""
        local enabled = v.camon
        if v.camon then
            nome = '🟢 ' .. v.fname .. " " .. v.lname
            text = "Online"
        else
            nome = '❌ ' .. v.fname .. " " .. v.lname
            text = "Bodycam is Offline"
        end
        menu[#menu + 1] = {
            header = nome,
            txt = text,
            disabled = not enabled,           
            params = {
                event = "bcam:Watch",
                args = {
                     v
                }
            }
        }
        --txt = "This goes to a sub menu",      
    end
    menu[#menu + 1] =  {
        header = "⬅ Close Menu",
        txt = 'Close',
        params = {
            event = 'qb-menu:closeMenu',
        }
    }

    exports['qb-menu']:openMenu(menu)
end

RegisterNetEvent("messy:camtoggle")
AddEventHandler('messy:camtoggle', function ()
    popocam = not popocam
    PlayerData = QBCore.Functions.GetPlayerData()
		
		QBCore.Functions.Progressbar("bcamming", "Turning on Bodycam.", 1250, false, true, {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		}, {
			animDict = "clothingtie",
			anim = "try_tie_neutral_d",
			flags = 49,
		}, {}, {}, function() -- Done
			StopAnimTask(ped, "clothingtie", "try_tie_neutral_d", 1.0)
			TriggerServerEvent("messy:camstatus")			
		end, function() -- Cancel
			StopAnimTask(ped, "clothingtie", "try_tie_neutral_d", 1.0)
			
			QBCore.Functions.Notify("Canceled..", "error")
		end)
end)

local currped = nil
RegisterNetEvent("bcam:Watch")
AddEventHandler('bcam:Watch', function (arg)
    --print(QBCore.Debug(arg))
	local ithim = getp(arg[1].source)
    DoScreenFadeOut(250)
        while not IsScreenFadedOut() do
            Wait(0)
        end
    SetFocusArea(ithim.coords.x, ithim.coords.y, ithim.coords.z,0.0,0.0,0.0)
    CreateACam(ithim.coords)
    ShowInfo(arg[1])
    
    WatchinAnim()
    Wait(100)
    watching = true
    watchsource = arg[1].source
    
    while NetworkDoesEntityExistWithNetworkId(ithim.pednid) == false do
        Wait(100)
    end
    
    local netpedid = NetworkGetEntityFromNetworkId(ithim.pednid)
    currped = netpedid
    
    local bone = GetPedBoneIndex(netpedid,31086)
    SetFocusEntity(netpedid)
    local head = GetEntityHeading(netpedid)
    
    AttachCamToPedBone(cam,netpedid,bone,0.0,0.48,0.40,GetEntityHeading(netpedid))
    SetCamFov(cam,95.0)
    SetCamNearClip(cam, 0.05)
    cteston = true
    SetCamRot(cam, vector3(-130.0, 0.0, head ))
    watchedped = netpedid
    DoScreenFadeIn(250)
end)

RegisterNetEvent("bcam:UpdateWatch")
AddEventHandler("bcam:UpdateWatch", function(d)
    local src = source
    camPlayers = d
	
end)

RegisterNetEvent("inventory:client:UpdatePlayerInventory")
AddEventHandler("inventory:client:UpdatePlayerInventory", function(t,i)
    local src = source
	
end)

local function GetCurrentTime()
    local hours = GetClockHours()
    local minutes = GetClockMinutes()
    local seconds = GetClockSeconds()
    if hours < 10 then
        hours = tostring(0 .. GetClockHours())
    end
    if minutes < 10 then
        minutes = tostring(0 .. GetClockMinutes())
    end
    if seconds < 10 then
        seconds = tostring(0 .. GetClockSeconds())
    end
    return tostring(hours .. ":" .. minutes .. ":" .. seconds)
end



local shownMenu = false
local function CloseMenuFull()
    exports['qb-menu']:closeMenu()
    exports['qb-core']:HideText()
    shownMenu = false
end
--"clothingtie", "try_tie_neutral_d"
if Config.UseTarget == false then
    CreateThread(function()
    while PlayerJob == nil do
        Wait(100)
    end
    while true do
        local wait = 2500
        local pos = GetEntityCoords(PlayerPedId())
        local inRange = false
        local nearmenu = false
        if PlayerJob.name == "police" then
            wait = 0
            for k, menus in pairs(Config.Locations) do
                for _, coords in ipairs(menus) do
                    
                        if #(pos - coords) < 5.0 then
                            inRange = true
                            if #(pos - coords) <= 1.5 then
                                nearmenu = true
                                if not shownMenu then
                                    exports['qb-core']:DrawText('[E] Access Bodycams', 'left')
                                    shownMenu = true
                                end
                                if IsControlJustReleased(0, 38) then
                                    exports['qb-core']:HideText()
                                    ShowCamMenu()
                                end
                            end

                            if not nearmenu and shownMenu then
                                CloseMenuFull()
                                shownMenu = false
                            end
                        end
                    
                end
            end
            if not inRange then
                Wait(1500)
                if shownMenu then
                    CloseMenuFull()
                    shownMenu = false
                end
            end
        end
        Wait(wait)
    end
    end) 
else --447.15, -974.226, 30.46 ; 437.36, -995.65, 30.58
    for k, v in ipairs(Config.Targets) do
        exports['qb-target']:AddBoxZone("terminal" .. k, v.coords, v.width, v.height, {
            name="terminal" .. k,
            debugpoly = false,
            minZ=v.coords.z - 1.5,
            maxZ=v.coords.z + 1.5,
        }, {
                options = {
                    {
                        icon = "fas fa-laptop",
                        label = "Access Bodycams", 
                        action = function()
                            ShowCamMenu()
                        end,
                        canInteract = function()
                            return true
                        end,
                        job = "police"                     
                    },
                },
                distance = 3.5,                
            })   
    end  
end
CreateThread(function()
    while true do
                		
        if cteston then
            if IsPedInAnyVehicle(currped,false) and isincar == false then
                isincar = true
                local bone = GetPedBoneIndex(currped,31086)
				local head = GetEntityHeading(currped)
                AttachCamToPedBone(cam,currped,bone,0.0,0.48,0.60,GetEntityHeading(currped))
                SetCamRot(cam, vector3(0.0, 0.0, head ))
                
            elseif IsPedInAnyVehicle(currped,false) == false and isincar == true then
                isincar = false
                local bone = GetPedBoneIndex(currped,31086)
                local head = GetEntityHeading(currped)
                AttachCamToPedBone(cam,currped,bone,0.0,0.48,0.40,GetEntityHeading(currped))
                SetCamRot(cam, vector3(-130.0, 0.0, head ))
                
            end
            ShowHelpNotification("Press ~INPUT_CELLPHONE_CANCEL~ to Cancel.")
            if IsControlJustPressed(0, 177) then 
                StopWatchin()
                watching = false
                CancelCam()
            end
            if watching then
                if IsEntityPlayingAnim(PlayerPedId(),currAnimDict,currAnim, 3) == false then
                    StopWatchin()
                    watching = false
                    CancelCam()
                end
                if camPlayers[watchsource] == false then
                    StopWatchin()
                    watching = false

                    CancelCam()
                    watchsource = nil
                end
            end

            ped = watchedped
            pos = GetEntityCoords(watchedped)
            local ghead = GetEntityHeading(watchedped)
            SetCamRot(cam, vector3(-10.0, 0.0, ghead ))
            SendNUIMessage({
                type = 'time',
                time = GetCurrentTime()
            })
        end
        
        Wait(1)
    end
end)