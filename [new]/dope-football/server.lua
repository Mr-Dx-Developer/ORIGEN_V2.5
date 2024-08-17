local ServerForwardX = nil
local ServerForwardY = nil
local FootballEventStarted = false
local EventTime = 15

local StartTime = nil
local Timer = 1

local RedTeamScore = 0
local BlueTeamScore = 0

RegisterServerEvent("dope-football:StartFootballEvent")
AddEventHandler("dope-football:StartFootballEvent", function()
    FootballEventStarted = true
    EventTime = Config.RentTime
    TriggerClientEvent("dope-football:FootballEventStarted", -1, FootballEventStarted, EventTime)
    StartTime = true
end)

RegisterNetEvent("dope-football:FinishEvent")
AddEventHandler("dope-football:FinishEvent", function()
    ServerForwardX = nil
    ServerForwardY = nil
    FootballEventStarted = false
    EventTime = 15
    StartTime = nil
    Timer = 1
    RedTeamScore = 0
    BlueTeamScore = 0
    TriggerClientEvent("dope-football:EventFinished", -1)
end)

RegisterServerEvent("dope-football:RedScored")
AddEventHandler("dope-football:RedScored", function()
    Citizen.Wait(100)
    RedTeamScore = RedTeamScore + 1
    Citizen.Wait(50)
    TriggerClientEvent("dope-football:IncreaseRedScores", -1, RedTeamScore)
end)

RegisterServerEvent("dope-football:BlueScored")
AddEventHandler("dope-football:BlueScored", function()
    Citizen.Wait(100)
    BlueTeamScore = BlueTeamScore + 1
    Citizen.Wait(50)
    TriggerClientEvent("dope-football:IncreaseBlueScores", -1, BlueTeamScore)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)
        if StartTime == true then
            Timer = Timer + 1
            if Timer == 29 then
                EventTime = EventTime - 1
                Timer = 1
                Citizen.Wait(1000)
                TriggerClientEvent("dope-football:FootballEventStarted", -1,  FootballEventStarted, EventTime)
            end
        end
    end
end)


RegisterServerEvent("dope-football:Shoot")
AddEventHandler("dope-football:Shoot", function(ForwardX, ForwardY)
    ServerForwardX = ForwardX
    ServerForwardY = ForwardY
    TriggerClientEvent("dope-football:StartShootProgress", -1, ServerForwardX, ServerForwardY)
end)

RegisterServerEvent("dope-football:SprintDribble")
AddEventHandler("dope-football:SprintDribble", function(ForwardX, ForwardY)
    ServerForwardX = ForwardX
    ServerForwardY = ForwardY
    TriggerClientEvent("dope-football:StartSprintDribbleProgress", -1, ServerForwardX, ServerForwardY)
end)

RegisterServerEvent("dope-football:RunDribble")
AddEventHandler("dope-football:RunDribble", function(ForwardX, ForwardY)
    ServerForwardX = ForwardX
    ServerForwardY = ForwardY
    TriggerClientEvent("dope-football:StartRunDribbleProgress", -1, ServerForwardX, ServerForwardY)
end)

RegisterServerEvent("dope-football:SlowDribble")
AddEventHandler("dope-football:SlowDribble", function(ForwardX, ForwardY)
    ServerForwardX = ForwardX
    ServerForwardY = ForwardY
    TriggerClientEvent("dope-football:StartSlowDribbleProgress", -1, ServerForwardX, ServerForwardY)
end)



RegisterServerEvent("dope-football:Pass")
AddEventHandler("dope-football:Pass", function(ForwardX, ForwardY)
    ServerForwardX = ForwardX
    ServerForwardY = ForwardY
    TriggerClientEvent("dope-football:StartPassProgress", -1, ServerForwardX, ServerForwardY)
end)

RegisterServerEvent("dope-football:PowerPass")
AddEventHandler("dope-football:PowerPass", function(ForwardX, ForwardY)
    ServerForwardX = ForwardX
    ServerForwardY = ForwardY
    TriggerClientEvent("dope-football:StartPowerPassProgress", -1, ServerForwardX, ServerForwardY)
end)


RegisterServerEvent("dope-football:Rainbow")
AddEventHandler("dope-football:Rainbow", function(ForwardX, ForwardY)
    ServerForwardX = ForwardX
    ServerForwardY = ForwardY
    TriggerClientEvent("dope-football:StartRainbowProgress", -1, ServerForwardX, ServerForwardY)
end)
