function checkNSend(result, cb)
    if result ~= nil then
        cb(result)
    else
        cb({})
    end
end

function contains(table, value)
    for k,v in pairs(table) do
        if (v == value) then return true end
    end
    return false
end
