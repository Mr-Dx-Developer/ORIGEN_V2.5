function RegisterBankTargets()
    for k, v in ipairs(Config.BankLocations) do
        local name = ('Bank_%s'):format(k)

        if Config.TargetScript == "ox_target" then
            exports.ox_target:addBoxZone({
                coords = v.coords,
                size = vector3(4,5,3),
                debug = false,
                rotation= 72,
                options = {{
                    name = name,
                    icon = 'fas fa-money-bill-wave',
                    label = "Access bank acount",
                    onSelect = function()
                        TriggerEvent("origen-banking:Client:BankMenu:Show")
                    end,
                    distance = 2.0
                }}
            })
        elseif Config.TargetScript == "qb-target" then
            exports["qb-target"]:AddBoxZone(name, v.coords, v.length, v.width,
                {
                    name = name,
                    heading = v.heading,
                    minZ = v.minZ,
                    maxZ = v.maxZ
                }, {
                    options = {{
                        icon = 'fas fa-money-bill-wave',
                        label = 'Access bank account',
                        action = function()
                            TriggerEvent("origen-banking:Client:BankMenu:Show")
                        end
                    }},
                    distance = 2.0
                }
            )
        elseif Config.TargetScript == "origen-target" then
            exports['origen-target']:boxZone(name, v.coords, v.length, v.width, {
                name = v.name,
                heading = v.heading,
                minZ = v.minZ,
                maxZ = v.maxZ
            }, {
                options = {{
                    icon = 'fas fa-money-bill-wave',
                    label = 'Access bank account',
                    action = function()
                        TriggerEvent("origen-banking:Client:BankMenu:Show")
                    end
                }},
                distance = 2.0
            })
        end
    end
end

function RegisterATMTargets() 
    if Config.TargetScript == "ox_target" then
        exports.ox_target:addModel(Config.ATMProps, {{
                icon = 'fas fa-credit-card',
                label = 'Use ATM',
                distance = 1.0,
                onSelect = function() 
                    TriggerEvent("origen-banking:Client:BankMenu:Show")
                end
        }})
    elseif Config.TargetScript == "qb-target" then
        exports["qb-target"]:AddTargetModel(Config.ATMProps, {
            options = {{
                icon = 'fas fa-credit-card',
                label = 'Use ATM',
                action = function() 
                    TriggerEvent("origen-banking:Client:BankMenu:Show")
                end
            }},
            distance = 1.0
        })
    elseif Config.TargetScript == "origen-target" then
        exports['origen-target']:targetModel(Config.ATMProps, {
            options = {{ 
                icon = 'fas fa-credit-card',
                label = 'Use ATM',
                action = function() 
                    TriggerEvent("origen-banking:Client:BankMenu:Show")
                end
            }},
            distance = 1.0
        })
    end
end