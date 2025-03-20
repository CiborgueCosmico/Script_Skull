-- AutoFarm.lua
local module = {}

function module.AutoFarm()
    if _G.AutoFarm and not _G.AutoFarmAllBosses then
        pcall(function()
            _G.Utils.CheckQuest()
            if game:GetService("Workspace").Enemies:FindFirstChild(_G.NameMon) then
                if _G.BringMob then _G.Combat.BringMob() end
                for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == _G.NameMon and v.Humanoid.Health > 0 then
                        repeat task.wait()
                            _G.Teleport.topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                            _G.Combat.FastAttack(v)
                        until not _G.AutoFarm or v.Humanoid.Health <= 0 or not v.Parent
                    end
                end
            else
                _G.Teleport.topos(_G.CFrameMon)
            end
        end)
    end
end

spawn(function()
    while task.wait(0.1) do
        module.AutoFarm()
    end
end)

return module
