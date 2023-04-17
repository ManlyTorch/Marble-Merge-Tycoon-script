local bg = Instance.new('BodyGyro',game.Workspace.Manly_Torch:WaitForChild('HumanoidRootPart'))
local playerHead = game.Players.LocalPlayer.Character.Head
local function SellScript()
	local RateToggle = false
	local script = Instance.new("LocalScript", game.CoreGui)
	local Player = game.Players.LocalPlayer.Name
	local PlayerPos = game.Workspace[Player].HumanoidRootPart
	local function Sell()
		local DisplayName = game.Players.LocalPlayer.DisplayName
		local RUX = 1
		local RUZ = 1
		local DRBX = 1
		local DRBZ = 1
		local DBX = 1
		local DBZ = 1
		local MBX = 1
		local MBZ = 1
		for i, v in pairs(game.Workspace:GetChildren()) do
			if v.Name == "Template" then
				if v:WaitForChild("BillboardGui"):WaitForChild("TextLabel").Text == DisplayName then
					for i2, v2 in pairs(v:GetChildren()) do
						if v2.Name == "NewDropperButton" then
							local DropperText = string.split(v2.BillboardGui.Main.Text, " ")
                            if DropperText[1] == "+25" then
                                DRBX = v2.Base.Position.X
                                DRBZ = v2.Base.Position.Z
                            end
						end
						if v2.Name == "SellButton" then
							DBX = v2.Base.Position.X
							DBZ = v2.Base.Position.Z
                        elseif v2.Name == "MergeButton" then
                            MBX = v2.Base.Position.X
                            MBZ = v2.Base.Position.Z
                        elseif v2.Name == "Upgrade Sell" then
                            RUX = v2.Base.Position.X
                            RUZ = v2.Base.Position.Z
						end
					end
				end
			end
		end
		local RVX = PlayerPos.CFrame.RightVector.X
		local RVY = PlayerPos.CFrame.RightVector.Y
		local RVZ = PlayerPos.CFrame.RightVector.Z
		local UVX = PlayerPos.CFrame.UpVector.X
		local UVY = PlayerPos.CFrame.UpVector.Y
		local UVZ = PlayerPos.CFrame.UpVector.Z
		local LVX = PlayerPos.CFrame.LookVector.X
		local LVY = PlayerPos.CFrame.LookVector.Y
		local LVZ = PlayerPos.CFrame.LookVector.Z
		PlayerPos.CFrame = CFrame.new(DBX, 6, DBZ, RVX, UVX, LVX, RVY, UVY, LVY, RVZ, UVZ, LVZ)
		-- DepositButton
		task.wait(0.1)
		PlayerPos.CFrame = CFrame.new(MBX, 6, MBZ, RVX, UVX, LVX, RVY, UVY, LVY, RVZ, UVZ, LVZ)
		-- MergeButton
		task.wait(0.1)
		PlayerPos.CFrame = CFrame.new(DRBX, 6, DRBZ, RVX, UVX, LVX, RVY, UVY, LVY, RVZ, UVZ, LVZ)
		-- 25 Droppers
		task.wait(0.1)
		if RateToggle then
			PlayerPos.CFrame = CFrame.new(RUX, 6, RUZ, RVX, UVX, LVX, RVY, UVY, LVY, RVZ, UVZ, LVZ)
            -- Buy rate upgrade
			task.wait(0.1)
		end
	end
	local Toggle = false
	local UIP = game:GetService("UserInputService")
	UIP.InputBegan:Connect(function(key, gameProcessedEvent)
		if gameProcessedEvent then return end
		if key.UserInputType == Enum.UserInputType.Keyboard then
			if key.KeyCode == Enum.KeyCode.Q then
				Toggle = not Toggle
			elseif key.KeyCode == Enum.KeyCode.R then
				RateToggle = not RateToggle
			end
		end
	end)
	while task.wait(0.001) do
		if Toggle then
			Sell()
		end
	end
end
coroutine.wrap(SellScript)()
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
local DisplayName = game.Players.LocalPlayer.DisplayName
print(DisplayName)
local function Marbles()
	for i, v in pairs(game.Workspace:GetChildren()) do
		if v.Name == "Template" then
			if v:WaitForChild("BillboardGui"):WaitForChild("TextLabel").Text == DisplayName then
				for i2, v2 in pairs(v.Marbles:GetChildren()) do
					Update()
					v2.Position = PlayerPos.Position
				end
			else
				v:Destroy()
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
