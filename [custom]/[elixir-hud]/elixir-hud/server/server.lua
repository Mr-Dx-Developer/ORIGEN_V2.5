local CodeID = {
    author = "Elixir FW",
    codeName = 'HUD V2 System 4.0',
    version = '2.2.0'
  }
  
  Citizen.CreateThread(function()
    print(CodeID.author .. ' - [' .. CodeID.codeName .. '] v' .. CodeID.version .. ' sucessfully started!')
  end)