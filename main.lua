-- main.lua
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Carregar todos os arquivos de funcionalidades
local AutoFarm = loadstring(game:HttpGet("https://raw.githubusercontent.com/CiborgueCosmico/Script_Skull/main/AutoFarm.lua"))()
local AutoRaid = loadstring(game:HttpGet("https://raw.githubusercontent.com/CiborgueCosmico/Script_Skull/main/AutoRaid.lua"))()
local AutoStats = loadstring(game:HttpGet("https://raw.githubusercontent.com/CiborgueCosmico/Script_Skull/main/AutoStats.lua"))()
local AutoSecondSea = loadstring(game:HttpGet("https://raw.githubusercontent.com/CiborgueCosmico/Script_Skull/main/AutoSecondSea.lua"))()
local AutoThirdSea = loadstring(game:HttpGet("https://raw.githubusercontent.com/CiborgueCosmico/Script_Skull/main/AutoThirdSea.lua"))()
local BossFarm = loadstring(game:HttpGet("https://raw.githubusercontent.com/CiborgueCosmico/Script_Skull/main/BossFarm.lua"))()
local Combat = loadstring(game:HttpGet("https://raw.githubusercontent.com/CiborgueCosmico/Script_Skull/main/Combat.lua"))()
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/CiborgueCosmico/Script_Skull/main/ESP.lua"))()
local FarmItemsCDK = loadstring(game:HttpGet("https://raw.githubusercontent.com/CiborgueCosmico/Script_Skull/main/FarmItems_CDK.lua"))()
local FruitCollect = loadstring(game:HttpGet("https://raw.githubusercontent.com/CiborgueCosmico/Script_Skull/main/FruitCollect.lua"))()
local Haki = loadstring(game:HttpGet("https://raw.githubusercontent.com/CiborgueCosmico/Script_Skull/main/Haki.lua"))()
local Misc = loadstring(game:HttpGet("https://raw.githubusercontent.com/CiborgueCosmico/Script_Skull/main/Misc.lua"))()
local Teleport = loadstring(game:HttpGet("https://raw.githubusercontent.com/CiborgueCosmico/Script_Skull/main/Teleport.lua"))()
local Utils = loadstring(game:HttpGet("https://raw.githubusercontent.com/CiborgueCosmico/Script_Skull/main/Utils.lua"))()

-- Criar a janela principal do Skull Hub
local Window = OrionLib:MakeWindow({
    Name = "Skull Hub",
    IntroText = "Bem-vindo ao Skull Hub",
    HidePremium = true,
    SaveConfig = false,
    ConfigFolder = "SkullHub"
})

-- ### Aba Main ###
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

MainTab:AddSection({Name = "Informações"})
MainTab:AddLabel("Skull Hub - Feito por CiborgueCosmico")
MainTab:AddLabel("Data: " .. os.date("%d/%m/%Y"))

-- ### Aba Auto Farm ###
local AutoFarmTab = Window:MakeTab({
    Name = "Auto Farm",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

AutoFarmTab:AddSection({Name = "Auto Farm Mobs"})
AutoFarmTab:AddToggle({
    Name = "Auto Farm Mobs",
    Default = false,
    Callback = function(value)
        _G.AutoFarm = value
        if value then
            AutoFarm.StartFarm()
        else
            AutoFarm.StopFarm()
        end
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Auto Farm Mobs " .. (value and "ativado" or "desativado"),
            Time = 3
        })
    end
})

AutoFarmTab:AddSection({Name = "Fruit Collect"})
AutoFarmTab:AddToggle({
    Name = "Auto Collect Fruits",
    Default = false,
    Callback = function(value)
        _G.AutoCollectFruits = value
        if value then
            FruitCollect.StartCollect()
        else
            FruitCollect.StopCollect()
        end
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Auto Collect Fruits " .. (value and "ativado" or "desativado"),
            Time = 3
        })
    end
})

AutoFarmTab:AddSection({Name = "Sea Progression"})
AutoFarmTab:AddToggle({
    Name = "Auto Second Sea",
    Default = false,
    Callback = function(value)
        _G.AutoSecondSea = value
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Auto Second Sea " .. (value and "ativado" or "desativado"),
            Time = 3
        })
    end
})

AutoFarmTab:AddToggle({
    Name = "Auto Third Sea",
    Default = false,
    Callback = function(value)
        _G.AutoThirdSea = value
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Auto Third Sea " .. (value and "ativado" or "desativado"),
            Time = 3
        })
    end
})

-- ### Aba Boss Farm ###
local BossFarmTab = Window:MakeTab({
    Name = "Boss Farm",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

BossFarmTab:AddSection({Name = "Auto Farm Boss"})
BossFarmTab:AddToggle({
    Name = "Auto Farm Boss",
    Default = false,
    Callback = function(value)
        _G.AutoBoss = value
        if value then
            BossFarm.StartBossFarm()
        else
            BossFarm.StopBossFarm()
        end
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Auto Farm Boss " .. (value and "ativado" or "desativado"),
            Time = 3
        })
    end
})

-- ### Aba Raid ###
local RaidTab = Window:MakeTab({
    Name = "Raid",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

RaidTab:AddSection({Name = "Auto Raid"})
RaidTab:AddToggle({
    Name = "Auto Raid",
    Default = false,
    Callback = function(value)
        _G.AutoRaid = value
        if value then
            AutoRaid.StartRaid()
        else
            AutoRaid.StopRaid()
        end
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Auto Raid " .. (value and "ativado" or "desativado"),
            Time = 3
        })
    end
})

-- ### Aba Farm Itens ###
local FarmItemsTab = Window:MakeTab({
    Name = "Farm Itens",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

FarmItemsTab:AddSection({Name = "Cursed Dual Katana (CDK)"})
FarmItemsTab:AddToggle({
    Name = "Auto Farm CDK",
    Default = false,
    Callback = function(value)
        _G.AutoCDK = value
        if value then
            FarmItemsCDK.StartCDKFarm()
        else
            FarmItemsCDK.StopCDKFarm()
        end
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Auto Farm CDK " .. (value and "ativado" or "desativado"),
            Time = 3
        })
    end
})

FarmItemsTab:AddSection({Name = "Haki"})
FarmItemsTab:AddToggle({
    Name = "Auto Colored Haki",
    Default = false,
    Callback = function(value)
        _G.AutoColoredHaki = value
        if value then
            Haki.StartColoredHaki()
        else
            Haki.StopColoredHaki()
        end
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Auto Colored Haki " .. (value and "ativado" or "desativado"),
            Time = 3
        })
    end
})

FarmItemsTab:AddToggle({
    Name = "Auto Legendary Haki",
    Default = false,
    Callback = function(value)
        _G.AutoLegendaryHaki = value
        if value then
            Haki.StartLegendaryHaki()
        else
            Haki.StopLegendaryHaki()
        end
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Auto Legendary Haki " .. (value and "ativado" or "desativado"),
            Time = 3
        })
    end
})

-- ### Aba Misc ###
local MiscTab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

MiscTab:AddSection({Name = "Miscellaneous Options"})
MiscTab:AddToggle({
    Name = "Auto Hop Server",
    Default = false,
    Callback = function(value)
        _G.AutoHop = value
        if value then
            Misc.StartHop()
        else
            Misc.StopHop()
        end
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Auto Hop Server " .. (value and "ativado" or "desativado"),
            Time = 3
        })
    end
})

MiscTab:AddSection({Name = "Stats"})
MiscTab:AddToggle({
    Name = "Auto Stats",
    Default = false,
    Callback = function(value)
        _G.AutoStats = value
        if value then
            AutoStats.StartAutoStats()
        else
            AutoStats.StopAutoStats()
        end
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Auto Stats " .. (value and "ativado" or "desativado"),
            Time = 3
        })
    end
})

MiscTab:AddSection({Name = "Combat"})
MiscTab:AddToggle({
    Name = "Auto Attack",
    Default = false,
    Callback = function(value)
        _G.AutoAttack = value
        if value then
            Combat.StartAutoAttack()
        else
            Combat.StopAutoAttack()
        end
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Auto Attack " .. (value and "ativado" or "desativado"),
            Time = 3
        })
    end
})

MiscTab:AddSection({Name = "ESP"})
MiscTab:AddToggle({
    Name = "Enable ESP",
    Default = false,
    Callback = function(value)
        _G.EnableESP = value
        if value then
            ESP.Enable()
        else
            ESP.Disable()
        end
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "ESP " .. (value and "ativado" or "desativado"),
            Time = 3
        })
    end
})

-- ### Aba Teleport ###
local TeleportTab = Window:MakeTab({
    Name = "Teleport",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

TeleportTab:AddSection({Name = "Teleport Options"})
TeleportTab:AddButton({
    Name = "Teleport to Sea 1",
    Callback = function()
        Teleport.toSea1()
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Teleportando para Sea 1...",
            Time = 3
        })
    end
})

-- Inicializar a interface
OrionLib:Init()
