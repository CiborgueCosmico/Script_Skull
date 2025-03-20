-- FruitCollect.lua
local module = {}

function module.FruitCollect()
    if _G.AutoFruitCollect then
        for _, fruit in pairs(game:GetService("Workspace"):GetChildren()) do
            if fruit:IsA("Tool") and string.find(fruit.Name, "Fruit") then
                _G.Teleport.topos(fruit.Handle.CFrame)
                task.wait(0.5)
                firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, fruit.Handle, 0)
                firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, fruit.Handle, 1)
            end
        end
    end
end

spawn(function()
    while task.wait(1) do
        pcall(module.FruitCollect)
    end
end)

return module
