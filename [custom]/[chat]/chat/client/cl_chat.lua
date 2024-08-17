local chatInputActive = false
local chatInputActivating = false
local chatHidden = true
local chatLoaded = false

RegisterNetEvent('chatMessage')
RegisterNetEvent('chat:addTemplate')
RegisterNetEvent('chat:addMessage')
RegisterNetEvent('chat:addSuggestion')
RegisterNetEvent('chat:addSuggestions')
RegisterNetEvent('chat:removeSuggestion')
RegisterNetEvent('chat:client:ClearChat')

-- internal events

RegisterNetEvent('_chat:messageEntered')

--deprecated, use chat:addMessage
AddEventHandler('chatMessage', function(author, color, text)
  local args = { text }
  if author ~= "" then
    table.insert(args, 1, author)
  end
  SendNUIMessage({
    type = 'ON_MESSAGE',
    message = {
      color = color,
      args = args
    }
  })
end)



AddEventHandler('chat:addMessage', function(message)
  SendNUIMessage({
    type = 'ON_MESSAGE',
    message = message
  })
end)

AddEventHandler('chat:addSuggestion', function(name, help, params)
  SendNUIMessage({
    type = 'ON_SUGGESTION_ADD',
    suggestion = {
      name = name,
      help = help,
      params = params or nil
    }
  })
end)

AddEventHandler('chat:addSuggestions', function(suggestions)
  for _, suggestion in ipairs(suggestions) do
    SendNUIMessage({
      type = 'ON_SUGGESTION_ADD',
      suggestion = suggestion
    })
  end
end)

AddEventHandler('chat:removeSuggestion', function(name)
  SendNUIMessage({
    type = 'ON_SUGGESTION_REMOVE',
    name = name
  })
end)

RegisterNetEvent('chat:resetSuggestions')
AddEventHandler('chat:resetSuggestions', function()
  SendNUIMessage({
    type = 'ON_COMMANDS_RESET'
  })
end)

AddEventHandler('chat:addTemplate', function(id, html)
  SendNUIMessage({
    type = 'ON_TEMPLATE_ADD',
    template = {
      id = id,
      html = html
    }
  })
end)

AddEventHandler('chat:client:ClearChat', function(name)
  SendNUIMessage({
    type = 'ON_CLEAR'
  })
end)

RegisterNUICallback('chatResult', function(data, cb)
  chatInputActive = false
  SetNuiFocus(false)

  if not data.canceled then
    local id = PlayerId()

    --deprecated
    local r, g, b = 0, 0x99, 255

    if data.message:sub(1, 1) == '/' then
      ExecuteCommand(data.message:sub(2))
    else
      TriggerServerEvent('_chat:messageEntered', GetPlayerName(id), { r, g, b }, data.message)
    end
  end

  cb('ok')
end)

local function refreshCommands()
  if GetRegisteredCommands then
    local registeredCommands = GetRegisteredCommands()

    local suggestions = {}

    for _, command in ipairs(registeredCommands) do
        if IsAceAllowed(('command.%s'):format(command.name)) then
            table.insert(suggestions, {
                name = '/' .. command.name,
                help = ''
            })
        end
    end

    TriggerEvent('chat:addSuggestions', suggestions)
  end
end

local function refreshThemes()
  local themes = {}

  for resIdx = 0, GetNumResources() - 1 do
    local resource = GetResourceByFindIndex(resIdx)

    if GetResourceState(resource) == 'started' then
      local numThemes = GetNumResourceMetadata(resource, 'chat_theme')

      if numThemes > 0 then
        local themeName = GetResourceMetadata(resource, 'chat_theme')
        local themeData = json.decode(GetResourceMetadata(resource, 'chat_theme_extra') or 'null')

        if themeName and themeData then
          themeData.baseUrl = 'nui://' .. resource .. '/'
          themes[themeName] = themeData
        end
      end
    end
  end

  SendNUIMessage({
    type = 'ON_UPDATE_THEMES',
    themes = themes
  })
end

AddEventHandler('onClientResourceStart', function(resName)
  Wait(500)

  refreshCommands()
  refreshThemes()
end)

AddEventHandler('onClientResourceStop', function(resName)
  Wait(500)

  refreshCommands()
  refreshThemes()
end)

RegisterNUICallback('loaded', function(data, cb)
  TriggerServerEvent('chat:init');

  refreshCommands()
  refreshThemes()

  chatLoaded = true

  cb('ok')
end)


RegisterNetEvent('chat:id')
AddEventHandler('chat:id', function(source, pname)
  local target = GetPlayerFromServerId(source)
  if target ~= nil and target ~= -1 then
    local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
    local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

    if target == source then
      TriggerEvent('chat:addMessage', {
          template = '<div class="chat-message" style="background-color: rgba(60, 179, 113);">{0} ID is - {1}</div>',
          args = { pname, source }
      })
    elseif GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 20.0 then
      TriggerEvent('chat:addMessage', {
          template = '<div class="chat-message" style="background-color: rgba(60, 179, 113);">{0} ID is - {1}</div>',
          args = { pname, source}
      })
    end
  end
end)

DiscordName = ""

RegisterNetEvent("chatt:SavePlayer")
AddEventHandler("chatt:SavePlayer", function(discname)
    DiscordName = discname
end)

CreateThread(function()
    TriggerServerEvent("chatt:checkPlayer")
end)

-- RegisterCommand('refreshname', function()
--     TriggerServerEvent("chatt:checkPlayer")
-- end)

-- RegisterCommand('ooc', function(source, args, rawCommand)
-- 	local msg = rawCommand:sub(4)
-- 	TriggerServerEvent('tg-chat:sendOocGlobally', msg)
-- end, false)

RegisterCommand('ac', function(source, args, rawCommand)
	local msg = rawCommand:sub(4)
	TriggerServerEvent('chatt:adminchatpermmision', GetPlayerName(PlayerId()), msg)
end, false)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/id', 'Check Server ID')
    TriggerEvent('chat:addSuggestion', '/autopilot', '1-4 (Autopilot for Electrical Vehicles)')
    TriggerEvent('chat:addSuggestion', '/crosshair', 'Toggle Crosshair')
    --TriggerEvent('chat:addSuggestion', '/fine', 'Open Fines Panel')
    TriggerEvent('chat:addSuggestion', '/dance', '1-3700')
    TriggerEvent('chat:addSuggestion', '/nearby', 'Do an emote with a nearby player /nearby (emote)')
    TriggerEvent('chat:addSuggestion', '/hud', 'Open HUD Settings')
    TriggerEvent('chat:addSuggestion', '/resethud', 'Reset HUD (Incase anything does not work as intended.')
    -- TriggerEvent('chat:addSuggestion', '/carry', 'Carry a player')
    TriggerEvent('chat:addSuggestion', '/hideinv', 'Close Inventory (Incase NUI is stuck)')
    -- TriggerEvent('chat:addSuggestion', '/breach', 'Breach into a house robbery (Police)')
    -- TriggerEvent('chat:addSuggestion', '/seat', '(number) depends on how many seats the vehicle has (Vehicle)')
    TriggerEvent('chat:addSuggestion', '/door', '0 | 4 open/close (Vehicle)')
    TriggerEvent('chat:addSuggestion', '/window', '-1 | 4 open/close (Vehicle)')
    TriggerEvent('chat:addSuggestion', '/t1', 'Toggle Torso (On)')
    TriggerEvent('chat:addSuggestion', '/t0', 'Toggle Torso (Off)')
    TriggerEvent('chat:addSuggestion', '/j1', 'Toggle Jacket (On)')
    TriggerEvent('chat:addSuggestion', '/j0', 'Toggle Jacket (Off)')
    TriggerEvent('chat:addSuggestion', '/v1', 'Toggle Vest (On)')
    TriggerEvent('chat:addSuggestion', '/v0', 'Toggle Vest (Off)')
    TriggerEvent('chat:addSuggestion', '/p1', 'Toggle Pants (On)')
    TriggerEvent('chat:addSuggestion', '/p0', 'Toggle Pants (Off)')
    TriggerEvent('chat:addSuggestion', '/s1', 'Toggle Shoes (On)')
    TriggerEvent('chat:addSuggestion', '/s0', 'Toggle Shoes (Off)')
    TriggerEvent('chat:addSuggestion', '/e1', 'Toggle Earrings (On)')
    TriggerEvent('chat:addSuggestion', '/e0', 'Toggle Earrings (Off)')
    TriggerEvent('chat:addSuggestion', '/w1', 'Toggle Watch (On)')
    TriggerEvent('chat:addSuggestion', '/w0', 'Toggle Watch (Off)')
    TriggerEvent('chat:addSuggestion', '/b1', 'Toggle Bag (On)')
    TriggerEvent('chat:addSuggestion', '/b0', 'Toggle Bag (Off)')
    TriggerEvent('chat:addSuggestion', '/n1', 'Toggle Chain/Tie (On)')
    TriggerEvent('chat:addSuggestion', '/n0', 'Toggle Chain/Tie (Off)')
end)

exports("isChatOpen",function()
  return chatInputActive
end)