-- Haki.lua
local module = {}

-- Função para localizar o Barista Cousin dinamicamente
local function findBaristaCousin()
    for _, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
        if v.Name == "Barista Cousin" and v:FindFirstChild("HumanoidRootPart") then
            return v.HumanoidRootPart.CFrame
        end
    end
    return nil
end

-- Função para verificar se Rip Indra está invocado
local function isRipIndraSpawned()
    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name == "rip_indra True Form" and v.Humanoid.Health > 0 then
            return true
        end
    end
    return false
end

-- Função para obter os Hakis Coloridos (Snow White, Pure Red, Winter Sky)
function module.AutoColoredHaki()
    local LocalPlayer = game:GetService("Players").LocalPlayer
    if not _G.World3 then
        _G.OrionLib:MakeNotification({Name = "Skull Hub", Content = "Teleporting to Sea 3 for Haki collection...", Time = 5})
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelThirdSea")
        task.wait(10) -- Espera o Sea 3 carregar
    end

    local fragments = LocalPlayer.Data.Fragments.Value or 0
    local berryRequirements = {
        ["White Cloud Berry"] = {Count = 0, Target = 10, For = "Snow White"},
        ["Red Cherry Berry"] = {Count = 0, Target = 15, For = "Pure Red"},
        ["Pink Pig Berry"] = {Count = 0, Target = 15, For = "Winter Sky"}
    }
    local colorsToBuy = {"Snow White", "Pure Red", "Winter Sky"}

    -- Passo 1: Priorizar Barista Cousin se disponível
    while _G.AutoColoredHaki do
        local baristaCFrame = findBaristaCousin()
        local ripIndraSpawned = isRipIndraSpawned()
        local hasEnoughLevel = LocalPlayer.Data.Level.Value >= 2200

        -- Se Rip Indra está invocado e o nível é suficiente, ignorar Barista Cousin
        if ripIndraSpawned and hasEnoughLevel then
            _G.OrionLib:MakeNotification({Name = "Skull Hub", Content = "Rip Indra spawned! Prioritizing Tushita quest...", Time = 5})
            break
        end

        -- Se Barista Cousin está disponível e há Fragments suficientes, comprar receita
        if baristaCFrame and fragments >= 7500 then
            _G.OrionLib:MakeNotification({Name = "Skull Hub", Content = "Found Barista Cousin! Prioritizing recipe purchase...", Time = 5})
            _G.Teleport.topos(baristaCFrame)
            task.wait(1)
            for i, color in pairs(colorsToBuy) do
                if not (LocalPlayer.Backpack:FindFirstChild(color) or LocalPlayer.Character:FindFirstChild(color)) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BaristaCousin", "BuyRecipe", color)
                    _G.OrionLib:MakeNotification({Name = "Skull Hub", Content = "Bought recipe for " .. color, Time = 2})
                    table.remove(colorsToBuy, i)
                    fragments = LocalPlayer.Data.Fragments.Value -- Atualiza Fragments após compra
                    break
                end
            end
        elseif not baristaCFrame then
            _G.OrionLib:MakeNotification({Name = "Skull Hub", Content = "Barista Cousin not found. Hopping server...", Time = 5})
            _G.Misc.Hop()
            task.wait(10) -- Espera o servidor carregar
        end

        -- Passo 2: Coletar Berries específicas no Sea 3
        if #colorsToBuy < 3 then -- Só coleta Berries se já comprou pelo menos uma receita
            _G.OrionLib:MakeNotification({Name = "Skull Hub", Content = "Starting Berry collection in Sea 3...", Time = 5})

            local berrySpots = {
                {Pos = CFrame.new(-5000, 315, -3000)}, -- Hydra Island (66 arbustos)
                {Pos = CFrame.new(-6500, 315, -9500)}, -- Great Tree (23 arbustos)
                {Pos = CFrame.new(-12550, 331, -7440)} -- Floating Turtle (Mansion)
            }

            local allCollected = false
            while not allCollected and _G.AutoColoredHaki do
                local berriesInServer = 0
                for _, spot in pairs(berrySpots) do
                    _G.Teleport.topos(spot.Pos)
                    task.wait(1)
                    for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v:IsA("Tool") and v:FindFirstChild("Handle") then
                            local berryName = v.Name
                            if berryRequirements[berryName] and berryRequirements[berryName].Count < berryRequirements[berryName].Target then
                                _G.Teleport.topos(v.Handle.CFrame)
                                task.wait(0.5)
                                firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v.Handle, 0)
                                firetouchinterest(LocalPlayer.Character.HumanoidRootPart, v.Handle, 1)
                                berryRequirements[berryName].Count = berryRequirements[berryName].Count + 1
                                berriesInServer = berriesInServer + 1
                                _G.OrionLib:MakeNotification({
                                    Name = "Skull Hub",
                                    Content = berryName .. ": " .. berryRequirements[berryName].Count .. "/" .. berryRequirements[berryName].Target .. " for " .. berryRequirements[berryName].For,
                                    Time = 2
                                })
                            end
                        end
                    end
                end

                -- Verifica se todas as Berries necessárias foram coletadas
                allCollected = true
                for _, req in pairs(berryRequirements) do
                    if req.Count < req.Target then
                        allCollected = false
                        break
                    end
                end

                if not allCollected and berriesInServer == 0 then
                    _G.OrionLib:MakeNotification({Name = "Skull Hub", Content = "No more Berries in this server. Hopping...", Time = 5})
                    _G.Misc.Hop()
                    task.wait(10)
                end
            end

            if allCollected then break end
        end

        task.wait(5) -- Pequena pausa para verificar Barista Cousin novamente
    end

    -- Passo 3: Fabricar as skins no Barista (Mansion)
    if not isRipIndraSpawned() then
        _G.OrionLib:MakeNotification({Name = "Skull Hub", Content = "Crafting Haki Skins at Barista...", Time = 5})
        _G.Teleport.topos(CFrame.new(-12550, 331, -7440)) -- Mansion no Sea 3
        task.wait(1)
        for _, color in pairs({"Snow White", "Pure Red", "Winter Sky"}) do
            if LocalPlayer.Backpack:FindFirstChild(color) or LocalPlayer.Character:FindFirstChild(color) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Barista", "CraftSkin", color)
                _G.OrionLib:MakeNotification({Name = "Skull Hub", Content = "Crafted " .. color .. " Haki Skin", Time = 2})
                task.wait(1)
            end
        end

        _G.OrionLib:MakeNotification({Name = "Skull Hub", Content = "Colored Haki (Snow White, Pure Red, Winter Sky) obtained!", Time = 5})
    end
end

-- Função para obter o Haki Lendário (ex.: Rainbow Saviour)
function module.AutoLegendaryHaki()
    local LocalPlayer = game:GetService("Players").LocalPlayer
    if not _G.World3 or LocalPlayer.Data.Level.Value < 2000 then
        _G.OrionLib:MakeNotification({Name = "Skull Hub", Content = "Need Sea 3 and Level 2000+ for Legendary Haki", Time = 5})
        return
    end

    _G.OrionLib:MakeNotification({Name = "Skull Hub", Content = "Starting Rainbow Saviour Quest...", Time = 5})
    _G.Teleport.topos(CFrame.new(-12550, 331, -7440)) -- Haki Master (Mansion)
    task.wait(1)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HakiMaster", "StartRainbowQuest")

    _G.OrionLib:MakeNotification({Name = "Skull Hub", Content = "Farming 500 kills for Rainbow Saviour...", Time = 5})
    local kills = 0
    while kills < 500 and _G.AutoLegendaryHaki do
        _G.Utils.CheckQuest()
        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v.Name == _G.NameMon and v.Humanoid.Health > 0 then
                repeat task.wait()
                    _G.Teleport.topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                    _G.Combat.FastAttack(v)
                until v.Humanoid.Health <= 0 or not v.Parent
                kills = kills + 1
                if kills % 50 == 0 then
                    _G.OrionLib:MakeNotification({Name = "Skull Hub", Content = "Kills: " .. kills .. "/500", Time = 3})
                end
            end
        end
        task.wait(1)
    end

    _G.OrionLib:MakeNotification({Name = "Skull Hub", Content = "Completing Rainbow Saviour Quest...", Time = 5})
    _G.Teleport.topos(CFrame.new(-12550, 331, -7440))
    task.wait(1)
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HakiMaster", "FinishRainbowQuest")

    _G.OrionLib:MakeNotification({Name = "Skull Hub", Content = "Rainbow Saviour Haki obtained!", Time = 5})
end

-- Loops para executar as funções
spawn(function()
    while task.wait(5) do
        if _G.AutoColoredHaki then pcall(module.AutoColoredHaki) end
    end
end)

spawn(function()
    while task.wait(5) do
        if _G.AutoLegendaryHaki then pcall(module.AutoLegendaryHaki) end
    end
end)

return module
