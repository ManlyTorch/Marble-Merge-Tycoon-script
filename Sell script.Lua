local Player = game.Players.LocalPlayer.Name
local PlayerPos = game.Workspace[Player].HumanoidRootPart
local function Sell()
	local RVX = PlayerPos.CFrame.RightVector.X
	local RVY = PlayerPos.CFrame.RightVector.Y
	local RVZ = PlayerPos.CFrame.RightVector.Z
	local UVX = PlayerPos.CFrame.UpVector.X
	local UVY = PlayerPos.CFrame.UpVector.Y
	local UVZ = PlayerPos.CFrame.UpVector.Z
	local LVX = PlayerPos.CFrame.LookVector.X
	local LVY = PlayerPos.CFrame.LookVector.Y
	local LVZ = PlayerPos.CFrame.LookVector.Z
	PlayerPos.CFrame = CFrame.new(-217.652115, 3.89999938, 84.7560043, RVX, UVX, LVX, RVY, UVY, LVY, RVZ, UVZ, LVZ)
	task.wait(0.1)
	PlayerPos.CFrame = CFrame.new(-177.87326, 6, 101.81356, RVX, UVX, LVX, RVY, UVY, LVY, RVZ, UVZ, LVZ)
	-- New Droppers
	task.wait(0.1)
	PlayerPos.CFrame = CFrame.new(-285.310242, 6, 80.5363922, RVX, UVX, LVX, RVY, UVY, LVY, RVZ, UVZ, LVZ)
	task.wait(0.1)
	-- Sell
	PlayerPos.CFrame = CFrame.new(-218.043381, 6, 115.259186, RVX, UVX, LVX, RVY, UVY, LVY, RVZ, UVZ, LVZ)
	task.wait(0.1)
	-- Merge
end
local Toggle = false
local UIP = game:GetService("UserInputService")
UIP.InputBegan:Connect(function(key, gameProcessedEvent)
	if gameProcessedEvent then return end
	if key.UserInputType == Enum.UserInputType.Keyboard then
		if key.KeyCode == Enum.KeyCode.Q then
			Toggle = not Toggle
		end
	end
end)
while task.wait(0.001) do
	if Toggle then
		Sell()
	end
end
