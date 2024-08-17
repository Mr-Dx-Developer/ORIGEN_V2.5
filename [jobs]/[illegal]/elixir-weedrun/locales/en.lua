-- ElixirFW

local Translations = {
    error = {
        ["canceled"]                    = "It is cancelled..",
        ["someone_recently_did_this"]   = "Someone did this recently..",
        ["cannot_do_this_right_now"]    = "I can't do this right now..",
        ["you_cannot_do_this"]          = "You can not do this..",
        ["you_dont_have_enough_money"]  = "You have not enough money..",
        ["no_package"]  = "You don't hold a package..",
        ["no_packages"]  = "You have no grass package to be delivered",
        ["no_green"]  = "You don't have enough green friends",
        ["stay_near"]  = "Stay a little nearby while I pack this",
        ["sign_out"]  = "You signed..",
        ["no_refund"]  = "No return!",
    },
    success = {
        ["collect_package"]                        = "You can collect the material now",
        ["send_email_right_now"]                 = "I send an e -mail now..",
        ["there_u_go"]                           = "Buyrun!",
    },
    mailstart = {
        ["sender"]                      = "Unknown",
        ["subject"]                     = "Weed",
        ["message"]                     = "The position of the customer will be periodically marked in your GPS, will go to them, deliver a processed grass package and another will be marked.Continue to do this until there are no more customers or the packages to be delivered are finished, after a while all GPS locations and so on.will be removed and you will have to start a new one.",
    },
    target = {
        ["weedboss"]                      = "Start",
        ["package_goods"]                  = "Package templates",
        ["collect_goods"]                  = "Packcollect Package Products",
        ["deliver_package"]               = "DELIVER THE PACKAGE",
        ["sign_out_target"]              = "Log out",
        ["sign_out_target2"]              = "Log out",
    },
    progress = {
        ["weighing_package"]                      = "Weighing package..",
        ["counting_bills"]                  = "Count the bills..",
        ["preparing_run"]                  = "Preparing to run..",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

-- ElixirFW
