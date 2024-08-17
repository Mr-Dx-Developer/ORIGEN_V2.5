if Config.Framework == "ESX" then
    ESX = exports["es_extended"]:getSharedObject()
elseif Config.Framework == "QBCORE" then
    QBCore = exports['qb-core']:GetCoreObject()
else
    print("[ERROR] Yout framework is not valid!")
end

Citizen.CreateThread(function()
    while true do
        Wait(Config.UpdateTime * 6000)
        
        local Slots = GetConvarInt("sv_maxClients", 48)
        local OnlinePlayers = GetActivePlayers()
        local id = GetPlayerServerId(PlayerId())
        local Player = GetPlayerName(PlayerId())
        local Street = GetStreetNameFromHashKey(GetStreetNameAtCoord(table.unpack(GetEntityCoords(PlayerPedId(), true))))
        local Area = GetLabelText(GetNameOfZone(table.unpack(GetEntityCoords(PlayerPedId(), true))))
        local Health = GetEntityHealth(PlayerPedId()) - 100


        if Config.Framework == "ESX" then
            local PlayerCharacterFirstName = ESX.PlayerData.firstName
            local PlayerCharacterLastName = ESX.PlayerData.lastName
            local PlayerCharacterJob = ESX.PlayerData.job.name
    
            local Gender = ESX.PlayerData.sex
            local PlayerCharacterGender = genderr
    
            if Gender == "m" then
                genderr = "Male"
            else 
                genderr = "Female"
            end
            
            local template = Config.Text
    
            local replacements = {
                ["{ServerPlayers}"] = #OnlinePlayers .. "/" ..Slots,
                ["{PlayerID}"] = id,
                ["{PlayerName}"] = Player,
                ["{PlayerCharacterFirstName}"] = PlayerCharacterFirstName,
                ["{PlayerCharacterLastName}"] = PlayerCharacterLastName,
                ["{PlayerCharacterGender}"] = PlayerCharacterGender,
                ["{PlayerCharacterJob}"] = PlayerCharacterJob,
                ["{PlayerCharacterStreet}"] = Street,
                ["{PlayerCharacterArea}"] = Area,
                ["{PlayerCharacterHealth}"] = Health,
            
            }
            
            local pattern = "{(.-)}"
            
            local result = template:gsub(pattern, function(key)
                return replacements['{' .. key .. '}'] or key
            end)
            
            
            DiscordStatus(result2, result3)
            SetRichPresence(result)

        elseif Config.Framework == "QBCORE" then

            local Data = QBCore.Functions.GetPlayerData()        

            local PlayerCharacterFirstName = Data.charinfo.firstname
            local PlayerCharacterLastName = Data.charinfo.lastname
            local PlayerCharacterJob = Data.job.label
    
            local Gender = Data.charinfo.gender
            local PlayerCharacterGender = Genderr
    
            if Gender == 0 then
                Genderr = "Male"
            else 
                Genderr = "Female"
            end
            
            local template = Config.Text
    
            local replacements = {
                ["{ServerPlayers}"] = #OnlinePlayers .. "/" ..Slots,
                ["{PlayerID}"] = id,
                ["{PlayerName}"] = Player,
                ["{PlayerCharacterFirstName}"] = PlayerCharacterFirstName,
                ["{PlayerCharacterLastName}"] = PlayerCharacterLastName,
                ["{PlayerCharacterGender}"] = PlayerCharacterGender,
                ["{PlayerCharacterJob}"] = PlayerCharacterJob,
                ["{PlayerCharacterStreet}"] = Street,
                ["{PlayerCharacterArea}"] = Area,
                ["{PlayerCharacterHealth}"] = Health,
            
            }
            
            local pattern = "{(.-)}"
            
            local result = template:gsub(pattern, function(key)
                return replacements['{' .. key .. '}'] or key
            end)
            
            
            DiscordStatus(result2, result3)
            SetRichPresence(result)
        end
 
    end
end)

function DiscordStatus()

    
    SetDiscordAppId(Config.ApplicationID)


    SetDiscordRichPresenceAsset(Config.BigAsset.ID)
    SetDiscordRichPresenceAssetText(Config.BigAsset.Text)

    SetDiscordRichPresenceAssetSmall(Config.SmallAsset.ID)
    SetDiscordRichPresenceAssetSmallText(Config.SmallAsset.Text)

    if Config.FirstButton.Enabled then
        SetDiscordRichPresenceAction(0, Config.FirstButton.Text, Config.FirstButton.Link)
    end
    
    if Config.SecondButton.Enabled then
        SetDiscordRichPresenceAction(1, Config.SecondButton.Text, Config.SecondButton.Link)
    end

end


-- CROSSHAIR
--[[------------------------------------------------------------------------
    Remove Reticle on ADS (Third Person)
------------------------------------------------------------------------]]--
local scopedWeapons = 
{
    100416529,  -- WEAPON_SNIPERRIFLE
    205991906,  -- WEAPON_HEAVYSNIPER
    3342088282  -- WEAPON_MARKSMANRIFLE
}

function HashInTable( hash )
    for k, v in pairs( scopedWeapons ) do 
        if ( hash == v ) then 
            return true 
        end 
    end 

    return false 
end 

function ManageReticle()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
        local _, hash = GetCurrentPedWeapon( ped, true )

        if ( GetFollowPedCamViewMode() ~= 4 and IsPlayerFreeAiming() and not HashInTable( hash ) ) then 
            HideHudComponentThisFrame( 14 )
        end 
    end 
end 

Citizen.CreateThread( function()
    while true do 
	
		HideHudComponentThisFrame( 14 )		
		Citizen.Wait( 0 )

    end 
end )