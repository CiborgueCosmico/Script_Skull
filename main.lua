-- main.lua
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()

-- Variáveis Globais
_G = _G or {}
_G.AutoFarm = false
_G.AutoFarmBoss = false
_G.AutoFarmAllBosses = false
_G.SelectedBoss = "Rip Indra"
_G.SelectWeapon = "Melee"
_G.BringMob = true
_G.AutoHaki = false
_G.BypassTP = false
_G.ESPPlayer = false
_G.ChestESP = false
_G.DevilFruitESP = false
_G.Remove_Effect = true
_G.AutoFruitCollect = false
_G.AutoQuestBoss = true
_G.FastAttack = false
_G.AttackDelay = 0.15
_G.MaxAttacksPerBurst = 3
_G.AutoRaid = false
_G.SelectedRaid = "Buddha"
_G.AutoStats = false
_G.Stats = {Melee = false, Defense = false, Sword = false, Gun = false, Fruit = false}
_G.StatPoints = 3
_G.AutoThirdSea = false
_G.AutoSetSpawn = false
_G.World1 = game:GetService("Players").LocalPlayer.Data.World.Value == 1
_G.World2 = game:GetService("Players").LocalPlayer.Data.World.Value == 2
_G.World3 = game:GetService("Players").LocalPlayer.Data.World.Value == 3

-- Função para carregar módulos
local function loadModule(url)
    return loadstring(game:HttpGet(url))()
end

-- Carregar módulos (substitua 'username' pelo seu usuário do GitHub)
local AutoFarm = loadModule("https://raw.githubusercontent.com/username/SlaHub/main/AutoFarm.lua")
local BossFarm = loadModule("https://raw.githubusercontent.com/username/SlaHub/main/BossFarm.lua")
local AutoRaid = loadModule("https://raw.githubusercontent.com/username/SlaHub/main/AutoRaid.lua")
local AutoThirdSea = loadModule("https://raw.githubusercontent.com/username/SlaHub/main/AutoThirdSea.lua")
local AutoStats = loadModule("https://raw.githubusercontent.com/username/SlaHub/main/AutoStats.lua")
local ESP = loadModule("https://raw.githubusercontent.com/username/SlaHub/main/ESP.lua")
local FruitCollect = loadModule("https://raw.githubusercontent.com/username/SlaHub/main/FruitCollect.lua")
local Teleport = loadModule("https://raw.githubusercontent.com/username/SlaHub/main/Teleport.lua")
local Combat = loadModule("https://raw.githubusercontent.com/username/SlaHub/main/Combat.lua")
local Misc = loadModule("https://raw.githubusercontent.com/username/SlaHub/main/Misc.lua")
local UI = loadModule("https://raw.githubusercontent.com/username/SlaHub/main/UI.lua")
local Utils = loadModule("https://raw.githubusercontent.com/username/SlaHub/main/Utils.lua")

-- Passar OrionLib para o módulo UI
_G.OrionLib = OrionLib

-- Inicializar UI
UI.Init()

-- Notificação de carregamento
OrionLib:MakeNotification({
    Name = "Sla Hub",
    Content = "Script loaded successfully!",
    Time = 5
})
