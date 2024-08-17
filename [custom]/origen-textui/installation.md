---
description: AC Text UI Installation Document
---

# Installation

## How to use ?


## Creating Normal Zone (Only Client)
```lua
Put this on top of your client side and you don't need to do anything else. This is for classic cordinates

This is for spesific coord text-ui
CreateThread(function()
    exports['origen-textui']:AddTextUIPed(vector3(x, y, z), 'Key (E)', 'Text (Talk with Trevor)', distance: 2.5)
end)

Also you can add for peds on cfg.lua, but you should know this script is creating peds by own!
```

## New Drawtext Update
```lua
    exports['qb-core']:DrawText('message') => exports['origen-textui']:drawText('E', 'Open Door')

    exports['qb-core']:HideText() => exports['origen-textui']:drawTextClose()

    exports['qb-core']:KeyPressed() => exports['origen-textui']:drawTextPress()

    exports['qb-core']:ChangeText('message') => exports['origen-textui']:changeText('Close Door')
```