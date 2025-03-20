-- main.lua
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Carregar todos os arquivos de funcionalidades
local AutoFarm = loadstring(game:HttpGet("https://raw.githubusercontent.com/CiborgueCosmico/Script_Skull/main/AutoFarm.lua"))()
local AutoRaid = loadstring(game:HttpGet("https://raw.githubusercontent.com/CiborgueCosmico/Script_Skull/main/AutoRaid.lua"))()
local AutoStats = loadstring(game:HttpGet("https://raw.githubusercontent.com/CiborgueCosmico/Script_Skull/main/AutoStats.lua"))()
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

-- ### Aba Stats ###
local StatsTab = Window:MakeTab({
    Name = "Stats",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

StatsTab:AddSection({Name = "Auto Stats"})
StatsTab:AddToggle({
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

-- ### Aba Haki ###
local HakiTab = Window:MakeTab({
    Name = "Haki",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

HakiTab:AddSection({Name = "Colored Haki"})
HakiTab:AddToggle({
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

HakiTab:AddSection({Name = "Legendary Haki"})
HakiTab:AddToggle({
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

-- ### Aba Fruit Collect ###
local FruitTab = Window:MakeTab({
    Name = "Fruit Collect",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

FruitTab:AddSection({Name = "Auto Collect Fruits"})
FruitTab:AddToggle({
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

-- ### Aba ESP ###
local ESPTab = Window:MakeTab({
    Name = "ESP",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

ESPTab:AddSection({Name = "ESP Options"})
ESPTab:AddToggle({
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

-- ### Aba Combat ###
local CombatTab = Window:MakeTab({
    Name = "Combat",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

CombatTab:AddSection({Name = "Combat Options"})
CombatTab:AddToggle({
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

-- ### Aba Farm Items ###
local FarmItemsTab = Window:MakeTab({
    Name = "Farm Items",
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

-- ### Aba Third Sea ###
local ThirdSeaTab = Window:MakeTab({
    Name = "Third Sea",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

ThirdSeaTab:AddSection({Name = "Auto Third Sea"})
ThirdSeaTab:AddToggle({
    Name = "Auto Third Sea",
    Default = false,
    Callback = function(value)
        _G.AutoThirdSea = value
        if value then
            AutoThirdSea.Enable()
        else
            AutoThirdSea.Disable()
        end
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Auto Third Sea " .. (value and "ativado" or "desativado"),
            Time = 3
        })
    end
})

-- Inicializar a interface
OrionLib:Init()
