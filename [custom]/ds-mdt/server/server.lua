QBCore = nil
oxmysql = exports['oxmysql']

QBCore = exports['qb-core']:GetCoreObject()

--Delete Expired Warrants
Citizen.CreateThread(function()
    Citizen.Wait(30000) --30 Seconds
    local timeNow = os.time() * 1000
    oxmysql:execute("DELETE FROM `mdt_warrants` WHERE date <= @date", {
        ["@date"] = timeNow,
    }, function(result)
        if(result ~= nil) then
            print("Deleted Expired Warrants"..result.affectedRows)
        end
    end, true)

end)