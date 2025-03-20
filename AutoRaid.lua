-- AutoRaid.lua
local module = {}

function module.AutoRaid()
    if not (_G.World2 or _G.World3) then return end
    local fragments = game:GetService("Players").LocalPlayer.Data.Fragments.Value
    local minFragments = _G.World2 and 1000 or 2500
    if fragments < minFragments then
        _G.OrionLib:MakeNotification({Name = "Sla Hub", Content = "Not enough Fragments! Need " .. minFragments, Time = 5})
        return
    end

    local raidPositions = {
        ["Buddha"] = _G.World2 and CFrame.new(-4310, 16, -5280) or CFrame.new(28600, 402, -6570),
        ["Dough"] = CFrame.new(28600, 402, -6570),
    }
    local raidPos = raidPositions[_G.SelectedRaid]
    if raidPos then
        _G.Teleport.topos(raidPos)
        task.wait(1)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectedRaid)
        task.wait(1)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Check")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Awaken")
        task.wait(5)
        
        while _G.AutoRaid and game:GetService("Workspace").Enemies:GetChildren()[1] do
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    repeat task.wait()
                        _G.Teleport.topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        _G.Combat.FastAttack(v)
                    until not _G.AutoRaid or v.Humanoid.Health <= 0 or not v.Parent
                end
            end
        end
        if _G.AutoFarm then _G.Utils.CheckQuest() _G.Teleport.topos(_G.CFrameMon) end
    end
end

spawn(function()
    while task.wait(1) do
        if _G.AutoRaid then pcall(module.AutoRaid) end
    end
end)

return module
