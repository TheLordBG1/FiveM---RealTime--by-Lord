ESX = nil

Citizen.CreateThread(function ()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
 	PlayerData = ESX.GetPlayerData()
  end
end)

local showTime = true -- Настройка за това дали да се показва времето автоматично при влизане. При false щес е показва само когато се използва командата.
local Command = "time" -- Името на командата за показване на времето.
print"=======Time script by Lord======="

RegisterCommand(Command, function(source, args, rawCommand)
    if showTime then 
        showTime = false
        EnableGui("notToBe")
    else
        showTime = true
        EnableGui("toBe")
    end
end)

function EnableGui(toBeOrNotToBe)
    SendNUIMessage({
        stance = toBeOrNotToBe,
        codetopass = "TurnOn"
    })
end
