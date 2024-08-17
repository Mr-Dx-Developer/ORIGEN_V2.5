local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
L1_1 = RegisterServerEvent
L2_1 = "ryt:sendEvent"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "ryt:sendEvent"
function L3_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = TriggerClientEvent
  L5_2 = "ryt:sendEvent"
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A3_2
  L9_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L4_2 = TriggerClientEvent
  L5_2 = "ryt:sendEvent"
  L6_2 = A1_2
  L7_2 = A0_2
  L8_2 = A2_2
  L9_2 = false
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterServerEvent
L2_1 = "ryt:Detach"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "ryt:Detach"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = TriggerClientEvent
  L2_2 = "ryt:Detach"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterServerEvent
L2_1 = "ryt:DeadEvent"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "ryt:DeadEvent"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = TriggerClientEvent
  L2_2 = "ryt:DeadEvent"
  L3_2 = A0_2
  L1_2(L2_2, L3_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterServerEvent
L2_1 = "ryt:enterPed"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "ryt:enterPed"
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = TriggerClientEvent
  L4_2 = "ryt:enterPed"
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterServerEvent
L2_1 = "ryt:exitPed"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "ryt:exitPed"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = TriggerClientEvent
  L3_2 = "ryt:exitPed"
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2(L3_2, L4_2, L5_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterServerEvent
L2_1 = "ryt:syncVariable"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "ryt:syncVariable"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = TriggerClientEvent
  L2_2 = "ryt:syncVariable"
  L3_2 = -1
  L4_2 = A0_2
  L1_2(L2_2, L3_2, L4_2)
  L0_1 = A0_2
end
L1_1(L2_1, L3_1)
L1_1 = Citizen
L1_1 = L1_1.CreateThread
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = Config
  L0_2 = L0_2.ESX
  L0_2 = L0_2.enabled
  if L0_2 then
    L0_2 = Config
    L0_2 = L0_2.ESX
    L0_2 = L0_2.exceptionJobs
    if L0_2 then
      ESX = nil
      L0_2 = TriggerEvent
      L1_2 = "esx:getSharedObject"
      function L2_2(A0_3)
        local L1_3
        ESX = A0_3
      end
      L0_2(L1_2, L2_2)
    end
  end
end

L1_1(L2_1)
L1_1 = Config
L1_1 = L1_1.ESX
L1_1 = L1_1.enabled
if L1_1 then
  L1_1 = Config
  L1_1 = L1_1.ESX
  L1_1 = L1_1.exceptionJobs
  if L1_1 then
    L1_1 = RegisterServerEvent
    L2_1 = "ryt:exceptionJobs"
    L1_1(L2_1)
    L1_1 = AddEventHandler
    L2_1 = "ryt:exceptionJobs"
    function L3_1(A0_2, A1_2)
      local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
      L2_2 = ESX
      L2_2 = L2_2.GetPlayerFromId
      L3_2 = A1_2
      L2_2 = L2_2(L3_2)
      L3_2 = TriggerClientEvent
      L4_2 = "ryt:exceptionJobs"
      L5_2 = A0_2
      L6_2 = false
      L3_2(L4_2, L5_2, L6_2)
      L3_2 = 1
      L4_2 = Config
      L4_2 = L4_2.ESX
      L4_2 = L4_2.jobs
      L4_2 = #L4_2
      L5_2 = 1
      for L6_2 = L3_2, L4_2, L5_2 do
        L7_2 = L2_2.job
        if nil ~= L7_2 then
          L7_2 = L2_2.job
          L7_2 = L7_2.name
          L8_2 = Config
          L8_2 = L8_2.ESX
          L8_2 = L8_2.jobs
          L8_2 = L8_2[L6_2]
          if L7_2 == L8_2 then
            L7_2 = TriggerClientEvent
            L8_2 = "ryt:exceptionJobs"
            L9_2 = A0_2
            L10_2 = true
            L7_2(L8_2, L9_2, L10_2)
          end
        end
      end
    end
    L1_1(L2_1, L3_1)
  end
end
