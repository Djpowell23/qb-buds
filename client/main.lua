local QBCore = exports["qb-core"]:GetCoreObject()

isLoggedIn = true
PlayerJob = {}
onDuty = false
vehSpawnLocation = Config.VehicleSpawnLocation
SmokingWeed = false
RelieveCount = 0

-- Create blip
Citizen.CreateThread(function()
    BestBuds = AddBlipForCoord(377.57, -830.24, 29.3)
    SetBlipSprite (BestBuds, 469)
    SetBlipDisplay(BestBuds, 4)
    SetBlipScale  (BestBuds, 0.9)
    SetBlipAsShortRange(BestBuds, true)
    SetBlipColour(BestBuds, 25)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Best Buds")
    EndTextCommandSetBlipName(BestBuds)
end)

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "bestbuds" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
	onDuty = duty	
end)

RegisterNetEvent("qb-buds:DutyBuds")
AddEventHandler("qb-buds:DutyBuds", function()
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job 
		if PlayerData.job.name == 'bestbuds' then 
    		TriggerServerEvent("QBCore:ToggleDuty")
		else
			QBCore.Functions.Notify("You don't work here...")
		end
	end)
end)

RegisterNetEvent("qb-buds:Tray1")
AddEventHandler("qb-buds:Tray1", function()
	TriggerEvent("inventory:client:SetCurrentStash", "budstray1")
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "budstray1", {
		maxweight = 50000,
		slots = 10,
	})
end)

RegisterNetEvent("qb-buds:shop")
AddEventHandler("qb-buds:shop", function()
	if onDuty and QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then
		TriggerServerEvent("inventory:server:OpenInventory", "shop", "bestbuds", Config.Items)
	elseif not onDuty and QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then 
		QBCore.Functions.Notify("You must be on duty to access this")
	elseif QBCore.Functions.GetPlayerData(src).job.name ~= 'bestbuds' then 
		QBCore.Functions.Notify("You must work here to access this")
	end
end)

RegisterNetEvent("qb-buds:Storage")
AddEventHandler("qb-buds:Storage", function()
	if onDuty and QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then
		TriggerEvent("inventory:client:SetCurrentStash", "BudsStorage")
		TriggerServerEvent("inventory:server:OpenInventory", "stash", "BudsStorage", {
			maxweight = 600000,
			slots = 40,
		})
	elseif not onDuty and QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then 
		QBCore.Functions.Notify("You must be on duty to access this")
	elseif QBCore.Functions.GetPlayerData(src).job.name ~= 'bestbuds' then 
		QBCore.Functions.Notify("You must work here to access this")
	end
end)

-- EZ Storage
RegisterNetEvent("qb-buds:readyProduct")
AddEventHandler("qb-buds:readyProduct", function()
	if onDuty and QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then
		TriggerEvent("inventory:client:SetCurrentStash", "readyProduct")
		TriggerServerEvent("inventory:server:OpenInventory", "stash", "readyProduct", {
			maxweight = 1000000, -- 1,000
			slots = 40,
		})
	elseif not onDuty and QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then 
		QBCore.Functions.Notify("You must be on duty to access this")
	elseif QBCore.Functions.GetPlayerData(src).job.name ~= 'bestbuds' then 
		QBCore.Functions.Notify("You must work here to access this")
	end
end)

-- Grind Caramelo
RegisterNetEvent("qb-buds:grindCaramelo")
AddEventHandler("qb-buds:grindCaramelo", function()
    if onDuty and QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then
    	QBCore.Functions.TriggerCallback('qb-buds:server:get:ingredientgrindCaramelo', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Grinding Caramelo Nug...", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "caramelobud", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "empty_weed_bag", 5)
					TriggerServerEvent('QBCore:Server:AddItem', "caramelobag", 5)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["caramelobag"], "add")
                    			QBCore.Functions.Notify("You filled five bags of Caramelo weed", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled...", "error")
				end)
			else
   				QBCore.Functions.Notify("You don\'t have the ingredients to make this", "error")
			end
		end)
	elseif not onDuty and QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then 
		QBCore.Functions.Notify("You must be on duty to access this")
	elseif QBCore.Functions.GetPlayerData(src).job.name ~= 'bestbuds' then 
		QBCore.Functions.Notify("You must work here to access this")
	end
end)

--  Make Caramelo Joint
RegisterNetEvent("qb-buds:carameloJoint")
AddEventHandler("qb-buds:carameloJoint", function()
    if onDuty and QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then
    	QBCore.Functions.TriggerCallback('qb-buds:server:get:ingredientcarameloJoint', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Caramelo Joint...", 6000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "caramelobag", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "rolling_paper", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "caramelojoint", 1)
					TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["caramelojoint"], "add")
					QBCore.Functions.Notify("You made a Caramelo Joint", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled...", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	elseif not onDuty and QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then 
		QBCore.Functions.Notify("You must be on duty to access this")
	elseif QBCore.Functions.GetPlayerData(src).job.name ~= 'bestbuds' then 
		QBCore.Functions.Notify("You must work here to access this")
	end
end)

-- Grind Medical Mass
RegisterNetEvent("qb-buds:grindMedicalMass")
AddEventHandler("qb-buds:grindMedicalMass", function()
    if onDuty and QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then
    	QBCore.Functions.TriggerCallback('qb-buds:server:get:ingredientgrindMedicalMass', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Grinding Medical Mass Nug...", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "medicalmassbud", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "empty_weed_bag", 5)
					TriggerServerEvent('QBCore:Server:AddItem', "medicalbag", 5)
                    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["medicalbag"], "add")
                    			QBCore.Functions.Notify("You filled five bags of Medical Mass weed", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled...", "error")
				end)
			else
   				QBCore.Functions.Notify("You don\'t have the ingredients to make this", "error")
			end
		end)
	elseif not onDuty and QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then 
		QBCore.Functions.Notify("You must be on duty to access this")
	elseif QBCore.Functions.GetPlayerData(src).job.name ~= 'bestbuds' then 
		QBCore.Functions.Notify("You must work here to access this")
	end
end)

-- Make Medical Mass Joint
RegisterNetEvent("qb-buds:medicalJoint")
AddEventHandler("qb-buds:medicalJoint", function()
    if onDuty and QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then
    	QBCore.Functions.TriggerCallback('qb-buds:server:get:ingredientmedicalJoint', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Medical Joint...", 6000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "medicalbag", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "rolling_paper", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "medicaljoint", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["medicaljoint"], "add")
                    QBCore.Functions.Notify("You made a Medical Joint", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	elseif not onDuty and QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then 
		QBCore.Functions.Notify("You must be on duty to access this")
	elseif QBCore.Functions.GetPlayerData(src).job.name ~= 'bestbuds' then 
		QBCore.Functions.Notify("You must work here to access this")
	end
end)

-- Grind Haze Heaven Joint
RegisterNetEvent("qb-buds:grindHazeHeaven")
AddEventHandler("qb-buds:grindHazeHeaven", function()
    if onDuty and QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then
    	QBCore.Functions.TriggerCallback('qb-buds:server:get:ingredientgrindHazeHeaven', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Grinding Haze Heaven Nug...", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "hazeheavenbud", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "empty_weed_bag", 5)
					TriggerServerEvent('QBCore:Server:AddItem', "hazeheavenbag", 5)
					TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hazeheavenbag"], "add")
					QBCore.Functions.Notify("You filled five bags of Haze Heaven weed", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled...", "error")
				end)
			else
   				QBCore.Functions.Notify("You don\'t have the ingredients to make this", "error")
			end
		end)
	elseif not onDuty and QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then 
		QBCore.Functions.Notify("You must be on duty to access this")
	elseif QBCore.Functions.GetPlayerData(src).job.name ~= 'bestbuds' then 
		QBCore.Functions.Notify("You must work here to access this")
	end
end)

-- Make Haze Heaven Joint
RegisterNetEvent("qb-buds:hazeheavenJoint")
AddEventHandler("qb-buds:hazeheavenJoint", function()
    if onDuty and QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then
    	QBCore.Functions.TriggerCallback('qb-buds:server:get:ingredienthazeheavenJoint', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making a Haze Heaven Joint...", 6000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "hazeheavenbag", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "rolling_paper", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "hazeheavenjoint", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hazeheavenjoint"], "add")
                    QBCore.Functions.Notify("You made a Haze Heaven Joint", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	elseif not onDuty and QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then 
		QBCore.Functions.Notify("You must be on duty to access this")
	elseif QBCore.Functions.GetPlayerData(src).job.name ~= 'bestbuds' then 
		QBCore.Functions.Notify("You must work here to access this")
	end
end)

-- Brownies
RegisterNetEvent("qb-buds:brownie")
AddEventHandler("qb-buds:brownie", function()
	if onDuty then 
		QBCore.Functions.Progressbar("pickup_sla", "Grabbing a Brownie...", 3000, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {
			TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
		}, {}, {}, function() -- Done
			TriggerServerEvent('QBCore:Server:AddItem', "weedbrownie", 1)
			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weedbrownie"], "add")
			QBCore.Functions.Notify("You got a brownie from the shelf", "success")
		end, function()
			QBCore.Functions.Notify("Cancelled...", "error")
		end)
	else
		QBCore.Functions.Notify("You must be on duty to take product.", "error")
	end
end)

-- Gummies
RegisterNetEvent("qb-buds:gummy")
AddEventHandler("qb-buds:gummy", function()
	if onDuty then 
		QBCore.Functions.Progressbar("pickup_sla", "Grabbing a Gummy...", 3000, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {
			TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
		}, {}, {}, function() -- Done
			TriggerServerEvent('QBCore:Server:AddItem', "weedgummy", 1)
			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weedgummy"], "add")
			QBCore.Functions.Notify("You got a gummy from the shelf", "success")
		end, function()
			QBCore.Functions.Notify("Cancelled...", "error")
		end)
	else
		QBCore.Functions.Notify("You must be on duty to take product.", "error")
	end
end)

-- Garage
RegisterNetEvent("qb-buds:spawnVehicle")
AddEventHandler("qb-buds:spawnVehicle", function()
	-- Deletes existing job vehicle
    if DoesEntityExist(JobVehicle) then
        SetVehicleHasBeenOwnedByPlayer(JobVehicle, false)
        SetEntityAsNoLongerNeeded(JobVehicle)
        DeleteEntity(JobVehicle)
    end

	-- Spawn Job Vehicle
	QBCore.Functions.SpawnVehicle(Config.JobVehicle, function(veh)
        JobVehicle = veh -- Job Vehicle
        SetVehicleNumberPlateText(JobVehicle, "BEST BUD") -- Set License Plate
        SetEntityHeading(JobVehicle, vehSpawnLocation.w) -- Set Heading
        exports['lj-fuel']:SetFuel(JobVehicle, 100.0) -- Max Fuel
		-- TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1) -- Put Player in Vehicle
		SetVehicleColours(JobVehicle, 53, 53) -- Bright Green
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(JobVehicle)) -- Give player keys
        SetEntityAsMissionEntity(JobVehicle, true, true) -- Prevent poofing
        SetVehicleDirtLevel(JobVehicle, 0) -- Sparkly Clean
		SetVehicleEngineOn(JobVehicle, true, true)
		QBCore.Functions.Notify("Your work vehicle is ready", "success")
    end, vehSpawnLocation, true)
end)

RegisterNetEvent("qb-buds:storeVehicle")
AddEventHandler("qb-buds:storeVehicle", function()
	-- Deletes existing job vehicle
	if DoesEntityExist(JobVehicle) then
		SetVehicleHasBeenOwnedByPlayer(JobVehicle, false)
		SetEntityAsNoLongerNeeded(JobVehicle)
		DeleteEntity(JobVehicle)
	else
		QBCore.Functions.Notify("The vehicle can't be found", "error")
	end
end)









