
getgenv().autoTap = false;
getgenv().autoBuyBelt = false;
getgenv().autoBuySword= false;
getgenv().autoSell= false;
getgenv().autoBuySkill= false;
getgenv().autoBuyShuriken= false;
getgenv().autoBuyRank= false;
local remotePath = game:GetService("Players").LocalPlayer;
local player = game.Players.LocalPlayer;


local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LemonHaze1/Library/main/VenyxLibrary.lua"))()
local venyx = library.new("-----VN-HUB-----", 8544776132)
-- themes
local themes = {
Background = Color3.fromRGB(24, 24, 24),
Glow = Color3.fromRGB(0, 255, 255),
Accent = Color3.fromRGB(10, 10, 10),
LightContrast = Color3.fromRGB(20, 20, 20),
DarkContrast = Color3.fromRGB(14, 14, 14),  
TextColor = Color3.fromRGB(0, 21, 255)
}
-- Auto mode
local page = venyx:addPage("Main", 8544745422)
local section1 =  page:addSection("Auto")
local section2 = page:addSection("Unlock Island")

section2:addButton("Start Unlock",function ()
    for i,v in next, game.workspace.islandUnlockParts:GetChildren() do 
        if v then 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.islandSignPart.CFrame; 
        wait(.5)
        end
        end
end)

section1:addToggle("AutoFullSell",nil,function (bool)
    getgenv().autoFullSell = bool
    if bool then
        aFullSell()
    end
end)

section1:addToggle("Auto Farm Shuriken", nil, function(bool)
    getgenv().autoTap = bool
    print("Auto tap is: ", bool);
    if bool then
        aTap();
    end
    end)
section1:addToggle("Auto Buy Belts", nil, function(bool)
    getgenv().autoBuyBelt = bool
    if bool then
        buyBetl()
    end
    end)
section1:addToggle("Auto Buy Sword", nil, function(bool)
    getgenv().autoBuySword = bool
    if bool then
        buySword()
    end
    end)
section1:addToggle("Auto Buy Shuriken", nil,function(bool)
        getgenv().autoBuyShuriken=bool
        if bool then
            buyShuriKens()
        end
        end)
section1:addToggle("Auto Ranks", nil,function(bool)
        getgenv().autoBuyRank=bool
        if bool then
            buyRank()
        end
        end)
section1:addToggle("Auto Sell X35", nil,function(bool)
    getgenv().autoSell=bool
    if bool then
        aSell()
    end
    end)

section1:addToggle("Auto Skill", nil, function(bool)
    getgenv().autoBuySkill = bool
    if bool then
        buySkill()
    end
    end)

-- teleport
local page = venyx:addPage("Teleport", 8544659032,TextColor == Color3.fromRGB(0, 0, 0))
local section1 =page:addSection("Island Section")
local section2= page:addSection("Collect All Chest")





section2:addButton("Collect",function ()
    conllectChest()
end)

local selectWord;
section1:addDropdown("Select Island",{"Enchanted Island","Astral Island","Mystical Island","Space Island","Tundra Island","Eternal Island","Sandstorm","Thunderstorm","Ancient Inferno Island","Midnight Shadow Island","Mythical Souls Island","Winter Wonder Island","Golden Master Island","Dragon Legend Island","Cybernetic Legends Island","Skystorm Ultraus Island","Chaos Legends Island","Soul Fusion Island","Dark Elements Island","Inner Peace Island","Blazing Vortex Island"},function (value)
    selectWord = value;

end)
section1:addButton("Teleport",function ()
    if selectWord then
        teleportIsland(selectWord)
    end 
end)

--2nd page
local page = venyx:addPage("Test", 8544776132)
local section1 = page:addSection("Section 1")
local section2 = page:addSection("Section 2")

section1:addToggle("Toggle", nil, function(value)
print("Toggled", value)
end)
section1:addButton("Button", function()
print("Clicked")
end)
section1:addTextbox("Notification", "Choi game nho tat unikey dum cai nha ba", function(value, focusLost)
print("Input", value)

if focusLost then
venyx:Notify("SupperIdol_Minh", value)
end
end)

section2:addKeybind("Toggle Keybind", Enum.KeyCode.RightControl, function()
print("Activated Keybind")
venyx:toggle()
end, function()
print("Changed Keybind")
end)
section2:addColorPicker("ColorPicker", Color3.fromRGB(50, 50, 50))
section2:addColorPicker("ColorPicker2")
section2:addSlider("Slider", 0, -100, 100, function(value)
print("Dragged", value)
end)
section2:addDropdown("Dropdown", {"Hello", "World", "Hello World", "Word", 1, 2, 3})
section2:addDropdown("Dropdown", {"Hello", "World", "Hello World", "Word", 1, 2, 3}, function(text)
print("Selected", text)
end)
section2:addButton("Exit Hack",function ()
    for i,v in pairs(game.CoreGui:GetChildren()) do
        if v.Name == "-----VN-HUB-----" then
            v:Destroy()
        end
    end
end)

-- second page
local theme = venyx:addPage("Theme", 5012544693)
local colors = theme:addSection("Colors")

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
colors:addColorPicker(theme, color, function(color3)
venyx:setTheme(theme, color3)
end)
end

--load
venyx:SelectPage(venyx.pages[1], true)
venyx:Notify("SupperIdol_Minh", "Admin dep trai day!!")







function aTap()
    spawn (function ()
        while autoTap == true do
            local args = {[1] = "swingKatana"}
                remotePath.ninjaEvent:FireServer(unpack(args))
                wait()
                
        end 
    end)
end
    
function buyBetl()
    spawn(function()
        while wait(0.5) do
        if autoBuyBelt ==true then
        if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
        local oh1 = "buyAllBelts"
        local oh2 = {"Ground", "Astral Island", "Space Island","Tundra Island", "Eternal Island", "Sandstorm", "Thunderstorm", "Ancient Inferno Island", "Midnight Shadow Island", "Mythical Souls Island", "Winter Wonder Island","Golden Master Island","Dragon Legend Island","Cybernetic Legends Island","Skystorm Ultraus Island","Chaos Legends Island","Soul Fusion Island","Dark Elements Island","Inner Peace Island","Blazing Vortex Island"}
        for i = 1,#oh2 do
        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i])
        end
        end
        end
        end
        end)
end
function buySkill()
    spawn(function()
        while wait(0.5) do
        if autoBuySkill ==true then
        if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
        local oh1 = "buyAllSkills"
        local oh2 = {"Ground", "Astral Island", "Space Island","Tundra Island", "Eternal Island", "Sandstorm", "Thunderstorm", "Ancient Inferno Island", "Midnight Shadow Island", "Mythical Souls Island", "Winter Wonder Island","Golden Master Island","Dragon Legend Island","Cybernetic Legends Island","Skystorm Ultraus Island","Chaos Legends Island","Soul Fusion Island","Dark Elements Island","Inner Peace Island","Blazing Vortex Island"}
        for i = 1,#oh2 do
        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i])
        end
        end
        end
        end
        end)
end
function buyShuriKens()
    spawn(function()
        while wait(0.5) do
        if autoBuyShuriken ==true then
        if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
        local oh1 = "buyAllShurikens"
        local oh2 = {"Ground", "Astral Island", "Space Island","Tundra Island", "Eternal Island", "Sandstorm", "Thunderstorm", "Ancient Inferno Island", "Midnight Shadow Island", "Mythical Souls Island", "Winter Wonder Island","Golden Master Island","Dragon Legend Island","Cybernetic Legends Island","Skystorm Ultraus Island","Chaos Legends Island","Soul Fusion Island","Dark Elements Island","Inner Peace Island","Blazing Vortex Island"}
        for i = 1,#oh2 do
        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i])
        end
        end
        end
        end
        end)
end

function buySword()
    spawn(function()
        while wait(0.5) do
        if autoBuySword ==true then
        if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
        local oh1 = "buyAllSwords"
        local oh2 = {"Ground", "Astral Island", "Space Island","Tundra Island", "Eternal Island", "Sandstorm", "Thunderstorm", "Ancient Inferno Island", "Midnight Shadow Island", "Mythical Souls Island", "Winter Wonder Island","Golden Master Island","Dragon Legend Island","Cybernetic Legends Island","Skystorm Ultraus Island","Chaos Legends Island","Soul Fusion Island","Dark Elements Island","Inner Peace Island","Blazing Vortex Island"}
        for i = 1,#oh2 do
        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i])
        end
        end
        end
        end
        end)
    
end

function buyRank()
    spawn(function()
        while wait(0.5) do
        if autoBuyRank==true then
        if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
        local oh1 = "buyRank"
        local oh2 = game:GetService("ReplicatedStorage").Ranks.Ground:GetChildren()
        for i = 1,#oh2 do
        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(oh1, oh2[i].Name)
        end
        end
        end
        end
        end)
end

function getCurrentPlayerPOS()
    local player = game.Players.LocalPlayer;
    if player.Character then
    return player.Character.HumanoidRootPart.Position;
    end
    return false; 
end

function teleportTo(placeCFrame)
    local player = game.Players.LocalPlayer;
    if player.Character then
        player.Character.HumanoidRootPart.CFrame = placeCFrame;
    end 
end

function teleportIsland(island)
    if game:GetService("Workspace").islandUnlockParts[(island)]then
        teleportTo(game:GetService("Workspace").islandUnlockParts[(island)].islandSignPart.CFrame) 

    end
end



--AutoSelll
function aSell()
    spawn(function()
        while wait(0.01) do
        if autoSell == true then
        if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
        game.workspace.sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
        wait(.1)
        game.workspace.sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Workspace.Part.CFrame
        end
        end
        end
        end)
    
end
--AutoFullSell
function aFullSell()
    spawn(function()
        while wait(0.01) do
        if autoFullSell==true then 
        if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
        if player.PlayerGui.gameGui.maxNinjitsuMenu.Visible == true then
        game.workspace.sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
        wait(.05)
        game.workspace.sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Workspace.Part.CFrame
        end
        end
        end
        end
        end)
end


function conllectChest()
    game:GetService("Workspace").mythicalChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
wait(3.5)
game:GetService("Workspace").goldenChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
wait(3.5)
game:GetService("Workspace").enchantedChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
wait(3.5)
game:GetService("Workspace").magmaChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
wait(3.5)
game:GetService("Workspace").legendsChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
wait(3.5)
game:GetService("Workspace").eternalChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
wait(3.5)
game:GetService("Workspace").saharaChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
wait(3.5)
game:GetService("Workspace").thunderChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
wait(3.5)
game:GetService("Workspace").ancientChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
wait(3.5)
game:GetService("Workspace").midnightShadowChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
wait(3.5)
game:GetService("Workspace").groupRewardsCircle["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
wait(3.5)
game:GetService("Workspace")["Daily Chest"].circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
wait(3.5)
game:GetService("Workspace")["wonderChest"].circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
wait(3.5)
game:GetService("Workspace").wonderChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
game:GetService("Workspace").midnightShadowChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
game:GetService("Workspace").ancientChest["circleInner"].CFrame = game.Workspace.Part.CFrame
game:GetService("Workspace").midnightShadowChest["circleInner"].CFrame = game.Workspace.Part.CFrame
game:GetService("Workspace").thunderChest["circleInner"].CFrame = game.Workspace.Part.CFrame
game:GetService("Workspace").saharaChest["circleInner"].CFrame = game.Workspace.Part.CFrame
game:GetService("Workspace").eternalChest["circleInner"].CFrame = game.Workspace.Part.CFrame
game:GetService("Workspace").legendsChest["circleInner"].CFrame = game.Workspace.Part.CFrame
game:GetService("Workspace").magmaChest["circleInner"].CFrame = game.Workspace.Part.CFrame
game:GetService("Workspace").enchantedChest["circleInner"].CFrame = game.Workspace.Part.CFrame
game:GetService("Workspace").goldenChest["circleInner"].CFrame = game.Workspace.Part.CFrame
game:GetService("Workspace").mythicalChest["circleInner"].CFrame = game.Workspace.Part.CFrame
game:GetService("Workspace").groupRewardsCircle["circleInner"].CFrame = game.Workspace.Part.CFrame
game:GetService("Workspace")["Daily Chest"].circleInner.CFrame = game.Workspace.Part.CFrame
end



