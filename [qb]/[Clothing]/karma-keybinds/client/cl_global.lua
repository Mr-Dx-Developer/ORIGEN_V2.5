-- Binds that are used globaly and do not fit in a single resouce
-- All Binds should use the event name and bool

Citizen.CreateThread(function()



    RegisterCommand('+showPlayerList', function() end, false)
    RegisterCommand('-showPlayerList', function() end, false)
    exports["karma-keybinds"]:registerKeyMapping("PlayerList", "Player", "View Online Players", "+showPlayerList", "-showPlayerList", "U", true)


    RegisterCommand('+generalUse', function() end, false)
    RegisterCommand('-generalUse', function() end, false)
    exports["karma-keybinds"]:registerKeyMapping("general", "Player", "General Use", "+generalUse", "-generalUse", "E", true)

    RegisterCommand('+housingMain', function() end, false)
    RegisterCommand('-housingMain', function() end, false)
    exports["karma-keybinds"]:registerKeyMapping("housingMain", "Housing", "Housing Main", "+housingMain", "-housingMain", "H", true)


    RegisterCommand('+housingSecondary', function() end, false)
    RegisterCommand('-housingSecondary', function() end, false)
    exports["karma-keybinds"]:registerKeyMapping("housingSecondary", "Housing", "Housing Secondary", "+housingSecondary", "-housingSecondary", "G", true)

    RegisterCommand('+generalUseThird', function() end, false)
    RegisterCommand('-generalUseThird', function() end, false)
    exports["karma-keybinds"]:registerKeyMapping("generalUseThird", "Player", "General Use Third", "+generalUseThird", "-generalUseThird", "G", true)
    


end)
