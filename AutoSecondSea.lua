-- AutoSecondSea.lua
local module = {}

function module.AutoSecondSea()
    local LocalPlayer = game:GetService("Players").LocalPlayer

    -- Verificar se o jogador está no First Sea e tem nível suficiente
    if not _G.World1 then
        _G.OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Precisa estar no First Sea",
            Time = 5
        })
        return
    end
    if LocalPlayer.Data.Level.Value < 700 then
        _G.OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Precisa de nível 700+ para o Second Sea",
            Time = 5
        })
        return
    end

    -- Passo 1: Derrotar "The Saw" (opcional, mas ajuda na progressão)
    _G.OrionLib:MakeNotification({
        Name = "Skull Hub",
        Content = "Derrotando The Saw...",
        Time = 3
    })
    _G.Teleport.topos(CFrame.new(1040, 15, 1350)) -- Middle Town (posição aproximada de The Saw)
    task.wait(1)
    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name == "The Saw" and v.Humanoid.Health > 0 then
            repeat task.wait()
                _G.Teleport.topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                _G.Combat.FastAttack(v)
            until v.Humanoid.Health <= 0 or not v.Parent
        end
    end
    task.wait(2)

    -- Passo 2: Falar com o Military Detective
    _G.OrionLib:MakeNotification({
        Name = "Skull Hub",
        Content = "Falando com o Military Detective...",
        Time = 3
    })
    _G.Teleport.topos(CFrame.new(911, 15, 1477)) -- Middle Town (posição do Military Detective)
    task.wait(1)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("talkToMilitaryDetective")

    -- Passo 3: Derrotar o Ice Admiral
    _G.OrionLib:MakeNotification({
        Name = "Skull Hub",
        Content = "Derrotando o Ice Admiral...",
        Time = 3
    })
    _G.Teleport.topos(CFrame.new(-1166, 7, -487)) -- Frozen Village (posição do Ice Admiral)
    task.wait(1)
    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name == "Ice Admiral" and v.Humanoid.Health > 0 then
            repeat task.wait()
                _G.Teleport.topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                _G.Combat.FastAttack(v)
            until v.Humanoid.Health <= 0 or not v.Parent
        end
    end
    task.wait(2)

    -- Passo 4: Viajar para o Second Sea
    _G.OrionLib:MakeNotification({
        Name = "Skull Hub",
        Content = "Viajando para o Second Sea...",
        Time = 3
    })
    _G.Teleport.topos(CFrame.new(-1166, 7, -487)) -- Frozen Village (posição do NPC/porta)
    task.wait(1)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelSecondSea")
    _G.OrionLib:MakeNotification({
        Name = "Skull Hub",
        Content = "Chegou ao Second Sea!",
        Time = 5
    })
end

-- Loop para executar a função automaticamente
spawn(function()
    while task.wait(5) do
        if _G.AutoSecondSea then pcall(module.AutoSecondSea) end
    end
end)

return module
