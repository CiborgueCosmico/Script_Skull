-- main.lua
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Carregar os arquivos de funcionalidades
local FarmItemsCDK = loadstring(game:HttpGet("https://raw.githubusercontent.com/CiborgueCosmico/Script_Skull/main/FarmItems_CDK.lua"))()
local AutoThirdSea = loadstring(game:HttpGet("https://raw.githubusercontent.com/CiborgueCosmico/Script_Skull/main/AutoThirdSea.lua"))()
local Haki = loadstring(game:HttpGet("https://raw.githubusercontent.com/CiborgueCosmico/Script_Skull/main/Haki.lua"))()

-- Criar a janela principal do Skull Hub
local Window = OrionLib:MakeWindow({
    Name = "Skull Hub",
    IntroText = "Welcome to Skull Hub",
    HidePremium = true,
    SaveConfig = false,
    ConfigFolder = "SkullHub"
})

-- Aba para Farm Items
local FarmTab = Window:MakeTab({
    Name = "Farm Items",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Seção para CDK
FarmTab:AddSection({Name = "Cursed Dual Katana (CDK)"})
FarmTab:AddToggle({
    Name = "Auto CDK",
    Default = false,
    Callback = function(value)
        _G.AutoCDK = value
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Auto CDK " .. (value and "enabled" or "disabled"),
            Time = 3
        })
    end
})

-- Aba para Third Sea
local ThirdSeaTab = Window:MakeTab({
    Name = "Third Sea",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Seção para Auto Third Sea
ThirdSeaTab:AddSection({Name = "Auto Third Sea"})
ThirdSeaTab:AddToggle({
    Name = "Auto Third Sea",
    Default = false,
    Callback = function(value)
        _G.AutoThirdSea = value
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Auto Third Sea " .. (value and "enabled" or "disabled"),
            Time = 3
        })
    end
})

-- Aba para Haki
local HakiTab = Window:MakeTab({
    Name = "Haki",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Seção para Hakis Coloridos
HakiTab:AddSection({Name = "Colored Haki"})
HakiTab:AddToggle({
    Name = "Auto Colored Haki",
    Default = false,
    Callback = function(value)
        _G.AutoColoredHaki = value
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Auto Colored Haki " .. (value and "enabled" or "disabled"),
            Time = 3
        })
    end
})

-- Seção para Haki Lendário
HakiTab:AddSection({Name = "Legendary Haki"})
HakiTab:AddToggle({
    Name = "Auto Legendary Haki",
    Default = false,
    Callback = function(value)
        _G.AutoLegendaryHaki = value
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Auto Legendary Haki " .. (value and "enabled" or "disabled"),
            Time = 3
        })
    end
})

-- Inicializar a UI
OrionLib:Init()
