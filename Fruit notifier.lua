-- Auto Fruit Grabber (Delta-compatible)
-- Teleports to spawned fruits and stores them

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local player = Players.LocalPlayer

function findFruit()
    for _, obj in pairs(Workspace:GetChildren()) do
        if obj:IsA("Tool") and string.find(obj.Name:lower(), "fruit") then
            return obj
        end
    end
    return nil
end

function teleportToFruit(fruit)
    if fruit and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = fruit.Handle.CFrame + Vector3.new(0, 2, 0)
    end
end

function storeFruit()
    local Backpack = player:WaitForChild("Backpack")
    for _, item in pairs(Backpack:GetChildren()) do
        if string.find(item.Name:lower(), "fruit") then
            local args = {
                [1] = "StoreFruit",
                [2] = item.Name
            }
            ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end

-- Main loop
while wait(2) do
    local fruit = findFruit()
    if fruit then
        teleportToFruit(fruit)
        wait(2) -- wait to ensure pickup
        storeFruit()
    end
end
