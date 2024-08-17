RegisterServerEvent("eff_flames")
AddEventHandler("eff_flames", function(entity)
	TriggerClientEvent("c_eff_flames", -1, entity)
end)

RegisterNetEvent("2step:triggersound", function(vehiclePos)
	TriggerClientEvent("2step:createsound", -1, vehiclePos)
end)

RegisterCommand("antilag", function(source, args, rawCommand)
	TriggerClientEvent("2step:Anti-lag", source, 0)
end)