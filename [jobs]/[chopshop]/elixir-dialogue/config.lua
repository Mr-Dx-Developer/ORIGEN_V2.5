Config = {}

Config.npcs = {
    -- {
    --     name = "Manav Hilmiye",
    --     text = "Selam, Meyvem Var! Almak ister misin?",
    --     job = "Manav",
    --     ped = "a_f_m_beach_01",
    --     coords = vector4(447.66, -988.27, 29.69, 18.59),
    --     options = {
    --         {
    --             label = "Evet",
    --             event = "e clubdans7",
    --             type = "command",
    --             args = {'1'} -- Komut için argümanlar
    --         },
    --         {
    --             label = "Hayir!",
    --             event = "e clubdans7",
    --             type = "command",
    --             args = {'1'} -- Komut için argümanlar
    --         },
    --         {
    --             label = "Jim'i Ariyorum",
    --             event = "e clubdans7",
    --             type = "command",
    --             args = {'1'} -- Komut için argümanlar
    --         },
    --         {
    --             label = "Bana Bir Arac Lazim",
    --             event = "e clubdans7",
    --             type = "command",
    --             args = {'1'} -- Komut için argümanlar
    --         }
    --     }
    -- },
    -- {
    --     name = "Nexus Tester",
    --     text = "Merhaba, Taksi Nerden Bulabilirim ?",
    --     job = "Sporcu",
    --     ped = "a_f_m_bodybuild_01",
    --     coords = vector4(443.73, -988.05, 29.69, 300.07),
    --     options = {
    --         {
    --             label = "Defol Git Basimdan",
    --             event = "e clubdans7",
    --             type = "command", -- Komut veya Event
    --             args = {'1'} -- Komut için argümanlar
    --         },
    --         {
    --             label = "Bilmiyorum Malesef",
    --             event = "e clubdans7",
    --             type = "event",-- Komut veya Event
    --             args = {'2'} -- Komut için argümanlar
    --         }
    --     }
    -- },
    -- {
    --     name = "Origen Development",
    --     text = "Bu akşam Ne yapayım?",
    --     job = "Hayat Kadini",
    --     ped = "a_f_m_eastsa_01",
    --     coords = vector4(443.29, -985.74, 29.69, 278.59),
    --     options = {
    --         {
    --             label = "Tavuk",
    --             event = "e clubdans7",
    --             type = "command",
    --             args = {'1'} -- Komut için argümanlar
    --         },
    --         {
    --             label = "Pilav",
    --             event = "e clubdans7",
    --             type = "command",
    --             args = {'2'} -- Komut için argümanlar
    --         },
    --         {
    --             label = "şalgam",
    --             event = "e clubdans7",
    --             type = "command",
    --             args = {'2'} -- Komut için argümanlar
    --         }
    --     }
    -- },
    {
        name = "Elixir FW",
        text = "What do you want, mate?",
        job = "Chop Shop",
        ped = "a_m_y_hippy_01",
        coords = vector4(203.9, -2017.5, 17.57, 278.21),
        options = {
            {
                label = "I want to work",
                event = "elixir-chopshop:jobaccept",
                type = "client",
                args = {'1'} 
            },
            {
                label = "Sell??",
                event = "elixir-chopshop:selljod",
                type = "client",
                args = {'2'}
            },
            {
                label = "Leave conversation",
                event = "e wave2",
                type = "command",
                args = {'3'}
            }
        }
    }
}