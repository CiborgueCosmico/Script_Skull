-- AutoStats.lua
local module = {}

function module.AutoStats()
    if _G.AutoStats and game:GetService("Players").LocalPlayer.Data.Points.Value > 0 then
        for stat, enabled in pairs(_G.Stats) do
            if enabled then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", stat, _G.StatPoints)
                task.wait(0.1)
            end
        end
    end
end

spawn(function()
    while task.wait(1) do
        if _G.AutoStats then pcall(module.AutoStats) end
    end
end)

return module
