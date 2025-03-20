-- Teleport.lua
local module = {}

function module.topos(targetCFrame)
    local character = game:GetService("Players").LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        if _G.BypassTP then
            character.HumanoidRootPart.CFrame = targetCFrame
        else
            local tween = game:GetService("TweenService"):Create(
                character.HumanoidRootPart,
                TweenInfo.new((character.HumanoidRootPart.Position - targetCFrame.Position).Magnitude / 100, Enum.EasingStyle.Linear),
                {CFrame = targetCFrame}
            )
            tween:Play()
            tween.Completed:Wait()
        end
    end
end

return module
