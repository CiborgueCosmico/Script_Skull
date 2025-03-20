-- Utils.lua
local module = {}

-- Função para verificar e definir a quest atual com base no nível do jogador
function module.CheckQuest()
    local MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
    local QuestNPCs = {
        ["BanditQuest1"] = "Bandit Leader",
        ["JungleQuest"] = "Jungle Quest Giver",
        ["BuggyQuest1"] = "Pirate Captain",
        ["DesertQuest"] = "Desert Officer",
        ["SnowQuest1"] = "Snowman Leader",
        ["MarineQuest1"] = "Marine Leader",
        ["SkyQuest1"] = "Sky Bandit Leader",
        ["SkyQuest2"] = "Sky Master",
        ["PrisonQuest1"] = "Prison Guard",
        ["ColosseumQuest1"] = "Gladiator Leader",
        ["MagmaQuest1"] = "Magma Admiral",
        ["FishmanQuest1"] = "Fishman Leader",
        ["FountainQuest"] = "Fountain Leader",
        ["MarineQuest2"] = "Marine Commander",
        ["Area1Quest"] = "Area 1 Leader",
        ["Area2Quest"] = "Area 2 Leader",
        ["SnowMountainQuest1"] = "Snow Mountain Leader",
        ["FrostQuest"] = "Ice Admiral",
        ["FireSideQuest"] = "Fire Leader",
        ["DarkMasterQuest"] = "Dark Master",
        ["FountainQuest2"] = "Fountain Leader",
        ["ZombieQuest"] = "Zombie Leader",
        ["PiratePortQuest"] = "Port Guard",
        ["AmazonQuest"] = "Amazon Leader",
        ["AmazonQuest2"] = "Amazon Leader 2",
        ["CitizenQuest"] = "Citizen Leader",
        ["MarineTreeQuest"] = "Marine Tree Leader",
        ["CaveIslandQuest"] = "Cave Leader",
        ["TikiQuest1"] = "Tiki Quest Giver",
        ["TikiQuest2"] = "Tiki Quest Giver",
        ["TikiQuest3"] = "Tiki Quest Giver"
    }

    -- Sea 1 (World 1)
    if _G.World1 then
        if MyLevel >= 0 and MyLevel <= 9 then _G.Mon = "Bandit" _G.LevelQuest = 1 _G.NameQuest = "BanditQuest1" _G.NameMon = "Bandit"
        elseif MyLevel >= 10 and MyLevel <= 14 then _G.Mon = "Monkey" _G.LevelQuest = 1 _G.NameQuest = "JungleQuest" _G.NameMon = "Monkey"
        elseif MyLevel >= 15 and MyLevel <= 29 then _G.Mon = "Gorilla" _G.LevelQuest = 2 _G.NameQuest = "JungleQuest" _G.NameMon = "Gorilla"
        elseif MyLevel >= 30 and MyLevel <= 39 then _G.Mon = "Pirate" _G.LevelQuest = 1 _G.NameQuest = "BuggyQuest1" _G.NameMon = "Pirate"
        elseif MyLevel >= 40 and MyLevel <= 59 then _G.Mon = "Brute" _G.LevelQuest = 2 _G.NameQuest = "BuggyQuest1" _G.NameMon = "Brute"
        elseif MyLevel >= 60 and MyLevel <= 74 then _G.Mon = "Desert Bandit" _G.LevelQuest = 1 _G.NameQuest = "DesertQuest" _G.NameMon = "Desert Bandit"
        elseif MyLevel >= 75 and MyLevel <= 89 then _G.Mon = "Desert Officer" _G.LevelQuest = 2 _G.NameQuest = "DesertQuest" _G.NameMon = "Desert Officer"
        elseif MyLevel >= 90 and MyLevel <= 99 then _G.Mon = "Snow Bandit" _G.LevelQuest = 1 _G.NameQuest = "SnowQuest1" _G.NameMon = "Snow Bandit"
        elseif MyLevel >= 100 and MyLevel <= 119 then _G.Mon = "Snowman" _G.LevelQuest = 2 _G.NameQuest = "SnowQuest1" _G.NameMon = "Snowman"
        elseif MyLevel >= 120 and MyLevel <= 149 then _G.Mon = "Chief Petty Officer" _G.LevelQuest = 1 _G.NameQuest = "MarineQuest1" _G.NameMon = "Chief Petty Officer"
        elseif MyLevel >= 150 and MyLevel <= 174 then _G.Mon = "Sky Bandit" _G.LevelQuest = 1 _G.NameQuest = "SkyQuest1" _G.NameMon = "Sky Bandit"
        elseif MyLevel >= 175 and MyLevel <= 189 then _G.Mon = "Dark Master" _G.LevelQuest = 2 _G.NameQuest = "SkyQuest1" _G.NameMon = "Dark Master"
        elseif MyLevel >= 190 and MyLevel <= 209 then _G.Mon = "Prisoner" _G.LevelQuest = 1 _G.NameQuest = "PrisonQuest1" _G.NameMon = "Prisoner"
        elseif MyLevel >= 210 and MyLevel <= 249 then _G.Mon = "Dangerous Prisoner" _G.LevelQuest = 2 _G.NameQuest = "PrisonQuest1" _G.NameMon = "Dangerous Prisoner"
        elseif MyLevel >= 250 and MyLevel <= 274 then _G.Mon = "Toga Warrior" _G.LevelQuest = 1 _G.NameQuest = "ColosseumQuest1" _G.NameMon = "Toga Warrior"
        elseif MyLevel >= 275 and MyLevel <= 299 then _G.Mon = "Gladiator" _G.LevelQuest = 2 _G.NameQuest = "ColosseumQuest1" _G.NameMon = "Gladiator"
        elseif MyLevel >= 300 and MyLevel <= 324 then _G.Mon = "Military Soldier" _G.LevelQuest = 1 _G.NameQuest = "MagmaQuest1" _G.NameMon = "Military Soldier"
        elseif MyLevel >= 325 and MyLevel <= 349 then _G.Mon = "Military Spy" _G.LevelQuest = 2 _G.NameQuest = "MagmaQuest1" _G.NameMon = "Military Spy"
        elseif MyLevel >= 350 and MyLevel <= 399 then _G.Mon = "Fishman Warrior" _G.LevelQuest = 1 _G.NameQuest = "FishmanQuest1" _G.NameMon = "Fishman Warrior"
        elseif MyLevel >= 400 and MyLevel <= 449 then _G.Mon = "Fishman Commando" _G.LevelQuest = 2 _G.NameQuest = "FishmanQuest1" _G.NameMon = "Fishman Commando"
        elseif MyLevel >= 450 and MyLevel <= 474 then _G.Mon = "God's Guard" _G.LevelQuest = 1 _G.NameQuest = "SkyQuest2" _G.NameMon = "God's Guard"
        elseif MyLevel >= 475 and MyLevel <= 524 then _G.Mon = "Shanda" _G.LevelQuest = 2 _G.NameQuest = "SkyQuest2" _G.NameMon = "Shanda"
        elseif MyLevel >= 525 and MyLevel <= 549 then _G.Mon = "Royal Squad" _G.LevelQuest = 1 _G.NameQuest = "SkyQuest2" _G.NameMon = "Royal Squad"
        elseif MyLevel >= 550 and MyLevel <= 624 then _G.Mon = "Royal Soldier" _G.LevelQuest = 2 _G.NameQuest = "SkyQuest2" _G.NameMon = "Royal Soldier"
        elseif MyLevel >= 625 and MyLevel <= 649 then _G.Mon = "Galley Pirate" _G.LevelQuest = 1 _G.NameQuest = "FountainQuest" _G.NameMon = "Galley Pirate"
        elseif MyLevel >= 650 and MyLevel <= 699 then _G.Mon = "Galley Captain" _G.LevelQuest = 2 _G.NameQuest = "FountainQuest" _G.NameMon = "Galley Captain"
        end

    -- Sea 2 (World 2)
    elseif _G.World2 then
        if MyLevel >= 700 and MyLevel <= 724 then _G.Mon = "Raider" _G.LevelQuest = 1 _G.NameQuest = "Area1Quest" _G.NameMon = "Raider"
        elseif MyLevel >= 725 and MyLevel <= 749 then _G.Mon = "Mercenary" _G.LevelQuest = 2 _G.NameQuest = "Area1Quest" _G.NameMon = "Mercenary"
        elseif MyLevel >= 750 and MyLevel <= 774 then _G.Mon = "Swan Pirate" _G.LevelQuest = 1 _G.NameQuest = "Area2Quest" _G.NameMon = "Swan Pirate"
        elseif MyLevel >= 775 and MyLevel <= 799 then _G.Mon = "Factory Staff" _G.LevelQuest = 2 _G.NameQuest = "Area2Quest" _G.NameMon = "Factory Staff"
        elseif MyLevel >= 800 and MyLevel <= 874 then _G.Mon = "Marine Lieutenant" _G.LevelQuest = 1 _G.NameQuest = "MarineQuest2" _G.NameMon = "Marine Lieutenant"
        elseif MyLevel >= 875 and MyLevel <= 899 then _G.Mon = "Marine Captain" _G.LevelQuest = 2 _G.NameQuest = "MarineQuest2" _G.NameMon = "Marine Captain"
        elseif MyLevel >= 900 and MyLevel <= 949 then _G.Mon = "Zombie" _G.LevelQuest = 1 _G.NameQuest = "ZombieQuest" _G.NameMon = "Zombie"
        elseif MyLevel >= 950 and MyLevel <= 974 then _G.Mon = "Vampire" _G.LevelQuest = 2 _G.NameQuest = "ZombieQuest" _G.NameMon = "Vampire"
        elseif MyLevel >= 975 and MyLevel <= 999 then _G.Mon = "Snow Trooper" _G.LevelQuest = 1 _G.NameQuest = "SnowMountainQuest1" _G.NameMon = "Snow Trooper"
        elseif MyLevel >= 1000 and MyLevel <= 1049 then _G.Mon = "Winter Warrior" _G.LevelQuest = 2 _G.NameQuest = "SnowMountainQuest1" _G.NameMon = "Winter Warrior"
        elseif MyLevel >= 1050 and MyLevel <= 1099 then _G.Mon = "Lab Subordinate" _G.LevelQuest = 1 _G.NameQuest = "FrostQuest" _G.NameMon = "Lab Subordinate"
        elseif MyLevel >= 1100 and MyLevel <= 1124 then _G.Mon = "Horned Warrior" _G.LevelQuest = 2 _G.NameQuest = "FrostQuest" _G.NameMon = "Horned Warrior"
        elseif MyLevel >= 1125 and MyLevel <= 1174 then _G.Mon = "Magma Ninja" _G.LevelQuest = 1 _G.NameQuest = "FireSideQuest" _G.NameMon = "Magma Ninja"
        elseif MyLevel >= 1175 and MyLevel <= 1199 then _G.Mon = "Lava Pirate" _G.LevelQuest = 2 _G.NameQuest = "FireSideQuest" _G.NameMon = "Lava Pirate"
        elseif MyLevel >= 1200 and MyLevel <= 1249 then _G.Mon = "Ship Deckhand" _G.LevelQuest = 1 _G.NameQuest = "FountainQuest2" _G.NameMon = "Ship Deckhand"
        elseif MyLevel >= 1250 and MyLevel <= 1274 then _G.Mon = "Ship Engineer" _G.LevelQuest = 2 _G.NameQuest = "FountainQuest2" _G.NameMon = "Ship Engineer"
        elseif MyLevel >= 1275 and MyLevel <= 1299 then _G.Mon = "Ship Steward" _G.LevelQuest = 3 _G.NameQuest = "FountainQuest2" _G.NameMon = "Ship Steward"
        elseif MyLevel >= 1300 and MyLevel <= 1324 then _G.Mon = "Ship Officer" _G.LevelQuest = 4 _G.NameQuest = "FountainQuest2" _G.NameMon = "Ship Officer"
        end

    -- Sea 3 (World 3)
    elseif _G.World3 then
        if MyLevel >= 1500 and MyLevel <= 1524 then _G.Mon = "Pirate Millionaire" _G.LevelQuest = 1 _G.NameQuest = "PiratePortQuest" _G.NameMon = "Pirate Millionaire"
        elseif MyLevel >= 1525 and MyLevel <= 1574 then _G.Mon = "Pistol Billionaire" _G.LevelQuest = 2 _G.NameQuest = "PiratePortQuest" _G.NameMon = "Pistol Billionaire"
        elseif MyLevel >= 1575 and MyLevel <= 1599 then _G.Mon = "Dragon Crew Warrior" _G.LevelQuest = 1 _G.NameQuest = "AmazonQuest" _G.NameMon = "Dragon Crew Warrior"
        elseif MyLevel >= 1600 and MyLevel <= 1624 then _G.Mon = "Dragon Crew Archer" _G.LevelQuest = 2 _G.NameQuest = "AmazonQuest" _G.NameMon = "Dragon Crew Archer"
        elseif MyLevel >= 1625 and MyLevel <= 1649 then _G.Mon = "Female Islander" _G.LevelQuest = 1 _G.NameQuest = "AmazonQuest2" _G.NameMon = "Female Islander"
        elseif MyLevel >= 1650 and MyLevel <= 1699 then _G.Mon = "Giant Islander" _G.LevelQuest = 2 _G.NameQuest = "AmazonQuest2" _G.NameMon = "Giant Islander"
        elseif MyLevel >= 1700 and MyLevel <= 1724 then _G.Mon = "Marine Commodore" _G.LevelQuest = 1 _G.NameQuest = "MarineTreeQuest" _G.NameMon = "Marine Commodore"
        elseif MyLevel >= 1725 and MyLevel <= 1774 then _G.Mon = "Marine Rear Admiral" _G.LevelQuest = 2 _G.NameQuest = "MarineTreeQuest" _G.NameMon = "Marine Rear Admiral"
        elseif MyLevel >= 1775 and MyLevel <= 1799 then _G.Mon = "Fishman Raider" _G.LevelQuest = 1 _G.NameQuest = "CitizenQuest" _G.NameMon = "Fishman Raider"
        elseif MyLevel >= 1800 and MyLevel <= 1824 then _G.Mon = "Fishman Captain" _G.LevelQuest = 2 _G.NameQuest = "CitizenQuest" _G.NameMon = "Fishman Captain"
        elseif MyLevel >= 1825 and MyLevel <= 1849 then _G.Mon = "Forest Pirate" _G.LevelQuest = 1 _G.NameQuest = "CaveIslandQuest" _G.NameMon = "Forest Pirate"
        elseif MyLevel >= 1850 and MyLevel <= 1899 then _G.Mon = "Mythological Pirate" _G.LevelQuest = 2 _G.NameQuest = "CaveIslandQuest" _G.NameMon = "Mythological Pirate"
        elseif MyLevel >= 1900 and MyLevel <= 1924 then _G.Mon = "Jungle Pirate" _G.LevelQuest = 1 _G.NameQuest = "ZombieQuest" _G.NameMon = "Jungle Pirate"
        elseif MyLevel >= 1925 and MyLevel <= 1974 then _G.Mon = "Musketeer Pirate" _G.LevelQuest = 2 _G.NameQuest = "ZombieQuest" _G.NameMon = "Musketeer Pirate"
        elseif MyLevel >= 1975 and MyLevel <= 1999 then _G.Mon = "Reborn Skeleton" _G.LevelQuest = 1 _G.NameQuest = "ZombieQuest" _G.NameMon = "Reborn Skeleton"
        elseif MyLevel >= 2000 and MyLevel <= 2024 then _G.Mon = "Living Zombie" _G.LevelQuest = 2 _G.NameQuest = "ZombieQuest" _G.NameMon = "Living Zombie"
        elseif MyLevel >= 2025 and MyLevel <= 2049 then _G.Mon = "Demonic Soul" _G.LevelQuest = 3 _G.NameQuest = "ZombieQuest" _G.NameMon = "Demonic Soul"
        elseif MyLevel >= 2050 and MyLevel <= 2074 then _G.Mon = "Posessed Mummy" _G.LevelQuest = 4 _G.NameQuest = "ZombieQuest" _G.NameMon = "Posessed Mummy"
        elseif MyLevel >= 2075 and MyLevel <= 2099 then _G.Mon = "Peanut Scout" _G.LevelQuest = 1 _G.NameQuest = "CitizenQuest" _G.NameMon = "Peanut Scout"
        elseif MyLevel >= 2100 and MyLevel <= 2124 then _G.Mon = "Peanut President" _G.LevelQuest = 2 _G.NameQuest = "CitizenQuest" _G.NameMon = "Peanut President"
        elseif MyLevel >= 2125 and MyLevel <= 2149 then _G.Mon = "Ice Cream Chef" _G.LevelQuest = 1 _G.NameQuest = "CitizenQuest" _G.NameMon = "Ice Cream Chef"
        elseif MyLevel >= 2150 and MyLevel <= 2199 then _G.Mon = "Ice Cream Commander" _G.LevelQuest = 2 _G.NameQuest = "CitizenQuest" _G.NameMon = "Ice Cream Commander"
        elseif MyLevel >= 2200 and MyLevel <= 2224 then _G.Mon = "Cookie Crafter" _G.LevelQuest = 1 _G.NameQuest = "CitizenQuest" _G.NameMon = "Cookie Crafter"
        elseif MyLevel >= 2225 and MyLevel <= 2249 then _G.Mon = "Cake Guard" _G.LevelQuest = 2 _G.NameQuest = "CitizenQuest" _G.NameMon = "Cake Guard"
        elseif MyLevel >= 2250 and MyLevel <= 2274 then _G.Mon = "Baking Staff" _G.LevelQuest = 1 _G.NameQuest = "CitizenQuest" _G.NameMon = "Baking Staff"
        elseif MyLevel >= 2275 and MyLevel <= 2299 then _G.Mon = "Head Baker" _G.LevelQuest = 2 _G.NameQuest = "CitizenQuest" _G.NameMon = "Head Baker"
        elseif MyLevel >= 2300 and MyLevel <= 2324 then _G.Mon = "Cocoa Warrior" _G.LevelQuest = 1 _G.NameQuest = "CitizenQuest" _G.NameMon = "Cocoa Warrior"
        elseif MyLevel >= 2325 and MyLevel <= 2349 then _G.Mon = "Chocolate Bar Battler" _G.LevelQuest = 2 _G.NameQuest = "CitizenQuest" _G.NameMon = "Chocolate Bar Battler"
        elseif MyLevel >= 2350 and MyLevel <= 2374 then _G.Mon = "Sweet Thief" _G.LevelQuest = 1 _G.NameQuest = "CitizenQuest" _G.NameMon = "Sweet Thief"
        elseif MyLevel >= 2375 and MyLevel <= 2399 then _G.Mon = "Candy Rebel" _G.LevelQuest = 2 _G.NameQuest = "CitizenQuest" _G.NameMon = "Candy Rebel"
        elseif MyLevel >= 2400 and MyLevel <= 2424 then _G.Mon = "Candy Pirate" _G.LevelQuest = 1 _G.NameQuest = "CitizenQuest" _G.NameMon = "Candy Pirate"
        elseif MyLevel >= 2425 and MyLevel <= 2449 then _G.Mon = "Snow Demon" _G.LevelQuest = 2 _G.NameQuest = "CitizenQuest" _G.NameMon = "Snow Demon"
        elseif MyLevel >= 2450 and MyLevel <= 2474 then _G.Mon = "Isle Outlaw" _G.LevelQuest = 1 _G.NameQuest = "TikiQuest1" _G.NameMon = "Isle Outlaw"
        elseif MyLevel >= 2475 and MyLevel <= 2499 then _G.Mon = "Island Boy" _G.LevelQuest = 2 _G.NameQuest = "TikiQuest1" _G.NameMon = "Island Boy"
        elseif MyLevel >= 2500 and MyLevel <= 2524 then _G.Mon = "Sun-kissed Warrior" _G.LevelQuest = 1 _G.NameQuest = "TikiQuest2" _G.NameMon = "Sun-kissed Warrior"
        elseif MyLevel >= 2525 and MyLevel <= 2549 then _G.Mon = "Isle Champion" _G.LevelQuest = 2 _G.NameQuest = "TikiQuest2" _G.NameMon = "Isle Champion"
        elseif MyLevel >= 2550 and MyLevel <= 2574 then _G.Mon = "Serpent Hunter" _G.LevelQuest = 1 _G.NameQuest = "TikiQuest3" _G.NameMon = "Serpent Hunter"
        elseif MyLevel >= 2575 and MyLevel <= 2600 then _G.Mon = "Skull Slayer" _G.LevelQuest = 2 _G.NameQuest = "TikiQuest3" _G.NameMon = "Skull Slayer"
        end
    else
        game:GetService("Players").LocalPlayer:Kick("Do not Support, Please wait...")
        return
    end

    -- Função auxiliar para obter a posição do NPC da quest
    local function GetQuestNPCPosition(questName)
        local npcName = QuestNPCs[questName]
        for _, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
            if v.Name == npcName and v:FindFirstChild("HumanoidRootPart") then
                return v.HumanoidRootPart.CFrame
            end
        end
        return CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625) -- Posição padrão
    end

    -- Função auxiliar para obter a posição do monstro
    local function GetMonsterPosition(monName)
        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v.Name == monName and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                return v.HumanoidRootPart.CFrame
            end
        end
        return nil
    end

    _G.CFrameQuest = GetQuestNPCPosition(_G.NameQuest)
    local monPos = GetMonsterPosition(_G.NameMon)
    _G.CFrameMon = monPos or (_G.CFrameQuest * CFrame.new(0, 0, 50))
end

-- Função para verificar se um boss requer uma quest e iniciá-la
function module.CheckBossQuest(bossName)
    local MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
    local BossQuests = {
        ["Saber Expert"] = {QuestName = "JungleQuest", LevelReq = 200, NPCName = "The Jungle Master"},
        ["Darkbeard"] = {QuestName = "DarkbeardQuest", LevelReq = 1000, NPCName = "Darkbeard Quest Giver"},
        ["rip_indra True Form"] = {QuestName = "IndraQuest", LevelReq = 1500, NPCName = "Indra Quest Giver"},
        ["Order"] = {QuestName = "OrderQuest", LevelReq = 500, NPCName = "Order Quest Giver"},
        ["The Gorilla King"] = {QuestName = "GorillaQuest", LevelReq = 25, NPCName = "Gorilla Quest Giver"},
        ["Greybeard"] = {QuestName = "GreybeardQuest", LevelReq = 850, NPCName = "Greybeard Quest Giver"},
        ["Diamond"] = {QuestName = "DiamondQuest", LevelReq = 750, NPCName = "Diamond Quest Giver"},
        ["Jeremy"] = {QuestName = "JeremyQuest", LevelReq = 800, NPCName = "Jeremy Quest Giver"},
        ["Fajita"] = {QuestName = "FajitaQuest", LevelReq = 900, NPCName = "Fajita Quest Giver"},
        ["Soul Reaper"] = {QuestName = "SoulReaperQuest", LevelReq = 1700, NPCName = "Soul Reaper Quest Giver"},
        ["Cursed Captain"] = {QuestName = "CursedCaptainQuest", LevelReq = 1800, NPCName = "Cursed Captain Quest Giver"},
        ["Dough King"] = {QuestName = "DoughKingQuest", LevelReq = 2200, NPCName = "Dough King Quest Giver"},
        ["Cake Prince"] = {QuestName = "CakePrinceQuest", LevelReq = 2150, NPCName = "Cake Prince Quest Giver"}
    }

    if BossQuests[bossName] and _G.AutoQuestBoss then
        local questData = BossQuests[bossName]
        if MyLevel >= questData.LevelReq then
            local npc = game:GetService("Workspace").NPCs:FindFirstChild(questData.NPCName)
            if npc and npc:FindFirstChild("HumanoidRootPart") then
                _G.Teleport.topos(npc.HumanoidRootPart.CFrame)
                task.wait(1)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", questData.QuestName, 1)
                return true
            end
        end
    end
    return false
end

-- Função para listar bosses spawnados no mundo atual
function module.GetSpawnedBosses()
    local spawnedBosses = {}
    local currentWorld = _G.World1 and "World1" or _G.World2 and "World2" or "World3"
    local Bosses = {
        World1 = {
            ["Order"] = {Name = "Order"},
            ["Saber Expert"] = {Name = "Saber Expert"},
            ["The Gorilla King"] = {Name = "The Gorilla King"},
            ["Bobby"] = {Name = "Bobby"},
            ["Yeti"] = {Name = "Yeti"},
            ["Mob Leader"] = {Name = "Mob Leader"},
            ["Vice Admiral"] = {Name = "Vice Admiral"}
        },
        World2 = {
            ["Darkbeard"] = {Name = "Darkbeard"},
            ["Greybeard"] = {Name = "Greybeard"},
            ["Diamond"] = {Name = "Diamond"},
            ["Jeremy"] = {Name = "Jeremy"},
            ["Fajita"] = {Name = "Fajita"},
            ["Don Swan"] = {Name = "Don Swan"},
            ["Smoke Admiral"] = {Name = "Smoke Admiral"},
            ["Cursed Captain"] = {Name = "Cursed Captain"}
        },
        World3 = {
            ["rip_indra True Form"] = {Name = "rip_indra True Form"},
            ["Soul Reaper"] = {Name = "Soul Reaper"},
            ["Longma"] = {Name = "Longma"},
            ["Captain Elephant"] = {Name = "Captain Elephant"},
            ["Beautiful Pirate"] = {Name = "Beautiful Pirate"},
            ["Stone"] = {Name = "Stone"},
            ["Island Empress"] = {Name = "Island Empress"},
            ["Kilo Admiral"] = {Name = "Kilo Admiral"},
            ["Cake Queen"] = {Name = "Cake Queen"}
        }
    }
    for bossName, bossData in pairs(Bosses[currentWorld]) do
        if game:GetService("Workspace").Enemies:FindFirstChild(bossData.Name) then
            table.insert(spawnedBosses, bossName)
        end
    end
    return spawnedBosses
end

-- Função para verificar se o jogador pode atacar o boss (se requer quest)
function module.CanAttackBoss(bossName)
    local bossData = {
        ["Saber Expert"] = {QuestRequired = true},
        ["Darkbeard"] = {QuestRequired = true},
        ["rip_indra True Form"] = {QuestRequired = true},
        ["Order"] = {QuestRequired = true},
        ["The Gorilla King"] = {QuestRequired = true},
        ["Greybeard"] = {QuestRequired = true},
        ["Diamond"] = {QuestRequired = true},
        ["Jeremy"] = {QuestRequired = true},
        ["Fajita"] = {QuestRequired = true},
        ["Soul Reaper"] = {QuestRequired = true},
        ["Cursed Captain"] = {QuestRequired = true},
        ["Dough King"] = {QuestRequired = true},
        ["Cake Prince"] = {QuestRequired = true}
    }
    if bossData[bossName] and bossData[bossName].QuestRequired then
        return game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
    end
    return true
end

return module
