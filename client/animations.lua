exports['qb-core']:GetCoreObject()

local SmokingWeed = false 
local RelieveCount = 0

-- Emote Stuff -- 
RegisterNetEvent('animations:client:SmokeWeed')
AddEventHandler('animations:client:SmokeWeed', function()
  SmokingWeed = true
  Citizen.CreateThread(function()
    while SmokingWeed do
      Citizen.Wait(Config.JointReliefInterval * 1000)
      TriggerServerEvent('hud:server:RelieveStress', math.random(Config.NormalJointMinStress, Config.NormalJointMaxStress))
      RelieveCount = RelieveCount + 1
      if RelieveCount == Config.JointMaxReliefCount then
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

RegisterNetEvent('animations:client:SmokeCaramelo')
AddEventHandler('animations:client:SmokeCaramelo', function()
  SmokingWeed = true
  Citizen.CreateThread(function()
    while SmokingWeed do
      Citizen.Wait(Config.JointReliefInterval * 1000)
      TriggerServerEvent('hud:server:RelieveStress', math.random(Config.CarameloMinStressRelief, Config.CarameloMaxStressRelief))
      RelieveCount = RelieveCount + 1
      if RelieveCount == Config.JointMaxReliefCount then
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
      Citizen.Wait(Config.JointReliefInterval * 1000)
      TriggerServerEvent('hud:server:RelieveStress', math.random(Config.MedicalMinStressRelief, Config.MedicalMaxStressRelief))
      SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + Config.MedicalHealingAmount)
      RelieveCount = RelieveCount + 1
      if RelieveCount == Config.JointMaxReliefCount then
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
      Citizen.Wait(Config.JointReliefInterval * 1000)
      TriggerServerEvent('hud:server:RelieveStress', math.random(Config.HeavenMinStressRelief, Config.HeavenMaxStressRelief))
      RelieveCount = RelieveCount + 1
      if RelieveCount == Config.JointMaxReliefCount then
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