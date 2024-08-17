Utils = {}
Utils.Functions = {}

---@param name string resource name
---@return boolean
function Utils.Functions:hasResource(name)
    return GetResourceState(name):find("start") ~= nil
end

--- Get framework used by the server
--- @return object
function Utils.Functions:GetFramework()
    if Utils.Functions:hasResource("qb-core") then
        return exports["qb-core"]:GetCoreObject()
    end
    if Utils.Functions:hasResource("es_extended") then
        return exports["es_extended"]:getSharedObject()
    end
end

function Utils.Functions:GetFrameworkName()
    if Utils.Functions:hasResource("qb-core") then
        return "qb"
    end
    if Utils.Functions:hasResource("es_extended") then
        return "esx"
    end
end
