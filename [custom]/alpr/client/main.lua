local showingController = false
RegisterCommand("alpr", function(source, args, raw)
	if not PLY:VehicleStateValid() then UTIL:Notify("You need to be in a Police vehicle") return; end
	if args[1] == nil then
		if showingController then
			showingController = false
			SendNUIMessage({ type = 'ALPR_GUI_HIDE' })
			SetNuiFocus(false, false)
		else
			showingController = true
			SendNUIMessage({ type = 'ALPR_GUI_DISPLAY' })
			SetNuiFocus(true, true)
		end
	elseif args[1] == "resetui" then
		SendNUIMessage({ type = 'ALPR_UI_RESET' })
		UTIL:Notify("ALPR UI Settings Reset")
	elseif args[1] == "clear" and args[2] ~= nil and (args[2] == "front" or args[2] == "rear" or args[2] == "both") then
		SendNUIMessage({ type = 'ALPR_ALERT_CLEAR', camera = args[2] })
		UTIL:Notify("Plate lock cleared")
	end
end)
TriggerEvent('chat:addSuggestion', "/alpr", "ALPR Controller", {{name="action", help="blank (toggle alpr) | resetui | clear"}, {name="camera", help="front | rear | both"}})

RegisterNUICallback('exit', function(data)
	showingController = false
	SetNuiFocus(false, false)
end)

RegisterNUICallback('updateMarker', function(data)
	local tkey = nil
	for k,v in pairs(CachedData) do
		if v.markerId == data.markerId then
			tkey = k
			break
		end
	end
    if tkey == nil then return; end
	if CachedData[tkey] then
		CachedData[tkey] = {
			plate = data.licensePlate,
			charid = data.characterId,
			reason = data.reason,
	        firstname = data.firstName,
	        lastname = data.lastName,
	        created = data.createdAt,
	        markerId = data.markerId,
	    }
	end
end)

RegisterNUICallback('createMarker', function(data)
	CachedData[data.licensePlate] = {}
	CachedData[data.licensePlate] = {
		plate = data.licensePlate,
		charid = data.characterId,
		reason = data.reason,
        firstname = data.firstName,
        lastname = data.lastName,
        created = data.createdAt,
        markerId = data.markerId,
	}
end)

RegisterNUICallback('deleteMarker', function(data)
	local tkey = nil
	for k,v in pairs(CachedData) do
		if v.markerId == data.markerId then
			tkey = k
			break
		end
	end
    if tkey == nil then return; end
	if CachedData[tkey] then
		CachedData[tkey] = {}
	end
end)

RegisterNUICallback('setuiscale', function(data)
	if data.element == nil then return; end
	SetResourceKvp("alpr_"..data.element.."_scale", data.scale)
	print("[ALPR] Saved UI Scale of Element: "..data.element.." | Scale: "..data.scale)
end)

RegisterNUICallback('setuipos', function(data)
	if data.element == nil then return; end
	SetResourceKvp("alpr_"..data.element.."_pos", json.encode(data.pos))
	print("[ALPR] Saved UI Pos of Element: "..data.element.." | Scale: "..data.pos)
end)

RegisterNUICallback('setuivol', function(data)
	print(type(data.shutterVol))
	SetResourceKvp("alpr_shutter_vol", data.shutterVol)
	SetResourceKvp("alpr_cchord_vol", data.cchordVol)
	SetResourceKvp("alpr_local_vol", data.localVol)
	SetResourceKvp("alpr_ncic_vol", data.ncicVol)
	print("[ALPR] Saved Volume Settings")
end)

RegisterNUICallback('enable', function()
	READER:SetDisplay( true )
end)

RegisterNUICallback('disable', function()
	READER:SetDisplay( false )
end)

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
		return
	end
	SetNuiFocus(false, false)
end)



function GetUISettings()
	SendNUIMessage({ 
		type = 'ALPR_UI_SETTINGS',
		payload = {
			alertPos=json.decode(GetResourceKvpString("alpr_alert_pos")),
			readerPos=json.decode(GetResourceKvpString("alpr_reader_pos")),
			alertScale=GetResourceKvpString("alpr_alert_scale"),
			readerScale=GetResourceKvpString("alpr_reader_scale"),
			shutterVol=GetResourceKvpString("alpr_shutter_vol"),
			cchordVol=GetResourceKvpString("alpr_cchord_vol"),
			localVol=GetResourceKvpString("alpr_local_vol"),
			ncicVol=GetResourceKvpString("alpr_ncic_vol")
		}
	})
end

RegisterCommand("loadAlprSettings", function( ... )
	GetUISettings()
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)

		if NetworkIsSessionStarted() then
			Wait(5000)
			GetUISettings()
            SendNUIMessage({ type = 'ALPR_UPDATE_CHARACTER', characterId = math.random(10000,99999)})
			return
		end
	end
end)