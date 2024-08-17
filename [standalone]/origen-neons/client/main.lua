local cursoractive = false
local uiactive = false

local RGBspeede = 1.36

local player = nil 
local vehicle = nil 
local vehicleplate = nil
local vlastplate = ""
local neondata = {}

local animspeed1 = Config.animationspeed1
local animspeed2 = Config.animationspeed2
local animspeed3 = Config.animationspeed3

local rgbspeed1 = Config.rgbspeed1
local rgbspeed2 = Config.rgbspeed2
local rgbspeed3 = Config.rgbspeed3

RegisterCommand("showui", function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	if IsPedSittingInAnyVehicle(player) and GetPedInVehicleSeat(vehicle, -1) == player then
		SendNUIMessage({
			message    = "showui"
	    })
		SetNuiFocus(true, true)
		Citizen.Wait(1000)
		uiactive = true
	end
end)  

RegisterNUICallback('escesc', function(data, cb)
	if uiactive == true then
		SetNuiFocus(false, false)
		SendNUIMessage({
			message    = "hideui"
	    })  
		uiactive = false
	end
end)

function toggleRGB()
	Citizen.CreateThread(function()
		local function RGBRainbow(frequency)
			local result = {}
			local curtime = GetGameTimer() / 1000
			result.r = math.floor( math.sin( curtime * frequency + 0 ) * 127 + 128 )
			result.g = math.floor( math.sin( curtime * frequency + 2 ) * 127 + 128 )
			result.b = math.floor( math.sin( curtime * frequency + 4 ) * 127 + 128 )	
			return result
		end
	    while true do
	    	Citizen.Wait(neondata[vehicleplate].rgbspeed)
			if player == nil then
				player = PlayerPedId()
			end
			if vehicle == nil then
				vehicle = GetVehiclePedIsIn(player, false)
			end
			if vehicleplate == nil then
				vehicleplate = GetVehicleNumberPlateText(vehicle)
			end				
			if IsPedSittingInAnyVehicle(player) and GetPedInVehicleSeat(vehicle, -1) == player then
				if neondata[vehicleplate].rgbON == true then
			        local rainbow = RGBRainbow( RGBspeede )
					SetVehicleNeonLightsColour(vehicle, rainbow.r, rainbow.g, rainbow.b)
				end		
			else
				break
			end
		end
	end)
end

function offanims()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	neondata[vehicleplate].anims = false
	neondata[vehicleplate].crisscross = false
    neondata[vehicleplate].lightning = false
    neondata[vehicleplate].fourways = false
    neondata[vehicleplate].blinking = false
    neondata[vehicleplate].snake = false
    neondata[vehicleplate].allinone = false
end

function checkspeed()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end		
	if neondata[vehicleplate].animspeed1ON == true then
		SendNUIMessage({
			message    = "animspeed1ON"
	    })
	elseif neondata[vehicleplate].animspeed2ON == true then
		SendNUIMessage({
			message    = "animspeed2ON"
	    })	
	elseif neondata[vehicleplate].animspeed3ON == true then
		SendNUIMessage({
			message    = "animspeed3ON"
	    })	
	else
		SendNUIMessage({
			message    = "animspeedallOFF"
	    })	 
	end
	if neondata[vehicleplate].rgbspeed1ON == true then
		SendNUIMessage({
			message    = "rgbspeed1ON"
	    })	
	elseif neondata[vehicleplate].rgbspeed2ON == true then
		SendNUIMessage({
			message    = "rgbspeed2ON"
	    })
	elseif neondata[vehicleplate].rgbspeed3ON == true then
		SendNUIMessage({
			message    = "rgbspeed3ON"
	    })	 
	else
		SendNUIMessage({
			message    = "rgbspeedallOFF"
	    })	   		
	end
end

function checkrgb()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end		
	if neondata[vehicleplate].rgbON == true then
		SendNUIMessage({
			message    = "animrgbON"
	    })
	else
		SendNUIMessage({
			message    = "rgbswitchOFF"
	    })			
	end
end

function checkanims()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end		
	if neondata[vehicleplate].anims == true then
		if neondata[vehicleplate].crisscross == true then
			SendNUIMessage({
				message    = "resyncanims",
				resyncedanim = "s-crisscross",
				toggleanim = true
		    })
		elseif neondata[vehicleplate].lightning == true then
			SendNUIMessage({
				message    = "resyncanims",
				resyncedanim = "s-lightning",
				toggleanim = true
		    })	
		elseif neondata[vehicleplate].fourways == true then
			SendNUIMessage({
				message    = "resyncanims",
				resyncedanim = "s-fourways",
				toggleanim = true
		    })
		elseif neondata[vehicleplate].blinking == true then
			SendNUIMessage({
				message    = "resyncanims",
				resyncedanim = "s-blinking",
				toggleanim = true
		    })
		elseif neondata[vehicleplate].snake == true then
			SendNUIMessage({
				message    = "resyncanims",
				resyncedanim = "s-snake",
				toggleanim = true
		    })
		elseif neondata[vehicleplate].allinone == true then
			SendNUIMessage({
				message    = "resyncanims",
				resyncedanim = "s-allinone",
				toggleanim = true
		    })
		else
			SendNUIMessage({
				message    = "resyncanims",
				toggleanim = false
			})	
		end
	else	
		SendNUIMessage({
			message    = "resyncanims",
			toggleanim = false
		})		
	end
end

function checkneons()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end		
	if neondata[vehicleplate].anims == false then	
		if neondata[vehicleplate].sneon1 == true then
			SetVehicleNeonLightEnabled(vehicle, 0, true)
			SendNUIMessage({
				message    = "sneon1ON"
		    })  
		else
			SetVehicleNeonLightEnabled(vehicle, 0, false)
		end
		if neondata[vehicleplate].sneon2 == true then
			SetVehicleNeonLightEnabled(vehicle, 1, true)
			SendNUIMessage({
				message    = "sneon2ON"
		    })  
		else
			SetVehicleNeonLightEnabled(vehicle, 1, false)
		end
		if neondata[vehicleplate].sneon3 == true then
			SetVehicleNeonLightEnabled(vehicle, 2, true)
			SendNUIMessage({
				message    = "sneon3ON"
		    })  
		else
			SetVehicleNeonLightEnabled(vehicle, 2, false)
		end
		if neondata[vehicleplate].sneon4 == true then
			SetVehicleNeonLightEnabled(vehicle, 3, true)
			SendNUIMessage({
				message    = "sneon4ON"
		    })  
		end
		if neondata[vehicleplate].sneon1 == true and neondata[vehicleplate].sneon2 == true and neondata[vehicleplate].sneon3 == true and neondata[vehicleplate].sneon4 == true then
			SendNUIMessage({
				message    = "sallneonsON"
		    })  	
		end
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(50)
		local vehentered = false
		player = PlayerPedId()
		vehicle = GetVehiclePedIsIn(player, false)
		vehicleplate = GetVehicleNumberPlateText(vehicle)
		if vehicle == nil or vehicleplate == nil then
			--
		else
			if vehicleplate == vlastplate then
			else
				vlastplate = vehicleplate
				vehentered = true
				if neondata[vehicleplate] == nil then
					neondata[vehicleplate] = {}
					neondata[vehicleplate] = {crisscross = false, lightning = false, fourways = false, blinking = false, snake = false, allinone = false, sneon1 = false, sneon2 = false, sneon3 = false, sneon4 = false, anims = false, animspeed = Config.animationspeed, rgbspeed = Config.rgbspeed, rgbON = false, animspeed1ON = false, animspeed2ON = false, animspeed3ON = false, rgbspeed1ON = false, rgbspeed2ON = false, rgbspeed3ON = false}				
				end
			end
		end
	
		if IsPedSittingInAnyVehicle(player) and GetPedInVehicleSeat(vehicle, -1) == player then
			if vehentered == true then
				checkanims()
				checkneons()
				checkrgb()
				checkspeed()
			end
			if neondata[vehicleplate].crisscross == true then
				SetVehicleNeonLightEnabled(vehicle, 0, true)
				SetVehicleNeonLightEnabled(vehicle, 1, true)
				Citizen.Wait(neondata[vehicleplate].animspeed)
				if neondata[vehicleplate].crisscross == true then
					SetVehicleNeonLightEnabled(vehicle, 0, false)
					SetVehicleNeonLightEnabled(vehicle, 1, false)
					SetVehicleNeonLightEnabled(vehicle, 2, true)
					SetVehicleNeonLightEnabled(vehicle, 3, true)			
					Citizen.Wait(neondata[vehicleplate].animspeed)  
					if neondata[vehicleplate].crisscross == true then
						SetVehicleNeonLightEnabled(vehicle, 2, false)
						SetVehicleNeonLightEnabled(vehicle, 3, false)
						Citizen.Wait(neondata[vehicleplate].animspeed)
					end
				end
			elseif neondata[vehicleplate].lightning == true then
				SetVehicleNeonLightEnabled(vehicle, 3, true)
				SetVehicleNeonLightEnabled(vehicle, 1, false)
				SetVehicleNeonLightEnabled(vehicle, 2, false)
				SetVehicleNeonLightEnabled(vehicle, 0, false)
				Citizen.Wait(neondata[vehicleplate].animspeed)
				if neondata[vehicleplate].lightning == true then
					SetVehicleNeonLightEnabled(vehicle, 3, false)
					SetVehicleNeonLightEnabled(vehicle, 1, true)
					SetVehicleNeonLightEnabled(vehicle, 0, true)
					Citizen.Wait(neondata[vehicleplate].animspeed)	
					if neondata[vehicleplate].lightning == true then
						SetVehicleNeonLightEnabled(vehicle, 1, false)
						SetVehicleNeonLightEnabled(vehicle, 0, false)
						SetVehicleNeonLightEnabled(vehicle, 2, true)
						Citizen.Wait(neondata[vehicleplate].animspeed)
						if neondata[vehicleplate].lightning == true then
							SetVehicleNeonLightEnabled(vehicle, 2, false)
							SetVehicleNeonLightEnabled(vehicle, 1, true)
							SetVehicleNeonLightEnabled(vehicle, 0, true)
							Citizen.Wait(neondata[vehicleplate].animspeed)
						end
					end
				end
			elseif neondata[vehicleplate].fourways == true then
				SetVehicleNeonLightEnabled(vehicle, 3, true)
				SetVehicleNeonLightEnabled(vehicle, 1, false)
				SetVehicleNeonLightEnabled(vehicle, 2, false)
				SetVehicleNeonLightEnabled(vehicle, 0, false)
				Citizen.Wait(neondata[vehicleplate].animspeed)
				if neondata[vehicleplate].fourways == true then
					SetVehicleNeonLightEnabled(vehicle, 3, false)
					SetVehicleNeonLightEnabled(vehicle, 1, true)
					SetVehicleNeonLightEnabled(vehicle, 2, false)
					SetVehicleNeonLightEnabled(vehicle, 0, false)
					Citizen.Wait(neondata[vehicleplate].animspeed)	
					if neondata[vehicleplate].fourways == true then
						SetVehicleNeonLightEnabled(vehicle, 3, false)
						SetVehicleNeonLightEnabled(vehicle, 1, false)
						SetVehicleNeonLightEnabled(vehicle, 2, true)
						SetVehicleNeonLightEnabled(vehicle, 0, false)
						Citizen.Wait(neondata[vehicleplate].animspeed)	
						if neondata[vehicleplate].fourways == true then
							SetVehicleNeonLightEnabled(vehicle, 3, false)
							SetVehicleNeonLightEnabled(vehicle, 1, false)
							SetVehicleNeonLightEnabled(vehicle, 2, false)
							SetVehicleNeonLightEnabled(vehicle, 0, true)
							Citizen.Wait(neondata[vehicleplate].animspeed)
						end
					end
				end
			elseif neondata[vehicleplate].blinking == true then
				SetVehicleNeonLightEnabled(vehicle, 3, true)
				SetVehicleNeonLightEnabled(vehicle, 1, true)
				SetVehicleNeonLightEnabled(vehicle, 2, true)
				SetVehicleNeonLightEnabled(vehicle, 0, true)
				Citizen.Wait(neondata[vehicleplate].animspeed)
				if neondata[vehicleplate].blinking == true then
					SetVehicleNeonLightEnabled(vehicle, 3, false)
					SetVehicleNeonLightEnabled(vehicle, 1, false)
					SetVehicleNeonLightEnabled(vehicle, 2, false)
					SetVehicleNeonLightEnabled(vehicle, 0, false)
					Citizen.Wait(neondata[vehicleplate].animspeed)
				end
			elseif neondata[vehicleplate].snake == true then
				SetVehicleNeonLightEnabled(vehicle, 3, true)
				SetVehicleNeonLightEnabled(vehicle, 1, false)
				SetVehicleNeonLightEnabled(vehicle, 2, false)
				SetVehicleNeonLightEnabled(vehicle, 0, false)
				Citizen.Wait(neondata[vehicleplate].animspeed)
				if neondata[vehicleplate].snake == true then
					SetVehicleNeonLightEnabled(vehicle, 3, false)
					SetVehicleNeonLightEnabled(vehicle, 1, true)
					SetVehicleNeonLightEnabled(vehicle, 2, false)
					SetVehicleNeonLightEnabled(vehicle, 0, false)
					Citizen.Wait(neondata[vehicleplate].animspeed)
					if neondata[vehicleplate].snake == true then
						SetVehicleNeonLightEnabled(vehicle, 3, false)
						SetVehicleNeonLightEnabled(vehicle, 1, false)
						SetVehicleNeonLightEnabled(vehicle, 2, true)
						SetVehicleNeonLightEnabled(vehicle, 0, false)
						Citizen.Wait(neondata[vehicleplate].animspeed)
						if neondata[vehicleplate].snake == true then
							SetVehicleNeonLightEnabled(vehicle, 3, false)
							SetVehicleNeonLightEnabled(vehicle, 1, false)
							SetVehicleNeonLightEnabled(vehicle, 2, false)
							SetVehicleNeonLightEnabled(vehicle, 0, true)
							Citizen.Wait(neondata[vehicleplate].animspeed)	
							if neondata[vehicleplate].snake == true then	
								SetVehicleNeonLightEnabled(vehicle, 3, true)
								SetVehicleNeonLightEnabled(vehicle, 1, false)
								SetVehicleNeonLightEnabled(vehicle, 2, false)
								SetVehicleNeonLightEnabled(vehicle, 0, false)
								Citizen.Wait(neondata[vehicleplate].animspeed)	
								if neondata[vehicleplate].snake == true then
									SetVehicleNeonLightEnabled(vehicle, 3, false)
									SetVehicleNeonLightEnabled(vehicle, 1, false)
									SetVehicleNeonLightEnabled(vehicle, 2, false)
									SetVehicleNeonLightEnabled(vehicle, 0, true)
									Citizen.Wait(neondata[vehicleplate].animspeed)	
									if neondata[vehicleplate].snake == true then
										SetVehicleNeonLightEnabled(vehicle, 3, false)
										SetVehicleNeonLightEnabled(vehicle, 1, false)
										SetVehicleNeonLightEnabled(vehicle, 2, true)
										SetVehicleNeonLightEnabled(vehicle, 0, false)
										Citizen.Wait(neondata[vehicleplate].animspeed)
										if neondata[vehicleplate].snake == true then
											SetVehicleNeonLightEnabled(vehicle, 3, false)
											SetVehicleNeonLightEnabled(vehicle, 1, true)
											SetVehicleNeonLightEnabled(vehicle, 2, false)
											SetVehicleNeonLightEnabled(vehicle, 0, false)
											Citizen.Wait(neondata[vehicleplate].animspeed)
										end
									end
								end
							end
						end
					end
				end
			elseif neondata[vehicleplate].allinone == true then
				SetVehicleNeonLightEnabled(vehicle, 0, true)
				SetVehicleNeonLightEnabled(vehicle, 1, true)
				Citizen.Wait(neondata[vehicleplate].animspeed)
				if neondata[vehicleplate].allinone == true then
					SetVehicleNeonLightEnabled(vehicle, 0, false)
					SetVehicleNeonLightEnabled(vehicle, 1, false)
					SetVehicleNeonLightEnabled(vehicle, 2, true)
					SetVehicleNeonLightEnabled(vehicle, 3, true)			
					Citizen.Wait(neondata[vehicleplate].animspeed)  
					if neondata[vehicleplate].allinone == true then
						SetVehicleNeonLightEnabled(vehicle, 2, false)
						SetVehicleNeonLightEnabled(vehicle, 3, false)
						Citizen.Wait(neondata[vehicleplate].animspeed)
						if neondata[vehicleplate].allinone == true then
							SetVehicleNeonLightEnabled(vehicle, 3, true)
							SetVehicleNeonLightEnabled(vehicle, 1, false)
							SetVehicleNeonLightEnabled(vehicle, 2, false)
							SetVehicleNeonLightEnabled(vehicle, 0, false)
							Citizen.Wait(neondata[vehicleplate].animspeed)
							if neondata[vehicleplate].allinone == true then
								SetVehicleNeonLightEnabled(vehicle, 3, false)
								SetVehicleNeonLightEnabled(vehicle, 1, true)
								SetVehicleNeonLightEnabled(vehicle, 0, true)
								Citizen.Wait(neondata[vehicleplate].animspeed)	
								if neondata[vehicleplate].allinone == true then
									SetVehicleNeonLightEnabled(vehicle, 1, false)
									SetVehicleNeonLightEnabled(vehicle, 0, false)
									SetVehicleNeonLightEnabled(vehicle, 2, true)
									Citizen.Wait(neondata[vehicleplate].animspeed)
									if neondata[vehicleplate].allinone == true then
										SetVehicleNeonLightEnabled(vehicle, 2, false)
										SetVehicleNeonLightEnabled(vehicle, 1, true)
										SetVehicleNeonLightEnabled(vehicle, 0, true)
										Citizen.Wait(neondata[vehicleplate].animspeed)
										if neondata[vehicleplate].allinone == true then
											SetVehicleNeonLightEnabled(vehicle, 3, true)
											SetVehicleNeonLightEnabled(vehicle, 1, false)
											SetVehicleNeonLightEnabled(vehicle, 2, false)
											SetVehicleNeonLightEnabled(vehicle, 0, false)
											Citizen.Wait(neondata[vehicleplate].animspeed)
											if neondata[vehicleplate].allinone == true then
												SetVehicleNeonLightEnabled(vehicle, 3, false)
												SetVehicleNeonLightEnabled(vehicle, 1, true)
												SetVehicleNeonLightEnabled(vehicle, 2, false)
												SetVehicleNeonLightEnabled(vehicle, 0, false)
												Citizen.Wait(neondata[vehicleplate].animspeed)	
												if neondata[vehicleplate].allinone == true then
													SetVehicleNeonLightEnabled(vehicle, 3, false)
													SetVehicleNeonLightEnabled(vehicle, 1, false)
													SetVehicleNeonLightEnabled(vehicle, 2, true)
													SetVehicleNeonLightEnabled(vehicle, 0, false)
													Citizen.Wait(neondata[vehicleplate].animspeed)	
													if neondata[vehicleplate].allinone == true then
														SetVehicleNeonLightEnabled(vehicle, 3, false)
														SetVehicleNeonLightEnabled(vehicle, 1, false)
														SetVehicleNeonLightEnabled(vehicle, 2, false)
														SetVehicleNeonLightEnabled(vehicle, 0, true)
														Citizen.Wait(neondata[vehicleplate].animspeed)	
														if neondata[vehicleplate].allinone == true then
															SetVehicleNeonLightEnabled(vehicle, 3, true)
															SetVehicleNeonLightEnabled(vehicle, 1, true)
															SetVehicleNeonLightEnabled(vehicle, 2, true)
															SetVehicleNeonLightEnabled(vehicle, 0, true)
															Citizen.Wait(neondata[vehicleplate].animspeed)
															if neondata[vehicleplate].allinone == true then
																SetVehicleNeonLightEnabled(vehicle, 3, false)
																SetVehicleNeonLightEnabled(vehicle, 1, false)
																SetVehicleNeonLightEnabled(vehicle, 2, false)
																SetVehicleNeonLightEnabled(vehicle, 0, false)
																Citizen.Wait(neondata[vehicleplate].animspeed)
																if neondata[vehicleplate].allinone == true then
																	SetVehicleNeonLightEnabled(vehicle, 3, true)
																	SetVehicleNeonLightEnabled(vehicle, 1, false)
																	SetVehicleNeonLightEnabled(vehicle, 2, false)
																	SetVehicleNeonLightEnabled(vehicle, 0, false)
																	Citizen.Wait(neondata[vehicleplate].animspeed)
																	if neondata[vehicleplate].allinone == true then
																		SetVehicleNeonLightEnabled(vehicle, 3, false)
																		SetVehicleNeonLightEnabled(vehicle, 1, true)
																		SetVehicleNeonLightEnabled(vehicle, 2, false)
																		SetVehicleNeonLightEnabled(vehicle, 0, false)
																		Citizen.Wait(neondata[vehicleplate].animspeed)
																		if neondata[vehicleplate].allinone == true then
																			SetVehicleNeonLightEnabled(vehicle, 3, false)
																			SetVehicleNeonLightEnabled(vehicle, 1, false)
																			SetVehicleNeonLightEnabled(vehicle, 2, true)
																			SetVehicleNeonLightEnabled(vehicle, 0, false)
																			Citizen.Wait(neondata[vehicleplate].animspeed)
																			if neondata[vehicleplate].allinone == true then
																				SetVehicleNeonLightEnabled(vehicle, 3, false)
																				SetVehicleNeonLightEnabled(vehicle, 1, false)
																				SetVehicleNeonLightEnabled(vehicle, 2, false)
																				SetVehicleNeonLightEnabled(vehicle, 0, true)
																				Citizen.Wait(neondata[vehicleplate].animspeed)	
																				if neondata[vehicleplate].allinone == true then
																					SetVehicleNeonLightEnabled(vehicle, 3, true)
																					SetVehicleNeonLightEnabled(vehicle, 1, false)
																					SetVehicleNeonLightEnabled(vehicle, 2, false)
																					SetVehicleNeonLightEnabled(vehicle, 0, false)
																					Citizen.Wait(neondata[vehicleplate].animspeed)	
																					if neondata[vehicleplate].allinone == true then
																						SetVehicleNeonLightEnabled(vehicle, 3, false)
																						SetVehicleNeonLightEnabled(vehicle, 1, false)
																						SetVehicleNeonLightEnabled(vehicle, 2, false)
																						SetVehicleNeonLightEnabled(vehicle, 0, true)
																						Citizen.Wait(neondata[vehicleplate].animspeed)	
																						if neondata[vehicleplate].allinone == true then
																							SetVehicleNeonLightEnabled(vehicle, 3, false)
																							SetVehicleNeonLightEnabled(vehicle, 1, false)
																							SetVehicleNeonLightEnabled(vehicle, 2, true)
																							SetVehicleNeonLightEnabled(vehicle, 0, false)
																							Citizen.Wait(neondata[vehicleplate].animspeed)
																							if neondata[vehicleplate].allinone == true then
																								SetVehicleNeonLightEnabled(vehicle, 3, false)
																								SetVehicleNeonLightEnabled(vehicle, 1, true)
																								SetVehicleNeonLightEnabled(vehicle, 2, false)
																								SetVehicleNeonLightEnabled(vehicle, 0, false)
																								Citizen.Wait(neondata[vehicleplate].animspeed)
																							end
																						end
																					end
																				end
																			end
																		end
																	end
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			else
				neondata[vehicleplate].anims = false
				Citizen.Wait(1000)
			end
		else
			Citizen.Wait(1000)
		end
	end
end)

RegisterNUICallback('neon1ON', function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	offanims()
    SetVehicleNeonLightEnabled(vehicle, 0, true)
    neondata[vehicleplate].sneon1 = true
    Citizen.Wait(75)
    checkneons()
end)
RegisterNUICallback('neon1OFF', function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	offanims()
    SetVehicleNeonLightEnabled(vehicle, 0, false)
    neondata[vehicleplate].sneon1 = false
    Citizen.Wait(75)
    checkneons()
end)

RegisterNUICallback('neon2ON', function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	offanims()
    SetVehicleNeonLightEnabled(vehicle, 1, true)
    neondata[vehicleplate].sneon2 = true
    Citizen.Wait(75)
    checkneons()
end)
RegisterNUICallback('neon2OFF', function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	offanims()
    SetVehicleNeonLightEnabled(vehicle, 1, false)
    neondata[vehicleplate].sneon2 = false
    Citizen.Wait(75)
    checkneons()
end)

RegisterNUICallback('neon3ON', function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	offanims()
    SetVehicleNeonLightEnabled(vehicle, 2, true)
    neondata[vehicleplate].sneon3 = true
    Citizen.Wait(75)
    checkneons()
end)
RegisterNUICallback('neon3OFF', function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	offanims()
    SetVehicleNeonLightEnabled(vehicle, 2, false)
    neondata[vehicleplate].sneon3 = false
    Citizen.Wait(75)
    checkneons()
end)

RegisterNUICallback('neon4ON', function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	offanims()
    SetVehicleNeonLightEnabled(vehicle, 3, true)
    neondata[vehicleplate].sneon4 = true
    Citizen.Wait(75)
    checkneons()
end)
RegisterNUICallback('neon4OFF', function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	offanims()
    SetVehicleNeonLightEnabled(vehicle, 3, false)
    neondata[vehicleplate].sneon4 = false
    Citizen.Wait(75)
    checkneons()
end)

RegisterNUICallback('neonallON', function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	offanims()
    SetVehicleNeonLightEnabled(vehicle, 0, true)
    SetVehicleNeonLightEnabled(vehicle, 1, true)
    SetVehicleNeonLightEnabled(vehicle, 2, true)
    SetVehicleNeonLightEnabled(vehicle, 3, true)
    neondata[vehicleplate].sneon1 = true
    neondata[vehicleplate].sneon2 = true
    neondata[vehicleplate].sneon3 = true
    neondata[vehicleplate].sneon4 = true
    Citizen.Wait(75)
    checkneons()
end)
RegisterNUICallback('neonallOFF', function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	offanims()
    SetVehicleNeonLightEnabled(vehicle, 0, false)
    SetVehicleNeonLightEnabled(vehicle, 1, false)
    SetVehicleNeonLightEnabled(vehicle, 2, false)
    SetVehicleNeonLightEnabled(vehicle, 3, false)
    neondata[vehicleplate].sneon1 = false
    neondata[vehicleplate].sneon2 = false
    neondata[vehicleplate].sneon3 = false
    neondata[vehicleplate].sneon4 = false
    Citizen.Wait(75)
    checkneons()
end)

RegisterNUICallback('crisscrossON', function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	neondata[vehicleplate].anims = true
	neondata[vehicleplate].lightning = false
	neondata[vehicleplate].fourways = false
	neondata[vehicleplate].blinking = false
	neondata[vehicleplate].snake = false
    neondata[vehicleplate].allinone = false
	neondata[vehicleplate].crisscross = true
end)
RegisterNUICallback('crisscrossOFF', function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	neondata[vehicleplate].anims = false
	neondata[vehicleplate].lightning = false
	neondata[vehicleplate].fourways = false
	neondata[vehicleplate].blinking = false
	neondata[vehicleplate].crisscross = false
	neondata[vehicleplate].snake = false
    neondata[vehicleplate].allinone = false
    Citizen.Wait(75)
    checkneons()
end)

RegisterNUICallback('lightningON', function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	neondata[vehicleplate].anims = true
	neondata[vehicleplate].crisscross = false
	neondata[vehicleplate].fourways = false
	neondata[vehicleplate].blinking = false
	neondata[vehicleplate].snake = false
    neondata[vehicleplate].allinone = false
	neondata[vehicleplate].lightning = true
end)

RegisterNUICallback('lightningOFF', function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	neondata[vehicleplate].anims = false
	neondata[vehicleplate].crisscross = false
	neondata[vehicleplate].fourways = false
	neondata[vehicleplate].blinking = false
	neondata[vehicleplate].lightning = false
	neondata[vehicleplate].snake = false
    neondata[vehicleplate].allinone = false
    Citizen.Wait(75)
    checkneons()
end)

RegisterNUICallback('fourwaysON', function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	neondata[vehicleplate].anims = true
	neondata[vehicleplate].crisscross = false
	neondata[vehicleplate].lightning = false
	neondata[vehicleplate].blinking = false
	neondata[vehicleplate].snake = false
    neondata[vehicleplate].allinone = false
	neondata[vehicleplate].fourways = true
end)

RegisterNUICallback('fourwaysOFF', function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	neondata[vehicleplate].anims = false
	neondata[vehicleplate].crisscross = false
	neondata[vehicleplate].lightning = false
	neondata[vehicleplate].blinking = false
	neondata[vehicleplate].fourways = false
	neondata[vehicleplate].snake = false
    neondata[vehicleplate].allinone = false
    Citizen.Wait(75)
    checkneons()
end)

RegisterNUICallback('blinkingON', function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	neondata[vehicleplate].anims = true
	neondata[vehicleplate].crisscross = false
	neondata[vehicleplate].lightning = false
	neondata[vehicleplate].fourways = false
	neondata[vehicleplate].snake = false
    neondata[vehicleplate].allinone = false
	neondata[vehicleplate].blinking = true
end)

RegisterNUICallback('blinkingOFF', function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	neondata[vehicleplate].anims = false
	neondata[vehicleplate].crisscross = false
	neondata[vehicleplate].lightning = false
	neondata[vehicleplate].fourways = false
	neondata[vehicleplate].blinking = false
	neondata[vehicleplate].snake = false
    neondata[vehicleplate].allinone = false
    Citizen.Wait(75)
    checkneons()
end)

RegisterNUICallback('snakeON', function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	neondata[vehicleplate].anims = true
	neondata[vehicleplate].crisscross = false
	neondata[vehicleplate].lightning = false
	neondata[vehicleplate].fourways = false
	neondata[vehicleplate].blinking = false
    neondata[vehicleplate].allinone = false
	neondata[vehicleplate].snake = true
end)

RegisterNUICallback('snakeOFF', function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	neondata[vehicleplate].anims = false
	neondata[vehicleplate].crisscross = false
	neondata[vehicleplate].lightning = false
	neondata[vehicleplate].fourways = false
	neondata[vehicleplate].blinking = false
	neondata[vehicleplate].snake = false
    neondata[vehicleplate].allinone = false
    Citizen.Wait(75)
    checkneons()
end)

RegisterNUICallback('allinoneON', function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	neondata[vehicleplate].anims = true
	neondata[vehicleplate].crisscross = false
	neondata[vehicleplate].lightning = false
	neondata[vehicleplate].fourways = false
	neondata[vehicleplate].blinking = false
    neondata[vehicleplate].snake = false
	neondata[vehicleplate].allinone = true
end)

RegisterNUICallback('allinoneOFF', function()
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	Citizen.Wait(50)
	neondata[vehicleplate].anims = false
	neondata[vehicleplate].crisscross = false
	neondata[vehicleplate].lightning = false
	neondata[vehicleplate].fourways = false
	neondata[vehicleplate].blinking = false
	neondata[vehicleplate].snake = false
    neondata[vehicleplate].allinone = false
    Citizen.Wait(75)
    checkneons()
end)

RegisterNUICallback('aspeed1ON', function()
	neondata[vehicleplate].animspeed = animspeed1
	neondata[vehicleplate].animspeed1ON = true
end)
RegisterNUICallback('aspeed1OFF', function()
	neondata[vehicleplate].animspeed = 150
	neondata[vehicleplate].animspeed1ON = false
end)

RegisterNUICallback('aspeed2ON', function()
	neondata[vehicleplate].animspeed = animspeed2
	neondata[vehicleplate].animspeed2ON = true
end)
RegisterNUICallback('aspeed2OFF', function()
	neondata[vehicleplate].animspeed = 150
	neondata[vehicleplate].animspeed2ON = false
end)

RegisterNUICallback('aspeed3ON', function()
	neondata[vehicleplate].animspeed = animspeed3
	neondata[vehicleplate].animspeed3ON = true
end)
RegisterNUICallback('aspeed3OFF', function()
	neondata[vehicleplate].animspeed = 150
	neondata[vehicleplate].animspeed3ON = false
end)

RegisterNUICallback('rgbspeed1ON', function()
	neondata[vehicleplate].rgbspeed = rgbspeed1
	neondata[vehicleplate].rgbspeed1ON = true
end)
RegisterNUICallback('rgbspeed1OFF', function()
	neondata[vehicleplate].rgbspeed = 500
	neondata[vehicleplate].rgbspeed1ON = false
end)

RegisterNUICallback('rgbspeed2ON', function()
	neondata[vehicleplate].rgbspeed = rgbspeed2
	neondata[vehicleplate].rgbspeed2ON = true
end)
RegisterNUICallback('rgbspeed2OFF', function()
	neondata[vehicleplate].rgbspeed = 500
	neondata[vehicleplate].rgbspeed2ON = false
end)

RegisterNUICallback('rgbspeed3ON', function()
	neondata[vehicleplate].rgbspeed = rgbspeed3
	neondata[vehicleplate].rgbspeed3ON = true
end)
RegisterNUICallback('rgbspeed3OFF', function()
	neondata[vehicleplate].rgbspeed = 500
	neondata[vehicleplate].rgbspeed3ON = false
end)

function hex2rgb(hex)
    hex = hex:gsub("#","")
    return tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))
end

RegisterNUICallback('rgbanimON', function(data, cb)
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	neondata[vehicleplate].rgbON = true
	toggleRGB()
end)
RegisterNUICallback('rgbanimOFF', function(data, cb)
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	neondata[vehicleplate].rgbON = false
end)

RegisterNUICallback('changecolor', function(data, cb)
	if player == nil then
		player = PlayerPedId()
	end
	if vehicle == nil then
		vehicle = GetVehiclePedIsIn(player, false)
	end
	if vehicleplate == nil then
		vehicleplate = GetVehicleNumberPlateText(vehicle)
	end	
	neondata[vehicleplate].rgbON = false
	SendNUIMessage({
		message    = "rgbswitchOFF"
	})  
	Citizen.Wait(500)
	if data.hexvalue == "aliceblue" then
    SetVehicleNeonLightsColour(vehicle, 240, 248, 255)
	elseif data.hexvalue == "antiquewhite" then
	    SetVehicleNeonLightsColour(vehicle, 250, 235, 215)
	elseif data.hexvalue == "aqua" then
	    SetVehicleNeonLightsColour(vehicle, 0, 255, 255)
	elseif data.hexvalue == "aquamarine" then
	    SetVehicleNeonLightsColour(vehicle, 127, 255, 212)
	elseif data.hexvalue == "azure" then
	    SetVehicleNeonLightsColour(vehicle, 240, 255, 255)
	elseif data.hexvalue == "beige" then
	    SetVehicleNeonLightsColour(vehicle, 245, 245, 220)
	elseif data.hexvalue == "bisque" then
	    SetVehicleNeonLightsColour(vehicle, 255, 228, 196)
	elseif data.hexvalue == "black" then
	    SetVehicleNeonLightsColour(vehicle, 0, 0, 0)
	elseif data.hexvalue == "blanchedalmond" then
	    SetVehicleNeonLightsColour(vehicle, 255, 235, 205)
	elseif data.hexvalue == "blue" then
	    SetVehicleNeonLightsColour(vehicle, 0, 0, 255)
	elseif data.hexvalue == "blueviolet" then
	    SetVehicleNeonLightsColour(vehicle, 138, 43, 226)
	elseif data.hexvalue == "brown" then
	    SetVehicleNeonLightsColour(vehicle, 165, 42, 42)
	elseif data.hexvalue == "burlywood" then
	    SetVehicleNeonLightsColour(vehicle, 222, 184, 135)
	elseif data.hexvalue == "burntsienna" then
	    SetVehicleNeonLightsColour(vehicle, 234, 126, 93)
	elseif data.hexvalue == "cadetblue" then
	    SetVehicleNeonLightsColour(vehicle, 95, 158, 160)
	elseif data.hexvalue == "chartreuse" then
	    SetVehicleNeonLightsColour(vehicle, 127, 255, 0)
	elseif data.hexvalue == "chocolate" then
	    SetVehicleNeonLightsColour(vehicle, 210, 105, 30)
	elseif data.hexvalue == "coral" then
	    SetVehicleNeonLightsColour(vehicle, 255, 127, 80)
	elseif data.hexvalue == "cornflowerblue" then
	    SetVehicleNeonLightsColour(vehicle, 100, 149, 237)
	elseif data.hexvalue == "cornsilk" then
	    SetVehicleNeonLightsColour(vehicle, 255, 248, 220)
	elseif data.hexvalue == "crimson" then
	    SetVehicleNeonLightsColour(vehicle, 220, 20, 60)
	elseif data.hexvalue == "cyan" then
	    SetVehicleNeonLightsColour(vehicle, 0, 255, 255)
	elseif data.hexvalue == "darkblue" then
	    SetVehicleNeonLightsColour(vehicle, 0, 0, 139)
	elseif data.hexvalue == "darkcyan" then
	    SetVehicleNeonLightsColour(vehicle, 0, 139, 139)
	elseif data.hexvalue == "darkgoldenrod" then
	    SetVehicleNeonLightsColour(vehicle, 184, 134, 11)
	elseif data.hexvalue == "darkgray" then
	    SetVehicleNeonLightsColour(vehicle, 169, 169, 169)
	elseif data.hexvalue == "darkgreen" then
	    SetVehicleNeonLightsColour(vehicle, 0, 100, 0)
	elseif data.hexvalue == "darkgrey" then
	    SetVehicleNeonLightsColour(vehicle, 169, 169, 169)
	elseif data.hexvalue == "darkkhaki" then
	    SetVehicleNeonLightsColour(vehicle, 189, 183, 107)
	elseif data.hexvalue == "darkmagenta" then
	    SetVehicleNeonLightsColour(vehicle, 139, 0, 139)
	elseif data.hexvalue == "darkolivegreen" then
	    SetVehicleNeonLightsColour(vehicle, 85, 107, 47)
	elseif data.hexvalue == "darkorange" then
	    SetVehicleNeonLightsColour(vehicle, 255, 140, 0)
	elseif data.hexvalue == "darkorchid" then
	    SetVehicleNeonLightsColour(vehicle, 153, 50, 204)
	elseif data.hexvalue == "darkred" then
	    SetVehicleNeonLightsColour(vehicle, 139, 0, 0)
	elseif data.hexvalue == "darksalmon" then
	    SetVehicleNeonLightsColour(vehicle, 233, 150, 122)
	elseif data.hexvalue == "darkseagreen" then
	    SetVehicleNeonLightsColour(vehicle, 143, 188, 143)
	elseif data.hexvalue == "darkslateblue" then
	    SetVehicleNeonLightsColour(vehicle, 72, 61, 139)
	elseif data.hexvalue == "darkslategray" then
	    SetVehicleNeonLightsColour(vehicle, 47, 79, 79)
	elseif data.hexvalue == "darkslategrey" then
	    SetVehicleNeonLightsColour(vehicle, 47, 79, 79)
	elseif data.hexvalue == "darkturquoise" then
	    SetVehicleNeonLightsColour(vehicle, 0, 206, 209)
	elseif data.hexvalue == "darkviolet" then
	    SetVehicleNeonLightsColour(vehicle, 148, 0, 211)
	elseif data.hexvalue == "deeppink" then
	    SetVehicleNeonLightsColour(vehicle, 255, 20, 147)
	elseif data.hexvalue == "deepskyblue" then
	    SetVehicleNeonLightsColour(vehicle, 0, 191, 255)
	elseif data.hexvalue == "dimgray" then
	    SetVehicleNeonLightsColour(vehicle, 105, 105, 105)
	elseif data.hexvalue == "dimgrey" then
	    SetVehicleNeonLightsColour(vehicle, 105, 105, 105)
	elseif data.hexvalue == "dodgerblue" then
	    SetVehicleNeonLightsColour(vehicle, 30, 144, 255)
	elseif data.hexvalue == "firebrick" then
	    SetVehicleNeonLightsColour(vehicle, 178, 34, 34)
	elseif data.hexvalue == "floralwhite" then
	    SetVehicleNeonLightsColour(vehicle, 255, 250, 240)
	elseif data.hexvalue == "forestgreen" then
	    SetVehicleNeonLightsColour(vehicle, 34, 139, 34)
	elseif data.hexvalue == "fuchsia" then
	    SetVehicleNeonLightsColour(vehicle, 255, 0, 255)
	elseif data.hexvalue == "gainsboro" then
	    SetVehicleNeonLightsColour(vehicle, 220, 220, 220)
	elseif data.hexvalue == "ghostwhite" then
	    SetVehicleNeonLightsColour(vehicle, 248, 248, 255)
	elseif data.hexvalue == "gold" then
	    SetVehicleNeonLightsColour(vehicle, 255, 215, 0)
	elseif data.hexvalue == "goldenrod" then
	    SetVehicleNeonLightsColour(vehicle, 218, 165, 32)
	elseif data.hexvalue == "gray" then
	    SetVehicleNeonLightsColour(vehicle, 128, 128, 128)
	elseif data.hexvalue == "green" then
	    SetVehicleNeonLightsColour(vehicle, 0, 128, 0)
	elseif data.hexvalue == "greenyellow" then
	    SetVehicleNeonLightsColour(vehicle, 173, 255, 47)
	elseif data.hexvalue == "grey" then
	    SetVehicleNeonLightsColour(vehicle, 128, 128, 128)
	elseif data.hexvalue == "honeydew" then
	    SetVehicleNeonLightsColour(vehicle, 240, 255, 240)
	elseif data.hexvalue == "hotpink" then
	    SetVehicleNeonLightsColour(vehicle, 255, 105, 180)
	elseif data.hexvalue == "indianred" then
	    SetVehicleNeonLightsColour(vehicle, 205, 92, 92)
	elseif data.hexvalue == "indigo" then
	    SetVehicleNeonLightsColour(vehicle, 75, 0, 130)
	elseif data.hexvalue == "ivory" then
	    SetVehicleNeonLightsColour(vehicle, 255, 255, 240)
	elseif data.hexvalue == "khaki" then
	    SetVehicleNeonLightsColour(vehicle, 240, 230, 140)
	elseif data.hexvalue == "lavender" then
	    SetVehicleNeonLightsColour(vehicle, 230, 230, 250)
	elseif data.hexvalue == "lavenderblush" then
	    SetVehicleNeonLightsColour(vehicle, 255, 240, 245)
	elseif data.hexvalue == "lawngreen" then
	    SetVehicleNeonLightsColour(vehicle, 124, 252, 0)
	elseif data.hexvalue == "lemonchiffon" then
	    SetVehicleNeonLightsColour(vehicle, 255, 250, 205)
	elseif data.hexvalue == "lightblue" then
	    SetVehicleNeonLightsColour(vehicle, 173, 216, 230)
	elseif data.hexvalue == "lightcoral" then
	    SetVehicleNeonLightsColour(vehicle, 240, 128, 128)
	elseif data.hexvalue == "lightcyan" then
	    SetVehicleNeonLightsColour(vehicle, 224, 255, 255)
	elseif data.hexvalue == "lightgoldenrodyellow" then
	    SetVehicleNeonLightsColour(vehicle, 250, 250, 210)
	elseif data.hexvalue == "lightgray" then
	    SetVehicleNeonLightsColour(vehicle, 211, 211, 211)
	elseif data.hexvalue == "lightgreen" then
	    SetVehicleNeonLightsColour(vehicle, 144, 238, 144)
	elseif data.hexvalue == "lightgrey" then
	    SetVehicleNeonLightsColour(vehicle, 211, 211, 211)
	elseif data.hexvalue == "lightpink" then
	    SetVehicleNeonLightsColour(vehicle, 255, 182, 193)
	elseif data.hexvalue == "lightsalmon" then
	    SetVehicleNeonLightsColour(vehicle, 255, 160, 122)
	elseif data.hexvalue == "lightseagreen" then
	    SetVehicleNeonLightsColour(vehicle, 32, 178, 170)
	elseif data.hexvalue == "lightskyblue" then
	    SetVehicleNeonLightsColour(vehicle, 135, 206, 250)
	elseif data.hexvalue == "lightslategray" then
	    SetVehicleNeonLightsColour(vehicle, 119, 136, 153)
	elseif data.hexvalue == "lightslategrey" then
	    SetVehicleNeonLightsColour(vehicle, 119, 136, 153)
	elseif data.hexvalue == "lightsteelblue" then
	    SetVehicleNeonLightsColour(vehicle, 176, 196, 222)
	elseif data.hexvalue == "lightyellow" then
	    SetVehicleNeonLightsColour(vehicle, 255, 255, 224)
	elseif data.hexvalue == "lime" then
	    SetVehicleNeonLightsColour(vehicle, 0, 255, 0)
	elseif data.hexvalue == "limegreen" then
	    SetVehicleNeonLightsColour(vehicle, 50, 205, 50)
	elseif data.hexvalue == "linen" then
	    SetVehicleNeonLightsColour(vehicle, 250, 240, 230)
	elseif data.hexvalue == "magenta" then
	    SetVehicleNeonLightsColour(vehicle, 255, 0, 255)
	elseif data.hexvalue == "maroon" then
	    SetVehicleNeonLightsColour(vehicle, 128, 0, 0)
	elseif data.hexvalue == "mediumaquamarine" then
	    SetVehicleNeonLightsColour(vehicle, 102, 205, 170)
	elseif data.hexvalue == "mediumblue" then
	    SetVehicleNeonLightsColour(vehicle, 0, 0, 205)
	elseif data.hexvalue == "mediumorchid" then
	    SetVehicleNeonLightsColour(vehicle, 186, 85, 211)
	elseif data.hexvalue == "mediumpurple" then
	    SetVehicleNeonLightsColour(vehicle, 147, 112, 219)
	elseif data.hexvalue == "mediumseagreen" then
	    SetVehicleNeonLightsColour(vehicle, 60, 179, 113)
	elseif data.hexvalue == "mediumslateblue" then
	    SetVehicleNeonLightsColour(vehicle, 123, 104, 238)
	elseif data.hexvalue == "mediumspringgreen" then
	    SetVehicleNeonLightsColour(vehicle, 0, 250, 154)
	elseif data.hexvalue == "mediumturquoise" then
	    SetVehicleNeonLightsColour(vehicle, 72, 209, 204)
	elseif data.hexvalue == "mediumvioletred" then
	    SetVehicleNeonLightsColour(vehicle, 199, 21, 133)
	elseif data.hexvalue == "midnightblue" then
	    SetVehicleNeonLightsColour(vehicle, 25, 25, 112)
	elseif data.hexvalue == "mintcream" then
	    SetVehicleNeonLightsColour(vehicle, 245, 255, 250)
	elseif data.hexvalue == "mistyrose" then
	    SetVehicleNeonLightsColour(vehicle, 255, 228, 225)
	elseif data.hexvalue == "moccasin" then
	    SetVehicleNeonLightsColour(vehicle, 255, 228, 181)
	elseif data.hexvalue == "navajowhite" then
	    SetVehicleNeonLightsColour(vehicle, 255, 222, 173)
	elseif data.hexvalue == "navy" then
	    SetVehicleNeonLightsColour(vehicle, 0, 0, 128)
	elseif data.hexvalue == "oldlace" then
	    SetVehicleNeonLightsColour(vehicle, 253, 245, 230)
	elseif data.hexvalue == "olive" then
	    SetVehicleNeonLightsColour(vehicle, 128, 128, 0)
	elseif data.hexvalue == "olivedrab" then
	    SetVehicleNeonLightsColour(vehicle, 107, 142, 35)
	elseif data.hexvalue == "orange" then
	    SetVehicleNeonLightsColour(vehicle, 255, 165, 0)
	elseif data.hexvalue == "orangered" then
	    SetVehicleNeonLightsColour(vehicle, 255, 69, 0)
	elseif data.hexvalue == "orchid" then
	    SetVehicleNeonLightsColour(vehicle, 218, 112, 214)
	elseif data.hexvalue == "palegoldenrod" then
	    SetVehicleNeonLightsColour(vehicle, 238, 232, 170)
	elseif data.hexvalue == "palegreen" then
	    SetVehicleNeonLightsColour(vehicle, 152, 251, 152)
	elseif data.hexvalue == "paleturquoise" then
	    SetVehicleNeonLightsColour(vehicle, 175, 238, 238)
	elseif data.hexvalue == "palevioletred" then
	    SetVehicleNeonLightsColour(vehicle, 219, 112, 147)
	elseif data.hexvalue == "papayawhip" then
	    SetVehicleNeonLightsColour(vehicle, 255, 239, 213)
	elseif data.hexvalue == "peachpuff" then
	    SetVehicleNeonLightsColour(vehicle, 255, 218, 185)
	elseif data.hexvalue == "peru" then
	    SetVehicleNeonLightsColour(vehicle, 205, 133, 63)
	elseif data.hexvalue == "pink" then
	    SetVehicleNeonLightsColour(vehicle, 255, 192, 203)
	elseif data.hexvalue == "plum" then
	    SetVehicleNeonLightsColour(vehicle, 221, 160, 221)
	elseif data.hexvalue == "powderblue" then
	    SetVehicleNeonLightsColour(vehicle, 176, 224, 230)
	elseif data.hexvalue == "purple" then
	    SetVehicleNeonLightsColour(vehicle, 128, 0, 128)
	elseif data.hexvalue == "rebeccapurple" then
	    SetVehicleNeonLightsColour(vehicle, 102, 51, 153)
	elseif data.hexvalue == "red" then
	    SetVehicleNeonLightsColour(vehicle, 255, 0, 0)
	elseif data.hexvalue == "rosybrown" then
	    SetVehicleNeonLightsColour(vehicle, 188, 143, 143)
	elseif data.hexvalue == "royalblue" then
	    SetVehicleNeonLightsColour(vehicle, 65, 105, 225)
	elseif data.hexvalue == "saddlebrown" then
	    SetVehicleNeonLightsColour(vehicle, 139, 69, 19)
	elseif data.hexvalue == "salmon" then
	    SetVehicleNeonLightsColour(vehicle, 250, 128, 114)
	elseif data.hexvalue == "sandybrown" then
	    SetVehicleNeonLightsColour(vehicle, 244, 164, 96)
	elseif data.hexvalue == "seagreen" then
	    SetVehicleNeonLightsColour(vehicle, 46, 139, 87)
	elseif data.hexvalue == "seashell" then
	    SetVehicleNeonLightsColour(vehicle, 255, 245, 238)
	elseif data.hexvalue == "sienna" then
	    SetVehicleNeonLightsColour(vehicle, 160, 82, 45)
	elseif data.hexvalue == "silver" then
	    SetVehicleNeonLightsColour(vehicle, 192, 192, 192)
	elseif data.hexvalue == "skyblue" then
	    SetVehicleNeonLightsColour(vehicle, 135, 206, 235)
	elseif data.hexvalue == "slateblue" then
	    SetVehicleNeonLightsColour(vehicle, 106, 90, 205)
	elseif data.hexvalue == "slategray" then
	    SetVehicleNeonLightsColour(vehicle, 112, 128, 144)
	elseif data.hexvalue == "slategrey" then
	    SetVehicleNeonLightsColour(vehicle, 112, 128, 144)
	elseif data.hexvalue == "snow" then
	    SetVehicleNeonLightsColour(vehicle, 255, 250, 250)
	elseif data.hexvalue == "springgreen" then
	    SetVehicleNeonLightsColour(vehicle, 0, 255, 127)
	elseif data.hexvalue == "steelblue" then
	    SetVehicleNeonLightsColour(vehicle, 70, 130, 180)
	elseif data.hexvalue == "tan" then
	    SetVehicleNeonLightsColour(vehicle, 210, 180, 140)
	elseif data.hexvalue == "teal" then
	    SetVehicleNeonLightsColour(vehicle, 0, 128, 128)
	elseif data.hexvalue == "thistle" then
	    SetVehicleNeonLightsColour(vehicle, 216, 191, 216)
	elseif data.hexvalue == "tomato" then
	    SetVehicleNeonLightsColour(vehicle, 255, 99, 71)
	elseif data.hexvalue == "turquoise" then
	    SetVehicleNeonLightsColour(vehicle, 64, 224, 208)
	elseif data.hexvalue == "violet" then
	    SetVehicleNeonLightsColour(vehicle, 238, 130, 238)
	elseif data.hexvalue == "wheat" then
	    SetVehicleNeonLightsColour(vehicle, 245, 222, 179)
	elseif data.hexvalue == "white" then
	    SetVehicleNeonLightsColour(vehicle, 255, 255, 255)
	elseif data.hexvalue == "whitesmoke" then
	    SetVehicleNeonLightsColour(vehicle, 245, 245, 245)
	elseif data.hexvalue == "yellow" then
	    SetVehicleNeonLightsColour(vehicle, 255, 255, 0)
	elseif data.hexvalue == "yellowgreen" then
	    SetVehicleNeonLightsColour(vehicle, 154, 205, 50)
	elseif data.hexvalue == "bubik" then
	    SetVehicleNeonLightsColour(vehicle, 0, 201, 219)
	elseif data.hexvalue == "rtx" then
	    SetVehicleNeonLightsColour(vehicle, 255, 102, 255)
	elseif data.hexvalue == "bp" then
	    SetVehicleNeonLightsColour(vehicle, 255, 89, 199)
	else
	    local colorr, colorg, colorb = hex2rgb(data.hexvalue)
	    SetVehicleNeonLightsColour(vehicle, colorr, colorg, colorb)
	end
end)

RegisterKeyMapping('showui', 'showui', 'keyboard', Config.openneonmenu)