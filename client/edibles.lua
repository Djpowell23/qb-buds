local QBCore = exports["qb-core"]:GetCoreObject()

local OnEdibles = false 
local RelieveCount = 0

-- Weed Brownie --
RegisterNetEvent("qb-buds:eatweedbrownie")
AddEventHandler("qb-buds:eatweedbrownie", function()
    OnEdibles = true
    
    CreateThread(function()
        while OnEdibles do
            Citizen.Wait(Config.BrownieReliefInterval * 1000)
            TriggerServerEvent('hud:server:RelieveStress', math.random(Config.BrownieMinStress, Config.BrownieMaxStress))
            RelieveCount = RelieveCount + 1
            if RelieveCount == Config.BrownieMaxReliefCount then
                if OnEdibles then
                    OnEdibles = false
                    RelieveCount = 0
                end
            end
        end
    end)
end)

-- Weed Gummy --
RegisterNetEvent("qb-buds:eatweedgummy")
AddEventHandler("qb-buds:eatweedgummy", function()
    OnEdibles = true
    
    CreateThread(function()
        while OnEdibles do
            Citizen.Wait(Config.GummyReliefInterval * 1000)
            TriggerServerEvent('hud:server:RelieveStress', math.random(Config.GummyMinStress, Config.GummyMaxStress))
            RelieveCount = RelieveCount + 1
            if RelieveCount == Config.GummyMaxReliefCount then
                if OnEdibles then
                    OnEdibles = false
                    RelieveCount = 0
                end
            end
        end
    end)

end)

-- Joints --
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
    end, function()
        QBCore.Functions.Notify("Cancelled...", "error")
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