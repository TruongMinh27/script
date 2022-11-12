getgenv().tpc = false;
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LemonHaze1/Library/main/VenyxLibrary.lua"))()
local venyx = library.new("-----VN-HUB-----", 8544776132)

---theme set
local themes = {
    Background = Color3.fromRGB(24, 24, 24),
    Glow = Color3.fromRGB(0, 255, 255),
    Accent = Color3.fromRGB(10, 10, 10),
    LightContrast = Color3.fromRGB(20, 20, 20),
    DarkContrast = Color3.fromRGB(14, 14, 14),  
    TextColor = Color3.fromRGB(0, 21, 255)
    }

--page1 Main
local page = venyx:addPage("Main")
local section1 = page:addSection("Spawn")
local section2 = page:addSection("Teleport To Crate")
local selectSpawn;
section1:addDropdown("Select spawn",{"Black Panther","The Hulk","Antman","Green Lantern","Iron Man","Batman","Spiderman","Superman","The Flash","Thor"},function (value)
    selectSpawn = value
end)
section1:addButton("Teleport",function ()
    if selectSpawn then
        teleportS(selectSpawn)
    end
end)

section2:addToggle("Toggle",nil,function ()
    getgenv().tpc = bool
    if bool then
        telecrate()
    end
end)


--Setting

local page = venyx:addPage("Setting", 8544776132)
local section1 = page:addSection("Section 1")


section1:addKeybind("Toggle Keybind", Enum.KeyCode.RightControl, function()
    print("Activated Keybind")
    venyx:toggle()
    end, function()
    print("Changed Keybind")
    end)


--Theme
local theme = venyx:addPage("Theme", 5012544693)
local colors = theme:addSection("Colors")

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
colors:addColorPicker(theme, color, function(color3)
venyx:setTheme(theme, color3)
end)
end

--load
venyx:SelectPage(venyx.pages[1], true)

--Script


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

function teleportS(spawn)
    local location = game:GetService("Workspace").Tycoons
    if teleportS then
        teleportTo(location.Tycoons[(spawn)].Essentials.Spawn.CFrame)
    end 
end


function telecrate()
    spawn (function ()
        local crate = game:GetService("Workspace").Crates.CashCrate.CashCrate
           while tpc == true do
               teleportTo(crate.CFrame)
               wait()
           end
       end)
    end