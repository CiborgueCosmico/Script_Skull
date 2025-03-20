-- FarmItems.lua
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Haki = loadstring(game:HttpGet("https://raw.githubusercontent.com/CiborgueCosmico/Script_Skull/main/Haki.lua"))()
local module = {}

-- Criar a janela da UI para Farm Items
local Window = OrionLib:MakeWindow({
    Name = "Skull Hub - Farm Items",
    IntroText = "Farm Items Section",
    HidePremium = true,
    SaveConfig = false,
    ConfigFolder = "SkullHubFarmItems"
})

-- Aba principal para Farm Items
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

-- Função para desbloquear a Cursed Dual Katana (CDK)
function module.AutoCDK()
    local LocalPlayer = game:GetService("Players").LocalPlayer
    if not _G.World3 or LocalPlayer.Data.Level.Value < 2200 then
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Need Sea 3 and Level 2200+",
            Time = 5
        })
        return
    end

    local hasTushita = LocalPlayer.Backpack:FindFirstChild("Tushita") or LocalPlayer.Character:FindFirstChild("Tushita")
    local hasYama = LocalPlayer.Backpack:FindFirstChild("Yama") or LocalPlayer.Character:FindFirstChild("Yama")

    -- Passo 1: Obter Hakis Coloridos (Snow White, Pure Red, Winter Sky)
    local requiredColors = {"Snow White", "Pure Red", "Winter Sky"}
    local hasAllColors = true
    for _, color in pairs(requiredColors) do
        if not (LocalPlayer.Backpack:FindFirstChild(color) or LocalPlayer.Character:FindFirstChild(color)) then
            hasAllColors = false
            break
        end
    end

    if not hasAllColors then
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Obtaining required Haki colors...",
            Time = 5
        })
        _G.AutoColoredHaki = true
        Haki.AutoColoredHaki()
        _G.AutoColoredHaki = false
    end

    -- Passo 2: Obter Tushita
    if not hasTushita then
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Starting Tushita Quest...",
            Time = 5
        })

        -- Spawnar Rip Indra
        _G.Teleport.topos(CFrame.new(-5080, 315, -3150)) -- Castle on the Sea
        task.wait(1)
        for _, color in pairs(requiredColors) do
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", color)
            task.wait(0.5)
        end
        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v.Name == "rip_indra True Form" and v.Humanoid.Health > 0 then
                OrionLib:MakeNotification({
                    Name = "Skull Hub",
                    Content = "Killing Rip Indra...",
                    Time = 3
                })
                repeat task.wait()
                    _G.Teleport.topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                    _G.Combat.FastAttack(v)
                until v.Humanoid.Health <= 0 or not v.Parent
            end
        end
        task.wait(2)

        -- Pegar o Holy Torch
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Collecting Holy Torch...",
            Time = 3
        })
        _G.Teleport.topos(CFrame.new(-5080, 315, -3150))
        task.wait(1)
        for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
            if v:IsA("Tool") and v.Name == "Holy Torch" then
                _G.Teleport.topos(v.Handle.CFrame)
                task.wait(0.5)
                firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v.Handle, 0)
                firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v.Handle, 1)
                break
            end
        end

        -- Acender as 5 Tochas
        local torchLocations = {
            CFrame.new(-10890, 332, -8420),
            CFrame.new(-11500, 332, -8600),
            CFrame.new(-11200, 332, -8800),
            CFrame.new(-11800, 350, -8700),
            CFrame.new(-12000, 332, -8500)
        }
        for i, torchPos in pairs(torchLocations) do
            OrionLib:MakeNotification({
                Name = "Skull Hub",
                Content = "Lighting Torch " .. i .. "/5...",
                Time = 2
            })
            _G.Teleport.topos(torchPos)
            task.wait(1)
        end

        -- Derrotar Longma
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Entering Portal to Fight Longma...",
            Time = 3
        })
        _G.Teleport.topos(CFrame.new(-10237, 332, -9459))
        task.wait(2)
        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v.Name == "Longma" and v.Humanoid.Health > 0 then
                repeat task.wait()
                    _G.Teleport.topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                    _G.Combat.FastAttack(v)
                until v.Humanoid.Health <= 0 or not v.Parent
                hasTushita = LocalPlayer.Backpack:FindFirstChild("Tushita") or LocalPlayer.Character:FindFirstChild("Tushita")
            end
        end
    end

    -- Passo 3: Obter Yama
    if not hasYama then
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Farming Elite Hunters for Yama (30 kills)...",
            Time = 5
        })
        local eliteKills = 0
        while eliteKills < 30 and _G.AutoCDK do
            _G.Teleport.topos(CFrame.new(-13206, 332, -7570)) -- Elite Hunter
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == "Elite Hunter" and v.Humanoid.Health > 0 then
                    repeat task.wait()
                        _G.Teleport.topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        _G.Combat.FastAttack(v)
                    until v.Humanoid.Health <= 0 or not v.Parent
                    eliteKills = eliteKills + 1
                    OrionLib:MakeNotification({
                        Name = "Skull Hub",
                        Content = "Elite Hunters killed: " .. eliteKills .. "/30",
                        Time = 3
                    })
                end
            end
            task.wait(5)
        end
        if eliteKills >= 30 then
            _G.Teleport.topos(CFrame.new(-13206, 332, -7570))
            hasYama = LocalPlayer.Backpack:FindFirstChild("Yama") or LocalPlayer.Character:FindFirstChild("Yama")
        end
    end

    if not (hasTushita and hasYama) then
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Failed to obtain Tushita or Yama",
            Time = 5
        })
        return
    end

    -- Passo 4: Iniciar o CDK Puzzle
    OrionLib:MakeNotification({
        Name = "Skull Hub",
        Content = "Starting CDK Puzzle...",
        Time = 5
    })
    _G.Teleport.topos(CFrame.new(-13206, 332, -7570)) -- Sick Man
    task.wait(1)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SickMan", "Start")
    task.wait(2)
    _G.Teleport.topos(CFrame.new(-12550, 331, -7440)) -- Crypt Master
    task.wait(1)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CryptMaster", "Check")

    -- Trial of Strength
    local bosses = {
        {Name = "Cake Queen", Pos = CFrame.new(-709, 381, -11011)},
        {Name = "Beautiful Pirate", Pos = CFrame.new(-12128, 5, -10371)},
        {Name = "Longma", Pos = CFrame.new(-10237, 332, -9459)}
    }
    for _, boss in pairs(bosses) do
        OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Killing " .. boss.Name .. "...",
            Time = 3
        })
        _G.Teleport.topos(boss.Pos)
        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v.Name == boss.Name and v.Humanoid.Health > 0 then
                repeat task.wait()
                    _G.Teleport.topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                    _G.Combat.FastAttack(v)
                until v.Humanoid.Health <= 0 or not v.Parent
            end
        end
        task.wait(2)
    end

    -- Trial of Water
    OrionLib:MakeNotification({
        Name = "Skull Hub",
        Content = "Starting Trial of Water...",
        Time = 3
    })
    _G.Teleport.topos(CFrame.new(-9500, 5, -11000))
    task.wait(1)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Boat", "StartRace")
    task.wait(120)

    -- Trial of the Hunter
    OrionLib:MakeNotification({
        Name = "Skull Hub",
        Content = "Starting Trial of the Hunter...",
        Time = 3
    })
    _G.Teleport.topos(CFrame.new(-13206, 332, -7570))
    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name == "Elite Hunter" and v.Humanoid.Health > 0 then
            repeat task.wait()
                _G.Teleport.topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                _G.Combat.FastAttack(v)
            until v.Humanoid.Health <= 0 or not v.Parent
        end
    end
    task.wait(2)

    -- Finalizar no Crypt Master
    OrionLib:MakeNotification({
        Name = "Skull Hub",
        Content = "Returning to Crypt Master...",
        Time = 3
    })
    _G.Teleport.topos(CFrame.new(-12550, 331, -7440))
    task.wait(1)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CryptMaster", "Finish")
    OrionLib:MakeNotification({
        Name = "Skull Hub",
        Content = "CDK Unlocked!",
        Time = 5
    })
end

-- Loop para executar a função
spawn(function()
    while task.wait(5) do
        if _G.AutoCDK then pcall(module.AutoCDK) end
    end
end)

return module
