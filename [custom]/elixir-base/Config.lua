Config = {

    Framework = "QBCORE", -- ESX/QBCORE

    ApplicationID = 907254021360873483, -- Your Application Id (Join discord if you dont know how to change)
    UpdateTime = 60, -- In Seconds (For best optimalization keep 60 seconds.)

    UpdateCheck = true,

    -- SERVER
    -- {ServerPlayers} : Show count all conected players

    -- PLAYER
    -- {PlayerID} : Show Player ID
    -- {PlayerName} : Show Player NAME

    -- CHARACTER
    -- {PlayerCharacterFirstName} : Show Player Character First Name
    -- {PlayerCharacterLastName} : Show Player Character Last Name
    -- {PlayerCharacterGender} : Show Player Character Sex (Male/Female)
    -- {PlayerCharacterJob} : Show Player Character Job
    -- {PlayerCharacterHealth} : Show Player Character Health

    -- {PlayerCharacterStreet} = Show name of the street where the player is currently located (Bridge Street, ...)
    -- {PlayerCharacterArea} = Show name of the area where the player is currently located (East Vinevwood, ...)

    Text = '{PlayerName} - {ServerPlayers} | ID: {PlayerID}',

    BigAsset = {
        ID = 'big', -- Big asset ID for name in the discord developer portal
        Text = 'Buy Now!!' -- Big asset text (showed in the discord)
    },

    SmallAsset = {
        ID = 'small', -- Small asset ID for name in the discord developer portal
        Text = 'Origen Developments' -- Small asset text (showed in the discord)
    },

    FirstButton = {
        Enabled = true,
        Text = 'Discord', -- First button link
        Link = 'https://discord.gg/xGajyNamxe' -- Second button link
    },

    SecondButton = {
        Enabled = true,
        Text = 'YT Preview', -- Second button text
        Link = 'https://youtu.be/T45LXdM69qQ' -- Second button link
    }
}

ConfigANTILAG = {
    -- 21 (Left Shift by default)
twoStepControl = 21,
    
    -- Add Vehicles to this list to allow the 2step/Anti-lag engagement -- Put more cars into one line to save vertical space
TwoStepCars = {
"t20", "gtr", "zack"
}
}
