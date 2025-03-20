-- Misc.lua
local module = {}

function module.AntiAFK()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
    task.wait(0.1)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, "W", false, game)
end

function module.AutoSetSpawn()
    if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
        if game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0 then
            task.wait(5)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        end
    end
end

function module.Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local Site
    while true do
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" then
            foundAnything = Site.nextPageCursor
        end
        for _, v in pairs(Site.data) do
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                pcall(function()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, v.id, game:GetService("Players").LocalPlayer)
                end)
                wait(4)
            end
        end
        task.wait(1)
    end
end

spawn(function()
    while task.wait(60) do
        module.AntiAFK()
    end
end)

spawn(function()
    while task.wait(1) do
        if _G.AutoSetSpawn then pcall(module.AutoSetSpawn) end
    end
end)

return module
