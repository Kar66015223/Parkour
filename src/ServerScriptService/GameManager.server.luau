local Teams = game:GetService("Teams")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local startGameEvent = ReplicatedStorage:WaitForChild("StartGameEvent")

local function ApplyStats(character)
    local player = Players:GetPlayerFromCharacter(character)
    if not player then return end

    local isWerewolf = (player.Team == Teams.Werewolf)

    character:SetAttribute("WalkSpeed", isWerewolf and 32 or 16)
    character:SetAttribute("RunSpeed", isWerewolf and 64 or 32)

    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = character:GetAttribute("WalkSpeed")
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(ApplyStats)
end)

local function StartGame()
    local allPlayers = Players:GetPlayers()
    if #allPlayers < 1 then return end

    for _, player in ipairs(allPlayers) do
        player.Team = Teams.Human
        print(player.Name .. " is human")
    end

    -- 50% chance to be a werewolf
    if math.random() <= 0.5 then
        local randomIndex = math.random(1, #allPlayers)
        local werewolfPlayer = allPlayers[randomIndex]

        werewolfPlayer.Team = Teams.Werewolf
        print(werewolfPlayer.Name .. " is the Werewolf!")
    end

    for _, player in ipairs(allPlayers) do
        player:LoadCharacter()
    end
end

startGameEvent.OnServerEvent:Connect(StartGame)