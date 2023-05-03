if game.PlaceId == 11796791326 then
    if game.Players.LocalPlayer.PlayerGui.ScreenGui.Frame.Active then
        print("Already executed")
    else
        game.Players.LocalPlayer.PlayerGui.ScreenGui.Frame.Active = true
        local Player = game.Players.LocalPlayer.Name
        local bg = Instance.new('BodyGyro', game.Workspace:WaitForChild(Player):WaitForChild('HumanoidRootPart'))
        local playerHead = game.Players.LocalPlayer.Character.Head
        local filename = "MMT_Script_Settings.txt"
        local Toggle = false
        local RateToggle = false
        local Settings = {
            Toggle,
            RateToggle
        }
        function loadSettings()
            print("loading settings")
            local HttpService = game:GetService("HttpService")
            if (readfile and isfile and isfile(filename)) then
                Settings = HttpService:JSONDecode(readfile(filename));
                return true
            else
                return false
            end
        end

        loadSettings()

        function saveSettings()
            local json;
            local HttpService = game:GetService("HttpService");
            if (writefile) then
                json = HttpService:JSONEncode(Settings);
                writefile(filename, json);
            else
                print("Your executor isn't supported (you can still use the script, settings won't save though)")
            end
        end

        local function DepositScript()
            local script = Instance.new("LocalScript", game.CoreGui)
            script.Name = "DepositScript"
            local Player = game.Players.LocalPlayer.Name
            local PlayerPos = game.Workspace[Player].HumanoidRootPart
            local function Deposit()
                local RUX = 1
                local RUZ = 1
                local DRBX = 1
                local DRBZ = 1
                local DBX = 1
                local DBZ = 1
                local MBX = 1
                local MBZ = 1
                for i, v in pairs(game.Workspace.Tycoons:GetChildren()) do
                    if v.Name == Player.."_tycoon" then
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
                
                PlayerPos.CFrame = CFrame.new(DBX, 6, DBZ, 1, 4.76592279e-29, -2.98949465e-25, -4.76592279e-29, 1, 1.22316572e-27, 2.98949465e-25, -1.22316572e-27, 1)
                -- DepositButton
                task.wait(0.5)
                if not Settings[2] then
                    PlayerPos.CFrame = CFrame.new(MBX, 6, MBZ, 1, 4.76592279e-29, -2.98949465e-25, -4.76592279e-29, 1, 1.22316572e-27, 2.98949465e-25, -1.22316572e-27, 1)
                    -- MergeButton
                    task.wait(0.5)
                    PlayerPos.CFrame = CFrame.new(MBX, 6, MBZ-20, 1, 4.76592279e-29, -2.98949465e-25, -4.76592279e-29, 1, 1.22316572e-27, 2.98949465e-25, -1.22316572e-27, 1)
                    -- Extra Position to avoid hitting other buttons.
                    task.wait(0.5)
                    PlayerPos.CFrame = CFrame.new(DRBX, 6, DRBZ, 1, 4.76592279e-29, -2.98949465e-25, -4.76592279e-29, 1, 1.22316572e-27, 2.98949465e-25, -1.22316572e-27, 1)
                    -- 25 Droppers
                    task.wait(0.5)
                end
                if Settings[2] then
                    PlayerPos.CFrame = CFrame.new(RUX, 6, RUZ, 1, 4.76592279e-29, -2.98949465e-25, -4.76592279e-29, 1, 1.22316572e-27, 2.98949465e-25, -1.22316572e-27, 1)
                    -- Buy rate upgrade
                    task.wait(0.5)
                end
            end
            local UIP = game:GetService("UserInputService")
            UIP.InputBegan:Connect(function(key, gameProcessedEvent)
                if gameProcessedEvent then return end
                if key.UserInputType == Enum.UserInputType.Keyboard then
                    if key.KeyCode == Enum.KeyCode.Q then
                        Settings[1] = not Settings[1]
                        saveSettings()
                    elseif key.KeyCode == Enum.KeyCode.R then
                        Settings[2] = not Settings[2]
                        saveSettings()
                    end
                end
            end)
            while task.wait(0.1) do
                if Settings[1] then
                    Deposit()
                end
            end
        end
        coroutine.wrap(DepositScript)()
        local function ObbyScript()
            local script = Instance.new("LocalScript", game.CoreGui)
            script.Name = "MarbleScript"
            local function Obby()
                for i, v in pairs(game.Workspace.Obby.Obbys:GetChildren()) do
                    for i2, v2 in pairs(v:GetChildren()) do
                        for i3, v3 in pairs(v2:GetChildren()) do
                            for i4, v4 in pairs(v3:GetChildren()) do
                                if v4.Name == "TouchInterest" then
                                    firetouchinterest(playerHead, v4.Parent, 0)
                                    task.wait(0.2)
                                    firetouchinterest(playerHead, v4.Parent, 1)
                                end
                            end
                        end
                    end
                end
            end
            while task.wait(0.1) and true do 
                Obby()
            end
        end
        coroutine.wrap(ObbyScript)()
        local function ChestScript()
            local script = Instance.new("LocalScript", game.CoreGui)
            script.Name = "ChestScript"
            local Premium = game.Workspace:WaitForChild("PremiumRewardCircle").Touchy.TouchInterest
            local Group = game.Workspace:WaitForChild("GroupRewardCircle").Touchy.TouchInterest
            local function Chest()
                firetouchinterest(playerHead, Group.Parent, 0)
                firetouchinterest(playerHead, Premium.Parent, 0)
                task.wait(0.1)
                firetouchinterest(playerHead, Group.Parent, 1)
                firetouchinterest(playerHead, Premium.Parent, 1)
            end
            while task.wait(0.2) and true do
                Chest()
            end
        end
        coroutine.wrap(ChestScript)()
        local Player = game.Players.LocalPlayer.Name
        local PlayerPos = game.Workspace[Player].HumanoidRootPart
        local function Update()
            local Player = game.Players.LocalPlayer.Name
            local PlayerPos = game.Workspace:WaitForChild(Player).HumanoidRootPart
        end
        Update()
        local DisplayName = game.Players.LocalPlayer.DisplayName
        local function Marbles()
            for i, v in pairs(game.Workspace:WaitForChild("Tycoons"):GetChildren()) do
                if v.Name == Player.."_tycoon" then
                    for i2, v2 in pairs(v:WaitForChild("Marbles"):GetChildren()) do
                        Update()
                        v2.Position = PlayerPos.Position
                        v2.CanCollide = false
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
        while task.wait(0.001) do
            Marbles()
        end
    end
else
    print("This isn't marble merge tycoon, why are you executing this script??")
end
