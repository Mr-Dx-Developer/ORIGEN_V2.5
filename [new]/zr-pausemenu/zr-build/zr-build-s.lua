if zr_config.framework == 'QB' then
    local QBCore = exports[zr_config.QB]:GetCoreObject()

    CreateThread(function()
        while true do
            local players = QBCore.Functions.GetQBPlayers()
    
            if #players > 0 then
                for _, job in pairs(zr_config.jobs) do
                    job.count = 0
    
                    for _, player in pairs(players) do
                        if player.PlayerData.job.name == job.name and player.PlayerData.job.onduty then
                            job.count = job.count + 1
                        end
                    end
                end
            end
    
            Wait(10000)
        end
    end)

    QBCore.Functions.CreateCallback('zr-pausemenu:GetData', function(source, cb)
        local Player = QBCore.Functions.GetPlayer(source)
        cb({
            zr_data = {
                zr_firstName = Player.PlayerData.charinfo.firstname,
                zr_lastName = Player.PlayerData.charinfo.lastname,
                zr_birthdate = Player.PlayerData.charinfo.birthdate,
                zr_job = Player.PlayerData.job.label,
                zr_grade = Player.PlayerData.job.grade.name,
                zr_gender = Player.PlayerData.charinfo.gender,
                zr_cash = Player.PlayerData.money['cash'],
                zr_bank = Player.PlayerData.money['bank']
            },
            zr_jobs = zr_config.jobs
        })
    end)
elseif zr_config.framework == 'ESX' then
    local ESX = exports[zr_config.ESX]:getSharedObject()

    CreateThread(function()
        while true do
            local players = ESX.GetExtendedPlayers()
    
            if #players > 0 then
                for _, job in pairs(zr_config.jobs) do
                    job.count = 0
    
                    for _, player in pairs(players) do
                        if player.job.name == job.name and player.job.onduty then
                            job.count = job.count + 1
                        end
                    end
                end
            end
    
            Wait(10000)
        end
    end)

    ESX.RegisterServerCallback('zr-pausemenu:GetData', function(source, cb)
        local xPlayer = ESX.GetPlayerFromId(source)

        cb({
            zr_data = {
                zr_firstName = xPlayer.get('firstName'),
                zr_lastName = xPlayer.get('lastName'),
                zr_birthdate = xPlayer.get('dateofbirth'),
                zr_job = xPlayer.job.label,
                zr_grade = xPlayer.job.grade_label,
                zr_gender = xPlayer.get('sex'),
                zr_cash = xPlayer.getAccount('money').money,
                zr_bank = xPlayer.getAccount('bank').money
            },
            zr_jobs = zr_config.jobs
        })
    end)
end

RegisterNetEvent('zr-pausemenu:Disconnect', function()
    local src = source
    DropPlayer(src, zr_config.disconnect)
end)

