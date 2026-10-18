local Players = game:GetService("Players")

local function onPlayerAdded(player)
    print(player.Name .. " joined the game")
    
    -- Set walkspeed for the player
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = 20
    
    -- Hide walkspeed from detection
    local function hideWalkSpeed()
        if humanoid.WalkSpeed ~= 20 then
            humanoid.WalkSpeed = 20
        end
    end
    
    humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(hideWalkSpeed)
end

local function onPlayerRemoving(player)
    print(player.Name .. " left the game")
end

Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoving)
