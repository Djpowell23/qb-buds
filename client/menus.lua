local QBCore = exports["qb-core"]:GetCoreObject()

-- Target
Citizen.CreateThread(function()

	exports['qb-target']:AddBoxZone("budsDuty", vector3(375.53, -827.31, 29.3), 0.5, 0.5, {
		name = "budsDuty",
		heading = 0,
		debugPoly = false,
		minZ=29.00,
		maxZ=29.6,
	}, {
		options = {
			{
			event = "qb-buds:DutyBuds",
			icon = "fas fa-clipboard",
			label = "Clock In/Out",
			job = "bestbuds",			
			},
		},
		distance = 3.0
	})

	exports['qb-target']:AddBoxZone("budstray1", vector3(378.81, -827.42, 29.3), 1.65, 0.85, {
		name = "budstray1",
		heading = 90,
		debugPoly = false,
		minZ=28.5,
		maxZ=29.5,
	}, {
		options = {
			{
			event = "qb-buds:Tray1",
			icon = "fas fa-clipboard",
			label = "Tray 1",
			},
		},
		distance = 1.5
	})
	
	exports['qb-target']:AddBoxZone("budsRegister", vector3(380.24, -827.31, 29.3), 0.45, 0.45, {
		name = "budsRegister",
		heading = 0,
		debugPoly = false,
		minZ=29.1,
		maxZ=29.65,
	}, {
		options = {
			{
			event = "qb-buds:bill",
			params = 1,
			icon = "fas fa-credit-card",
			label = "Charge Customer",
			job = "bestbuds",
			},
		},
		distance = 2.0
	})

	exports['qb-target']:AddBoxZone("budsShop", vector3(383.87, -819.68, 29.3), 1.8, 1, {
		name = "budsShop",
		heading = 0,
		debugPoly = false,
		minZ=28.5,
		maxZ=29.8,
	}, {
		options = {
			{
			event = "qb-menu:OrderMenuBuds",
			icon = "fas fa-laptop",
			label = "Select Items",
			job = "bestbuds",
			},
		},
		distance = 2.0
	})

	exports['qb-target']:AddBoxZone("budsStorage", vector3(376.88, -824.54, 29.3), 0.75, 0.75, {
		name = "budsStorage",
		heading = 0,
		debugPoly = false,
		minZ=28.4,
		maxZ=29.2,
	}, {
		options = {
			{
			event = "qb-buds:Storage",
			icon = "fas fa-box",
			label = "Company Storage.",
			job = "bestbuds",
			},
		},
		distance = 2.0
	})

	-- Joint Creation Table
	exports['qb-target']:AddBoxZone("budsWeedCrafting", vector3(374.51, -816.15, 29.3), 1.25, 0.5, {
		name = "budsWeedCrafting",
		heading = 90,
		debugPoly = false,
		minZ=29.1,
		maxZ=29.65,
	}, {
		options = {
			{
			event = "qb-menu:budsWeedCrafting",
			icon = "fas fa-rocket",
			label = "Weed Crafting",
			job = "bestbuds",
			},
		},
		distance = 2.0
	})

	-- Edible Shelves --
	exports['qb-target']:AddBoxZone("bestBudsShelf1", vector3(379.61, -825.41, 29.3), 2.1, 0.8, {
		name = "budsConsumables",
		heading = 90,
		debugpoly = false,
		minZ=28.4,
		maxZ=30.2,
	}, {
		options = {
			{
				event = "qb-buds:brownie",
				icon = "fas fa-box",
				label = "Grab Brownie",
				job = "bestbuds",
			},
			{
				event = "qb-buds:gummy",
				icon = "fas fa-box",
				label = "Grab Gummies",
				job = "bestbuds",
				},
			},
		distance = 1.5
	})

	exports['qb-target']:AddBoxZone("bestBudsShelf2", vector3(377.17, -825.48, 29.3), 2.1, 0.8, {
		name = "budsConsumables",
		heading = 90,
		debugpoly = false,
		minZ=28.4,
		maxZ=30.2,
	}, {
		options = {
			{
				event = "qb-buds:brownie",
				icon = "fas fa-box",
				label = "Grab Brownie",
				job = "bestbuds",
			},
			{
				event = "qb-buds:gummy",
				icon = "fas fa-box",
				label = "Grab Gummies",
				job = "bestbuds",
				},
			},
		distance = 1.5
	})

	exports['qb-target']:AddBoxZone("bestBudsShelf3", vector3(374.61, -825.44, 29.3), 2.1, 0.8, {
		name = "budsConsumables",
		heading = 90,
		debugpoly = false,
		minZ=28.4,
		maxZ=30.2,
	}, {
		options = {
			{
				event = "qb-buds:brownie",
				icon = "fas fa-box",
				label = "Grab Brownie",
				job = "bestbuds",
			},
			{
				event = "qb-buds:gummy",
				icon = "fas fa-box",
				label = "Grab Gummies",
				job = "bestbuds",
				},
			},
		distance = 1.5
	})
	-- End Edible Shelves --

	-- Weed Grinding Station
	exports['qb-target']:AddBoxZone("budsWeedGrinding", vector3(382.38, -817.42, 29.3), 1.8, 1, {
		name = "budsWeedGrinding",
		heading = 271,
		debugPoly = false,
		minZ=28.8,
		maxZ=29.5,
	}, {
		options = {
			{
			event = "qb-menu:budsWeedGrinding",
			icon = "fas fa-cannabis",
			label = "Weed Grinding",
			job = "bestbuds",
			},
		},
		distance = 2.0
	})

	-- Product Storage --
	exports['qb-target']:AddBoxZone("readyProduct", vector3(373.85, -827.75, 29.3), 2.1, 0.4, {
		name = "readyProduct",
		heading = 0,
		debugPoly = false,
		minZ=28.4,
		maxZ=29.8,
	}, {
		options = {
			{
			event = "qb-buds:readyProduct",
			icon = "fas fa-box",
			label = "Ready to Sell",
			job = "bestbuds",
			},
		},
		distance = 1.5
	})
	-- End Product Storage --

	-- Buds Garage -- 
	exports['qb-target']:AddBoxZone("budsGarage", vector3(372.83, -827.09, 29.29), 1.2, 0.6, {
		name = "budsGarage",
		heading = 0,
		debugPoly = false,
		minZ=28.4,
		maxZ=30.5,
	}, {
		options = {
			{
			event = "qb-menu:budsGarage",
			icon = "fas fa-box",
			label = "Garage Menu",
			job = "bestbuds",
			},
		},
		distance = 1.5
	})
	-- End Garage --
end)
-- Net Events

-- Buds Garage Menu
RegisterNetEvent('qb-menu:budsGarage', function(data)
	if QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then 
		exports['qb-menu']:openMenu({
			{
				header = "Open Menu",
				isMenuHeader = true 
			},
			{
				header = "• Rent Vehicle",
				txt = "Deliver some buds",
				params = {
					event = "qb-buds:spawnVehicle"
				}
			},
			{
				header = "Store Vehicle",
				txt = "Put that whip away",
				params = {
					event = "qb-buds:storeVehicle"
				}
			},
			{
				header = "Close (ESC)",
				txt = "",
				params = {
					event = "qb-menu:client:closeMenu"
				}
			}
		})
	else 
		QBCore.Functions.Notify("You must work here to access this")
	end
end)

-- Employee Menu
RegisterNetEvent('qb-menu:OrderMenuBuds', function(data)
	if QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then 
		exports['qb-menu']:openMenu({
			{
				header = "Open Menu",
				isMenuHeader = true 
			},
			{
				header = "• Shop Items",
				txt = "Order New Ingredients",
				params = {
					event = "qb-buds:shop"
				}
			},
			{
				header = "Open Stash",
				txt = "See what's in your stash",
				params = {
					event = "qb-buds:Storage"
				}
			},
			{
				header = "Close (ESC)",
				txt = "",
				params = {
					event = "qb-menu:client:closeMenu"
				}
			}
		})
	else 
		QBCore.Functions.Notify("You must work here to access this")
	end
end)

RegisterNetEvent('qb-menu:budsWeedCrafting', function(data) 
	if QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then 
		exports['qb-menu']:openMenu({
			{
				id = 0,
				header = "| Start Rolling Some Weed |",
				isMenuHeader = true, 
				txt = "",
			},
			{
				id = 1,
				header = "• Caramelo Joint",
				txt = "Rolling Paper, Caramelo Bag",
				params = {
					event = "qb-buds:carameloJoint"
				}
			},
			{
				id = 2,
				header = "• Medical Mass Joint",
				txt = "Rolling Paper, Medical Mass Bag",
				params = {
					event = "qb-buds:medicalJoint"
				}
			},
			{
				id = 3,
				header = "• Haze Heaven Joint",
				txt = "Rolling Paper, Haze Heaven Bag",
				params = {
					event = "qb-buds:hazeheavenJoint"
				}
			},
			{
				id = 4,
				header = "Nevermind (ESC)",
				txt = "",
				params = {
					event = "qb-menu:client:closeMenu"
				}
			},
		})
	else 
		QBCore.Functions.Notify("You must work here to access this")
	end	
end)

-- Grinding Station
RegisterNetEvent('qb-menu:budsWeedGrinding', function(data)
	if QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then 
		exports['qb-menu']:openMenu({
			{
				id = 0,
				header = "| Start Grinding Some Weed |",
				isMenuHeader = true,
				txt = "",
			},
			{
				id = 1,
				header = "• Grind Caramelo Bud",
				txt = "Caramelo Bud", "Empty Weed Bag",
				params = {
					event = "qb-buds:grindCaramelo"
				}
			},
			{
				id = 2,
				header = "• Grind Medical Mass Bud",
				txt = "Medical Mass Bud", "Empty Weed Bag",
				params = {
					event = "qb-buds:grindMedicalMass"
				}
			},
			{
				id = 3,
				header = "• Grind Haze Heaven Bud",
				txt = "Haze Heaven Bud", "Empty Weed Bag",
				params = {
					event = "qb-buds:grindHazeHeaven"
				}
			},
			{
				id = 4,
				header = "Nevermind (ESC)",
				txt = "",
				params = {
					event = "qb-menu:client:closeMenu"
				}
			},
		})
	else 
		QBCore.Functions.Notify("You must work here to access this")
	end
end)

-- Billing --
RegisterNetEvent("qb-buds:bill", function()
	if QBCore.Functions.GetPlayerData(src).job.name == 'bestbuds' then 
		local bill = exports['qb-input']:ShowInput({
			header = "Bill",
			submitText = "Submit",
			inputs = {
				{
					type = 'number',
					isRequired = true,
					name = 'id',
					text = 'Server ID'
				},
				{
					type = 'number',
					isRequired = true,
					name = 'amount',
					text = 'Amount!'
				}
			}
		})
	else 
		QBCore.Functions.Notify("You must work here to access this")
	end
    if bill then
        if not bill.id or not bill.amount then return end
        TriggerServerEvent("qb-buds:bill:player", bill.id, bill.amount)
    end
end)
