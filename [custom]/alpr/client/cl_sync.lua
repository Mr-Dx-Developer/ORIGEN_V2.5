-- Takes the given backup functions and restores the data
local function RestoreData( obj, getFunc, setFunc, setBackupFunc, key )
	if ( key ~= nil ) then
		local data = getFunc( obj, key )

		if ( data ~= nil ) then
			setFunc( obj, key, data )
			setBackupFunc( obj, key, nil )
		end
	else
		local data = getFunc( obj )

		if ( data ~= nil ) then
			setFunc( obj, data )
			setBackupFunc( obj, nil )
		end
	end
end


--[[----------------------------------------------------------------------------------
	Plate reader sync variables and functions
----------------------------------------------------------------------------------]]--
-- Declares a table that is used to backup the player's plate reader data
READER.backupData =
{
	cams = {
		["front"] = nil,
		["rear"] = nil
	}
}

-- Returns a table with the front and rear plate reader data
function READER:GetReaderDataForSync()
	return {
		["front"] = self.vars.cams["front"],
		["rear"] = self.vars.cams["rear"]
	}
end

-- Sets the internal plate reader data for the given camera
function READER:SetReaderCamData( cam, data )
	if ( type( data ) == "table" ) then
		self.vars.cams[cam] = data
	end
end

-- Getter and setter for the backup plate reader data
function READER:GetBackupReaderData( cam ) return self.backupData.cams[cam] end
function READER:SetBackupReaderData( cam, data ) self.backupData.cams[cam] = data end

-- Returns if there is any backup data for the plate reader
function READER:IsThereBackupData()
	return self:GetBackupReaderData( "front" ) ~= nil or self:GetBackupReaderData( "rear" ) ~= nil
end

-- Backs up the player's plate reader data
function READER:BackupData()
	-- Get the player's data
	local data = self:GetReaderDataForSync()

	-- Iterate through the front and rear camera
	for cam in UTIL:Values( { "front", "rear" } ) do
		-- Check that there isn't already backup data, then if not, back up the player's data
		if ( self:GetBackupReaderData( cam ) == nil ) then
			self:SetBackupReaderData( cam, data[cam] )
		end
	end
end

-- Replaces the internal plate reader data with the data provided
function READER:LoadDataFromDriver( data )
	-- Backup the local data first
	self:BackupData()

	-- As a precaution, give the system 50ms before it replaces the local data with the data from the driver
	Citizen.SetTimeout( 50, function()
		-- Set the camera data
		for cam in UTIL:Values( { "front", "rear" } ) do
			self:SetReaderCamData( cam, data[cam] )
		end

		-- Force the NUI side to update the plate reader display with the new data
		self:ForceNUIUpdate( true )
	end )
end

-- Restores the backed up plate reader data
function READER:RestoreFromBackup()
	-- Iterate through the cameras and restore their backups
	for cam in UTIL:Values( { "front", "rear" } ) do
		RestoreData( READER, READER.GetBackupReaderData, READER.SetReaderCamData, READER.SetBackupReaderData, cam )
	end

	-- Force the NUI side to update the plate reader display with the restored data
	self:ForceNUIUpdate( true )
end


--[[----------------------------------------------------------------------------------
	Sync functions
----------------------------------------------------------------------------------]]--
SYNC = {}
-- Used to get the other ped (driver/passenger) in a vehicle and calls the given callback. This function will only work
-- if the player can control the radar, it also ensures that the other ped (if found) exists and is a player. The other
-- player's server ID is passed to the given callback as an argument.
function SYNC:SyncData( cb )
	if ( PLY:CanControlRadar() ) then
		local otherPly = PLY:GetOtherPedServerId()

		if ( otherPly ~= nil ) then
			cb( otherPly )
		end
	end
end

-- Sends the radar's power state to the other player (driver/passenger)
function SYNC:SendPowerState( state )
	self:SyncData( function( ply )
		TriggerServerEvent( "wk_wars2x_sync:sendPowerState", ply, state )
	end )
end

-- Sends the power state for the given antenna to the other player (driver/passenger)
function SYNC:SendAntennaPowerState( state, ant )
	self:SyncData( function( ply )
		TriggerServerEvent( "wk_wars2x_sync:sendAntennaPowerState", ply, state, ant )
	end )
end

-- Sends the mode for the given antenna to the other player (driver/passenger)
function SYNC:SendAntennaMode( ant, mode )
	self:SyncData( function( ply )
		TriggerServerEvent( "wk_wars2x_sync:sendAntennaMode", ply, ant, mode )
	end )
end

-- Sends a lock/unlock state, as well as the current player's displayed data to the other player (driver/passenger)
function SYNC:LockAntennaSpeed( ant, data )
	self:SyncData( function( ply )
		TriggerServerEvent( "wk_wars2x_sync:sendLockAntennaSpeed", ply, ant, data )
	end )
end

-- Sends the given operator menu table data to the other player
function SYNC:SendUpdatedOMData( data )
	self:SyncData( function( ply )
		TriggerServerEvent( "wk_wars2x_sync:sendUpdatedOMData", ply, data )
	end )
end

-- Sends the plate reader lock event with the data from the reader that was locked
function SYNC:LockReaderCam( cam, data )
	self:SyncData( function( ply )
		TriggerServerEvent( "wk_wars2x_sync:sendLockCameraPlate", ply, cam, data )
	end )
end

RegisterNetEvent( "wk_wars2x_sync:receiveLockCameraPlate" )
AddEventHandler( "wk_wars2x_sync:receiveLockCameraPlate", function( camera, data )
	READER:LockCam( camera, true, false, data )
end )

-- Event for gathering the radar data and sending it to another player
RegisterNetEvent( "wk_wars2x_sync:getRadarDataFromDriver" )
AddEventHandler( "wk_wars2x_sync:getRadarDataFromDriver", function( playerFor )
	local readerData = READER:GetReaderDataForSync()

	TriggerServerEvent( "wk_wars2x_sync:sendRadarDataForPassenger", playerFor, { radarData, readerData } )
end )

-- Event for receiving radar data from another player
RegisterNetEvent( "wk_wars2x_sync:receiveRadarData" )
AddEventHandler( "wk_wars2x_sync:receiveRadarData", function( data )
	READER:LoadDataFromDriver( data[2] )
end )