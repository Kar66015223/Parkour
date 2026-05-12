local ReplicatedStorage = game:GetService("ReplicatedStorage")
local startGameEvent = ReplicatedStorage:WaitForChild("StartGameEvent")
local button = script.Parent

button.MouseButton1Click:Connect(function()
    startGameEvent:FireServer()
end)