if game.PlaceId == 4918537844 then
    local MainGui = game.Players.LocalPlayer.PlayerGui:WaitForChild("MainGui")
    if not MainGui.Menu.Frame.Settings.MuteMusic.Selectable then
        print("You already executed the script!")
    else
        MainGui.Menu.Frame.Settings.MuteMusic.Selectable = false
        CapitalismConfigButton = Instance.new("TextButton", MainGui.Menu.Frame.Settings)
        CapitalismConfigButton.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
        CapitalismConfigButton.BorderColor3 = Color3.fromRGB(120, 120, 120)
        CapitalismConfigButton.Position = UDim2.new(0.6916, 0, 0.09416, 0)
        CapitalismConfigButton.Size = UDim2.new(0.304503, 0, 0.068417996, 0)
        CapitalismConfigButton.Font = Enum.Font.SourceSans
        CapitalismConfigButton.Text = "Capitalism Config"
        CapitalismConfigButton.TextScaled = true
        CapitalismConfigButton.TextWrapped = true
        CapitalismConfigButton.BorderSizePixel = 1
        CapitalismConfigButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        CapitalismConfigButton.Name = "CapitalismConfigButton"
        G = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
        G.Name = "Capitalism Config"
        CapitalismConfig = game.Players.LocalPlayer.PlayerGui.Shop:Clone()
        CapitalismConfig.Parent = game.Players.LocalPlayer.PlayerGui["Capitalism Config"]
        CapitalismConfigClose = Instance.new("TextButton", game.Players.LocalPlayer.PlayerGui["Capitalism Config"].Shop.Tabs)
        CapitalismConfigClose.TextScaled = true
        CapitalismConfigClose.Position = UDim2.new(1.005116959064327, 0, 0.8332098948303955, 0)
        CapitalismConfigClose.BackgroundColor3 = Color3.fromRGB(150, 18, 18)
        CapitalismConfigClose.BorderColor3 = Color3.fromRGB(47, 47, 47)
        CapitalismConfigClose.Font = Enum.Font.SourceSansBold
        CapitalismConfigClose.TextColor3 = Color3.fromRGB(255, 255, 255)
        CapitalismConfigClose.Text = "Close"
        CapitalismConfigClose.Size = UDim2.new(1.142178362573099, 0, 0.185159811433248, 0)
        for i, v in pairs(CapitalismConfig:GetChildren()) do
            if v.Name == "LocalScript" then
                v:Destroy()
            elseif v.Name == "ModuleViewerHandler" then
                v:Destroy()
            elseif v.Name == "Info" then
                v:Destroy()
            end
        end
        for i, v in pairs(CapitalismConfigButton:GetChildren()) do
            v:Destroy()
        end
        local function Check(Item)
            if Item == "Manage" then
                MainGui.Parent.Shop.Enabled = false
                MainGui.Parent.ResGUI.MainFrame.Visible = false
                MainGui.Bank.Frame.Visible = false
                MainGui.Menu.Frame.Visible = false
            elseif Item == "Menu" then
                MainGui.Manage.Stats.Visible = false
                MainGui.Parent.Shop.Enabled = false
                MainGui.Parent.ResGUI.MainFrame.Visible = false
                MainGui.Bank.Frame.Visible = false
            elseif Item == "Bank" then
                MainGui.Manage.Stats.Visible = false
                MainGui.Parent.Shop.Enabled = false
                MainGui.Parent.ResGUI.MainFrame.Visible = false
                MainGui.Menu.Frame.Visible = false
            elseif Item == "Edit" then
                MainGui.Manage.Stats.Visible = false
                MainGui.Parent.ResGUI.MainFrame.Visible = false
                MainGui.Bank.Frame.Visible = false
                MainGui.Menu.Frame.Visible = false
            elseif Item == "Research" then
                MainGui.Manage.Stats.Visible = false
                MainGui.Parent.Shop.Enabled = false
                MainGui.Bank.Frame.Visible = false
                MainGui.Menu.Frame.Visible = false
            else
                warn("Uh oh I messed up error code: 1")
            end
        end
        local function CapitalismConfigButtonScript()
            local CapitalismScript = Instance.new("LocalScript", CapitalismConfigButton)
            local CapitalismConfig = game.Players.LocalPlayer.PlayerGui:WaitForChild("Capitalism Config")
            local BUTTON = MainGui.Menu.Frame.Settings.CapitalismConfigButton
            MainGui.Menu.MouseButton1Click:Connect(function()
                CapitalismConfig.Shop.Enabled = false
                Check("Menu")
            end)
            MainGui.Manage.MouseButton1Click:Connect(function()
                CapitalismConfig.Shop.Enabled = false
                Check("Manage")
            end)
            MainGui.Bank.MouseButton1Click:Connect(function()
                CapitalismConfig.Shop.Enabled = false
                Check("Bank")
            end)
            MainGui.Edit.MouseButton1Click:Connect(function()
                CapitalismConfig.Shop.Enabled = false
                Check("Edit")
            end)
            MainGui.Research.MouseButton1Click:Connect(function()
                CapitalismConfig.Shop.Enabled = false
                Check("Research")
            end)
            CapitalismConfigClose.MouseButton1Click:Connect(function()
                CapitalismConfig.Shop.Enabled = false
            end)
            MainGui.Menu.Frame.Frame.SpaceAgency.MouseButton1Click:Connect(function()
                CapitalismConfig.Shop.Enabled = false
            end)
            MainGui.Menu.Frame.Frame.Feedback.MouseButton1Click:Connect(function()
                CapitalismConfig.Shop.Enabled = false
            end)
            BUTTON.MouseButton1Click:Connect(function()
                CapitalismConfig.Shop.Enabled = not CapitalismConfig.Shop.Enabled
            end)
        end
        coroutine.wrap(CapitalismConfigButtonScript)()
        for i, v in pairs(game.Players.LocalPlayer.PlayerGui["Capitalism Config"].Shop:GetChildren()) do
            for i2, v2 in pairs(v:GetChildren()) do
                for i3, v3 in pairs (v2:GetChildren()) do
                    for i4, v4 in pairs (v3:GetChildren()) do
                        if v4.Name == "Cost" then
                            v4:Destroy()
                        end
                    end
                end
            end
        end
        local Shop = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Capitalism Config").Shop
        local UIS = game:GetService("UserInputService")
        local GG = false
        local Modules = {
            'Earth',
            'Moon',
            'Mars',
            'Venus',
            'AmongUs',
            'Canada',
            'Britain',
            'USA',
            'China',
            'Europe',
            'India',
            'Russia',
            'Japan',
            'BaseStation'
        }
        local Settings = {
            Modules,
            CapitalismToggle,
            StationToggle
        }

        local filename = "SSI_Capitalism_Settings.txt";

        function loadSettings()
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

        local function TextLabelThing(List)
            for i, v in pairs(List:GetChildren()) do
                if v:IsA("TextLabel") then
                    Text = v
                end
            end
        end

        local function LISTADDREMOVE(Module)
            for i, v in pairs(Settings[1]) do
                for i2, v2 in pairs(Module:GetChildren()) do
                    if v2:IsA("TextLabel") then
                        v2.TextColor3 = Color3.fromRGB(255,0,0)
                    end
                    if v2.Name == v then
                        ListToggle = false
                        if v2:IsA("Model") then
                            table.remove(Settings[1], i)
                        end
                    else
                        ListToggle = true
                    end
                end
            end
            if ListToggle then
                i = #Settings[1]+1
                for i2, v in pairs(Module:GetChildren()) do
                    if v:IsA("Model") then
                        Settings[1][i] = v.Name
                    end
                    if v:IsA("TextLabel") then
                        v.TextColor3 = Color3.fromRGB(0,255,0)
                    end
                end
            end
            saveSettings()
        end

        local function ListUpdate(Module)
            for i, v in pairs(Settings[1]) do
                for i2, v2 in pairs(Module:GetChildren()) do
                    if v2:IsA("Model") then
                        if v2.Name == v then
                            g = i
                        end
                    end
                end
            end
            for i, v in pairs(Module:GetChildren()) do
                if v:IsA("Model") then
                    if Settings[1][g] == v.Name then
                        for i2, v2 in pairs(Module:GetChildren()) do
                            if v2:IsA("TextLabel") then
                                v2.TextColor3 = Color3.fromRGB(0,255,0)
                            end
                            
                        end
                    else
                        for i3, v3 in pairs(Module:GetChildren()) do
                            if v3:IsA("TextLabel") then
                                v3.TextColor3 = Color3.fromRGB(255,0,0)
                            end
                        end
                    end
                end
            end
        end

        for i2, v2 in pairs(Shop:GetChildren()) do
            if v2.Name ~= "Tabs" and v2.Name ~= "Info" and v2.Name ~= "LocalScript" and v2.Name ~= "ModuleViewerHandler" then
                for i, v in pairs(v2.FixFrame:GetChildren()) do
                    if v.Name ~= "UIGridLayout" and v.Name ~= "UIPadding" then
                        ListUpdate(v)
                        Newbutton = Instance.new("TextButton")
                        GRID = Instance.new("UIGridLayout")
                        Newbutton.Name = v.Name
                        Newbutton.Parent = v.Parent
                        Newbutton.BackgroundTransparency = 1
                        Newbutton.BorderSizePixel = 0
                        Newbutton.TextTransparency = 1
                        GRID.Parent = Newbutton
                        GRID.CellSize = UDim2.new(0, 90, 0, 90)
                        v.Parent = Newbutton
                        v.Parent.MouseButton1Click:Connect(function()
                            LISTADDREMOVE(v)
                        end)
                    end
                end
            end
        end

        local vu = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:connect(function()
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
        
        local Capitalism = Instance.new("TextButton")
        
        Capitalism.Name = "Capitalism"
        Capitalism.Parent = MainGui.Menu.Frame.Settings
        Capitalism.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
        Capitalism.BorderColor3 = Color3.fromRGB(120, 120, 120)
        Capitalism.Position = UDim2.new(0.6916, 0, 0, 0)
        Capitalism.Size = UDim2.new(0.304503, 0, 0.068417996, 0)
        Capitalism.Selected = true
        Capitalism.Font = Enum.Font.SourceSans
        Capitalism.Text = "Capitalism mode: On"
        Capitalism.TextColor3 = Color3.fromRGB(255, 255, 255)
        Capitalism.TextScaled = true
        Capitalism.TextWrapped = true  

        local StationsToggle = Instance.new("TextButton")
        
        StationsToggle.Name = "Stations Toggle"
        StationsToggle.Parent = MainGui.Menu.Frame.Settings
        StationsToggle.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
        StationsToggle.BorderColor3 = Color3.fromRGB(120, 120, 120)
        StationsToggle.Position = UDim2.new(0.345842, 0, 0.09416, 0)
        StationsToggle.Size = UDim2.new(0.304503, 0, 0.068417996, 0)
        StationsToggle.Selected = true
        StationsToggle.Font = Enum.Font.SourceSans
        StationsToggle.Text = "Stations Toggle: Off"
        StationsToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
        StationsToggle.TextScaled = true
        StationsToggle.TextWrapped = true
        
        local function CapitalismButtonScript()
            local script = Instance.new('LocalScript', Capitalism)
        
            local Capitalism = script.Parent
            local ToggleButton = script.Parent.Parent.Capitalism
            local StationsToggle = script.Parent.Parent["Stations Toggle"]
        
            local function updateScreen()
                if Settings[2] == true then
                    Capitalism.Text = "Capitalism Mode: On"
                else
                    Capitalism.Text = "Capitalism Mode: Off"
                end
                if Settings[3] == true then
                    StationsToggle.Text = "Stations Toggle: On"
                else
                    StationsToggle.Text = "Stations Toggle: Off"
                end
            end
            updateScreen()
            
            StationsToggle.MouseButton1Click:Connect(function()
                Settings[3] = not Settings[3]
                updateScreen()
                saveSettings()
            end)
            ToggleButton.MouseButton1Click:Connect(function()
                Settings[2] = not Settings[2]
                updateScreen()
                saveSettings()
            end)
            while task.wait(0.2) and true do
                local plr = game.Players.LocalPlayer
                local Team = game:GetService("Teams")
                local TO = plr.Team.Name

                local Parts = game.Workspace.Stations
                function isItemNOTInList(item, list)
                    for _, i in pairs(list) do
                        if item == i then
                            return false
                        end
                    end
                    return true
                end
                function RemoveParts(P)
                    for _, PC in pairs(P:GetChildren()) do
                        if Settings[3] then
                            PCT = PC
                            for _, PCTC in pairs(PCT:GetChildren()) do
                                for _, v in pairs(PCTC:GetChildren()) do
                                    if isItemNOTInList(v.Name, Settings[1]) then
                                        v:Destroy()
                                    end
                                end
                            end
                        else
                            PCT = PC:WaitForChild(TO)
                            for _, PCTC in pairs(PCT:GetChildren()) do
                                if isItemNOTInList(PCTC.Name, Settings[1]) then
                                    PCTC:Destroy()
                                end
                            end
                        end
                    end
                end
                while wait(0.0001) and Settings[2] do
                        RemoveParts(Parts)
                    end
                end
        end
        coroutine.wrap(CapitalismButtonScript)()
    end
end
