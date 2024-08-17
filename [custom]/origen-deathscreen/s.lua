AddEventHandler('qb-playerDied', function(weaponLabel, time)
    TriggerClientEvent('origen-deathscreen:openUI', source, time)
end)