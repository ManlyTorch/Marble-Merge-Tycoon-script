local bg = Instance.new('BodyGyro',game.Workspace.Manly_Torch:WaitForChild('HumanoidRootPart'))
local playerHead = game.Players.LocalPlayer.Character.Head
local function Obby()
	for i, v in pairs(game.Workspace.Obby.Obbys:GetChildren()) do
		for i2, v2 in pairs(v:GetChildren()) do
			for i3, v3 in pairs(v2:GetChildren()) do
				for i4, v4 in pairs(v3:GetChildren()) do
					if v4.Name == "TouchInterest" then
						firetouchinterest(playerHead, v4.Parent, 0)
						firetouchinterest(playerHead, v4.Parent, 1)
					end
				end
			end
		end
	end
end
local Player = game.Players.LocalPlayer.Name
local PlayerPos = game.Workspace[Player].HumanoidRootPart
local function Update()
	local Player = game.Players.LocalPlayer.Name
	local PlayerPos = game.Workspace:WaitForChild(Player).HumanoidRootPart
end
Update()
local function Marbles()
	for i, v in pairs(game.Workspace:GetChildren()) do
		if v.Name == "Template" then
			for i2, v2 in pairs(v.Marbles:GetChildren()) do
				Update()
				v2.Position = PlayerPos.Position
			end
		end
	end
end
local AntiAfk = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
    AntiAfk:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    AntiAfk:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
while task.wait(0.0001) do
	Marbles()
	Obby()
end
