RegisterNetEvent('ajnaems:playSound')
AddEventHandler('ajnaems:playSound', function(playersInArea, coords)
	local distance  = (Config.SoundMaxDistance or 5.0)
	local soundData = {
		soundId  = ('ajnaems_%s'):format(source),
		url 	 = Config.DefibSoundUrl,
		position = coords,
		volume 	 = (Config.SoundMaxVolume or 0.4),
		loop	 = false
	}

	for _,playerId in pairs(playersInArea) do
		TriggerClientEvent('xsound:stateSound', playerId, 'playpos', soundData)
		TriggerClientEvent('xsound:stateSound', playerId, 'distance', {soundId = soundData.soundId, distance = distance})
	end
end)

RegisterNetEvent('ajnaems:deleteObjects')
AddEventHandler('ajnaems:deleteObjects', function(propList)
	for k,propId in pairs(propList) do
		local entity = NetworkGetEntityFromNetworkId(propId)
		if DoesEntityExist(entity) then
			DeleteEntity(entity)
		end
	end
end)