local string_find = string.find
GlobalState.scoreplayers = {}
GlobalState.onlineplayers = 0

function GetIdentifier(source)
    local identifiers = GetPlayerIdentifiers(source)
    for _, identifier in pairs(identifiers) do
        if string_find(identifier, Config.UseIdentifier) then
            return identifier
        end
    end
    return 'Could not load'
end

RegisterNetEvent("scoreboard:initiatedata", function()
    local players = {}
    local totalonline = GetNumPlayerIndices()
    for _, playerId in pairs(GetPlayers()) do
        if GetPlayerPed(playerId) ~= 0 then
            players[tonumber(playerId)] = {
                source = playerId,
                identifier = GetIdentifier(playerId),
                name = GetPlayerName(playerId)
            }
        end
    end
    Wait(100)
    GlobalState.scoreplayers = players
    GlobalState.onlineplayers = totalonline
end)

RegisterNetEvent("scoreboard:getPermission", function()
    local source = source
    local isAdmin = IsPlayerAceAllowed(source, 'command')
    TriggerClientEvent("scoreboard:hasPermission", source, isAdmin)
end)

AddEventHandler("onResourceStart", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
	TriggerEvent("scoreboard:initiatedata")
end)

AddEventHandler("playerDropped", function()
	TriggerEvent("scoreboard:initiatedata")
end)