-- BossFarm.lua
local module = {}

local Bosses = {
    World1 = {
        ["Order"] = {Name = "Order"},
        ["Saber Expert"] = {Name = "Saber Expert", QuestRequired = true},
        ["The Gorilla King"] = {Name = "The Gorilla King"}
    },
    World2 = {
        ["Darkbeard"] = {Name = "Darkbeard"},
        ["Greybeard"] = {Name = "Greybeard"},
        ["Diamond"] = {Name = "Diamond"},
        ["Jeremy"] = {Name = "Jeremy"},
        ["Fajita"] = {Name = "Fajita"}
    },
    World3 = {
        ["rip_indra True Form"] = {Name = "rip_indra True Form"},
        ["Soul Reaper"] = {Name = "Soul Reaper"},
        ["Cursed Captain"] = {Name = "Cursed Captain"},
        ["Dough King"] = {Name = "Dough King"},
        ["Cake Prince"] = {Name = "Cake Prince"}
    }
}

function module.FarmBoss(bossName)
    local currentWorld = _G.World1 and "World1" or _G.World2 and "World2" or "World3"
    local bossData = Bosses[currentWorld][bossName]
    if bossData and game:GetService("Workspace").Enemies:FindFirstChild(bossData.Name) then
        if _G.Utils.CanAttackBoss(bossName) then
            _G.Utils.CheckBossQuest(bossName)
            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if v.Name == bossData.Name and v.Humanoid.Health > 0 then
                    repeat task.wait()
                        _G.Combat.AutoHaki()
                        _G.Combat.EquipWeapon(_G.SelectWeapon)
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        _G.Teleport.topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        _G.Combat.FastAttack(v)
                    until not _G.AutoFarmBoss or v.Humanoid.Health <= 0 or not v.Parent
                end
            end
        end
    end
end

function module.FarmAllBosses()
    local currentWorld = _G.World1 and "World1" or _G.World2 and "World2" or "World3"
    for bossName, bossData in pairs(Bosses[currentWorld]) do
        if game:GetService("Workspace").Enemies:FindFirstChild(bossData.Name) then
            module.FarmBoss(bossName)
        end
    end
end

spawn(function()
    while task.wait() do
        if _G.AutoFarmBoss then pcall(function() module.FarmBoss(_G.SelectedBoss) end)
        elseif _G.AutoFarmAllBosses then pcall(module.FarmAllBosses) end
    end
end)

return module
