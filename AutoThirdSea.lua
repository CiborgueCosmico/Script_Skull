-- AutoThirdSea.lua
local module = {}

function module.AutoThirdSea()
    local LocalPlayer = game:GetService("Players").LocalPlayer
    if not _G.World2 or LocalPlayer.Data.Level.Value < 1500 then
        _G.OrionLib:MakeNotification({Name = "Sla Hub", Content = "Need Sea 2 and Level 1500+", Time = 5})
        return
    end

    if LocalPlayer.Data.Beli.Value < 1000000 then
        _G.OrionLib:MakeNotification({Name = "Sla Hub", Content = "Need 1M Beli for Don Swan", Time = 5})
        return
    end
    _G.Teleport.topos(CFrame.new(2288, 15, 905))
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

    local honor = LocalPlayer.Data.Honor.Value or 0
    if honor < 2500000 then
        _G.Utils.CheckQuest()
        for i = 1, 100 do
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

    _G.Teleport.topos(CFrame.new(-1600, 150, -700))
    task.wait(1)
    local colors = {"Red", "Blue", "Green"}
    for _, color in pairs(colors) do
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1", color)
        task.wait(1)
    end

    _G.Teleport.topos(CFrame.new(-5080, 315, -3150))
    task.wait(1)
    for _, color in pairs(colors) do
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", color)
        task.wait(0.5)
    end
    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name == "rip_indra True Form" and v.Humanoid.Health > 0 then
            repeat task.wait()
                _G.Teleport.topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                _G.Combat.FastAttack(v)
            until v.Humanoid.Health <= 0 or not v.Parent
        end
    end

    _G.Teleport.topos(CFrame.new(-1600, 150, -700))
    task.wait(1)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelThirdSea")
end

spawn(function()
    while task.wait(5) do
        if _G.AutoThirdSea then pcall(module.AutoThirdSea) end
    end
end)

return module
