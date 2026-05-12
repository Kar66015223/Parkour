local UserInputService = game:GetService("UserInputService")

local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")

local function GetSpeed(attriName)
    return character:GetAttribute(attriName) or (attriName == "WalkSpeed" and 16 or 32)
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.LeftShift then
        humanoid.WalkSpeed = GetSpeed("RunSpeed")
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.LeftShift then
        humanoid.WalkSpeed = GetSpeed("WalkSpeed")
    end
end)