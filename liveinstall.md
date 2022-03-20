## qb-bossmenu:config.lua
['bestbuds'] = vector3(374.27, -823.49, 29.3)

## Move Images from images folder to lj-inventory

## qb-smallresources:server:main.lua (or delete if moved internally)
QBCore.Functions.CreateUseableItem("caramelojoint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseCarameloJoint", src)
    end
end)

QBCore.Functions.CreateUseableItem("medicaljoint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseMedicalJoint", src)
    end
end)

QBCore.Functions.CreateUseableItem("hazeheavenjoint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseHazeHeavenJoint", src)
    end
end)

## qb-smallresources:client:main.lua (or delete if moved internally)
RegisterNetEvent('consumables:client:UseCarameloJoint', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting joint..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["caramelojoint"], "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeCaramelo')
    end)
end)

RegisterNetEvent('consumables:client:UseMedicalJoint', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting joint..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["medicaljoint"], "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeMedical')
    end)
end)

RegisterNetEvent('consumables:client:UseHazeHeavenJoint', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting joint..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hazeheavenjoint"], "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeHeaven')
    end)
end)

## dpemotes:client:emote.lua (delete because moved internally)
RegisterNetEvent('animations:client:SmokeCaramelo')
AddEventHandler('animations:client:SmokeCaramelo', function()
  SmokingWeed = true
  Citizen.CreateThread(function()
    while SmokingWeed do
      Citizen.Wait(10000)
      TriggerServerEvent('hud:server:RelieveStress', math.random(5, 7))
      RelieveCount = RelieveCount + 1
      if RelieveCount == 6 then
        if ChosenDict == "MaleScenario" and IsInAnimation then
          ClearPedTasksImmediately(PlayerPedId())
          IsInAnimation = false
          DebugPrint("Forced scenario exit")
        elseif ChosenDict == "Scenario" and IsInAnimation then
          ClearPedTasksImmediately(PlayerPedId())
          IsInAnimation = false
          DebugPrint("Forced scenario exit")
        end

        if IsInAnimation then
          ClearPedTasks(PlayerPedId())
          DestroyAllProps()
          IsInAnimation = false
        end

        if SmokingWeed then
          SmokingWeed = false
          RelieveCount = 0
        end
      end
    end
  end)
end)

RegisterNetEvent('animations:client:SmokeMedical')
AddEventHandler('animations:client:SmokeMedical', function()
  SmokingWeed = true
  Citizen.CreateThread(function()
    while SmokingWeed do
      Citizen.Wait(10000)
      TriggerServerEvent('hud:server:RelieveStress', math.random(11, 12))
      RelieveCount = RelieveCount + 1
      if RelieveCount == 6 then
        if ChosenDict == "MaleScenario" and IsInAnimation then
          ClearPedTasksImmediately(PlayerPedId())
          IsInAnimation = false
          DebugPrint("Forced scenario exit")
        elseif ChosenDict == "Scenario" and IsInAnimation then
          ClearPedTasksImmediately(PlayerPedId())
          IsInAnimation = false
          DebugPrint("Forced scenario exit")
        end

        if IsInAnimation then
          ClearPedTasks(PlayerPedId())
          DestroyAllProps()
          IsInAnimation = false
        end

        if SmokingWeed then
          SmokingWeed = false
          RelieveCount = 0
        end
      end
    end
  end)
end)

RegisterNetEvent('animations:client:SmokeHeaven')
AddEventHandler('animations:client:SmokeHeaven', function()
  SmokingWeed = true
  Citizen.CreateThread(function()
    while SmokingWeed do
      Citizen.Wait(10000)
      TriggerServerEvent('hud:server:RelieveStress', math.random(17, 18))
      RelieveCount = RelieveCount + 1
      if RelieveCount == 6 then
        if ChosenDict == "MaleScenario" and IsInAnimation then
          ClearPedTasksImmediately(PlayerPedId())
          IsInAnimation = false
          DebugPrint("Forced scenario exit")
        elseif ChosenDict == "Scenario" and IsInAnimation then
          ClearPedTasksImmediately(PlayerPedId())
          IsInAnimation = false
          DebugPrint("Forced scenario exit")
        end

        if IsInAnimation then
          ClearPedTasks(PlayerPedId())
          DestroyAllProps()
          IsInAnimation = false
        end

        if SmokingWeed then
          SmokingWeed = false
          RelieveCount = 0
        end
      end
    end
  end)
end)

## qb-smallresources:server:main.lua (change joint to req a lighter)
QBCore.Functions.CreateUseableItem("joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player.Functions.GetItemByName("lighter") then
        if Player.Functions.RemoveItem(item.name, 1, item.slot) then
            TriggerClientEvent("consumables:client:UseJoint", src)
        end    
    else
        TriggerClientEvent("QBCore:Notify", source, "You don't have a lighter", "error")
    end
end)