-- Working Auto Store Script (Redz Hub-style)

local rs = game:GetService("ReplicatedStorage")
local player = game:GetService("Players").LocalPlayer

while wait(1) do
    for _, tool in pairs(player.Backpack:GetChildren()) do
        if tool:IsA("Tool") and tool.Name:lower():find("fruit") then
            pcall(function()
                rs.Remotes.CommF_:InvokeServer("StoreFruit", tool.Name, "yes")
                print("Trying to store:", tool.Name)
            end)
        end
    end
end
