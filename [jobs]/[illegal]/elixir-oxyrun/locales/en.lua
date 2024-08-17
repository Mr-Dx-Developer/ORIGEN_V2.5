-- ElixirFW

local Translations = {
    error = {
        ["canceled"]                    = "It is cancelled..",
        ["someone_recently_did_this"]   = "Someone did this recently..",
        ["cannot_do_this_right_now"]    = "I can't do this right now..",
        ["does_not_speak"]              = "There is no package to give.",
        ["you_cannot_do_this"]          = "You can not do this..",
        ["you_dont_have_enough_money"]  = "You have not enough money..",
        ["no_package"]  = "you don't hold a package..",
        ["no_oxy"]  = "you don't say..",
        ["occupied_routes"]  = "All the routes are full now, then try again..",
    },
    success = {
        ["you_have_arrived"]              = "You came to the marked place, wait for customers..",
        ["location_marked"]     = "Go to Location marked in your GPS.",
        ["suppliers_position"]                        = "The location of the suppliers was marked in your GPS..",
        ["send_email_right_now"]                 = "I send an e -mail now..",
        ["start_run"]                 = "You have logged in, buy yourself a vehicle..",
    },
    mailstart = {
        ["sender"]                      = "Unknown",
        ["subject"]                     = "Special Delivery",
        ["message"]                     = "Thank you for helping me, you will be generously rewarded! Find yourself a tool to reach the supplier.Make sure you arrive there in time and you have started selling it alone, otherwise you will scare customers!",
    },
    mailfinish = {
        ["sender"]                      = "Unknown",
        ["subject"]                     = "Special Delivery",
        ["message"]                     = "You did a great favor to me!Come back to me when you're ready for more!",
    },
    target = {
        ["oxyboss"]                      = "Start",
        ["oxysupplier"]                  = "I have a",
        ["handoff_package"]              = "Leave the package",
    },
    progress = {
        ["talking_to_boss"]                  = "Speaking..",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

-- ElixirFW
