-- You probably shouldnt touch these.
local AnimationDuration = -1
local ChosenAnimation = ""
local ChosenDict = ""
local IsInAnimation = false
local MovementType = 0
local PlayerGender = "male"
local PlayerHasProp = false
local PlayerProps = {}
local PlayerParticles = {}
local SecondPropEmote = false
local lang = "en";
local PtfxNotif = false
local PtfxPrompt = false
local PtfxWait = 500
local PtfxNoProp = false

PlayerData = {}

QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('onResourceStart', function(resource) --if you restart the resource
  if resource == GetCurrentResourceName() then
      Wait(200)
      PlayerData = QBCore.Functions.GetPlayerData()
  end
end)


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
end)

RegisterNetEvent('QBCore:Player:SetPlayerData')
AddEventHandler('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

RegisterCommand("cancelemote", function() EmoteCancel() end, false);
RegisterKeyMapping('cancelemote', 'Cancel Emote', 'keyboard', 'x')

-----------------------------------------------------------------------------------------------------
-- Commands / Events --------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
  TriggerEvent('chat:addSuggestion', '/e', 'Play an emote', {{ name="emotename", help="dance, camera, sit or any valid emote."}})
  TriggerEvent('chat:addSuggestion', '/e', 'Play an emote', {{ name="emotename", help="dance, camera, sit or any valid emote."}})
  TriggerEvent('chat:addSuggestion', '/emote', 'Play an emote', {{ name="emotename", help="dance, camera, sit or any valid emote."}})
  TriggerEvent('chat:addSuggestion', '/emotes', 'List available emotes.')
  TriggerEvent('chat:addSuggestion', '/walk', 'Set your walkingstyle.', {{ name="style", help="/walks for a list of valid styles"}})
end)

RegisterCommand('e', function(source, args, raw)
  if not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] then
      EmoteCommandStart(source, args, raw)
  end
end, false);

RegisterCommand('emote', function(source, args, raw)
  if not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] then
      EmoteCommandStart(source, args, raw)
  end
end, false);

RegisterCommand('walk', function(source, args, raw)
  if not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] then
      WalkCommandStart(source, args, raw)
  end
end, false);

RegisterCommand('walks', function(source, args, raw)
  if not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] then
      WalksOnCommand()
  end
end, false);

-- Added 

CanDoEmote = true
SmokingWeed = false
RelieveCount = 0

RegisterNetEvent('animations:ToggleCanDoAnims')
AddEventHandler('animations:ToggleCanDoAnims', function(bool)
  CanDoEmote = bool
end)

RegisterNetEvent('animations:client:SmokeWeed')
AddEventHandler('animations:client:SmokeWeed', function()
  SmokingWeed = true
  Citizen.CreateThread(function()
    while SmokingWeed do
      Citizen.Wait(10000)
      TriggerServerEvent('hud:server:RelieveStress', math.random(15, 18))
      RelieveCount = RelieveCount + 1
      if RelieveCount == 6 then
        if ChosenDict == "MaleScenario" and IsInAnimation then
          ClearPedTasksImmediately(PlayerPedId())
          IsInAnimation = false
          DebugPrint("Forced scenario exit")
        elseif ChosenDict == "Scenario" and IsInAnimation then
          ClearPedTasksImmediately(PlayerPedId())
          IsInAnimation = false
          DebugPrint("Forced scenario exit")
        end
      
        if IsInAnimation then
          ClearPedTasks(PlayerPedId())
          DestroyAllProps()
          IsInAnimation = false
        end
      
        if SmokingWeed then
          SmokingWeed = false
          RelieveCount = 0
        end
      end
    end
  end)
end)

RegisterNetEvent('animations:client:EmoteCommandStart')
AddEventHandler('animations:client:EmoteCommandStart', function(args)
  if CanDoEmote then
    EmoteCommandStart(source, args)
  else
    QBCore.Functions.Notify("Cannot Be Done Right Now", "error")
  end
end)

AddEventHandler('onResourceStop', function(resource)
  if resource == GetCurrentResourceName() then
    DestroyAllProps()
    ClearPedTasksImmediately(GetPlayerPed(-1))
    ResetPedMovementClipset(PlayerPedId())
  end
end)

-----------------------------------------------------------------------------------------------------
------ Functions and stuff --------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

function EmoteCancel()

  if ChosenDict == "MaleScenario" and IsInAnimation then
    ClearPedTasksImmediately(PlayerPedId())
    IsInAnimation = false
    DebugPrint("Forced scenario exit")
  elseif ChosenDict == "Scenario" and IsInAnimation then
    ClearPedTasksImmediately(PlayerPedId())
    IsInAnimation = false
    DebugPrint("Forced scenario exit")
  end

  PtfxNotif = false
  PtfxPrompt = false

  if IsInAnimation then
    PtfxStop()
    ClearPedTasks(GetPlayerPed(-1))
    DestroyAllProps()
    IsInAnimation = false
  end
end

function EmoteChatMessage(args)
  TriggerEvent('chat:addMessage', {
    template = '<div class="chat-message system"><strong>SYSTEM</strong> {0}</div>',
    args = {string.format(""..args.."")}
  });	
end

local debug = false;
function DebugPrint(args)
  if debug then
    print(args)
  end
end

function PtfxStart()
    if PtfxNoProp then
      PtfxAt = PlayerPedId()
    else
      PtfxAt = prop
    end
    UseParticleFxAsset(PtfxAsset)
    Ptfx = StartNetworkedParticleFxLoopedOnEntityBone(PtfxName, PtfxAt, Ptfx1, Ptfx2, Ptfx3, Ptfx4, Ptfx5, Ptfx6, GetEntityBoneIndexByName(PtfxName, "VFX"), 1065353216, 0, 0, 0, 1065353216, 1065353216, 1065353216, 0)
    SetParticleFxLoopedColour(Ptfx, 1.0, 1.0, 1.0)
    table.insert(PlayerParticles, Ptfx)
end

function PtfxStop()
  for a,b in pairs(PlayerParticles) do
    DebugPrint("Stopped PTFX: "..b)
    StopParticleFxLooped(b, false)
    table.remove(PlayerParticles, a)
  end
end

function pairsByKeys (t, f)
    local a = {}
    for n in pairs(t) do
        table.insert(a, n)
    end
    table.sort(a, f)
    local i = 0      -- iterator variable
    local iter = function ()   -- iterator function
        i = i + 1
        if a[i] == nil then
            return nil
        else
            return a[i], t[a[i]]
        end
    end
    return iter
end

function EmoteCommandStart(source, args, raw)
    if #args > 0 then
    local name = string.lower(args[1])
    if name == "c" or name == "cancel" then
        if IsInAnimation then
            EmoteCancel()
        else
            -- QBCore.Functions.Notify("No emote to cancel.", "error")
        end
      return
    end

    if DP.Emotes[name] ~= nil then
      if OnEmotePlay(DP.Emotes[name]) then end return
    elseif DP.Dances[name] ~= nil then
      if OnEmotePlay(DP.Dances[name]) then end return
    elseif DP.AdultEmotes[name] ~= nil then
      if OnEmotePlay(DP.AdultEmotes[name]) then end return
    elseif DP.PropEmotes[name] ~= nil then
      if OnEmotePlay(DP.PropEmotes[name]) then end return
    elseif DP.Expressions[name] ~= nil then
      if OnEmotePlay(DP.Expressions[name]) then end return
    elseif DP.Customs[name] ~= nil then
      if OnEmotePlay(DP.Customs[name]) then end return
    elseif DP.Shared[name] ~= nil then
      RequestOfSharedAnim(name)
    else
      QBCore.Functions.Notify(name .. " is not a valid emote!", "error")
    end
  end
end

function LoadAnim(dict)
  while not HasAnimDictLoaded(dict) do
    RequestAnimDict(dict)
    Wait(10)
  end
end

function LoadPropDict(model)
  while not HasModelLoaded(GetHashKey(model)) do
    RequestModel(GetHashKey(model))
    Wait(10)
  end
end

function PtfxThis(asset)
  while not HasNamedPtfxAssetLoaded(asset) do
    RequestNamedPtfxAsset(asset)
    Wait(10)
  end
  UseParticleFxAsset(asset)
end

function DestroyAllProps()
  for _,v in pairs(PlayerProps) do
    DeleteEntity(v)
  end
  PlayerHasProp = false
  DebugPrint("Destroyed Props")
end

function AddPropToPlayer(prop1, bone, off1, off2, off3, rot1, rot2, rot3)
  local Player = PlayerPedId()
  local x,y,z = table.unpack(GetEntityCoords(Player))

  if not HasModelLoaded(prop1) then
    LoadPropDict(prop1)
  end

  prop = CreateObject(GetHashKey(prop1), x, y, z+0.2,  true,  true, true)
  AttachEntityToEntity(prop, Player, GetPedBoneIndex(Player, bone), off1, off2, off3, rot1, rot2, rot3, true, true, false, true, 1, true)
  table.insert(PlayerProps, prop)
  PlayerHasProp = true
  SetModelAsNoLongerNeeded(prop1)
end

-----------------------------------------------------------------------------------------------------
-- V -- This could be a whole lot better, i tried messing around with "IsPedMale(ped)"
-- V -- But i never really figured it out, if anyone has a better way of gender checking let me know.
-- V -- Since this way doesnt work for ped models.
-- V -- in most cases its better to replace the scenario with an animation bundled with prop instead.
-----------------------------------------------------------------------------------------------------

function CheckGender()
  local hashSkinMale = GetHashKey("mp_m_freemode_01")
  local hashSkinFemale = GetHashKey("mp_f_freemode_01")

  if GetEntityModel(PlayerPedId()) == hashSkinMale then
    PlayerGender = "male"
  elseif GetEntityModel(PlayerPedId()) == hashSkinFemale then
    PlayerGender = "female"
  end
  DebugPrint("Set gender as = ("..PlayerGender..")")
end

-----------------------------------------------------------------------------------------------------
------ This is the major function for playing emotes! -----------------------------------------------
-----------------------------------------------------------------------------------------------------

local function PtfxLoop()
  PtfxPrompt = true

  CreateThread(function()
    while PtfxPrompt do
      if not PtfxNotif then
        SimpleNotify(PtfxInfo)
        PtfxNotif = true
      end

      if IsControlPressed(0, 47) then
        PtfxStart()
        Wait(PtfxWait)
        PtfxStop()
      end
      Wait(0)
    end
  end)
end

function OnEmotePlay(EmoteName)
  InVehicle = IsPedInAnyVehicle(PlayerPedId(), true)
  if InVehicle == 1 then
    return
  end

  if not DoesEntityExist(GetPlayerPed(-1)) then
    return false
  end

  ChosenDict,ChosenAnimation,ename = table.unpack(EmoteName)
  AnimationDuration = -1

  if PlayerHasProp then
    DestroyAllProps()
  end

  if ChosenDict == "Expression" then
    SetFacialIdleAnimOverride(PlayerPedId(), ChosenAnimation, 0)
    return
  end

  if ChosenDict == "MaleScenario" or "Scenario" then 
    CheckGender()
    if ChosenDict == "MaleScenario" then if InVehicle then return end
      if PlayerGender == "male" then
        ClearPedTasks(GetPlayerPed(-1))
        TaskStartScenarioInPlace(GetPlayerPed(-1), ChosenAnimation, 0, true)
        DebugPrint("Playing scenario = ("..ChosenAnimation..")")
        IsInAnimation = true
      else
        QBCore.Functions.Notify("This emote is male only, sorry!", "error");
      end return
    elseif ChosenDict == "ScenarioObject" then if InVehicle then return end
      BehindPlayer = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0 - 0.5, -0.5);
      ClearPedTasks(GetPlayerPed(-1))
      TaskStartScenarioAtPosition(GetPlayerPed(-1), ChosenAnimation, BehindPlayer['x'], BehindPlayer['y'], BehindPlayer['z'], GetEntityHeading(PlayerPedId()), 0, 1, false)
      DebugPrint("Playing scenario = ("..ChosenAnimation..")")
      IsInAnimation = true
      return
    elseif ChosenDict == "Scenario" then if InVehicle then return end
      ClearPedTasks(GetPlayerPed(-1))
      TaskStartScenarioInPlace(GetPlayerPed(-1), ChosenAnimation, 0, true)
      DebugPrint("Playing scenario = ("..ChosenAnimation..")")
      IsInAnimation = true
    return end
  end

  LoadAnim(ChosenDict)

  if EmoteName.AnimationOptions then
    if EmoteName.AnimationOptions.EmoteLoop then
      MovementType = 1
    if EmoteName.AnimationOptions.EmoteMoving then
      MovementType = 51
  end

  elseif EmoteName.AnimationOptions.EmoteMoving then
    MovementType = 51
  elseif EmoteName.AnimationOptions.EmoteMoving == false then
    MovementType = 0
  elseif EmoteName.AnimationOptions.EmoteStuck then
    MovementType = 50
  end

  else
    MovementType = 0
  end

  if InVehicle == 1 then
    MovementType = 51
  end

  if EmoteName.AnimationOptions then
    if EmoteName.AnimationOptions.EmoteDuration == nil then 
      EmoteName.AnimationOptions.EmoteDuration = -1
      AttachWait = 0
    else
      AnimationDuration = EmoteName.AnimationOptions.EmoteDuration
      AttachWait = EmoteName.AnimationOptions.EmoteDuration
    end

    if EmoteName.AnimationOptions.PtfxAsset then
      PtfxAsset = EmoteName.AnimationOptions.PtfxAsset
      PtfxName = EmoteName.AnimationOptions.PtfxName
      if EmoteName.AnimationOptions.PtfxNoProp then
        PtfxNoProp = EmoteName.AnimationOptions.PtfxNoProp
      else
        PtfxNoProp = false
      end
      Ptfx1, Ptfx2, Ptfx3, Ptfx4, Ptfx5, Ptfx6, PtfxScale = table.unpack(EmoteName.AnimationOptions.PtfxPlacement)
      PtfxInfo = EmoteName.AnimationOptions.PtfxInfo
      PtfxWait = EmoteName.AnimationOptions.PtfxWait
      PtfxNotif = false
      PtfxLoop()
      PtfxThis(PtfxAsset)
    else
      DebugPrint("Ptfx = none")
      PtfxPrompt = false
    end
  end

  TaskPlayAnim(GetPlayerPed(-1), ChosenDict, ChosenAnimation, 2.0, 2.0, AnimationDuration, MovementType, 0, false, false, false)
  RemoveAnimDict(ChosenDict)
  IsInAnimation = true
  MostRecentDict = ChosenDict
  MostRecentAnimation = ChosenAnimation

  if EmoteName.AnimationOptions then
    if EmoteName.AnimationOptions.Prop then
        PropName = EmoteName.AnimationOptions.Prop
        PropBone = EmoteName.AnimationOptions.PropBone
        PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(EmoteName.AnimationOptions.PropPlacement)
        if EmoteName.AnimationOptions.SecondProp then
          SecondPropName = EmoteName.AnimationOptions.SecondProp
          SecondPropBone = EmoteName.AnimationOptions.SecondPropBone
          SecondPropPl1, SecondPropPl2, SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6 = table.unpack(EmoteName.AnimationOptions.SecondPropPlacement)
          SecondPropEmote = true
        else
          SecondPropEmote = false
        end
        Wait(AttachWait)
        AddPropToPlayer(PropName, PropBone, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6)
        if SecondPropEmote then
          AddPropToPlayer(SecondPropName, SecondPropBone, SecondPropPl1, SecondPropPl2, SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6)
        end
    end
  end
  return true
end