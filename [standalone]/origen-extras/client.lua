local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L0_1 = GetPlayerPed
L1_1 = -1
L0_1 = L0_1(L1_1)
L1_1 = nil
L2_1 = nil
L3_1 = 0
L4_1 = false
L5_1 = 0
L6_1 = 1000
L7_1 = 0 
L8_1 = 0
L9_1 = {}
L10_1 = false
L11_1 = false
L12_1 = nil
L13_1 = false
L14_1 = false
L15_1 = nil
L16_1 = false
pedInFront = 0
jobPlayer = L16_1
function L16_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = GetEntityCoords
  L1_2 = L0_1
  L2_2 = false
  L0_2 = L0_2(L1_2, L2_2)
  L1_2 = GetOffsetFromEntityInWorldCoords
  L2_2 = L0_1
  L3_2 = 0.0
  L4_2 = 1.3
  L5_2 = 0.0
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  L2_2 = StartShapeTestCapsule
  L3_2 = L0_2.x
  L4_2 = L0_2.y
  L5_2 = L0_2.z
  L6_2 = L1_2.x
  L7_2 = L1_2.y
  L8_2 = L1_2.z
  L9_2 = 1.0
  L10_2 = 12
  L11_2 = L0_1
  L12_2 = 7
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  L3_2 = GetShapeTestResult
  L4_2 = L2_2
  L3_2, L4_2, L5_2, L6_2, L7_2 = L3_2(L4_2)
  L8_2 = IsEntityDead
  L9_2 = L7_2
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    L8_2 = IsPedAPlayer
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if L8_2 then
      return L7_2
  end
  else
    L8_2 = 0
    return L8_2
  end
end
function L17_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = CastRayPointToPoint
  L1_2 = GetEntityCoords
  L2_2 = L0_1
  L1_2 = L1_2(L2_2)
  L2_2 = GetOffsetFromEntityInWorldCoords
  L3_2 = L0_1
  L4_2 = 0.0
  L5_2 = 2.0
  L6_2 = 0.0
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  L3_2 = 10
  L4_2 = L0_1
  L5_2 = 0
  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  L1_2 = GetRaycastResult
  L2_2 = L0_2
  L1_2, L2_2, L3_2, L4_2, L5_2 = L1_2(L2_2)
  L6_2 = IsEntityAVehicle
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  if L6_2 then
    return L5_2
  else
    L6_2 = 0
    return L6_2
  end
end
GetVehicleInFront = L17_1
function L17_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = ipairs
  L2_2 = GetActivePlayers
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = L2_2()
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = GetPlayerPed
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if L7_2 == A0_2 then
      return L6_2
    end
  end
  L1_2 = -1
  return L1_2
end
function L18_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 24
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 25
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 14
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 15
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 23
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 24
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 25
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 37
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 44
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 140
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 141
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 142
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 257
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 263
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 264
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
end
function L19_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if A0_2 then
    L3_2 = RequestAnimDict
    L4_2 = A1_2
    L3_2(L4_2)
    while true do
      L3_2 = HasAnimDictLoaded
      L4_2 = A1_2
      L3_2 = L3_2(L4_2)
      if L3_2 then
        break
      end
      L3_2 = Citizen
      L3_2 = L3_2.Wait
      L4_2 = 100
      L3_2(L4_2)
    end
    L3_2 = TaskPlayAnim
    L4_2 = L0_1
    L5_2 = A1_2
    L6_2 = A2_2
    L7_2 = 8.0
    L8_2 = -8
    L9_2 = -1
    L10_2 = 51
    L11_2 = 0
    L12_2 = 0
    L13_2 = 0
    L14_2 = 0
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  end
end
function L20_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = L15_1
  if nil == L0_2 then
    L0_2 = pedInFront
    if 0 == L0_2 then
      goto lbl_110
    end
    L0_2 = PedToNet
    L1_2 = pedInFront
    L0_2 = L0_2(L1_2)
    L2_1 = L0_2
    L1_2 = L2_1
    L0_2 = L9_1
    L0_2[L1_2] = nil
    L0_2 = TriggerServerEvent
    L1_2 = "ryt:syncVariable"
    L2_2 = L9_1
    L0_2(L1_2, L2_2)
    L0_2 = Config
    L0_2 = L0_2.ESX
    L0_2 = L0_2.enabled
    if L0_2 then
      L0_2 = Config
      L0_2 = L0_2.ESX
      L0_2 = L0_2.exceptionJobs
      if L0_2 then
        L0_2 = TriggerServerEvent
        L1_2 = "ryt:exceptionJobs"
        L2_2 = GetPlayerServerId
        L3_2 = L17_1
        L4_2 = L0_1
        L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
        L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
        L3_2 = GetPlayerServerId
        L4_2 = L17_1
        L5_2 = pedInFront
        L4_2, L5_2, L6_2 = L4_2(L5_2)
        L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2)
        L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2)
        while true do
          L0_2 = L12_1
          if nil ~= L0_2 then
            break
          end
          L0_2 = Citizen
          L0_2 = L0_2.Wait
          L1_2 = 0
          L0_2(L1_2)
        end
    end
    else
      L0_2 = true
      L12_1 = L0_2
    end
    L0_2 = L12_1
    if L0_2 then
      L0_2 = TriggerServerEvent
      L1_2 = "ryt:sendEvent"
      L2_2 = GetPlayerServerId
      L3_2 = L17_1
      L4_2 = pedInFront
      L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
      L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
      L3_2 = GetPlayerServerId
      L4_2 = L17_1
      L5_2 = L0_1
      L4_2, L5_2, L6_2 = L4_2(L5_2)
      L3_2 = L3_2(L4_2, L5_2, L6_2)
      L4_2 = PedToNet
      L5_2 = pedInFront
      L4_2 = L4_2(L5_2)
      L5_2 = PedToNet
      L6_2 = L0_1
      L5_2, L6_2 = L5_2(L6_2)
      L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2)
      L0_2 = nil
      L12_1 = L0_2
    end
  else
    L0_2 = TriggerServerEvent
    L1_2 = "ryt:Detach"
    L2_2 = GetPlayerServerId
    L3_2 = L17_1
    L4_2 = NetToPed
    L5_2 = L15_1
    L4_2, L5_2, L6_2 = L4_2(L5_2)
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2)
    L2_2, L3_2, L4_2, L5_2, L6_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2)
    L0_2 = ClearPedTasksImmediately
    L1_2 = L0_1
    L0_2(L1_2)
    L0_2 = nil
    L1_2 = nil
    L2_1 = L1_2
    L1_1 = L0_2
    L0_2 = 0
    L1_2 = false
    L2_2 = 0
    L3_2 = 1000
    L6_1 = L3_2
    L5_1 = L2_2
    L4_1 = L1_2
    L3_1 = L0_2
    L0_2 = false
    L1_2 = false
    L11_1 = L1_2
    L10_1 = L0_2
    L0_2 = false
    pedInFront = 0
    jobPlayer = L0_2
    L0_2 = nil
    L15_1 = L0_2
  end
  ::lbl_110::
end
fGrab = L20_1
function L20_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = L3_1
  if 0 ~= L1_2 then
    L1_2 = L7_1
    if 0 ~= L1_2 then
      L2_2 = L2_1
      L1_2 = L9_1
      L3_2 = L3_1
      L1_2[L2_2] = L3_2
      L1_2 = TriggerServerEvent
      L2_2 = "ryt:syncVariable"
      L3_2 = L9_1
      L1_2(L2_2, L3_2)
      if A0_2 then
        L1_2 = TriggerEvent
        L2_2 = "ryt:DeadEvent"
        L1_2(L2_2)
        L1_2 = TriggerServerEvent
        L2_2 = "ryt:enterPed"
        L3_2 = GetPlayerServerId
        L4_2 = L17_1
        L5_2 = NetToPed
        L6_2 = L2_1
        L5_2, L6_2 = L5_2(L6_2)
        L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
        L3_2 = L3_2(L4_2, L5_2, L6_2)
        L4_2 = L7_1
        L4_2 = L4_2 - 1
        L5_2 = VehToNet
        L6_2 = L3_1
        L5_2, L6_2 = L5_2(L6_2)
        L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
      else
        L1_2 = Hint
        L2_2 = Config
        L2_2 = L2_2.Languages
        L3_2 = Config
        L3_2 = L3_2.Language
        L2_2 = L2_2[L3_2]
        L2_2 = L2_2.taskenter
        L1_2(L2_2)
        L1_2 = IsControlJustPressed
        L2_2 = 0
        L3_2 = Config
        L3_2 = L3_2.Keys
        L3_2 = L3_2.TaskEnterKey
        L1_2 = L1_2(L2_2, L3_2)
        if L1_2 then
          L1_2 = TriggerEvent
          L2_2 = "ryt:DeadEvent"
          L1_2(L2_2)
          L1_2 = TriggerServerEvent
          L2_2 = "ryt:enterPed"
          L3_2 = GetPlayerServerId
          L4_2 = L17_1
          L5_2 = NetToPed
          L6_2 = L2_1
          L5_2, L6_2 = L5_2(L6_2)
          L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
          L3_2 = L3_2(L4_2, L5_2, L6_2)
          L4_2 = L7_1
          L4_2 = L4_2 - 1
          L5_2 = VehToNet
          L6_2 = L3_1
          L5_2, L6_2 = L5_2(L6_2)
          L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
        end
      end
    end
  end
end
fPutCar = L20_1
function L20_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = L3_1
  if 0 ~= L1_2 then
    L2_2 = L2_1
    L1_2 = L9_1
    L1_2 = L1_2[L2_2]
    if nil ~= L1_2 then
      L1_2 = L3_1
      L3_2 = L2_1
      L2_2 = L9_1
      L2_2 = L2_2[L3_2]
      if L1_2 == L2_2 then
        if A0_2 then
          L1_2 = Vdist
          L2_2 = GetEntityCoords
          L3_2 = L0_1
          L2_2 = L2_2(L3_2)
          L3_2 = GetEntityCoords
          L4_2 = NetToPed
          L5_2 = L2_1
          L4_2, L5_2, L6_2 = L4_2(L5_2)
          L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2)
          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
          if L1_2 then
            L1_2 = TriggerServerEvent
            L2_2 = "ryt:exitPed"
            L3_2 = GetPlayerServerId
            L4_2 = L17_1
            L5_2 = NetToPed
            L6_2 = L2_1
            L5_2, L6_2 = L5_2(L6_2)
            L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
            L3_2 = L3_2(L4_2, L5_2, L6_2)
            L4_2 = VehToNet
            L6_2 = L2_1
            L5_2 = L9_1
            L5_2 = L5_2[L6_2]
            L4_2, L5_2, L6_2 = L4_2(L5_2)
            L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
            L2_2 = L2_1
            L1_2 = L9_1
            L1_2[L2_2] = nil
            L1_2 = TriggerServerEvent
            L2_2 = "ryt:syncVariable"
            L3_2 = L9_1
            L1_2(L2_2, L3_2)
          end
        else
          L1_2 = 5
          L6_1 = L1_2
          L1_2 = L8_1
          if L1_2 < 3.0 then
            L1_2 = Hint
            L2_2 = Config
            L2_2 = L2_2.Languages
            L3_2 = Config
            L3_2 = L3_2.Language
            L2_2 = L2_2[L3_2]
            L2_2 = L2_2.exitped
            L1_2(L2_2)
            L1_2 = IsControlJustReleased
            L2_2 = 0
            L3_2 = Config
            L3_2 = L3_2.Keys
            L3_2 = L3_2.TaskEnterKey
            L1_2 = L1_2(L2_2, L3_2)
            if L1_2 then
              L1_2 = TriggerServerEvent
              L2_2 = "ryt:exitPed"
              L3_2 = GetPlayerServerId
              L4_2 = L17_1
              L5_2 = NetToPed
              L6_2 = L2_1
              L5_2, L6_2 = L5_2(L6_2)
              L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
              L3_2 = L3_2(L4_2, L5_2, L6_2)
              L4_2 = VehToNet
              L6_2 = L2_1
              L5_2 = L9_1
              L5_2 = L5_2[L6_2]
              L4_2, L5_2, L6_2 = L4_2(L5_2)
              L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
              L2_2 = L2_1
              L1_2 = L9_1
              L1_2[L2_2] = nil
              L1_2 = TriggerServerEvent
              L2_2 = "ryt:syncVariable"
              L3_2 = L9_1
              L1_2(L2_2, L3_2)
              L1_2 = 1000
              L6_1 = L1_2
            end
          end
        end
      end
    end
  end
end
fExitCar = L20_1
L20_1 = RegisterNetEvent
L21_1 = "ryt:sendEvent"
L20_1(L21_1)
L20_1 = AddEventHandler
L21_1 = "ryt:sendEvent"
function L22_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if A2_2 then
    L1_1 = A1_2
    L3_2 = 200
    L6_1 = L3_2
    L3_2 = AttachEntityToEntity
    L4_2 = L0_1
    L5_2 = NetToPed
    L6_2 = A1_2
    L5_2 = L5_2(L6_2)
    L6_2 = 4103
    L7_2 = Config
    L7_2 = L7_2.AttachPosition
    L8_2 = 0.0
    L9_2 = 0.0
    L10_2 = 0.0
    L11_2 = true
    L12_2 = false
    L13_2 = false
    L14_2 = true
    L15_2 = 1
    L16_2 = true
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    L3_2 = L19_1
    L4_2 = Config
    L4_2 = L4_2.Animations
    L4_2 = L4_2.citizenAnimation
    L4_2 = L4_2.enabled
    L5_2 = Config
    L5_2 = L5_2.Animations
    L5_2 = L5_2.citizenAnimation
    L5_2 = L5_2.animDict
    L6_2 = Config
    L6_2 = L6_2.Animations
    L6_2 = L6_2.citizenAnimation
    L6_2 = L6_2.anim
    L3_2(L4_2, L5_2, L6_2)
  else
    L15_1 = A1_2
    L3_2 = 5
    L6_1 = L3_2
    L3_2 = L19_1
    L4_2 = Config
    L4_2 = L4_2.Animations
    L4_2 = L4_2.policeAnimation
    L4_2 = L4_2.enabled
    L5_2 = Config
    L5_2 = L5_2.Animations
    L5_2 = L5_2.policeAnimation
    L5_2 = L5_2.animDict
    L6_2 = Config
    L6_2 = L6_2.Animations
    L6_2 = L6_2.policeAnimation
    L6_2 = L6_2.anim
    L3_2(L4_2, L5_2, L6_2)
  end
end
L20_1(L21_1, L22_1)
L20_1 = RegisterNetEvent
L21_1 = "ryt:Detach"
L20_1(L21_1)
L20_1 = AddEventHandler
L21_1 = "ryt:Detach"
function L22_1()
  local L0_2, L1_2, L2_2
  L0_2 = DetachEntity
  L1_2 = L0_1
  L2_2 = true
  L0_2(L1_2, L2_2)
  L0_2 = ClearPedTasks
  L1_2 = L0_1
  L0_2(L1_2)
  L0_2 = nil
  L1_1 = L0_2
  L0_2 = 1000
  L6_1 = L0_2
end
L20_1(L21_1, L22_1)
L20_1 = RegisterNetEvent
L21_1 = "ryt:DeadEvent"
L20_1(L21_1)
L20_1 = AddEventHandler
L21_1 = "ryt:DeadEvent"
function L22_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = L15_1
  oldDrag = L0_2
  L0_2 = IsPedAPlayer
  L1_2 = NetToPed
  L2_2 = oldDrag
  L1_2, L2_2, L3_2, L4_2, L5_2 = L1_2(L2_2)
  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  if L0_2 then
    L0_2 = TriggerServerEvent
    L1_2 = "ryt:Detach"
    L2_2 = GetPlayerServerId
    L3_2 = L17_1
    L4_2 = NetToPed
    L5_2 = oldDrag
    L4_2, L5_2 = L4_2(L5_2)
    L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2, L4_2, L5_2)
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  end
  L0_2 = nil
  L15_1 = L0_2
  L0_2 = 1000
  L6_1 = L0_2
  L0_2 = ClearPedTasksImmediately
  L1_2 = L0_1
  L0_2(L1_2)
end
L20_1(L21_1, L22_1)
L20_1 = RegisterNetEvent
L21_1 = "ryt:enterPed"
L20_1(L21_1)
L20_1 = AddEventHandler
L21_1 = "ryt:enterPed"
function L22_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = TaskEnterVehicle
  L3_2 = L0_1
  L4_2 = NetToVeh
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  L5_2 = 20000
  L6_2 = A0_2
  L7_2 = 1.5
  L8_2 = 1
  L9_2 = 0
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
end
L20_1(L21_1, L22_1)
L20_1 = RegisterNetEvent
L21_1 = "ryt:exitPed"
L20_1(L21_1)
L20_1 = AddEventHandler
L21_1 = "ryt:exitPed"
function L22_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = TaskLeaveVehicle
  L2_2 = L0_1
  L3_2 = NetToVeh
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = 256
  L1_2(L2_2, L3_2, L4_2)
end
L20_1(L21_1, L22_1)
L20_1 = RegisterNetEvent
L21_1 = "ryt:exceptionJobs"
L20_1(L21_1)
L20_1 = AddEventHandler
L21_1 = "ryt:exceptionJobs"
function L22_1(A0_2)
  local L1_2
  L1_2 = not A0_2
  L12_1 = L1_2
end
L20_1(L21_1, L22_1)
L20_1 = RegisterNetEvent
L21_1 = "ryt:syncVariable"
L20_1(L21_1)
L20_1 = AddEventHandler
L21_1 = "ryt:syncVariable"
function L22_1(A0_2)
  local L1_2
  L9_1 = A0_2
end
L20_1(L21_1, L22_1)
L20_1 = Citizen
L20_1 = L20_1.CreateThread
function L21_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  while true do
    L0_2 = GetPlayerPed
    L1_2 = -1
    L0_2 = L0_2(L1_2)
    L0_1 = L0_2
    L0_2 = Config
    L0_2 = L0_2.CommandEnabled
    if not L0_2 then
      L0_2 = verifyJobPlayer
      L0_2 = L0_2()
      jobPlayer = L0_2
    end
    L0_2 = L16_1
    L0_2 = L0_2()
    pedInFront = L0_2
    L0_2 = IsEntityDead
    L1_2 = L0_1
    L0_2 = L0_2(L1_2)
    if not L0_2 then
      L0_2 = IsPedRagdoll
      L1_2 = L0_1
      L0_2 = L0_2(L1_2)
    end
    L4_1 = L0_2
    L0_2 = L1_1
    if nil ~= L0_2 then
      L0_2 = IsPedWalking
      L1_2 = NetToPed
      L2_2 = L1_1
      L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2 = L1_2(L2_2)
      L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
      pedWalking = L0_2
      L0_2 = IsPedSprinting
      L1_2 = NetToPed
      L2_2 = L1_1
      L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2 = L1_2(L2_2)
      L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
      pedSprinting = L0_2
      L0_2 = IsEntityPlayingAnim
      L1_2 = L0_1
      L2_2 = Config
      L2_2 = L2_2.Animations
      L2_2 = L2_2.citizenAnimation
      L2_2 = L2_2.animDict
      L3_2 = Config
      L3_2 = L3_2.Animations
      L3_2 = L3_2.citizenAnimation
      L3_2 = L3_2.anim
      L4_2 = 3
      L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2)
      L5_1 = L0_2
    else
      L0_2 = L15_1
      if nil ~= L0_2 then
        L0_2 = GetVehicleInFront
        L0_2 = L0_2()
        L3_1 = L0_2
        L0_2 = IsEntityPlayingAnim
        L1_2 = L0_1
        L2_2 = Config
        L2_2 = L2_2.Animations
        L2_2 = L2_2.policeAnimation
        L2_2 = L2_2.animDict
        L3_2 = Config
        L3_2 = L3_2.Animations
        L3_2 = L3_2.policeAnimation
        L3_2 = L3_2.anim
        L4_2 = 3
        L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2)
        L5_1 = L0_2
        L0_2 = L3_1
        if 0 ~= L0_2 then
          L0_2 = 1
          L1_2 = GetNumberOfVehicleDoors
          L2_2 = L3_1
          L1_2 = L1_2(L2_2)
          L2_2 = 1
          for L3_2 = L0_2, L1_2, L2_2 do
            L4_2 = GetEntryPositionOfDoor
            L5_2 = L3_1
            L6_2 = L3_2
            L4_2 = L4_2(L5_2, L6_2)
            L5_2 = Vdist
            L6_2 = GetEntityCoords
            L7_2 = L0_1
            L6_2 = L6_2(L7_2)
            L7_2 = L4_2
            L5_2 = L5_2(L6_2, L7_2)
            L6_2 = 0.8
            if L5_2 < L6_2 then
              L7_1 = L3_2
              L5_2 = true
              L13_1 = L5_2
            end
          end
        else
          L0_2 = false
          L13_1 = L0_2
        end
      end
    end
    L0_2 = Config
    L0_2 = L0_2.CommandEnabled
    if not L0_2 then
      L0_2 = GetVehicleInFront
      L0_2 = L0_2()
      L3_1 = L0_2
      L0_2 = L3_1
      if 0 ~= L0_2 then
        L1_2 = L2_1
        L0_2 = L9_1
        L0_2 = L0_2[L1_2]
        if nil ~= L0_2 then
          L0_2 = L3_1
          L2_2 = L2_1
          L1_2 = L9_1
          L1_2 = L1_2[L2_2]
          if L0_2 == L1_2 then
            L0_2 = Vdist
            L1_2 = GetEntityCoords
            L2_2 = L0_1
            L1_2 = L1_2(L2_2)
            L2_2 = GetEntityCoords
            L3_2 = NetToPed
            L4_2 = L2_1
            L3_2, L4_2, L5_2, L6_2, L7_2 = L3_2(L4_2)
            L2_2, L3_2, L4_2, L5_2, L6_2, L7_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
            L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
            L8_1 = L0_2
          end
        end
      end
    end
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = 500
    L0_2(L1_2)
  end
end
L20_1(L21_1)
L20_1 = Citizen
L20_1 = L20_1.CreateThread
function L21_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  while true do
    L0_2 = Citizen
    L0_2 = L0_2.Wait
    L1_2 = L6_1
    L0_2(L1_2)
    L0_2 = Config
    L0_2 = L0_2.CommandEnabled
    if L0_2 then
      L0_2 = Config
      L0_2 = L0_2.DropPlayer
      if not L0_2 then
        goto lbl_16
      end
    end
    L0_2 = fExitCar
    L1_2 = false
    L0_2(L1_2)
    ::lbl_16::
    L0_2 = L1_1
    if nil ~= L0_2 then
      L0_2 = pedWalking
      if L0_2 then
        L0_2 = TaskGoStraightToCoord
        L1_2 = L0_1
        L2_2 = GetOffsetFromEntityInWorldCoords
        L3_2 = NetToPed
        L4_2 = L1_1
        L3_2 = L3_2(L4_2)
        L4_2 = 0.0
        L5_2 = 1.2
        L6_2 = 1.32
        L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
        L3_2 = 1.0
        L4_2 = 500
        L5_2 = 130.0
        L6_2 = 0.0
        L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2)
        L0_2 = L18_1
        L0_2()
        L0_2 = false
        L10_1 = L0_2
      else
        L0_2 = pedSprinting
        if L0_2 then
          L0_2 = TaskGoStraightToCoord
          L1_2 = L0_1
          L2_2 = GetOffsetFromEntityInWorldCoords
          L3_2 = NetToPed
          L4_2 = L1_1
          L3_2 = L3_2(L4_2)
          L4_2 = 0.0
          L5_2 = 8.2
          L6_2 = 1.32
          L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
          L3_2 = 5.0
          L4_2 = 500
          L5_2 = 130.0
          L6_2 = 0.0
          L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2)
          L0_2 = L18_1
          L0_2()
          L0_2 = false
          L10_1 = L0_2
        else
          L0_2 = L10_1
          if not L0_2 then
            L0_2 = TaskGoStraightToCoord
            L1_2 = L0_1
            L2_2 = GetOffsetFromEntityInWorldCoords
            L3_2 = L0_1
            L4_2 = 0.0
            L5_2 = 0.0
            L6_2 = 1.32
            L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
            L3_2 = 1.0
            L4_2 = 2000
            L5_2 = GetEntityHeading
            L6_2 = L0_1
            L5_2 = L5_2(L6_2)
            L6_2 = 3.0
            L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2)
            L0_2 = true
            L10_1 = L0_2
          end
        end
      end
      L0_2 = L5_1
      if not L0_2 then
        L0_2 = L19_1
        L1_2 = Config
        L1_2 = L1_2.Animations
        L1_2 = L1_2.citizenAnimation
        L1_2 = L1_2.enabled
        L2_2 = Config
        L2_2 = L2_2.Animations
        L2_2 = L2_2.citizenAnimation
        L2_2 = L2_2.animDict
        L3_2 = Config
        L3_2 = L3_2.Animations
        L3_2 = L3_2.citizenAnimation
        L3_2 = L3_2.anim
        L0_2(L1_2, L2_2, L3_2)
      end
      L0_2 = L4_1
      if L0_2 then
        L0_2 = L11_1
        if not L0_2 then
          L0_2 = true
          L11_1 = L0_2
          L0_2 = TriggerServerEvent
          L1_2 = "ryt:DeadEvent"
          L2_2 = GetPlayerServerId
          L3_2 = L17_1
          L4_2 = NetToPed
          L5_2 = L1_1
          L4_2, L5_2, L6_2 = L4_2(L5_2)
          L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2)
          L2_2, L3_2, L4_2, L5_2, L6_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
          L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2)
        end
      else
        L0_2 = false
        L11_1 = L0_2
      end
    else
      L0_2 = L15_1
      if nil ~= L0_2 then
        L0_2 = Config
        L0_2 = L0_2.CollisionRange
        if L0_2 > 0.0 then
          L0_2 = SetPedCapsule
          L1_2 = L0_1
          L2_2 = Config
          L2_2 = L2_2.CollisionRange
          L0_2(L1_2, L2_2)
        end
        L0_2 = L18_1
        L0_2()
        L0_2 = Config
        L0_2 = L0_2.DisableSprint
        if L0_2 then
          L0_2 = DisableControlAction
          L1_2 = 0
          L2_2 = 21
          L3_2 = true
          L0_2(L1_2, L2_2, L3_2)
        end
        L0_2 = L4_1
        if L0_2 then
          L0_2 = TriggerEvent
          L1_2 = "ryt:DeadEvent"
          L0_2(L1_2)
        end
        L0_2 = L5_1
        if not L0_2 then
          L0_2 = L19_1
          L1_2 = Config
          L1_2 = L1_2.Animations
          L1_2 = L1_2.policeAnimation
          L1_2 = L1_2.enabled
          L2_2 = Config
          L2_2 = L2_2.Animations
          L2_2 = L2_2.policeAnimation
          L2_2 = L2_2.animDict
          L3_2 = Config
          L3_2 = L3_2.Animations
          L3_2 = L3_2.policeAnimation
          L3_2 = L3_2.anim
          L0_2(L1_2, L2_2, L3_2)
        end
        L0_2 = Config
        L0_2 = L0_2.DropPlayer
        if not L0_2 then
          L0_2 = Config
          L0_2 = L0_2.CommandEnabled
          if L0_2 then
            goto lbl_196
          end
        end
        L0_2 = Hint
        L1_2 = Config
        L1_2 = L1_2.Languages
        L2_2 = Config
        L2_2 = L2_2.Language
        L1_2 = L1_2[L2_2]
        L1_2 = L1_2.releaseperson
        L0_2(L1_2)
        L0_2 = IsControlJustPressed
        L1_2 = 0
        L2_2 = Config
        L2_2 = L2_2.Keys
        L2_2 = L2_2.GrabAndDropKey
        L0_2 = L0_2(L1_2, L2_2)
        if L0_2 then
          L0_2 = fGrab
          L0_2()
        end
        ::lbl_196::
        L0_2 = Config
        L0_2 = L0_2.CommandEnabled
        if L0_2 then
          L0_2 = Config
          L0_2 = L0_2.DropPlayer
          if not L0_2 then
            goto lbl_207
          end
        end
        L0_2 = fPutCar
        L1_2 = false
        L0_2(L1_2)
      end
    end
    ::lbl_207::
  end
end
L20_1(L21_1)
function L20_1()
  local L0_2, L1_2
  L0_2 = L13_1
  return L0_2
end
GetPutCarAvailable = L20_1
function L20_1()
  local L0_2, L1_2, L2_2
  L0_2 = GetVehicleInFront
  L0_2 = L0_2()
  if 0 ~= L0_2 then
    L2_2 = L2_1
    L1_2 = L9_1
    L1_2 = L1_2[L2_2]
    if nil ~= L1_2 then
      L1_2 = true
      return L1_2
    end
  end
  L1_2 = false
  return L1_2
end
GetExitCarAvailable = L20_1
L20_1 = exports
L21_1 = "GetPutCarAvailable"
L22_1 = GetPutCarAvailable
L20_1(L21_1, L22_1)
L20_1 = exports
L21_1 = "GetExitCarAvailable"
L22_1 = GetExitCarAvailable
L20_1(L21_1, L22_1)
