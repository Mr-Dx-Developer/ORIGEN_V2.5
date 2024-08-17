local BallModel = "p_ld_soc_ball_01"
local EventStarted = false
local RemainingTime = 15
local IncreaseRedScore = false

local RedScore = 0
local BlueScore = 0

local EventStartedByPlayer = false

RegisterCommand("teleportball", function()
    if EventStartedByPlayer == true then
        SetEntityCoords(Ball, Config.BallSpawnCoords)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        AddBoxZone("BlueTeamGoal", vector3(801.92, -248.72, 65.1), 0.35, 7.4, {
            name="BlueTeamGoal",
            heading=243.0,
            debugPoly=false,
            minZ=64.51,
            maxZ=68.22
        })
        AddBoxZone("RedTeamGoal", vector3(740.75, -218.64, 66.1), 0.35, 7.4, {
        name="RedTeamGoals",
        heading=243.0,
        debugPoly=false,
        minZ=64.51,
        maxZ=68.22
        })
        break
    end
end)


Citizen.CreateThread(function()
    while true do
        local pCoords = GetEntityCoords(PlayerPedId())
        if EventStarted == true and GetDistanceBetweenCoords(pCoords, Config.BallSpawnCoords) < 65 then
            sleep = 5
            Draw2DText("~r~"..RedScore.."   ~w~-~b~   "..BlueScore.."", { 0.455, 0.855 }, 1.0, 1.0)
            Draw2DText("Remaining Time", { 0.451, 0.055 }, 0.5, 0.5)
            Draw2DText("~y~"..RemainingTime.." ~w~ Minutes", { 0.458, 0.085 }, 0.5, 0.5)
            if RemainingTime == -1 then
                TriggerServerEvent("dope-football:FinishEvent")
                RemainingTime = 15
            end
        else
            sleep = 2000
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do
        local pCoords = GetEntityCoords(PlayerPedId())
        if GetDistanceBetweenCoords(pCoords, Config.RichardCoords) < 10 then
            sleep = 5
            if not DoesEntityExist(Richard) then 
                local PedModel = Config.RichardModel
                RequestModel(PedModel)
                while not HasModelLoaded(PedModel) do
                    Citizen.Wait(10)
                end

                Richard = CreatePed(1, PedModel, Config.RichardCoords, Config.RichardHeading, false, false)
                SetBlockingOfNonTemporaryEvents(Richard, true)
                FreezeEntityPosition(Richard, true)
                SetEntityInvincible(Richard, true)
                TaskStartScenarioInPlace(Richard, "PROP_HUMAN_SEAT_CHAIR_DRINK_BEER", 0, true) 
                

            end
            if GetDistanceBetweenCoords(pCoords, Config.RichardCoords) < 2 then
                if EventStarted == false then
                    DrawText3D(vector3(Config.RichardCoords.x+0.01, Config.RichardCoords.y+0.3, Config.RichardCoords.z+2.2), "~g~E~w~ - ~y~Richard - ~w~Rent a Football Field ~g~250$~w~")
                elseif EventStarted == true then
                    DrawText3D(vector3(Config.RichardCoords.x+0.01, Config.RichardCoords.y+0.3, Config.RichardCoords.z+2.2), "~y~Richard - ~w~Football Field is Currently Rented. Come Back in ~r~"..RemainingTime.."~w~ Minutes")
                end
                if IsControlJustPressed(0, 38) and EventStarted == false then
                    TriggerServerEvent("dope-football:StartFootballEvent")
                    DoScreenFadeOut(1000)
                    Citizen.Wait(1000) 
                    SetEntityCoords(PlayerPedId(), Config.PlayerTeleportCoords)
                    SetEntityHeading(PlayerPedId(), Config.PlayerTeleportHeading)
                    Citizen.Wait(100)
				    DoScreenFadeIn(1600)
                    DeleteObject(Ball)
                    SpawnBall()
                    EventStartedByPlayer = true
                end
            end
        else
            sleep = 2000
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do
    local pCoords = GetEntityCoords(PlayerPedId())
    Ball = GetClosestObjectOfType(pCoords.x, pCoords.y, pCoords.z, 100.0, BallModel, true, true, true)
    local BallCoords = GetEntityCoords(Ball)
    if not NetworkGetEntityIsNetworked(Ball) then
        NetworkRegisterEntityAsNetworked(Ball)
    end
    if GetDistanceBetweenCoords(pCoords, BallCoords) < 100 then
        sleep = 5
        local BallCoords = GetEntityCoords(Ball)
        DrawMarker(25, BallCoords.x, BallCoords.y, BallCoords.z-0.10, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, 1.15, 1.15, 1.15, 0, 255, 0, 100, false, true, 2, false, false, false, false)
        if GetDistanceBetweenCoords(pCoords, BallCoords) > 15 then
            DrawMarker(20, BallCoords.x, BallCoords.y, BallCoords.z+0.50, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, 0.95, 0.95, 0.95, 0, 255, 0, 100, false, true, 2, false, false, false, false)
        end
        if GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z+0.68, BallCoords, true) < 1.3 or GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, BallCoords, true) < 1.3 then
            if IsPedSprinting(PlayerPedId()) then
                SprintDribble()
            end
            if IsPedRunning(PlayerPedId()) then
                RunDribble()
            end
            if IsPedStopped(PlayerPedId()) or IsPedWalking(PlayerPedId()) then
                SlowDribble()
            end
        end
        if GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z-0.1, BallCoords, true) < 1.8 and IsControlJustPressed(0, Config.ShootButton) then
            Shoot()
        end 
        if GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z-0.1, BallCoords, true) < 1.8 and IsControlJustPressed(0, Config.PassButton) then
            Pass()
        end
        if GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z-0.1, BallCoords, true) < 1.8 and IsControlJustPressed(0, Config.RainbowButton) then
            Rainbow()
        end   
        if GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z-0.1, BallCoords, true) < 1.8 and IsControlJustPressed(0, Config.PowerPassButton) then
            PowerPass()
        end     
    else
        sleep = 2000
    end
    Citizen.Wait(sleep)
    end
end)

function SpawnBall()
   Citizen.CreateThread(function()
        RequestModel(BallModel)
    	local SpawnRequest = 1
    	while not HasModelLoaded(BallModel) and SpawnRequest < 5 do
    		Citizen.Wait(500)				
            SpawnRequest = SpawnRequest + 1
        end
    	if not HasModelLoaded(BallModel) then
    		SetModelAsNoLongerNeeded(BallModel)
    	else
            CreateObjectNoOffset(BallModel, Config.BallSpawnCoords, true, false, 1)
        end
    end)
end

RegisterNetEvent("dope-football:FootballEventStarted")
AddEventHandler("dope-football:FootballEventStarted", function(FootballEventStarted, EventTime)
    EventStarted = FootballEventStarted
    RemainingTime = EventTime
end)

RegisterNetEvent("dope-football:EventFinished")
AddEventHandler("dope-football:EventFinished", function()
    EventStarted = false
    RemainingTime = 15
    IncreaseRedScore = false
    RedScore = 0
    BlueScore = 0
    EventStartedByPlayer = false
    DeleteObject(Ball)
end)

RegisterNetEvent("dope-football:IncreaseRedScores")
AddEventHandler("dope-football:IncreaseRedScores", function(RedTeamScore)
    RedScore = RedTeamScore
    SetEntityVelocity(Ball, 0.0 * (0.0 * 10), 0.0 * (0.0 * 0.0), 0.0 * 10)
    SetEntityCoords(Ball, Config.BallSpawnCoords)
end)

RegisterNetEvent("dope-football:IncreaseBlueScores")
AddEventHandler("dope-football:IncreaseBlueScores", function(BlueTeamScore)
    BlueScore = BlueTeamScore
    SetEntityVelocity(Ball, 0.0 * (0.0 * 10), 0.0 * (0.0 * 0.0), 0.0 * 10)
    SetEntityCoords(Ball, Config.BallSpawnCoords)
end)

RegisterNetEvent('bt-polyzone:enter')
AddEventHandler('bt-polyzone:enter', function(name)
    if name == "BlueTeamGoal" then
        TriggerServerEvent("dope-football:RedScored")
    elseif name == "RedTeamGoal" then
        TriggerServerEvent("dope-football:BlueScored")
    end
end)

RegisterNetEvent("dope-football:StartShootProgress")
AddEventHandler("dope-football:StartShootProgress", function(ServerForwardX, ServerForwardY)
    SetEntityVelocity(Ball, ServerForwardX * (3.5 * 10), ServerForwardY * (3.5 * 10), 1.0 * 10)
end)

RegisterNetEvent("dope-football:StartPassProgress")
AddEventHandler("dope-football:StartPassProgress", function(ServerForwardX, ServerForwardY)
    SetEntityVelocity(Ball, ServerForwardX * (2.1 * 10), ServerForwardY * (2.1 * 10), 0.0 * 10)
end)

RegisterNetEvent("dope-football:StartPowerPassProgress")
AddEventHandler("dope-football:StartPowerPassProgress", function(ServerForwardX, ServerForwardY)
    SetEntityVelocity(Ball, ServerForwardX * (1.85 * 10), ServerForwardY * (1.85 * 10), 0.9 * 10)
end)

RegisterNetEvent("dope-football:StartRainbowProgress")
AddEventHandler("dope-football:StartRainbowProgress", function(ServerForwardX, ServerForwardY)
    SetEntityVelocity(Ball, ServerForwardX * (0.5 * 10), ServerForwardY * (0.5 * 10), 0.9 * 10)
end)

RegisterNetEvent("dope-football:StartSprintDribbleProgress")
AddEventHandler("dope-football:StartSprintDribbleProgress", function(ServerForwardX, ServerForwardY)
    SetEntityVelocity(Ball, ServerForwardX * (0.8 * 10), ServerForwardY * (0.8 * 10), 0.0 * 10)
end)

RegisterNetEvent("dope-football:StartRunDribbleProgress")
AddEventHandler("dope-football:StartRunDribbleProgress", function(ServerForwardX, ServerForwardY)
    SetEntityVelocity(Ball, ServerForwardX * (0.65 * 10), ServerForwardY * (0.65 * 10), 0.0 * 10)
end)

RegisterNetEvent("dope-football:StartSlowDribbleProgress")
AddEventHandler("dope-football:StartSlowDribbleProgress", function(ServerForwardX, ServerForwardY)
    SetEntityVelocity(Ball, ServerForwardX * (0.3 * 10), ServerForwardY * (0.3 * 10), 0.0 * 10)
end)

function DrawText3D(coord, text)
	local onScreen,_x,_y=GetScreenCoordFromWorldCoord(coord.x, coord.y, coord.z)
	local px,py,pz=table.unpack(GetGameplayCamCoords()) 
	local scale = 0.3
	if onScreen then
		SetTextScale(scale, scale)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextDropshadow(0)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 380
        DrawRect(_x, _y + 0.0120, 0.0 + factor, 0.025, 41, 11, 41, 100)
	end
end

function Shoot()
    local ForwardX = GetEntityForwardX(PlayerPedId())
    local ForwardY = GetEntityForwardY(PlayerPedId()) 
    RequestAnimDict("misstrevor3_beatup")
    TaskPlayAnim(PlayerPedId(), "misstrevor3_beatup", "guard_beatup_kickidle_guard1", 8.0, -8.0, -1, 0, false, false, false)
    Citizen.Wait(310)
    TriggerServerEvent("dope-football:Shoot", ForwardX, ForwardY)
    Citizen.Wait(800)
    ClearPedTasks(PlayerPedId())
end

function Pass()
    local ForwardX = GetEntityForwardX(PlayerPedId())
    local ForwardY = GetEntityForwardY(PlayerPedId()) 
    RequestAnimDict("misstrevor3_beatup")
    TaskPlayAnim(PlayerPedId(), "misstrevor3_beatup", "guard_beatup_kickidle_guard1", 8.0, -8.0, -1, 0, false, false, false)
    Citizen.Wait(310)
    TriggerServerEvent("dope-football:Pass", ForwardX, ForwardY)
    Citizen.Wait(800)
    ClearPedTasks(PlayerPedId())
end

function PowerPass()
    local ForwardX = GetEntityForwardX(PlayerPedId())
    local ForwardY = GetEntityForwardY(PlayerPedId()) 
    RequestAnimDict("misstrevor3_beatup")
    TaskPlayAnim(PlayerPedId(), "misstrevor3_beatup", "guard_beatup_kickidle_guard1", 8.0, -8.0, -1, 0, false, false, false)
    Citizen.Wait(310)
    TriggerServerEvent("dope-football:PowerPass", ForwardX, ForwardY)
    Citizen.Wait(800)
    ClearPedTasks(PlayerPedId())
end

function Rainbow()
    local ForwardX = GetEntityForwardX(PlayerPedId())
    local ForwardY = GetEntityForwardY(PlayerPedId()) 
    RequestAnimDict("move_jump")
    TaskPlayAnim(PlayerPedId(), "move_jump", "jump_launch_long_l", 8.0, -8.0, -1, 0, false, false, false);
    Citizen.Wait(310)
    TriggerServerEvent("dope-football:Rainbow", ForwardX, ForwardY)
    Citizen.Wait(700)
    ClearPedTasks(PlayerPedId())
end

function SprintDribble()
    local ForwardX = GetEntityForwardX(PlayerPedId())
    local ForwardY = GetEntityForwardY(PlayerPedId()) 
    TriggerServerEvent("dope-football:SprintDribble", ForwardX, ForwardY)
end

function RunDribble()
    local ForwardX = GetEntityForwardX(PlayerPedId())
    local ForwardY = GetEntityForwardY(PlayerPedId()) 
    TriggerServerEvent("dope-football:RunDribble", ForwardX, ForwardY)
end

function SlowDribble()
    local ForwardX = GetEntityForwardX(PlayerPedId())
    local ForwardY = GetEntityForwardY(PlayerPedId()) 
    TriggerServerEvent("dope-football:SlowDribble", ForwardX, ForwardY)
end


function Draw2DText(text, pos, scalex, scaley)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextScale(scalex, scaley)
	SetTextColour(255, 255, 255, 255)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(table.unpack(pos))
end


local inzone = false
local Zones = {}

Citizen.CreateThread(function()
    while true do
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.BallSpawnCoords) < 60 and EventStartedByPlayer == true then
            sleep = 2
        else 
            sleep = 2000
        end
        local plyPed = Ball
        local coord = GetEntityCoords(plyPed)
        Citizen.Wait(sleep)
        for _, zone in pairs(Zones) do
            if Zones[_]:isPointInside(coord) then
                inzone = true
                TriggerEvent("bt-polyzone:enter", _)
                while inzone do
                    local plyPed = Ball
                    local InZoneCoordS = GetEntityCoords(plyPed)
                    if not Zones[_]:isPointInside(InZoneCoordS) then 
                        inzone = false
                    end
                    Citizen.Wait(sleep)
                end
                TriggerEvent("bt-polyzone:exit", _)
            end
        end
    end
end)

function AddBoxZone(name, center, length, width, options)
    Zones[name] = BoxZone:Create(center, length, width, options)
end
