-- UI.lua
local module = {}

function module.Init()
    local Window = _G.OrionLib:MakeWindow({
        Name = "Sla Hub | Blox Fruits",
        IntroText = "Welcome to Sla Hub",
        HidePremium = false,
        SaveConfig = true,
        ConfigFolder = "SlaHubConfig"
    })

    local MainTab = Window:MakeTab({Name = "Main", Icon = "rbxassetid://4483345998"})
    MainTab:AddToggle({Name = "Auto Farm Level", Default = false, Callback = function(Value) _G.AutoFarm = Value end})
    MainTab:AddToggle({Name = "Bring Mob", Default = true, Callback = function(Value) _G.BringMob = Value end})
    MainTab:AddDropdown({Name = "Select Weapon", Default = "Melee", Options = {"Melee", "Sword", "Gun", "Fruit"}, Callback = function(Value) _G.SelectWeapon = Value end})
    MainTab:AddToggle({Name = "Fast Attack", Default = false, Callback = function(Value) _G.FastAttack = Value end})
    MainTab:AddSlider({Name = "Attack Delay", Min = 0.05, Max = 0.5, Default = 0.15, Increment = 0.05, Callback = function(Value) _G.AttackDelay = Value end})
    MainTab:AddSlider({Name = "Attacks per Burst", Min = 1, Max = 5, Default = 3, Increment = 1, Callback = function(Value) _G.MaxAttacksPerBurst = Value end})

    local BossTab = Window:MakeTab({Name = "Boss Farm", Icon = "rbxassetid://6034830839"})
    BossTab:AddToggle({Name = "Auto Farm Boss", Default = false, Callback = function(Value) _G.AutoFarmBoss = Value end})
    BossTab:AddDropdown({Name = "Select Boss", Default = "Rip Indra", Options = _G.Utils.GetSpawnedBosses(), Callback = function(Value) _G.SelectedBoss = Value end})
    BossTab:AddToggle({Name = "Auto Farm All Bosses", Default = false, Callback = function(Value) _G.AutoFarmAllBosses = Value end})
    BossTab:AddToggle({Name = "Auto Quest for Bosses", Default = true, Callback = function(Value) _G.AutoQuestBoss = Value end})
    BossTab:AddToggle({Name = "Auto Haki", Default = false, Callback = function(Value) _G.AutoHaki = Value end})

    local RaidTab = Window:MakeTab({Name = "Raid", Icon = "rbxassetid://6031094678"})
    RaidTab:AddToggle({Name = "Auto Raid", Default = false, Callback = function(Value) _G.AutoRaid = Value end})
    RaidTab:AddDropdown({Name = "Select Raid", Default = "Buddha", Options = {"Buddha", "Dough"}, Callback = function(Value) _G.SelectedRaid = Value end})

    local StatsTab = Window:MakeTab({Name = "Stats", Icon = "rbxassetid://6034754441"})
    StatsTab:AddToggle({Name = "Auto Stats", Default = false, Callback = function(Value) _G.AutoStats = Value end})
    StatsTab:AddToggle({Name = "Melee", Default = false, Callback = function(Value) _G.Stats.Melee = Value end})
    StatsTab:AddToggle({Name = "Defense", Default = false, Callback = function(Value) _G.Stats.Defense = Value end})
    StatsTab:AddToggle({Name = "Sword", Default = false, Callback = function(Value) _G.Stats.Sword = Value end})
    StatsTab:AddToggle({Name = "Gun", Default = false, Callback = function(Value) _G.Stats.Gun = Value end})
    StatsTab:AddToggle({Name = "Fruit", Default = false, Callback = function(Value) _G.Stats.Fruit = Value end})
    StatsTab:AddSlider({Name = "Points per Increment", Min = 1, Max = 10, Default = 3, Increment = 1, Callback = function(Value) _G.StatPoints = Value end})

    local FruitTab = Window:MakeTab({Name = "Fruit", Icon = "rbxassetid://6031094678"})
    FruitTab:AddToggle({Name = "Auto Collect Fruits", Default = false, Callback = function(Value) _G.AutoFruitCollect = Value end})

    local TeleportTab = Window:MakeTab({Name = "Teleport", Icon = "rbxassetid://6031071053"})
    TeleportTab:AddToggle({Name = "Bypass TP", Default = false, Callback = function(Value) _G.BypassTP = Value end})

    local VisualsTab = Window:MakeTab({Name = "Visuals", Icon = "rbxassetid://6034754441"})
    VisualsTab:AddToggle({Name = "Player ESP", Default = false, Callback = function(Value) _G.ESPPlayer = Value end})
    VisualsTab:AddToggle({Name = "Chest ESP", Default = false, Callback = function(Value) _G.ChestESP = Value end})
    VisualsTab:AddToggle({Name = "Devil Fruit ESP", Default = false, Callback = function(Value) _G.DevilFruitESP = Value end})

    local MiscTab = Window:MakeTab({Name = "Misc", Icon = "rbxassetid://6031229361"})
    MiscTab:AddToggle({Name = "Remove Effects", Default = true, Callback = function(Value) _G.Remove_Effect = Value end})
    MiscTab:AddToggle({Name = "Auto Third Sea", Default = false, Callback = function(Value) _G.AutoThirdSea = Value end})
    MiscTab:AddToggle({Name = "Auto Set Spawn", Default = false, Callback = function(Value) _G.AutoSetSpawn = Value end})
    MiscTab:AddButton({Name = "Hop Server", Callback = _G.Misc.Hop})

    _G.OrionLib:Init()

    -- Atualização dinâmica da lista de bosses
    spawn(function()
        while task.wait(5) do
            BossTab.Elements["Select Boss"]:SetOptions(_G.Utils.GetSpawnedBosses())
        end
    end)
end

return module
