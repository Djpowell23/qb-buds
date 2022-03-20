Config = {}

-- Job Vehicle
Config.JobVehicle = "cheetah2"
Config.VehicleSpawnLocation = vector4(364.88, -826.07, 29.29, 178.79)

-- Database query
Config.SQL = 'oxmysql' --- oxmysql or ghmattisql

-- Edible Stress Amounts
Config.BrownieMinStress = 15 -- min amount of stress to be relieved per tick
Config.BrownieMaxStress = 20 -- max amount of stress to be relieved per tick
Config.GummyMinStress = 15 -- min amount of stress to be relieved per tick
Config.GummyMaxStress = 20 -- max amount of stress to be relieved per tick

-- Multiply ReliefCount by ReliefInterval for total seconds
Config.BrownieMaxReliefCount = 10 -- times you will relieve stress
Config.BrownieReliefInterval = 30 -- seconds between stress relief
Config.GummyMaxReliefCount = 10 -- times you will relieve stress
Config.GummyReliefInterval = 30 -- times you will relieve stress

Config.CarameloMinStressRelief = 5 -- min stress relieved per tick
Config.CarameloMaxStressRelief = 7 -- max stress relieved per tick

Config.MedicalMinStressRelief = 11 -- min stress relieved per tick
Config.MedicalMaxStressRelief = 12 -- max stress relieved per tick

Config.HeavenMinStressRelief = 17 -- min stress relieved per tick
Config.HeavenMaxStressRelief = 18 -- max stress relieved per tick

-- Shop Items
Config.Items = {
label = "Shop",
    slots = 10,
    items = {
        [1] = {
            name = "lighter",
            price = 0,
            amount = 20,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "empty_weed_bag",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "rolling_paper",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "caramelobud",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "medicalmassbud",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "hazeheavenbud",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
    },
}