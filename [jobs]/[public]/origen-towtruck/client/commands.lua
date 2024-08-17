RegisterCommand(Config.Commands.TowTruck, function()
    if inJob then
        isTabletOpen = true
        SendPlayerProfile()
        SendTop10()
        SetNuiVisible()
    else
        Koci.showNotification(Koci.getPhrase("warning-command"))
    end
end, false)
