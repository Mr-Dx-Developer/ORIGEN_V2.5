QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add('clear', 'Clear Self Chat', {}, false, function(source, args)
    TriggerClientEvent('chat:client:ClearChat', source)
end)

QBCore.Commands.Add('clearall', 'Clear Chat (Everyone) (Staff Only)', {}, false, function(source, args)
	TriggerClientEvent('chat:client:ClearChat', -1)
end, "admin")

-- RegisterServerEvent('tg-chat:sendOocGlobally')
-- AddEventHandler('tg-chat:sendOocGlobally', function(msg)
-- local src = source
-- 	TriggerClientEvent('chat:addMessage', -1, {
--         template = '<div class="chat-message" style="background-color: rgba(51, 112, 165, 0.85);"><b>OOC | {0}</b> {1}</div>',
--         args = { GetPlayerName(src).. ' |', msg}
--     })
-- end)
	
RegisterCommand('police', function(source, args, rawCommand)
	-- If From Console
	if source == 0 then
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="chat-message" style="background-color: rgba(15, 55, 255, 0.85);"><b>Police Announcement:</b> {0}</div>',
			args = { args }
		})
		return
	end

	-- Emojis Stuff
	args = table.concat(args, ' ')
	args = args:gsub("%:heart:", "❤️")
	args = args:gsub("%:smile:", "🙂")
	args = args:gsub("%:thinking:", "🤔")
	args = args:gsub("%:check:", "✅")
	args = args:gsub("%:hot:", "🥵")
	args = args:gsub("%:sad:", "😦")

	-- Permmisions Stuff
	local xPlayer = QBCore.Functions.GetPlayer(source)
	if xPlayer.PlayerData.job ~= nil and  xPlayer.PlayerData.job.name == 'police' and xPlayer.PlayerData.job.grade.level >= 1 then
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="chat-message" style="background-color: rgba(15, 55, 255, 0.85);"><b>Police Announcement:</b> {0}</div>',
			args = { args }
		})
	else
		TriggerClientEvent('chat:addMessage', source, {
			template = '<div class="chat-message" style="background-color: rgba(190, 97, 18, 0.85); color: white;"><b>SYSTEM:</b> Access Denied</div>',
			args = {}
		})
	end
end, false)

RegisterCommand('sheriff', function(source, args, rawCommand)
	-- If From Console
	if source == 0 then
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="chat-message" style="background-color: rgba(184, 118, 53, 0.85);"><b>SDSO Announcement:</b> {0}</div>',
			args = { args }
		})
		return
	end

	-- Emojis Stuff
	args = table.concat(args, ' ')
	args = args:gsub("%:heart:", "❤️")
	args = args:gsub("%:smile:", "🙂")
	args = args:gsub("%:thinking:", "🤔")
	args = args:gsub("%:check:", "✅")
	args = args:gsub("%:hot:", "🥵")
	args = args:gsub("%:sad:", "😦")

	-- Permmisions Stuff
	local xPlayer = QBCore.Functions.GetPlayer(source)
	if xPlayer.PlayerData.job ~= nil and  xPlayer.PlayerData.job.name == 'police' and xPlayer.PlayerData.job.grade.level >= 1 then
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="chat-message" style="background-color: rgba(184, 118, 53, 0.85);"><b>SDSO Announcement:</b> {0}</div>',
			args = { args }
		})
	else
		TriggerClientEvent('chat:addMessage', source, {
			template = '<div class="chat-message" style="background-color: rgba(190, 97, 18, 0.85); color: white;"><b>SYSTEM:</b> Access Denied</div>',
			args = {}
		})
	end
end, false)

RegisterCommand('cityhall', function(source, args, rawCommand)
	-- If From Console
	if source == 0 then
		TriggerClientEvent('chat:addMessage', -1, {
        	template = '<div class="chat-message" style="background-color: rgba(58, 151, 113, 0.65);"><b>🏚️ CityHall Announcement:</b> {0}</div>',
			args = { args }
		})
		return
	end

	-- Emojis Stuff
	args = table.concat(args, ' ')
	args = args:gsub("%:heart:", "❤️")
	args = args:gsub("%:smile:", "🙂")
	args = args:gsub("%:thinking:", "🤔")
	args = args:gsub("%:check:", "✅")
	args = args:gsub("%:hot:", "🥵")
	args = args:gsub("%:sad:", "😦")

	-- Permmisions Stuff
	local xPlayer = QBCore.Functions.GetPlayer(source)
	if xPlayer.PlayerData.job ~= nil and  xPlayer.PlayerData.job.name == 'casino' and xPlayer.PlayerData.job.grade.level >= 2 then
		TriggerClientEvent('chat:addMessage', -1, {
        	template = '<div class="chat-message" style="background-color: rgba(58, 151, 113, 0.65);"><b>🏚️ CityHall Announcement:</b> {0}</div>',
			args = { args }
		})
	else
		TriggerClientEvent('chat:addMessage', source, {
			template = '<div class="chat-message" style="background-color: rgba(190, 97, 18, 0.85); color: white;"><b>SYSTEM:</b> Access Denied</div>',
			args = {}
		})
	end
end, false)

RegisterCommand('iec', function(source, args, rawCommand)
	-- If From Console
	if source == 0 then
		TriggerClientEvent('chat:addMessage', -1, {
        	template = '<div class="chat-message" style="background-color: rgba(205, 133, 0, 0.65);;"><b>⚡ Electricity Authority Announcement:</b> {0}</div>',
			args = { args }
		})
		return
	end

	-- Emojis Stuff
	args = table.concat(args, ' ')
	args = args:gsub("%:heart:", "❤️")
	args = args:gsub("%:smile:", "🙂")
	args = args:gsub("%:thinking:", "🤔")
	args = args:gsub("%:check:", "✅")
	args = args:gsub("%:hot:", "🥵")
	args = args:gsub("%:sad:", "😦")

	-- Permmisions Stuff
	local xPlayer = QBCore.Functions.GetPlayer(source)
	if xPlayer.PlayerData.job ~= nil and  xPlayer.PlayerData.job.name == 'casino' and xPlayer.PlayerData.job.grade.level >= 2 then
		TriggerClientEvent('chat:addMessage', -1, {
        	template = '<div class="chat-message" style="background-color: rgba(205, 133, 0, 0.65);"><b>⚡ Electricity Authority Announcement:</b> {0}</div>',
			args = { args }
		})
	else
		TriggerClientEvent('chat:addMessage', source, {
			template = '<div class="chat-message" style="background-color: rgba(190, 97, 18, 0.85); color: white;"><b>SYSTEM:</b> Access Denied</div>',
			args = {}
		})
	end
end, false)

RegisterCommand('judge', function(source, args, rawCommand)
	-- If From Console
	if source == 0 then
		TriggerClientEvent('chat:addMessage', -1, {
        	template = '<div class="chat-message" style="background-color: rgba(205, 133, 0, 0.65);;"><b>⚖️ Court House Announcement:</b> {0}</div>',
			args = { args }
		})
		return
	end

	-- Emojis Stuff
	args = table.concat(args, ' ')
	args = args:gsub("%:heart:", "❤️")
	args = args:gsub("%:smile:", "🙂")
	args = args:gsub("%:thinking:", "🤔")
	args = args:gsub("%:check:", "✅")
	args = args:gsub("%:hot:", "🥵")
	args = args:gsub("%:sad:", "😦")

	-- Permmisions Stuff
	local xPlayer = QBCore.Functions.GetPlayer(source)
	if xPlayer.PlayerData.job ~= nil and  xPlayer.PlayerData.job.name == 'judge' and xPlayer.PlayerData.job.grade.level >= 2 then
		TriggerClientEvent('chat:addMessage', -1, {
        	template = '<div class="chat-message" style="background-color: rgba(205, 133, 0, 0.65);"><b>⚖️ Court House Announcement:</b> {0}</div>',
			args = { args }
		})
	else
		TriggerClientEvent('chat:addMessage', source, {
			template = '<div class="chat-message" style="background-color: rgba(190, 97, 18, 0.85); color: white;"><b>SYSTEM:</b> Access Denied</div>',
			args = {}
		})
	end
end, false)

RegisterCommand('group', function(source, args, rawCommand)
	if source == 0 then
		return
	end

	local _source = source
	local xPlayerGroup = QBCore.Functions.GetPermission(_source)

	TriggerClientEvent('chat:addMessage', _source, {
    	template = '<div class="chat-message" style="background-color: rgba(190, 97, 18, 0.85); color: white;"><b>SYSTEM:</b> Group User: {0}</div>',
    	args = {xPlayerGroup}
    })
end, false)

RegisterServerEvent('chatt:adminchatpermmision')
AddEventHandler('chatt:adminchatpermmision', function(name, msg)
	local _source = source
	local xPlayerGroup = QBCore.Functions.GetPermission(_source)
	if xPlayerGroup ~= nil and xPlayerGroup ~= "user" then
		sendToAllPlayers(name, msg)
	else
		TriggerClientEvent('chat:addMessage', _source, {
        	template = '<div class="chat-message" style="background-color: rgba(190, 97, 18, 0.85); color: white;"><b>SYSTEM:</b> You are not a staff member</div>',
        	args = {}
    	})
	end
end)

RegisterServerEvent('chatt:adminchatsystem')
AddEventHandler('chatt:adminchatsystem', function(name, msg)
	local _source = source
	sendToAllPlayers(name, GetPlayerName(_source) .. msg)
end)

function sendToAllPlayers(name, msg)
	local xPlayers = QBCore.Functions.GetPlayers()
	for i = 1, #xPlayers, 1 do
		local xPlayer = QBCore.Functions.GetPlayer(xPlayers[i])
		local xPlayerGroup = QBCore.Functions.GetPermission(xPlayers[i])
		if xPlayerGroup ~= nil and xPlayerGroup ~= "user" then
			TriggerClientEvent('chat:addMessage', xPlayer.PlayerData.source, {
    			template = '<div class="chat-message" style="background-color: rgba(37, 103, 113, 0.85);"><b>Staff Chat: [{0}]</b> {1}</div>',
    			args = {name, msg}
    		})
    	end
    end
end

RegisterCommand('staff', function(source, args, rawCommand)
	-- If From Console
	if source == 0 then
		TriggerClientEvent('chat:addMessage', -1, {
        	template = '<div class="chat-message" style="background-color: rgba(58, 151, 113, 0.85);"><b>🔑 Staff Announcement:</b> {0}</div>',
        	args = { args }
    	})
		return
	end

	-- Emojis Stuff
	args = table.concat(args, ' ')
	args = args:gsub("%:heart:", "❤️")
    args = args:gsub("%:smile:", "🙂")
    args = args:gsub("%:thinking:", "🤔")
    args = args:gsub("%:check:", "✅")
    args = args:gsub("%:hot:", "🥵")
    args = args:gsub("%:sad:", "😦")

    -- Permmisions Stuff
	local xPlayerGroup = QBCore.Functions.GetPermission(source)
	if xPlayerGroup ~= nil and xPlayerGroup ~= "user" then
		TriggerClientEvent('chat:addMessage', -1, {
        	template = '<div class="chat-message" style="background-color: rgba(58, 151, 113, 0.85);"><b>🔑 Staff Announcement:</b> {0}</div>',
        	args = { args }
    	})
	else
		TriggerClientEvent('chat:addMessage', source, {
        	template = '<div class="chat-message" style="background-color: rgba(190, 97, 18, 0.85); color: white;"><b>SYSTEM:</b> Access Denied</div>',
        	args = {}
    	})
	end
end, false)