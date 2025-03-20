-- AutoThirdSea.lua
local module = {}

function module.AutoThirdSea()
    local LocalPlayer = game:GetService("Players").LocalPlayer

    -- Verificar se o jogador está no Second Sea e tem nível suficiente
    if not _G.World2 then
        _G.OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Precisa estar no Second Sea",
            Time = 5
        })
        return
    end
    if LocalPlayer.Data.Level.Value < 1500 then
        _G.OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Precisa de nível 1500+ para o Third Sea",
            Time = 5
        })
        return
    end

    -- Verificar Beli para Don Swan
    if LocalPlayer.Data.Beli.Value < 1000000 then
        _G.OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Farming 1M de Beli para Don Swan...",
            Time = 5
        })
        while LocalPlayer.Data.Beli.Value < 1000000 and _G.AutoThirdSea do
            _G.Utils.CheckQuest()
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == _G.NameMon and v.Humanoid.Health > 0 then
                    repeat task.wait()
                        _G.Teleport.topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        _G.Combat.FastAttack(v)
                    until v.Humanoid.Health <= 0 or not v.Parent
                end
            end
            task.wait(1)
        end
    end

    -- Passo 1: Derrotar Don Swan
    _G.OrionLib:MakeNotification({
        Name = "Skull Hub",
        Content = "Derrotando Don Swan...",
        Time = 3
    })
    _G.Teleport.topos(CFrame.new(2288, 15, 905)) -- Mansion (posição de Don Swan)
    task.wait(1)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2284, 15, 905))
    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name == "Don Swan" and v.Humanoid.Health > 0 then
            repeat task.wait()
                _G.Teleport.topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                _G.Combat.FastAttack(v)
            until v.Humanoid.Health <= 0 or not v.Parent
        end
    end
    task.wait(2)

    -- Passo 2: Acumular 2.5M de Honor
    local honor = LocalPlayer.Data.Honor.Value or 0
    if honor < 2500000 then
        _G.OrionLib:MakeNotification({
            Name = "Skull Hub",
            Content = "Farming 2.5M de Honor...",
            Time = 5
        })
        _G.Utils.CheckQuest()
        while honor < 2500000 and _G.AutoThirdSea do
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == _G.NameMon and v.Humanoid.Health > 0 then
                    repeat task.wait()
                        _G.Teleport.topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        _G.Combat.FastAttack(v)
                    until v.Humanoid.Health <= 0 or not v.Parent
                end
            end
            task.wait(1)
            honor = LocalPlayer.Data.Honor.Value or 0
        end
    end

    -- Passo 3: Viajar para o Third Sea
    _G.OrionLib:MakeNotification({
        Name = "Skull Hub",
        Content = "Viajando para o Third Sea...",
        Time = 3
    })
    _G.Teleport.topos(CFrame.new(-5080, 315, -3150)) -- Castle on the Sea
    task.wait(1)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelThirdSea")
    _G.OrionLib:MakeNotification({
        Name = "Skull Hub",
        Content = "Chegou ao Third Sea!",
        Time = 5
    })
end

-- Loop para executar a função automaticamente
spawn(function()
    while task.wait(5) do
        if _G.AutoThirdSea then pcall(module.AutoThirdSea) end
    end
end)

return module
