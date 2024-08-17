RegisterKeyMapping("+chat", "Show chat", "KEYBOARD", Config.ShowChatKey)
RegisterCommand("+chat", function()
    TriggerEvent("chat:show")
end)