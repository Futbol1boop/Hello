-- Auto Store from Backpack (also works after un-storing)
local rs = game:GetService("ReplicatedStorage")
local player = game:GetService("Players").LocalPlayer

while wait(1) do
    for _, v in pairs(player.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.Name:lower():find("fruit") then
            rs.Remotes:FindFirstChild("CommF_"):InvokeServer("StoreFruit", v.Name)
        end
    end
end
