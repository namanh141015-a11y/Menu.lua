local OrionLib = loadstring(game:HttpGet(('https://githubusercontent.com')))()
local Window = OrionLib:MakeWindow({Name = "Fat Squirrel - Ultra Speed 0.0002s", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest"})

getgenv().AutoLift = false
getgenv().AutoAgility = false
getgenv().AutoDurability = false
getgenv().AutoRebirth = false
local RunService = game:GetService("RunService")

local KeyTab = Window:MakeTab({Name = "Key System", Icon = "rbxassetid://4483345998", PremiumOnly = false})

KeyTab:AddTextbox({
    Name = "Enter Key Here",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        if Value == "soc" then
            OrionLib:MakeNotification({Name = "Success!", Content = "Menu Activated! Check other tabs.", Image = "rbxassetid://4483345998", Time = 5})
            
            local FarmTab = Window:MakeTab({Name = "Auto Farm", Icon = "rbxassetid://4483345998", PremiumOnly = false})
            
            FarmTab:AddToggle({
                Name = "Auto Lift (0.0002s)",
                Default = false,
                Callback = function(Value)
                    getgenv().AutoLift = Value
                    task.spawn(function()
                        while getgenv().AutoLift do
                            game:GetService("Players").LocalPlayer.MuscleLegendsEvents.LiftWeight:FireServer({["1"] = "liftweight"})
                            RunService.Heartbeat:Wait()
                        end
                    end)
                end
            })

            FarmTab:AddToggle({
                Name = "Auto Agility (0.0002s)",
                Default = false,
                Callback = function(Value)
                    getgenv().AutoAgility = Value
                    task.spawn(function()
                        while getgenv().AutoAgility do
                            game:GetService("Players").LocalPlayer.MuscleLegendsEvents.RunOnTreadmill:FireServer()
                            RunService.Heartbeat:Wait()
                        end
                    end)
                end
            })

            FarmTab:AddToggle({
                Name = "Auto Durability (0.0002s)",
                Default = false,
                Callback = function(Value)
                    getgenv().AutoDurability = Value
                    task.spawn(function()
                        while getgenv().AutoDurability do
                            game:GetService("Players").LocalPlayer.MuscleLegendsEvents.DoPushups:FireServer({["1"] = "pushups"})
                            RunService.Heartbeat:Wait()
                        end
                    end)
                end
            })

            FarmTab:AddToggle({
                Name = "Auto Rebirth",
                Default = false,
                Callback = function(Value)
                    getgenv().AutoRebirth = Value
                    task.spawn(function()
                        while getgenv().AutoRebirth do
                            game:GetService("Players").LocalPlayer.MuscleLegendsEvents.Rebirth:FireServer()
                            task.wait(0.3)
                        end
                    end)
                end
            })

            local MiscTab = Window:MakeTab({Name = "Utilities", Icon = "rbxassetid://4483345998", PremiumOnly = false})
            
            MiscTab:AddSlider({
                Name = "Walk Speed",
                Min = 16,
                Max = 500,
                Default = 16,
                Color = Color3.fromRGB(255,255,255),
                Increment = 1,
                ValueName = "Speed",
                Callback = function(Value)
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
                end    
            })

            MiscTab:AddSlider({
                Name = "Jump Power",
                Min = 50,
                Max = 500,
                Default = 50,
                Color = Color3.fromRGB(255,255,255),
                Increment = 1,
                ValueName = "Power",
                Callback = function(Value)
                    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
                end    
            })
        else
            OrionLib:MakeNotification({Name = "Wrong Key!", Content = "Please try again.", Image = "rbxassetid://4483345998", Time = 5})
        end
    end
})

OrionLib:Init()
