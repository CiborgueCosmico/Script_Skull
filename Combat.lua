-- Combat.lua
local module = {}

function module.AutoHaki()
    if _G.AutoHaki then
        if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
            game:GetService("ReplicatedStorage").Remotes.Buso:FireServer()
        end
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("KenHaki") and not game:GetService("Players").LocalPlayer.Character.KenHaki.Value then
            game:GetService("ReplicatedStorage").Remotes.Ken:FireServer()
        end
    end
end

function module.EquipWeapon(ToolSe)
    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(ToolSe))
    end
end

function module.BringMob()
    local hrp = game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local bringDistance = 100
    local bringPos = hrp.Position

    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            local mobPos = v.HumanoidRootPart.Position
            local distance = (mobPos - bringPos).Magnitude
            if distance <= bringDistance then
                v.HumanoidRootPart.CFrame = CFrame.new(bringPos + Vector3.new(0, 5, 0))
                v.HumanoidRootPart.CanCollide = false
                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
            end
        end
    end
end

function module.FastAttack(target)
    local VirtualUser = game:GetService("VirtualUser")
    if not target or not target:FindFirstChild("Humanoid") or target.Humanoid.Health <= 0 then return end

    module.AutoHaki()
    module.EquipWeapon(_G.SelectWeapon)

    local tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
    local skills = {"Z", "X", "C", "V"}

    if _G.FastAttack then
        for i = 1, _G.MaxAttacksPerBurst do
            VirtualUser:CaptureController()
            VirtualUser:Button1Down(Vector2.new(1280, 672))
            if tool and #skills > 0 then
                local skill = skills[math.random(1, #skills)]
                game:GetService("VirtualInputManager"):SendKeyEvent(true, skill, false, game)
                task.wait(0.05)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, skill, false, game)
            end
            game:GetService("RunService").Heartbeat:Wait()
        end
        task.wait(0.2)
    else
        VirtualUser:CaptureController()
        VirtualUser:Button1Down(Vector2.new(1280, 672))
    end
end

return module
