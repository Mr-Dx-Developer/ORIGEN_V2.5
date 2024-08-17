function Load(name)
	local resourceName = GetCurrentResourceName()
	local chunk = LoadResourceFile(resourceName, ('data/%s.lua'):format(name))
	if chunk then
		local err
		chunk, err = load(chunk, ('@@%s/data/%s.lua'):format(resourceName, name), 't')
		if err then
			error(('\n^1 %s'):format(err), 0)
		end
		return chunk()
	end
end

-------------------------------------------------------------------------------
-- Settings
-------------------------------------------------------------------------------

Config = {
	FrameWork = 'qb', -- ['qb', 'esx']
	MaxDistance = 7.0,
	-- Whether to have the target as a toggle or not
	Toggle = false,
	DrawSprite = true,
	DrawDistance = 20.0,
	-- Enable default options (Toggling vehicle doors)
	EnableDefaultOptions = true,
	-- Disable the target eye whilst being in a vehicle
	DisableInVehicle = false,
	-- Key to open the target eye, here you can find all the names: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
	OpenKey = 'LMENU', -- Left Alt
	-- Control for key press detection on the context menu, it's the Right Mouse Button by default, controls are found here https://docs.fivem.net/docs/game-references/controls/
	MenuControlKey = 237,

	-- These are all empty for you to fill in, refer to the .md files for help in filling these in
	CircleZones = {},

	BoxZones = {},

	PolyZones = {},

	TargetBones = {},

	TargetModels = {},

	GlobalPedOptions = {},

	GlobalVehicleOptions = {},

	GlobalObjectOptions = {},

	GlobalPlayerOptions = {},

	Peds = {},
}

CreateThread(function()
	if Config.FrameWork == 'qb' then
		local state = GetResourceState('qb-core')
		if state ~= 'missing' then
			if state ~= 'started' then
				local timeout = 0
				repeat
					timeout += 1
					Wait(0)
				until GetResourceState('qb-core') == 'started' or timeout > 100
			end
		end
		local QBCore = exports['qb-core']:GetCoreObject()
		local PlayerData = QBCore.Functions.GetPlayerData()

		ItemCount = function(item)
			for _, v in pairs(PlayerData.items) do
				if v.name == item then
					return true
				end
			end
			return false
		end

		JobCheck = function(job)
			if type(job) == 'table' then
				job = job[PlayerData.job.name]
				if job and PlayerData.job.grade.level >= job then
					return true
				end
			elseif job == 'all' or job == PlayerData.job.name then
				return true
			end
			return false
		end

		GangCheck = function(gang)
			if type(gang) == 'table' then
				gang = gang[PlayerData.gang.name]
				if gang and PlayerData.gang.grade.level >= gang then
					return true
				end
			elseif gang == 'all' or gang == PlayerData.gang.name then
				return true
			end
			return false
		end

		CitizenCheck = function(citizenid)
			return citizenid == PlayerData.citizenid or citizenid[PlayerData.citizenid]
		end

		RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
			PlayerData = QBCore.Functions.GetPlayerData()
			SpawnPeds()
		end)

		RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
			PlayerData = {}
			DeletePeds()
		end)

		RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
			PlayerData.job = JobInfo
		end)

		RegisterNetEvent('QBCore:Client:OnGangUpdate', function(GangInfo)
			PlayerData.gang = GangInfo
		end)

		RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
			PlayerData = val
		end)
	else
		local state = GetResourceState('es_extended')
		if state ~= 'missing' then
			if state ~= 'started' then
				local timeout = 0
				repeat
					timeout += 1
					Wait(0)
				until GetResourceState('es_extended') == 'started' or timeout > 100
			end
		end
		ESX = exports["es_extended"]:getSharedObject()
		local PlayerData = ESX.PlayerData
	
		ItemCount = function(item)
			for _, v in pairs(PlayerData.inventory) do
				if v.name == item then
					return true
				end
			end
			return false
		end
	
		JobCheck = function(job)
			if job == 'all' or job == PlayerData.job.name then
				return true
			end
			return false
		end
	
		CitizenCheck = function(citizenid)
			return citizenid == PlayerData.identifier or citizenid[PlayerData.identifier]
		end
	
		RegisterNetEvent('esx:playerLoaded', function()
			PlayerData = ESX.PlayerData
			SpawnPeds()
		end)
	
		RegisterNetEvent('esx:setJob', function(JobInfo)
			PlayerData.job = JobInfo
		end)
	end
end)

function CheckOptions(data, entity, distance)
	if Config.FrameWork == 'qb' then
		if distance and data.distance and distance > data.distance then return false end
		if data.job and not JobCheck(data.job) then return false end
		if data.gang and not GangCheck(data.gang) then return false end
		if data.item and not ItemCount(data.item) then return false end
		if data.citizenid and not CitizenCheck(data.citizenid) then return false end
		if data.canInteract and not data.canInteract(entity, distance, data) then return false end
		return true
	else
		if distance and data.distance and distance > data.distance then return false end
		if data.job and not JobCheck(data.job) then return false end
		if data.item and not ItemCount(data.item) then return false end
		if data.citizenid and not CitizenCheck(data.citizenid) then return false end
		if data.canInteract and not data.canInteract(entity, distance, data) then return false end
		return true
	end
end