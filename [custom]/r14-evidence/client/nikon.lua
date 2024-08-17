QBCore = exports['qb-core']:GetCoreObject()

nikon = false -- non local variable, used by evidence script

-------------------------------------------------------------------------------------------
--------------------------            LOCAL VARIABLES            --------------------------
-------------------------------------------------------------------------------------------

local ped, vehicle, usingscenario, inveh = nil, nil, nil, nil
local nikon_cam = nil
local nikon_fov_max = 70.0
local nikon_fov_min = 1.0 -- max zoom level (smaller fov is more zoom)
local nikon_zoomspeed = 5.0 -- camera zoom speed
local nikon_speed_lr = 8.0 -- speed by which the camera pans left-right
local nikon_speed_ud = 8.0 -- speed by which the camera pans up-down
local nikon_fov = (nikon_fov_max+nikon_fov_min)*0.5
local nikon_keybindEnabled = false -- When enabled, nikons are available by keybind
local nikon_nikonKey = 73
local storeNikonKey = 177
local camdate, camsecond, ostime = '', '', nil
local photos = {} -- 
local up = false
local memopac = 190
local displayUploadPathOpac = nil
local currentCamSecond = nil
local currentCamera = nil
local deviceSettings = {}
local noMemory = false
local maxPhotos = 200 -- max photos per SD card, intended to prevent items from becoming to massive
local savedcam = nil -- camera places you into first person to not run the scenario
local usedSD = false
local curPage, curAmount, curImageSpace, curPassword, curPhotos = nil, nil, nil, nil, nil
local cameraErrors = { -- these are error messages in the event the server is unable to supply a webhook to the camera when a photo is taken
    ['missing'] = {notify = 'Unable to save photo due to missing network configuration!', print = 'Nikoff server table is missing webhook for upload path %s, please inform staff.'},
    ['blank'] = {notify = 'Unable to save photo due to a faulty network configuration!', print = 'Nikoff server table contains a blank webhook for upload path %s, please inform staff.'},
    ['nopath'] = {notify = 'Unable to save photo due to corrupted device settings!', print = 'Nikoff device settings does not have a proper upload path set, please inform staff to check their r14-evidence camera configuration.'},
}

-------------------------------------------------------------------------------------------
--------------------------        DEFAULT CAMERA SETTINGS        --------------------------
-------------------------------------------------------------------------------------------

local defaultDeviceSettings = {
    showOverlay = true,
    showTimestamp = true,
    uploadImages = false,
    uploadPath = 1,
    uploadPathPassword = nil,
    uploadPathDisplay = Config.Camera[1].Path,
    autoUpload = false,
    flashEnabled = true,
    memoryCard = true,
    memoryCardName = false, 
}

-------------------------------------------------------------------------------------------
--------------------------     BASE GAME/QB EVENT HANDLERS       --------------------------
-------------------------------------------------------------------------------------------

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        UpdateCameraData(currentCamera) -- update our camaera data before restart
        if nikon then TriggerServerEvent('evidence:server:setinvbusy', false) SetFollowPedCamViewMode(savedcam) end -- set inv_busy in state bag to false
        if GetPedConfigFlag(ped, 194) then -- cancel our scenario 
            prevCoords = GetEntityCoords(ped)
            ClearPedTasks(ped)
            SetEntityCoords(ped, prevCoords.x, prevCoords.y, prevCoords.z - 1.0)
        end

    end
end)

-------------------------------------------------------------------------------------------
--------------------------          CAMERA FUNCTIONS             --------------------------
-------------------------------------------------------------------------------------------

function GetCoreSlot(coreid)
    local PlayerData = QBCore.Functions.GetPlayerData()    
    local coreslot = false

    for k, v in pairs(PlayerData.items) do
        if v.id == coreid then coreslot = k end
    end
    
    return coreslot
end

function LoadCameraData(slot)
    if slot then
        currentCamera = slot
        local PlayerData = QBCore.Functions.GetPlayerData()

        if PlayerData.items[slot].info and next(PlayerData.items[slot].info) and PlayerData.items[slot].info.uploadPath then
            deviceSettings = {
                showOverlay = PlayerData.items[slot].info.showOverlay,
                showTimestamp = PlayerData.items[slot].info.showTimestamp,
                uploadImages = PlayerData.items[slot].info.uploadImages,
                uploadPath = PlayerData.items[slot].info.uploadPath,
                uploadPathPassword = PlayerData.items[slot].info.uploadPathPassword,
                uploadPathDisplay = PlayerData.items[slot].info.uploadPathDisplay,
                autoUpload = PlayerData.items[slot].info.autoUpload,
                flashEnabled = PlayerData.items[slot].info.flashEnabled,
                memoryCard = PlayerData.items[slot].info.memoryCard,
                memoryCardName = PlayerData.items[slot].info.memoryCardName,
            }

            photos = PlayerData.items[slot].info.photos
        else
            deviceSettings = table.clone(defaultDeviceSettings)
        end

        if PlayerData.items[slot].info.memoryCard then
            for k, v in pairs(PlayerData.items[slot].info.photos) do
                photos[k] = v
            end
        else
            photos = {}
        end         

        curPhotos = #photos 
    else
        deviceSettings = {}
        photos = {}
    end
end

function UpdateCameraData(slot)
    local info = table.clone(deviceSettings)
    info.photos = photos

    TriggerServerEvent("evidence:server:updatecamerainfo", {slot = slot, info = info})
end

local function VerifyCredentials(uploadPath)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local credentials = false 

    if Config.Camera[uploadPath].Auth and Config.AuthorizedJobs[Config.Camera[uploadPath].Auth] and Config.AuthorizedJobs[Config.Camera[uploadPath].Auth].Check() then credentials = true end
    if Config.Camera[uploadPath].Job and PlayerData.job.name == Config.Camera[uploadPath].Job then credentials = true end
    if Config.Camera[uploadPath].Type and PlayerData.job.type == Config.Camera[uploadPath].Type then credentials = true end
    if not Config.Camera[uploadPath].Auth and not Config.Camera[uploadPath].Job and not Config.Camera[uploadPath].Type then credentials = true end
    
    return credentials
end

function ValidUploadPath(path)
    local upload = path

    if not Config.Camera[path] or deviceSettings.uploadPathDisplay ~= Config.Camera[path].Path then
        Config.Functions.Notify('Attempting to upload to image space that does not exist!', 'error')  
        upload = false 
    end

    if Config.Camera[path].Password and deviceSettings.uploadPathPassword ~= Config.Camera[path].Password then 
        Config.Functions.Notify('Attempting to upload to image space with invalid password!', 'error')  
        upload = false 
    end
        
    return upload
end

function TakePhoto()
    if deviceSettings.flashEnabled then Wait(50) end

    QBCore.Functions.TriggerCallback('nikon:GetWebhook', function(webhook)
        exports['screenshot-basic']:requestScreenshotUpload(webhook, 'files[]', {encoding = 'jpg'}, function(data)
            local resp = json.decode(data)
            local photodata = {}

            if cameraErrors[webhook] then Config.Functions.Notify('Please contact your image space administrator or Nikoff customer support!', 'error') Config.Functions.Notify(cameraErrors[webhook].notify, 'error') print(cameraErrors[webhook].print) return end

            if resp then
                photodata = {
                    url = resp.attachments[1].url, 
                    id = resp.attachments[1].id,
                    time = ostime,
                    uploadPath = deviceSettings.uploadPath,
                    exif = {
                        [1] = {label = 'View GPS Coordinates', value = GetEntityCoords(ped), order = 1},
                        [2] = {label = "Date Taken:", value = displaydate, order = 2},
                        [3] = {label = 'Time Taken: (Unix)', value = ostime, order = 3},
                        [4] = {label = 'Uploaded:', value = deviceSettings.uploadPath ~= 1 and displaydate, order = 4},
                        [5] = {label = 'Zoom Setting:', value = nikon_fov, order = 5},
                        [6] = {label = "Image Format:", value = "JPEG", order = 6},
                        [7] = {label = "Flash:", value = deviceSettings.flashEnabled and 'Flash fired' or 'Flash did not fire', order = 7},
                    },
                }

                if deviceSettings.memoryCard then
                    if curPhotos < maxPhotos then 
                        photos[#photos + 1] = photodata
                    else
                        Config.Functions.Notify('Memory is full! Please clear space or change SD cards!', 'error') 
                    end
                end

                if deviceSettings.memoryCard and curPhotos < 10 then
                    photos[#photos + 1 ] = photo
                    curPhotos = #photos 
                end

                if deviceSettings.uploadPath > 1 and Config.Camera[deviceSettings.uploadPath] then
                    TriggerServerEvent('evidence:server:updateimagespace', photodata)
                end                  
            else
                Config.Functions.Notify('Unable to save photo, please check your settings or contact Nikoff customer support!', 'error') 
            end
        end)
    end, deviceSettings.uploadPath)
end

function RemovePhoto(photoId)
    local count = 0
    local newphotos = table.clone(photos)
    photos = {}

    for k, v in pairs(newphotos) do
        if k ~= photoId then
            count = count + 1
            photos[count] = v 
        end
    end

    UpdateCameraData(currentCamera)

    ViewPhotos()
end

local function CheckInputRotation(nikon_cam, nikon_zoomvalue)
    local rightAxisX = GetDisabledControlNormal(0, 220)
    local rightAxisY = GetDisabledControlNormal(0, 221)
    local rotation = GetCamRot(nikon_cam, 2)
    if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
        new_z = rotation.z + rightAxisX*-1.0*(nikon_speed_ud)*(nikon_zoomvalue+0.1)
        new_x = math.max(math.min(20.0, rotation.x + rightAxisY*-1.0*(nikon_speed_lr)*(nikon_zoomvalue+0.1)), -89.5)
        SetCamRot(nikon_cam, new_x, 0.0, new_z, 2)
        if nikon and not inveh then SetEntityHeading(ped,new_z) end
    end
end

local function HandleZoom(nikon_cam)
    if IsDisabledControlJustPressed(0,241) then -- Scrollup
        nikon_fov = math.max(nikon_fov - nikon_zoomspeed, nikon_fov_min)
    end
    if IsDisabledControlJustPressed(0,242) then
        nikon_fov = math.min(nikon_fov + nikon_zoomspeed, nikon_fov_max) -- ScrollDown
    end
    local nikon_current_fov = GetCamFov(nikon_cam)
    if math.abs(nikon_fov-nikon_current_fov) < 0.1 then
        nikon_fov = nikon_current_fov
    end
    SetCamFov(nikon_cam, nikon_current_fov + (nikon_fov - nikon_current_fov)*0.05)
end

function CheckAuth(space)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local authorized = false

    if space.Auth and Config.AuthorizedJobs[space.Auth] and Config.AuthorizedJobs[space.Auth].Check() then authorized = true end
    if space.Type and PlayerData.job.type == space.Type then authorized = true end
    if space.Job and PlayerData.job.name == space.Job then authorized = true end
    if not space.Auth and not space.Type and not space.Job then authorized = true end

    return authorized
end

-------------------------------------------------------------------------------------------
---------------------          CAMERA MENU FUNCTIONS             --------------------------
-------------------------------------------------------------------------------------------

function SDcard(slot)
    local PlayerData = QBCore.Functions.GetPlayerData()

    local nikoffMenu = {
        {
            header = ('Manage SD Card'):format(),
            isMenuHeader = true,
        }
    }

    nikoffMenu[#nikoffMenu+1] = {
        header = ('Rename "%s"'):format(PlayerData.items[slot].info.name),
        params = {
            isAction = true,
            event = RenameSD,
            args = slot,
        }
    }

    nikoffMenu[#nikoffMenu+1] = {
        header = "Close (ESC)",
        params = {
            event = 'qb-menu:client:closeMenu',
        }
    }    

    exports['qb-menu']:openMenu(nikoffMenu)
end

function SelectImageSpace()
    local nikoffMenu = {
        {
            header = 'Select Image Space',
            isMenuHeader = true,
        }
    }

    for k, v in ipairs(Config.Camera) do
        if k ~= 1 then
            if CheckAuth(v) then
                nikoffMenu[#nikoffMenu+1] = {
                    header = v.Path,
                    params = {
                        isAction = true,
                        event = function()                       
                            if v.Password then
                                local input = exports['qb-input']:ShowInput({
                                    header = v.Path,
                                    submitText = "Log In",
                                    inputs = {
                                        {
                                            text = 'Enter Password',
                                            name = "password", 
                                            type = "text",
                                            isRequired = true,
                                            default = preexisting,
                                        },
                                    },
                                })
                                if input.password == v.Password then
                                    curImageSpace = k
                                    curPage = 1
                                    curPassword = input.password
                                    curAmount = 5
                                    TriggerServerEvent('evidence:server:fetchnetphotos', {imageSpace = k, page = curPage, amount = curAmount, password = input.password})
                                elseif input.password ~= v.Password then
                                    Config.Functions.Notify('Invalid password, please try again.', 'error') 
                                    SelectImageSpace() -- return to this function if incorrect for another attempt
                                    return
                                end
                            else
                                curImageSpace = k
                                curPage = 1
                                curAmount = 5
                                TriggerServerEvent('evidence:server:fetchnetphotos', {imageSpace = k, page = curPage, amount = curAmount})
                            end
                        end,
                    }
                }
            end
        end
    end

    nikoffMenu[#nikoffMenu+1] = {
        header = "Back",
        params = {
            isAction = true,
            event = DeviceSettings,
        }
    }
    exports['qb-menu']:openMenu(nikoffMenu)
end


function RenameSD(slot)
    local PlayerData = QBCore.Functions.GetPlayerData()

    local input = exports['qb-input']:ShowInput({
        header = "Name SD Card",
        submitText = "Name Card",
        inputs = {
            {
                text = 'Enter Name',
                name = "newname", 
                type = "text",
                isRequired = true,
                default = PlayerData.items[slot].info and PlayerData.items[slot].info.name,
            },
        },
    })
    if input and input.newname then
        TriggerServerEvent('evidence:server:updateSDcard', {slot = slot, name = input.newname})

        while QBCore.Functions.GetPlayerData().items[slot].info.name ~= input.newname do
            Wait(100)
        end

        SDcard(slot)
    end
end

function UploadPhoto(photo)
    local nikoffMenu = {
        {
            header = 'Select Image Space For Upload',
            isMenuHeader = true,
        }
    }

    for k, v in ipairs(Config.Camera) do
        if k ~= 1 then
            if VerifyCredentials(k) then
                nikoffMenu[#nikoffMenu+1] = {
                    header = v.Path,
                    params = {
                        isAction = true,
                        event = function()                       
                            if v.Password then
                                local input = exports['qb-input']:ShowInput({
                                    header = v.Path,
                                    submitText = "Log In",
                                    inputs = {
                                        {
                                            text = 'Enter Password',
                                            name = "password", 
                                            type = "text",
                                            isRequired = true,
                                            default = preexisting,
                                        },
                                    },
                                })
                                if input.password == v.Password then
                                    photo.uploadPath = k
                                    photos[photo.photoId].exif[4].value = displaydate
                                    photo.exif[4].value = displaydate
                                    TriggerServerEvent('evidence:server:uploadphoto', k, photo)
                                elseif input.password ~= v.Password then
                                    Config.Functions.Notify('Invalid password, please try again.', 'error') 
                                    ManagePhoto(photo)
                                    return
                                end
                            else
                                photos[photo.photoId].exif[4].value = displaydate
                                photo.exif[4].value = displaydate
                                photo.uploadPath = k
                                TriggerServerEvent('evidence:server:uploadphoto', k, photo)
                            end
                            
                            ManagePhoto(photo)
                        end,
                    }
                }
            end
        end
    end

    nikoffMenu[#nikoffMenu+1] = {
        header = "Back",
        params = {
            isAction = true,
            event = DeviceSettings,
        }
    }
    exports['qb-menu']:openMenu(nikoffMenu)
end

function ManagePhoto(photo)
    local nikoffMenu = {
        {
            header = ('nikoff_%s.jpg'):format(photo.id),
            isMenuHeader = true,
        }
    }

    nikoffMenu[#nikoffMenu+1] = {
        header = ('<img src="%s" style="max-width: 250px;" />'):format(photo.url),
        params = {
            isAction = true,
            event = function()
                exports['qb-menu']:openMenu({{
                    header = ('<img src="%s" style="max-width: 1080px;" />'):format(photo.url),
                    params = {
                        isAction = true,
                        event = ManagePhoto,
                        args = photo,
                    }
                }})
            end,
        }
    }

    for k, v in pairs(photo.exif) do
        local isGPS = false

        if type(v.value) == 'table' or type(v.value) == 'vector3' then isGPS = true end

        local hdr = isGPS and v.label or nil
        local args = isGPS and v.value or nil

        if isGPS then hdr = v.label end

        nikoffMenu[#nikoffMenu+1] = {
            header = hdr or ('%s %s'):format(v.label, v.value),
            disabled = not isGPS,
            params = {
                isAction = isGPS and true,
                event = isGPS and function(args)
                    SetNewWaypoint(v.value.x, v.value.y)
                    Config.Functions.Notify(('GPS Waypoint set for (%s, %s)'):format(v.value.x, v.value.y)) 
                    ManagePhoto(photo)
                end,
                args = args,
            }
        }
    end

    nikoffMenu[#nikoffMenu+1] = {
        header = 'Manage Photo',
        isMenuHeader = true,
    }

    if photo.exif[4].value then
        nikoffMenu[#nikoffMenu+1] = {
            header = 'Copy URL',
            params = {
                event = 'evidence:client:CopyEvidence',
                args = {
                    text = photo.url,
                },
            }
        }    
    end

    if not photo.imageSpace then
        nikoffMenu[#nikoffMenu+1] = {
            header = 'Upload Photo',
            params = {
                isAction = true,
                event = UploadPhoto,
                args = photo,
            }
        }

        nikoffMenu[#nikoffMenu+1] = {
            header = 'Delete Photo',
            params = {
                isAction = true,
                event = function()
                    RemovePhoto(photo.photoId)
                end,
            }
        }
    end

    nikoffMenu[#nikoffMenu+1] = {
        header = "Back",
        params = {
            isServer = photo.imageSpace,
            isAction = not photo.imageSpace,
            event = photo.imageSpace and 'evidence:server:fetchnetphotos' or ViewPhotos,
            args = {imageSpace = curImageSpace, page = curPage, amount = curAmount or 20},
        }
    }
    exports['qb-menu']:openMenu(nikoffMenu)
end

function ViewPhotos()
    local nikoffMenu = {
        {
            header = 'Nikoff G900 Onboard Memory',
            isMenuHeader = true,
        }
    }
   
    if next(photos) then
        for i = #photos, 1, -1 do     
            if photos[i] then
                local v = table.clone(photos[i])
                v.photoId = i

                nikoffMenu[#nikoffMenu+1] = {
                    header = ('<img src="%s" style="max-width: 250px;" />'):format(photos[i].url),
                    text = ('Taken: %s</br> Uploaded: %s'):format(v.exif[2].value, v.exif[4].value or 'false'),
                    params = {
                        isAction = true,
                        event = ManagePhoto,
                        args = v,
                    }
                }
            end
        end
    else
        nikoffMenu[#nikoffMenu+1] = {
            header = 'No photos found.',
            disabled = true,
        }
    end



    nikoffMenu[#nikoffMenu+1] = {
        header = "Back",
        params = {
            isAction = true,
            event = DeviceSettings,
        }
    }

    exports['qb-menu']:openMenu(nikoffMenu)
end

function ChangeUpload()
    local nikoffMenu = {
        {
            header = 'Nikoff G900 Manage Upload Settings',
            isMenuHeader = true,
        }
    }

    for k, v in ipairs(Config.Camera) do
        if VerifyCredentials(k) then
            nikoffMenu[#nikoffMenu+1] = {
                header = ('%s&nbsp%s'):format(v.Path, deviceSettings.uploadPath == k and '<p style="color:Green;"><strong>ENABLED<strong></p>' or '<p style="color:Tomato;"><strong>DISABLED<strong></p>'),
                params = {
                    isAction = true,
                    event = function()
                        
                        if v.Password then
                            local input = exports['qb-input']:ShowInput({
                                header = v.Path,
                                submitText = "Log In",
                                inputs = {
                                    {
                                        text = 'Enter Password',
                                        name = "password", 
                                        type = "text",
                                        isRequired = true,
                                        default = preexisting,
                                    },
                                },
                            })
                            if input.password == v.Password then 
                                deviceSettings.uploadPath = k
                                deviceSettings.uploadPathPassword = v.Password
                                deviceSettings.uploadPathDisplay = v.Path 
                                displayUploadPathOpac = 190
                            elseif input.password ~= v.Password then
                                Config.Functions.Notify('Invalid password, please try again.', 'error') 
                                ChangeUpload()
                            end
                        else
                            deviceSettings.uploadPath = k
                            deviceSettings.uploadPathDisplay = v.Path 
                            displayUploadPathOpac = 190
                        end

                        ChangeUpload()
                    end,
                }
            }
        end
    end

    nikoffMenu[#nikoffMenu+1] = {
        header = "Back",
        params = {
            isAction = true,
            event = DeviceSettings,
        }
    }
    exports['qb-menu']:openMenu(nikoffMenu)
end

function DeviceSettings(open)
    UpdateCameraData(currentCamera)

    local nikoffMenu = {
        {
            header = 'Nikoff G900 Device Settings',
            isMenuHeader = true,
        }
    }

    nikoffMenu[#nikoffMenu+1] = {
        header = ('Display Overlay:&nbsp%s'):format(deviceSettings.showOverlay and '<p style="color:Gold;"><strong>ENABLED<strong></p>' or '<p style="color:LightCoral;"><strong>DISABLED<strong></p>'),
        params = {
            isAction = true,
            event = function()
                deviceSettings.showOverlay = not deviceSettings.showOverlay
                DeviceSettings()
            end,
        }
    }

    nikoffMenu[#nikoffMenu+1] = {
        header = ('Display Timestamp:&nbsp%s'):format(deviceSettings.showTimestamp and '<p style="color:Gold;"><strong>ENABLED<strong></p>' or '<p style="color:LightCoral;"><strong>DISABLED<strong></p>'),
        params = {
            isAction = true,
            event = function()
                deviceSettings.showTimestamp = not deviceSettings.showTimestamp
                DeviceSettings()
            end,
        }
    }

    nikoffMenu[#nikoffMenu+1] = {
        header = ('Enable Flash:&nbsp%s'):format(deviceSettings.flashEnabled and '<p style="color:Gold;"><strong>ENABLED<strong></p>' or '<p style="color:LightCoral;"><strong>DISABLED<strong></p>'),
        params = {
            isAction = true,
            event = function()
                deviceSettings.flashEnabled = not deviceSettings.flashEnabled
                DeviceSettings()
            end,
        }
    }
    
    nikoffMenu[#nikoffMenu+1] = {
        header = ('Image Upload:&nbsp%s'):format(deviceSettings.uploadPath ~= 1 and '<p style="color:Gold;"><strong>ENABLED<strong></p>' or '<p style="color:LightCoral;"><strong>DISABLED<strong></p>'),
        params = {
            isAction = true,
            event = ChangeUpload,
        }
    }

    nikoffMenu[#nikoffMenu+1] = {
        header = 'View Image Space',
        params = {
            isAction = true,
            event = SelectImageSpace,
        }
    }

    nikoffMenu[#nikoffMenu+1] = {
        header = 'View Onboard Photos',
        disabled = not deviceSettings.memoryCard,
        params = {
            isAction = true,
            event = ViewPhotos,
        }
    }

    local hdr = deviceSettings.memoryCard and 'Eject SD Card' or 'Insert SD Card'

    nikoffMenu[#nikoffMenu+1] = {
        header = hdr,
        params = {
            isAction = true,
            event = function()
                if deviceSettings.memoryCard then
                    local data = {info = {photos = table.clone(photos), name = deviceSettings.memoryCardName}}

                    TriggerServerEvent('evidence:server:sdcard', data)
                else
                    SelectSDCard()                   
                end
            end,
        }
    }

    nikoffMenu[#nikoffMenu+1] = {
        header = "Close (ESC)",
        params = {
            event = 'qb-menu:client:closeMenu',
        }
    }
    exports['qb-menu']:openMenu(nikoffMenu)
end

function SelectSDCard(open)
    if deviceSettings.memoryCard then DeviceSettings() return end

    local nikoffMenu = {
        {
            header = 'Select SD Card From Inventory',
            isMenuHeader = true,
        }
    }
    local PlayerData = QBCore.Functions.GetPlayerData()

    for k, v in pairs(PlayerData.items) do
        if v.name == 'sdcard' then
            local cardPhotos = v.info.photos and #v.info.photos or 0

            nikoffMenu[#nikoffMenu+1] = {
                header = v.info.name and ('SD Card: "%s"'):format(v.info.name) or 'Unnamed SD Card',
                text = ('Slot %s, Photos %s'):format(k, cardPhotos < maxPhotos and cardPhotos or cardPhotos >= maxPhotos and 'Currently Full'),
                params = {
                    isAction = true,
                    event = function()
                        if not deviceSettings.memoryCard then
                            local data = {slot = k}
       
                            TriggerServerEvent('evidence:server:sdcard', data)
                        end
                    end,
                }
            }
        end
    end
    
    nikoffMenu[#nikoffMenu+1] = {
        header = "Back",
        params = {
            event = DeviceSettings,
        }
    }
    exports['qb-menu']:openMenu(nikoffMenu)
end

-------------------------------------------------------------------------------------------
---------------------     CAMERA OVERLAY/GENERAL FUNCTIONS       --------------------------
-------------------------------------------------------------------------------------------

local function HideHUDThisFrame()
    HideHelpTextThisFrame()
    HideHudAndRadarThisFrame()
    HideHudComponentThisFrame(1) -- Wanted Stars
    HideHudComponentThisFrame(2) -- Weapon icon
    HideHudComponentThisFrame(3) -- Cash
    HideHudComponentThisFrame(4) -- MP CASH
    HideHudComponentThisFrame(6)
    HideHudComponentThisFrame(7)
    HideHudComponentThisFrame(8)
    HideHudComponentThisFrame(9)
    HideHudComponentThisFrame(13) -- Cash Change
    HideHudComponentThisFrame(11) -- Floating Help Text
    HideHudComponentThisFrame(12) -- more floating help text
    HideHudComponentThisFrame(15) -- Subtitle Text
    HideHudComponentThisFrame(18) -- Game Stream
    HideHudComponentThisFrame(19) -- weapon wheel
end

local function Overlay()
    SetTextScale(.9, .9)
    SetTextFont(2)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 190)
    SetTextEntry('STRING')
    SetTextCentre(true)
    AddTextComponentString('REC')
    EndTextCommandDisplayText(0.91,.08)
    DrawSprite('cameraoverlay', 'corner', 0.1, 0.15, .1, .2, 0, 255, 255, 255, 190)
    DrawSprite('cameraoverlay', 'corner', 0.9, 0.15, -.1, .2, 0, 255, 255, 255, 190)
    DrawSprite('cameraoverlay', 'corner', 0.1, 0.85, .1, -.2, 0, 255, 255, 255, 190)
    DrawSprite('cameraoverlay', 'corner', 0.9, 0.85, -.1, -.2, 0, 255, 255, 255, 190)
    DrawSprite('cameraoverlay', 'battery', 0.095, 0.11, .04, .04, 0, 255, 255, 255, 190)
    if camsecond == '1' or camsecond == '3' or camsecond == '5' or camsecond == '7' or camsecond == '9' then
        DrawSprite('mpinventory', 'in_world_circle', 0.88, 0.108, .025, .045, 0, 210, 0, 0, 190)
    end
    if deviceSettings.flashEnabled then DrawSprite('cameraoverlay', 'flash', 0.134, 0.11, .029, .04, 0, 255, 255, 255, 190) end
end     


local function NoMemoryWarning()
    if memopac == 0 then up = true elseif memopac == 190 then up = false end

    if not up then memopac = memopac - 1 else memopac = memopac + 1 end

    SetTextScale(.7, .7)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 0, 0, memopac)
    SetTextEntry('STRING')
    SetTextCentre(false)
    AddTextComponentString('No Memory Available')
    EndTextCommandDisplayText(0.445, 0.475)

    SetTextScale(.7, .7)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 0, 0, memopac)
    SetTextEntry('STRING')
    SetTextCentre(false)
    AddTextComponentString('Please Select Image Space or Insert SD Card')
    EndTextCommandDisplayText(0.375, 0.525)
end

local function MemoryFullWarning()
    if memopac == 0 then up = true elseif memopac == 190 then up = false end

    if not up then memopac = memopac - 1 else memopac = memopac + 1 end

    SetTextScale(.7, .7)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 0, 0, memopac)
    SetTextEntry('STRING')
    SetTextCentre(false)
    AddTextComponentString('Internal Memory Is Full')
    EndTextCommandDisplayText(0.072, 0.145)
end
            
local function Timestamp()
    SetTextScale(.7, .7)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 190)
    SetTextEntry('STRING')
    SetTextCentre(false)
    AddTextComponentString(camdate)
    EndTextCommandDisplayText(0.07, 0.87)
end

local function DisplaySettingsKey(opac)
    SetTextScale(.7, .7)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, opac or 190)
    SetTextEntry('STRING')
    SetTextCentre(false)
    AddTextComponentString('Menu [E]')
    EndTextCommandDisplayText(0.87, 0.87)
end

local function DisplayUploadPath(opac)
    SetTextScale(.7, .7)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, opac or 190)
    SetTextEntry('STRING')
    SetTextCentre(false)
    AddTextComponentString(('Saving To: %s'):format(deviceSettings.uploadPathDisplay))
    EndTextCommandDisplayText(0.07, 0.82)
end

local function CloseCam()
    SetStreamedTextureDictAsNoLongerNeeded('cameraoverlay')
    SetStreamedTextureDictAsNoLongerNeeded('mpinventory')
    ClearTimecycleModifier()
    nikon_fov = (nikon_fov_max+nikon_fov_min)*0.5

    if not inveh then
        SetFollowPedCamViewMode(savedcam)
        RenderScriptCams(false, false, 0, 1, 0)
        DestroyCam(nikon_cam, false)

        local resetCoords = GetEntityCoords(ped)

        ClearPedTasks(ped)
        SetEntityCoords(ped, resetCoords.x, resetCoords.y, resetCoords.z - 1)
    else
        CellCamActivate(false, false)
        DestroyMobilePhone()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})

        inveh = false
    end

    UpdateCameraData(currentCamera)
    LoadCameraData(false)

    currentCamera = false
    currentCamSecond = false
    nikon = false
end

local function CamLoop()
    currentCamSecond = camsecond
    local displaySettingsOpac = 190
    displayUploadPathOpac = 190

    TriggerServerEvent('evidence:server:setinvbusy', true)

    while nikon and (usingscenario or (inveh and vehicle)) do       
        DisableControlAction(0, 200) -- escape/map
        DisableControlAction(1, 200) -- escape/map
        DisableControlAction(2, 200) -- escape/map
        DisableControlAction(0, 241)
        DisableControlAction(1, 241)
        DisableControlAction(0, 242)
        DisableControlAction(1, 242)
        DisableControlAction(2, 241)
        DisableControlAction(2, 242)
        DisableControlAction(0, 83)
        DisableControlAction(1, 83)
        DisableControlAction(2, 83)
        DisableControlAction(0, 84)
        DisableControlAction(1, 84)
        DisableControlAction(2, 84)
        DisableControlAction(0, 25)
        DisableControlAction(1, 25)
        DisableControlAction(2, 25)
        DisableControlAction(0, 51)
        DisableControlAction(1, 51)
        DisableControlAction(2, 51)

        if displaySettingsOpac > 0 or displayUploadPathOpac > 0 then
            if displaySettingsOpac > 0 then displaySettingsOpac = displaySettingsOpac - 1 end
            if displayUploadPathOpac > 0 then displayUploadPathOpac = displayUploadPathOpac - 1 end
            DisplaySettingsKey(displaySettingsOpac) 
            DisplayUploadPath(displayUploadPathOpac)
        end
        HideHUDThisFrame() -- hide gta hud
        if deviceSettings.showOverlay then Overlay() end -- display cam frame and battery
        if deviceSettings.showTimestamp then Timestamp() end -- display cam timestamp
        if deviceSettings.uploadImages and deviceSettings.uploadPath then DisplayUpload() end
        if not deviceSettings.memoryCard and deviceSettings.uploadPath == 1 then NoMemoryWarning() noMemory = true else noMemory = false end
        if deviceSettings.memoryCard and curPhotos >= maxPhotos then MemoryFullWarning() noMemory = true else noMemory = false end

        if IsControlJustReleased(0, storeNikonKey) or (not IsNuiFocused() and IsDisabledControlJustReleased(0, 200)) then -- escape loop
            break
        end

        if IsControlJustReleased(0, 177) or IsControlJustReleased(0, 157) or IsControlJustReleased(0, 158) or IsControlJustReleased(0, 160) or IsControlJustReleased(0, 164) or IsControlJustReleased(0, 165) or IsControlJustReleased(0, 159) then
            break
        end

        if IsControlJustReleased(0, 23) then
            deviceSettings.flashEnabled = not deviceSettings.flashEnabled
        end

        if IsControlJustReleased(0, 24) and not noMemory and ValidUploadPath(deviceSettings.uploadPath) then -- take photo

            if deviceSettings.flashEnabled then

                RequestNamedPtfxAsset("scr_bike_business")
                UseParticleFxAssetNextCall("scr_bike_business")

                Ptfx = StartNetworkedParticleFxLoopedOnEntityBone("scr_bike_cfid_camera_flash", GetCurrentPedWeaponEntityIndex(ped or PlayerPedId()), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, GetEntityBoneIndexByName("scr_bike_cfid_camera_flash", "VFX"), 1065353216, 0, 0, 0, 1065353216, 1065353216, 1065353216, 0)
            end

            CreateThread(TakePhoto)
            PlaySoundFrontend(-1, "Camera_Shoot", "Phone_Soundset_Franklin", false)
        elseif IsControlJustReleased(0, 24) then
            PlaySoundFrontend(-1, "5_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", false)
        end

        if IsDisabledControlJustReleased(0, 51) then -- open camera settings
            DeviceSettings()
        end

        if not inveh then -- handles camera when on foot, cell phone camera covers these functions otherwise
            local nikon_zoomvalue = (1.0/(nikon_fov_max-nikon_fov_min))*(nikon_fov-nikon_fov_min)
            CheckInputRotation(nikon_cam, nikon_zoomvalue)
            HandleZoom(nikon_cam)
        end

        Wait(0)
    end

    TriggerServerEvent('evidence:server:setinvbusy', false)

    CloseCam() -- when loop breaks close camera
end

-------------------------------------------------------------------------------------------
---------------------          CAMERA EVENT HANDLERS             --------------------------
-------------------------------------------------------------------------------------------

RegisterNetEvent("evidence:client:receivenetphotos", function(photopackage, nextpage)
    local nikoffMenu = {
        {
            header = ('Viewing %s'):format(Config.Camera[curImageSpace].Path or 'Image Space'),
            isMenuHeader = true,
        }
    }

    if photopackage and next(photopackage) then
        if curPage > 1 then
            nikoffMenu[#nikoffMenu+1] = {
                header = '<-- Previous Page',
                params = {
                    isAction = true,
                    event = function()
                        curPage = curPage - 1 
                        TriggerServerEvent('evidence:server:fetchnetphotos', {imageSpace = curImageSpace, page = curPage, amount = curAmount or 20, password = curPassword})                
                    end,

                }
            }          
        end

        for i = 1, #photopackage, 1 do     
            if photopackage[i] then
                local v = table.clone(photopackage[i])
                v.photoId = i
                v.imageSpace = true

                nikoffMenu[#nikoffMenu+1] = {
                    header = ('<img src="%s" style="max-width: 250px;" />'):format(v.url),
                    text = ('Taken: %s</br> Uploaded: %s'):format(v.exif[2].value, v.exif[4].value or 'false'),
                    params = {
                        isAction = true,
                        event = ManagePhoto,
                        args = v,
                    }
                }
            end
        end

        if nextpage then 
            nikoffMenu[#nikoffMenu+1] = {
                header = 'Next Page -->',
                params = {
                    isAction = true,
                    event = function()
                        curPage = curPage + 1
                        TriggerServerEvent('evidence:server:fetchnetphotos', {imageSpace = curImageSpace, page = curPage, amount = curAmount or 20, password = curPassword})                
                    end,

                }
            }          
        end

    else
        nikoffMenu[#nikoffMenu+1] = {
            header = 'No photos found.',
            disabled = true,
        }
    end



    nikoffMenu[#nikoffMenu+1] = {
        header = "Back",
        params = {
            isAction = true,
            event = DeviceSettings,
        }
    }

    exports['qb-menu']:openMenu(nikoffMenu)

end)

RegisterNetEvent("evidence:client:confirmeject", function(data)
    photos = {}
    deviceSettings.memoryCard = false
    deviceSettings.memoryCardName = nil
    DeviceSettings()
end)

RegisterNetEvent("evidence:client:confirminsert", function(data)
    photos = data.photos or {}
    deviceSettings.memoryCard = true
    deviceSettings.memoryCardName = data.name
    curPhotos = #photos 
    if not usedSD then DeviceSettings() else Config.Functions.Notify('SD Card has been inserted!') usedSD = false end
end)

RegisterNetEvent('evidence:client:time', function(printdate, time, date)
    ostime = time
    camdate = date
    displaydate = printdate
    camsecond = string.sub(camdate, 27, 27)
end)

RegisterNetEvent("nikon:useSDCard", function(slot)
    if nikon and currentCamSecond and not deviceSettings.memoryCard then
        local data = {slot = slot}
        usedSD = true
       
        TriggerServerEvent('evidence:server:sdcard', data)
    elseif nikon and currentCamSecond and deviceSettings.memoryCard then
        Config.Functions.Notify('This camera already has an SD card inserted!', 'error')
        return 
    else
        local PlayerData = QBCore.Functions.GetPlayerData()
        
        if (PlayerData.items[slot] and PlayerData.items[slot].info and PlayerData.items[slot].info.name) or (not PlayerData.items[slot].info and not PlayerData.items[slot].info.name) then
            SDcard(slot)
        else
            RenameSD(slot)
        end
    end
end)

RegisterNetEvent('nikon:Toggle', function(slot, coreid)
    if nikon and not currentCamSecond then return end

    if coreid then slot = GetCoreSlot(coreid) end

    if not slot and coreid then print('You are using core inventory and script is unable to find the item slot for the camera you used. Please consider a different inventory.') return end

    if nikon and IsControlPressed(0, 21) or IsControlPressed(1, 21) or IsControlPressed(2, 21) then
        local PlayerData = QBCore.Functions.GetPlayerData()



        photos = PlayerData.items[slot] and PlayerData.items[slot].info.photos

        LoadCameraData(slot, coreid)

        DeviceSettings()
    elseif not nikon  then
        nikon = true

        LoadCameraData(slot, coreid)

        if GetPedConfigFlag(ped, 194) then
            prevCoords = GetEntityCoords(ped)
            ClearPedTasks(ped)
            SetEntityCoords(ped, prevCoords.x, prevCoords.y, prevCoords.z - 1.0)

            Wait(2000) -- wait for the previous scenario to end, ped will not recieve the papparazi scenario until it has fully ended
        else
            ClearPedTasks(ped)
        end

        if IsPedArmed(ped, -1) then
            SetCurrentPedWeapon(ped, `weapon_unarmed`, true)
            TriggerEvent('weapons:client:SetCurrentWeapon', nil, false)
           
            Wait(100)

            while IsPedArmed(ped, -1) do
                Wait(200)
            end
        end

        Wait(200)

        if not IsPedInAnyVehicle(ped) then
            TaskStartScenarioInPlace(ped, "WORLD_HUMAN_PAPARAZZI", 0, 1)
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"camera"})
        end

        RequestStreamedTextureDict('cameraoverlay')
        RequestStreamedTextureDict('mpinventory')

        Wait(1500)

        SetTimecycleModifier("default")
        SetTimecycleModifierStrength(0.3)
        
        if not vehicle then
            inveh = false
            savedcam = GetFollowPedCamViewMode()
            SetFollowPedCamViewMode(4)

            nikon_cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true)
            AttachCamToEntity(nikon_cam, ped, 0.0, 0.65, 0.68, true)
            SetCamRot(nikon_cam, 0.0,0.0,GetEntityHeading(ped))
            SetCamFov(nikon_cam, nikon_fov)
            RenderScriptCams(true, false, 0, 1, 0)
        else
            inveh = true
            CreateMobilePhone(0)
            CellCamActivate(true, true)
        end
        
        CamLoop()
    else
        CloseCam()
    end
end)


-------------------------------------------------------------------------------------------
---------------------                    THREADS                 --------------------------
-------------------------------------------------------------------------------------------

CreateThread(function() -- main thread
	while true do
        if LocalPlayer.state.isLoggedIn then
            PlayerData = QBCore.Functions.GetPlayerData()

	        ped = PlayerPedId()   
            vehicle = IsPedSittingInAnyVehicle(ped)
            usingscenario = IsPedUsingScenario(ped, "WORLD_HUMAN_PAPARAZZI") -- check to make sure they are actually using the scenario

            if PlayerData.metadata['inlaststand'] or PlayerData.metadata['isdead'] then
                nikon = false            
            end
        end

        Wait(1000)
	end
end)
