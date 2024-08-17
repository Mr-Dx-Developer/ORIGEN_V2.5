Koci               = {}
Koci.Framework     = Utils.Functions:GetFramework()
Koci.FrameworkName = Utils.Functions:GetFrameworkName()
Koci.Utils         = Utils.Functions
Koci.Server        = {
    Players = {}
}
Koci.Callbacks     = {}

function Koci.Server:RegisterServerCallback(key, func)
    Koci.Callbacks[key] = func
end

function Koci.Server:TriggerCallback(key, source, payload, cb)
    if not cb then
        cb = function() end
    end

    if Koci.Callbacks[key] then
        Koci.Callbacks[key](source, payload, cb)
    end
end

gMusics = {}
