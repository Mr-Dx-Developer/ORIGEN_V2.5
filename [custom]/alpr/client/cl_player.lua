--[[----------------------------------------------------------------------------------
	Player info variables
----------------------------------------------------------------------------------]]--
PLY =
{
	ped = PlayerPedId(),
	veh = nil,
	inDriverSeat = false,
	inPassengerSeat = false,
	vehClassValid = false
}

-- Returns if the current vehicle fits the validity requirements for the radar to work
function PLY:VehicleStateValid()
	return DoesEntityExist( self.veh ) and self.veh > 0 and self.vehClassValid
end

-- Used to check if the player is in a position where the radar should be allowed operation
function PLY:IsDriver()
	return self:VehicleStateValid() and self.inDriverSeat
end

-- Returns if the player is in the front passenger seat of an emergency vehicle
function PLY:IsPassenger()
	return self:VehicleStateValid() and self.inPassengerSeat
end

-- Returns if the player can view the radar, ensures their vehicle state is valid and that they are a driver or
-- a passenger (where valid)
function PLY:CanViewRadar()
	return self:IsDriver() or ( self:IsPassenger() )
end

-- Returns if the player is allowed to control the radar from the passenger seat
function PLY:CanControlRadar()
	return self:IsDriver() or ( self:IsPassenger() )
end

-- Returns the ped in the opposite seat to the player, e.g. if we're the passenger, then return the driver
function PLY:GetOtherPed()
	if ( self:IsDriver() ) then
		return GetPedInVehicleSeat( PLY.veh, 0 )
	elseif ( self:IsPassenger() ) then
		return GetPedInVehicleSeat( PLY.veh, -1 )
	end

	return nil
end

-- Returns the server ID of the player in the opposite seat (driver/passenger)
function PLY:GetOtherPedServerId()
	local otherPed = self:GetOtherPed()

	if ( otherPed ~= nil and otherPed ~= 0 and IsPedAPlayer( otherPed ) ) then
		local otherPly = GetPlayerServerId( NetworkGetPlayerIndexFromPed( otherPed ) )

		return otherPly
	end

	return nil
end

-- The main purpose of this thread is to update the information about the local player, including their
-- ped id, the vehicle id (if they're in one), whether they're in a driver seat, and if the vehicle's class
-- is valid or not
Citizen.CreateThread( function()
	while ( true ) do
		PLY.ped = PlayerPedId()
		PLY.veh = GetVehiclePedIsIn( PLY.ped, false )
		PLY.inDriverSeat = GetPedInVehicleSeat( PLY.veh, -1 ) == PLY.ped
		PLY.inPassengerSeat = GetPedInVehicleSeat( PLY.veh, 0 ) == PLY.ped
		PLY.vehClassValid = GetVehicleClass( PLY.veh ) == 18

		Citizen.Wait( 500 )
	end
end )