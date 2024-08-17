UTIL = {}

-- Returns a number to a set number of decimal places
function UTIL:Round( num, numDecimalPlaces )
	return tonumber( string.format( "%." .. ( numDecimalPlaces or 0 ) .. "f", num ) )
end

-- The custom font used for the digital displays have the ¦ symbol as an empty character, this function
-- takes a speed and returns a formatted speed that can be displayed on the radar
function UTIL:FormatSpeed( speed )
	-- Return "Err" (Error) if the given speed is outside the 0-999 range
	if ( speed < 0 or speed > 999 ) then return "Err" end

	-- Convert the speed to a string
	local text = tostring( speed )
	local pipes = ""

	-- Create a string of pipes (¦) for the number of spaces
	for i = 1, 3 - string.len( text ) do
		pipes = pipes .. "¦"
	end

	-- Return the formatted speed
	return pipes .. text
end

-- Returns a clamped numerical value based on the given parameters
function UTIL:Clamp( val, min, max )
	-- Return the min value if the given value is less than the min
	if ( val < min ) then
		return min
	-- Return the max value if the given value is larger than the max
	elseif ( val > max ) then
		return max
	end

	-- Return the given value if it's between the min and max
	return val
end

-- Returns if the given table is empty, includes numerical and non-numerical key values
function UTIL:IsTableEmpty( t )
	local c = 0

	for _ in pairs( t ) do c = c + 1 end

	return c == 0
end

-- Credit to Deltanic for this function
function UTIL:Values( xs )
	local i = 0

	return function()
		i = i + 1
		return xs[i]
	end
end

-- Old ray trace function for getting a vehicle in a specific direction from a start point
function UTIL:GetVehicleInDirection( entFrom, coordFrom, coordTo )
	local rayHandle = StartShapeTestCapsule( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 5.0, 10, entFrom, 7 )
	local _, _, _, _, vehicle = GetShapeTestResult( rayHandle )
	return vehicle
end

-- Returns if a target vehicle is coming towards or going away from the patrol vehicle, it has a range
-- so if a vehicle is sideways compared to the patrol vehicle, the directional arrows won't light up
function UTIL:GetEntityRelativeDirection( myAng, tarAng )
	local angleDiff = math.abs( ( myAng - tarAng + 180 ) % 360 - 180 )

	if ( angleDiff < 45 ) then
		return 1
	elseif ( angleDiff > 135 ) then
		return 2
	end

	return 0
end

-- Returns if there is a player in the given vehicle
function UTIL:IsPlayerInVeh( veh )
	for i = -1, GetVehicleMaxNumberOfPassengers( veh ) + 1, 1 do
		local ped = GetPedInVehicleSeat( veh, i )

		if ( DoesEntityExist( ped ) ) then
			if ( IsPedAPlayer( ped ) ) then return true end
		end
	end

	return false
end

-- Your everyday GTA notification function
function UTIL:Notify( text )
	SetNotificationTextEntry( "STRING" )
	AddTextComponentSubstringPlayerName( text )
	DrawNotification( false, true )
end

-- Used to draw text to the screen, helpful for debugging issues
function UTIL:DrawDebugText( x, y, scale, centre, text )
	SetTextFont( 4 )
	SetTextProportional( 0 )
	SetTextScale( scale, scale )
	SetTextColour( 255, 255, 255, 255 )
	SetTextDropShadow( 0, 0, 0, 0, 255 )
	SetTextEdge( 2, 0, 0, 0, 255 )
	SetTextCentre( centre )
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry( "STRING" )
	AddTextComponentString( text )
	DrawText( x, y )
end

-- Returns if the current resource name is valid
function UTIL:IsResourceNameValid()
	return GetCurrentResourceName() == "wk_wars2x"
end

local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end

		enum.destructor = nil
		enum.handle = nil
	end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
			coroutine.yield(id)
			next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function UTIL:EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end