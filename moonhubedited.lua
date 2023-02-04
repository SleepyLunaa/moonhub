local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()



function Script()
    local Window = Library.CreateLib("MoonHub™", "GrapeTheme")



    local Main = Window:NewTab("Main")
    local MainSection = Main:NewSection("Main")


    -- Script

    MainSection:NewSlider("Walkspeed", "Changes how fast you walk", 250, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)

    MainSection:NewSlider("JumpPower", "Changes how fast you jump", 250, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)

    MainSection:NewSlider("Gravity", "Changes your gravity for you and bey", 250, 16, function(s) -- 250 (MaxValue) | 0 (MinValue)
        workspace.Gravity = s
    end)

    MainSection:NewToggle("Infinite Jump", "Lets you infinitely jump", function()
        local InfiniteJumpEnabled = true
        game:GetService("UserInputService").JumpRequest:connect(function()
            if InfiniteJumpEnabled then
                game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
            end
        end)
    end)

    local Functionality = Window:NewTab("Functionality")
    local FunctionalitySection = Functionality:NewSection("Functionality")

-- Functionality

    FunctionalitySection:NewButton("Rejoin", "Rejoins the game", function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end)

    FunctionalitySection:NewButton(("Copy Discord Link"), "Copies the discord link to your clipboard", function()
        setclipboard("https://discord.gg/a7sxRKPn")
    end)


-- Useful Scripts

    local UsefulScripts = Window:NewTab("Useful Scripts")
    local UsefulScriptsSection = UsefulScripts:NewSection("Useful Scripts")

    UsefulScriptsSection:NewButton("AutoFarm", "Executes AutoFarm", function()
        local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")


local Player = Players.LocalPlayer
local Event = ReplicatedStorage:WaitForChild("event")
local Trainer = require(ReplicatedStorage:WaitForChild("trainer"))
local Events = require(Player:WaitForChild("PlayerGui"):WaitForChild("framework"):WaitForChild("events"))


local Beys = Workspace:WaitForChild("beyblades")
local Battles = Workspace:WaitForChild("battles")
local Specials = Workspace:WaitForChild("specials")


function GetBey()
    local Bey = Beys:FindFirstChild(Player.Name)
    if Bey and Bey.PrimaryPart then
        return Bey
    end
    return false
end


Battles.ChildRemoved:Connect(function(A_1)
    if A_1.Name == Player.Name .. "_Target" then
        wait()
        Event:FireServer("BattleTower")
    end
end)


Event:FireServer("BattleTower")


Events.TrainerBattleResult = function()
    wait()
    Trainer.close()
end


while wait() do
    
    local Bey = GetBey()
    if Bey then
        
        while Bey.Parent and wait() do
            local Enemy = Beys:FindFirstChild(Player.Name .. "_Target")
                pcall(function()
                    Enemy:FindFirstChildOfClass("Humanoid").Health = 0
                end)
            end
        end
    end
    end)

    UsefulScriptsSection:NewButton("AntiLag", "Makes your game less laggier", function()
        local function deleteFolder(folder)
            for i, object in pairs(folder:GetChildren()) do
                if object:IsA("Folder") then
                    deleteFolder(object)
                else
                    object:Destroy()
                end
            end
            folder:Destroy()
        end
        
        local specialsFolder = game.Workspace:FindFirstChild("specials")
        if specialsFolder then
            deleteFolder(specialsFolder)
        end
    end)

    UsefulScriptsSection:NewButton("Snipe", "Set meteor to Y and Tornado to N and press B to toggle", function()
        local toggle = false

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.B then
        toggle = not toggle
    end
end)


while true do
    wait()
    
    if toggle then
        local args1 = {
            [1] = "skill",
            [2] = 1675442417.3927498,
            [3] = 3
        }
        
        local args2 = {
            [1] = "skill",
            [2] = 1675442419.8774009,
            [3] = 2
        }
        
        local replicatedStorage = game:GetService("ReplicatedStorage")
        local func = replicatedStorage:WaitForChild("func")
        
        func:InvokeServer(unpack(args1))
        func:InvokeServer(unpack(args2))
    end
end
end)

UsefulScriptsSection:NewButton("SnipeV2 / MeteorNuker", "Set meteor to Y", function()
    local args = {
        [1] = "skill",
        [2] = 1675535457.8575954,
        [3] = 3
    }
    
    local toggle = false
    
    game:GetService("UserInputService").InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.N then
            toggle = not toggle
        end
    end)
    
    while true do
        if toggle then
            game:GetService("ReplicatedStorage").func:InvokeServer(unpack(args))
        end
        wait()
    end   
end)

UsefulScriptsSection:NewButton("AutoCharge", "Set F for charge and N for toggle", function()
    local toggle = true

    game:GetService("UserInputService").InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.N then
            toggle = not toggle
        end
    end)
    
    while toggle do
        wait(6)
        local args = {
            [1] = "skill",
            [2] = 1673095237.634022,
            [3] = 4
        }
    
        game:GetService("ReplicatedStorage").func:InvokeServer(unpack(args))
    end       
end)

    local Debugging = Window:NewTab("Debugging")
    local DebuggingSection = Debugging:NewSection("Debugging")

    --Debugging

    DebuggingSection:NewButton("RemoteSpy", "Executes Remotespy", function()
        loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()
    end)

    DebuggingSection:NewButton("Infinite Yield", "Executes Infinite Yield", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)

    DebuggingSection:NewButton("Lazy Dex (Fastest Dex)", "Dex explorer", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/Lazy_Dex.lua"))()
    end)

        -- Credits


    local Credits = Window:NewTab("Credits")
    local CreditsSection = Credits:NewSection("Credits")
    CreditsSection:NewLabel("Created by Moon")

end

Script()
