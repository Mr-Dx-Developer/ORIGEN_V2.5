TwoNaShared.Types = {}

TwoNaShared.Types.Frameworks = { 
    {
        Name = "ESX",
        ResourceName = "es_extended",
        GetFramework = function()
            local core = nil
            while core == nil do
                Citizen.Wait(0)
                TriggerEvent('esx:getSharedObject', function(obj) core = obj end)
            end
            return core
        end
    },
    {
        Name = "QBCore",
        ResourceName = "qb-core",
        GetFramework = function() return exports["qb-core"]:GetCoreObject() end
    }
}

TwoNaShared.Types.Databases = { 
    {
        Name = "MYSQL-ASYNC",
        ResourceName = "mysql_async"
    },
    {
        Name = "OXMYSQL",
        ResourceName = "oxmysql"
    }
}

