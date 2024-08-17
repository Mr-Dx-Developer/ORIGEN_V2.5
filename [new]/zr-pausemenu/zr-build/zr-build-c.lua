local Framework, Callback = nil, nil

if zr_config.framework == 'QB' then
    Framework = exports[zr_config.QB]:GetCoreObject()
    Callback = Framework.Functions.TriggerCallback
elseif zr_config.framework == 'ESX' then
    Framework = exports[zr_config.ESX]:getSharedObject()
    Callback = Framework.TriggerServerCallback
end

-- Disable native fivem pause menu
CreateThread(function()
	while true do
	    Wait(1)
		SetPauseMenuActive(false)
	end
end)

function zr_pausemenu_show()
    local timeout = 0

    while Framework == nil do
        timeout += 1
        Wait(100)

        if timeout > 25 then
            break
        end
    end

    if not Framework then
        return print('Something wrong with the shit so fuck off bitch!')
    end

    local p = promise.new()
    Callback('zr-pausemenu:GetData', function(cb) p:resolve(cb) end)

    local zrData = Citizen.Await(p)

    SendNUIMessage({
        type = 'show',
        config = zr_config,
        jobs = zrData.zr_jobs,
        data = zrData.zr_data
    })
    SetNuiFocus(true, true)
    StartScreenEffect(zr_config.zr_blur, 0, true)
end

RegisterNUICallback('show-maps', function()
    zr_pausemenu_hide()
    TriggerScreenblurFadeOut(1000)
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'),1,-1)

    if ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'),1,-1) then
        zr_pausemenu_hide()
    end
end)

RegisterNUICallback('show-settings', function()
    zr_pausemenu_hide()
    TriggerScreenblurFadeOut(1000)
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'),0,-1)       

    if ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'),0,-1) then
        zr_pausemenu_hide()
    end
end)

RegisterNUICallback('hide', function()
    zr_pausemenu_hide()
end)

RegisterNUICallback('disconnect', function()
    TriggerServerEvent("zr-pausemenu:Disconnect")
end)