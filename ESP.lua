-- ESP.lua
local module = {}

local function AddESP(instance, color, text)
    local billboard = Instance.new("BillboardGui")
    billboard.Adornee = instance
    billboard.Size = UDim2.new(0, 100, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    billboard.AlwaysOnTop = true
    local label = Instance.new("TextLabel", billboard)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color
    label.TextScaled = true
    billboard.Parent = instance
end

function module.ESP()
    pcall(function()
        if _G.ESPPlayer then
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player ~= game:GetService("Players").LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    if not player.Character:FindFirstChild("PlayerESP") then
                        AddESP(player.Character.HumanoidRootPart, Color3.new(1, 0, 0), player.Name)
                        player.Character.HumanoidRootPart:FindFirstChild("PlayerESP").Name = "PlayerESP"
                    end
                end
            end
        end
        if _G.ChestESP then
            for _, chest in pairs(game:GetService("Workspace"):GetChildren()) do
                if string.find(chest.Name, "Chest") and not chest:FindFirstChild("ChestESP") then
                    AddESP(chest, Color3.new(1, 1, 0), chest.Name)
                    chest:FindFirstChild("ChestESP").Name = "ChestESP"
                end
            end
        end
        if _G.DevilFruitESP then
            for _, fruit in pairs(game:GetService("Workspace"):GetChildren()) do
                if fruit:IsA("Tool") and string.find(fruit.Name, "Fruit") and not fruit:FindFirstChild("FruitESP") then
                    AddESP(fruit.Handle, Color3.new(0, 1, 0), fruit.Name)
                    fruit.Handle:FindFirstChild("FruitESP").Name = "FruitESP"
                end
            end
        end
    end)
end

spawn(function()
    while task.wait(1) do
        module.ESP()
    end
end)

return module
