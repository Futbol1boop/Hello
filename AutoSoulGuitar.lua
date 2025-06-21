-- Auto Soul Guitar Script for Roblox (LocalScript)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local toolName = "SoulGuitar"

local function getSoulGuitar()
	for _, item in ipairs(player.Backpack:GetChildren()) do
		if item:IsA("Tool") and item.Name == toolName then
			return item
		end
	end
	return nil
end

local function equipSoulGuitar()
	local soulGuitar = getSoulGuitar()
	if soulGuitar then
		soulGuitar.Parent = character
	end
end

local function fireSoulGuitar()
	local tool = character:FindFirstChild(toolName)
	if tool then
		if tool:FindFirstChild("Fire") then
			tool.Fire:FireServer()
		elseif tool:FindFirstChild("Activate") then
			tool:Activate()
		end
	end
end

RunService.RenderStepped:Connect(function()
	equipSoulGuitar()
	fireSoulGuitar()
end)
