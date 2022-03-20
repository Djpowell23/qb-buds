local QBCore = exports['qb-core']:GetCoreObject()

-- Create blip
-- Citizen.CreateThread(function()
--     BestBuds = AddBlipForCoord(377.57, -830.24, 29.3)
--     SetBlipSprite (BestBuds, 469)
--     SetBlipDisplay(BestBuds, 4)
--     SetBlipScale  (BestBuds, 0.75)
--     SetBlipAsShortRange(BestBuds, true)
--     SetBlipColour(BestBuds, 25)
--     BeginTextCommandSetBlipName("STRING")
--     AddTextComponentSubstringPlayerName("Best Buds")
--     EndTextCommandSetBlipName(BestBuds)
-- end)

-- Brownie Item --
QBCore.Functions.CreateUseableItem("weedbrownie", function(source, item)
    -- TriggerClientEvent("qb-buds:eatweedbrownie")
    local Player = QBCore.Functions.GetPlayer(source)
    
    local src = source
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("qb-buds:eatweedbrownie", src)
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
-- End Brownie --

-- Gummy Item --
QBCore.Functions.CreateUseableItem("weedgummy", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    
    local src = source
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("qb-buds:eatweedgummy", src)
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
-- End Gummy --

-- Billing Information
RegisterServerEvent("qb-buds:bill:player")
AddEventHandler("qb-buds:bill:player", function(playerId, amount)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)
    if biller.PlayerData.job.name == 'bestbuds' then
        if billed ~= nil then
            if amount and amount > 0 then
                if Config.SQL == 'oxmysql' then
                exports.oxmysql:insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (:citizenid, :amount, :society, :sender)', {
                    ['citizenid'] = billed.PlayerData.citizenid,
                    ['amount'] = amount,
                    ['society'] = biller.PlayerData.job.name,
                    ['sender'] = biller.PlayerData.charinfo.firstname
                })
                else
                    exports.ghmattisql:execute('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (@citizenid, @amount, @society, @sender)', {
                    ['@citizenid'] = billed.PlayerData.citizenid,
                    ['@amount'] = amount,
                    ['@society'] = biller.PlayerData.job.name,
                    ['@sender'] = biller.PlayerData.charinfo.firstname
                    })
                end
                TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
            else
                TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
    end
end)

-- Caramelo Grinding --
QBCore.Functions.CreateCallback('qb-buds:server:get:ingredientgrindCaramelo', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local weedcaramelo = Ply.Functions.GetItemByName("caramelobud")
    local emptyweedbag = Ply.Functions.GetItemByName("empty_weed_bag")
    if weedcaramelo ~= nil and emptyweedbag ~= nil then
        if weedcaramelo >= 1 and emptyweedbag >= 5 then 
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

-- Caramelo Joint Crafting
QBCore.Functions.CreateCallback('qb-buds:server:get:ingredientcarameloJoint', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local weedcaramelo = Ply.Functions.GetItemByName("caramelobag")
    local rollingpaper = Ply.Functions.GetItemByName("rolling_paper")
    if weedcaramelo ~= nil and rollingpaper ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

-- Joint Crafting --
-- Medical Mass
QBCore.Functions.CreateCallback('qb-buds:server:get:ingredientgrindMedicalMass', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local weedcaramelo = Ply.Functions.GetItemByName("medicalmassbud")
    local emptyweedbag = Ply.Functions.GetItemByName("empty_weed_bag")
    if weedcaramelo ~= nil and emptyweedbag ~= nil then
        if weedcaramelo >= 1 and emptyweedbag >= 5 then 
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

-- Medical Mass
QBCore.Functions.CreateCallback('qb-buds:server:get:ingredientmedicalJoint', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local weedmedicalmass = Ply.Functions.GetItemByName("medicalbag")
    local rollingpaper = Ply.Functions.GetItemByName("rolling_paper")
    if weedmedicalmass ~= nil and rollingpaper ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

-- Haze Heaven Grinding (currently only one required)
QBCore.Functions.CreateCallback('qb-buds:server:get:ingredientgrindHazeHeaven', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local weedhazeheaven = Ply.Functions.GetItemByName("hazeheavenbud")
    local emptyweedbag = Ply.Functions.GetItemByName("empty_weed_bag")
    if weedhazeheaven ~= nil and emptyweedbag ~= nil then
        if weedhazeheaven >= 1 and emptyweedbag >= 5 then 
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

-- Haze Heaven
QBCore.Functions.CreateCallback('qb-buds:server:get:ingredienthazeheavenJoint', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local weedhazeheaven = Ply.Functions.GetItemByName("hazeheavenbag")
    local rollingpaper = Ply.Functions.GetItemByName("rolling_paper")
    if weedhazeheaven ~= nil and rollingpaper ~= nil then
        cb(true)
    else
        cb(false)
    end
end)
-- Joint Crafting End --

-- Create Joints as Items --
QBCore.Functions.CreateUseableItem("caramelojoint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player.Functions.GetItemByName("lighter") then
        if Player.Functions.RemoveItem(item.name, 1, item.slot) then
            TriggerClientEvent("consumables:client:UseCarameloJoint", src)
        end    
    else
        TriggerClientEvent("QBCore:Notify", source, "You don't have a lighter", "error")
    end
end)

QBCore.Functions.CreateUseableItem("medicaljoint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player.Functions.GetItemByName("lighter") then
        if Player.Functions.RemoveItem(item.name, 1, item.slot) then
            TriggerClientEvent("consumables:client:UseMedicalJoint", src)
        end    
    else
        TriggerClientEvent("QBCore:Notify", source, "You don't have a lighter", "error")
    end
end)

QBCore.Functions.CreateUseableItem("hazeheavenjoint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player.Functions.GetItemByName("lighter") then
        if Player.Functions.RemoveItem(item.name, 1, item.slot) then
            TriggerClientEvent("consumables:client:UseHazeHeavenJoint", src)
        end    
    else
        TriggerClientEvent("QBCore:Notify", source, "You don't have a lighter", "error")
    end
end)
-- End Item Creation --
