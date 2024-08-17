RegisterNetEvent('elixir-chopshop:StartMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = 'Chop Parts',
            -- icon = 'fas fa-code',
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = 'Door',
            icon = 'fas fa-code-merge',
            txt = 'Print a message!',
            params = {
                event = "elixir-chopshop:chopdoor",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },  
        {
            header = 'Wheel',
            icon = 'fas fa-code-merge',
            txt = 'Print a message!',
            params = {
                event = "elixir-chopshop:chopwheel",
                args = {
                    number = 1,
                    id = 2
                }
            }
        }, 
        {
            header = 'Hood',
            icon = 'fas fa-code-merge',
            params = {
                event = "elixir-chopshop:chophood",
                args = {
                    number = 1,
                    id = 2
                }
            }
        }, 
        {
            header = 'Trunk',
            icon = 'fas fa-code-merge',
            params = {
                event = "elixir-chopshop:choptrunk",
                args = {
                    number = 1,
                    id = 2
                }
            }
        }, 

    })
end)

RegisterNetEvent('elixir-chopshop:chopdoor')
AddEventHandler('elixir-chopshop:chopdoor', function()
    TriggerServerEvent("elixir-chopshop:server:chopdoor")
end)

RegisterNetEvent('elixir-chopshop:chopwheel')
AddEventHandler('elixir-chopshop:chopwheel', function()
    TriggerServerEvent("elixir-chopshop:server:chopwheel")
end)

RegisterNetEvent('elixir-chopshop:chophood')
AddEventHandler('elixir-chopshop:chophood', function()
    TriggerServerEvent("elixir-chopshop:server:chophood")
end)

RegisterNetEvent('elixir-chopshop:choptrunk')
AddEventHandler('elixir-chopshop:choptrunk', function()
    TriggerServerEvent("elixir-chopshop:server:choptrunk")
end)