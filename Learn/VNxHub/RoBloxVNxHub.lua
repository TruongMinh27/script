local Config = {
    WindowName = "VN.Hub",
	Color = Color3.fromRGB(255,46,46),
	Keybind = Enum.KeyCode.RightControl
}
game:GetService("Players").LocalPlayer.Idled:connect(function()
	game:GetService("VirtualUser"):ClickButton2(Vector2.new())
	end)

yes1 = {"Melee","Defense","Sword","Gun","Blox Fruit"}


tools = "Combat"
for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
if v.ClassName == "Tool" then
v.Parent = game.Players.LocalPlayer.Backpack
end end 
tools ={}
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetDescendants()) do
if v.ClassName == "Tool" then
table.insert(tools,v.Name)
end end 

mobs = {}
for i,v in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
if v.ClassName == "Model"  and v:FindFirstChild("Stun") then
table.insert(mobs,v.Name)
table.sort(mobs)
end end 
for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
if v.ClassName == "Model"  and v:FindFirstChild("Stun") then
table.insert(mobs,v.Name)
table.sort(mobs)
end end 
getgenv().speed = 100

game:GetService('RunService').Stepped:connect(function()
if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Notifications") then
game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Notifications"):remove()
end end)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/LemonHaze1/Library/main/VGLibrary.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))
local remotePath = game:GetService("Players").LocalPlayer;

local Tab1 = Window:CreateTab("Main")
local Tab2 = Window:CreateTab("UI Settings")

local Section1 = Tab1:CreateSection("Auto")
local Section2 = Tab1:CreateSection("Misc")
local Section3 = Tab2:CreateSection("Menu made by")
local Section4 = Tab2:CreateSection("Settings")

---Auto

local Toggle1 = Section1:CreateToggle("ON/OFF Auto Farm", nil, function(State)
    aFarm = State
   hitbox()
   aTp()
   aTap()
end)

--Mics

local Toggle21 = Section2:CreateToggle("No Dogle",nil,function (State)
	_G.nododgecool = State
	NoDodgeCool()
end)
local Toggle22 = Section2:CreateButton("G to Run",nil,function (State)
	sRun = State
	if sRun then
		walkspeed()
	end
end)
local TextBox1 = Section2:CreateTextBox("JumpPower", "Only numbers", true, function(Value)
    _G.WSf = Value
end)


--- UI Settings
local Dropdown3 = Section4:CreateDropdown("Image")
local Option7 = Dropdown3:AddOption("Default", function(String)
	Window:SetBackground("8556772943")
end)
local Option8 = Dropdown3:AddOption("Hearts", function(String)
	Window:SetBackground("6073763717")
end)
local Option9 = Dropdown3:AddOption("Abstract", function(String)
	Window:SetBackground("6073743871")
end)
local Option10 = Dropdown3:AddOption("Hexagon", function(String)
	Window:SetBackground("6073628839")
end)
local Option11 = Dropdown3:AddOption("Circles", function(String)
	Window:SetBackground("6071579801")
end)
local Option12 = Dropdown3:AddOption("Lace With Flowers", function(String)
	Window:SetBackground("6071575925")
end)
local Option13 = Dropdown3:AddOption("Floral", function(String)
	Window:SetBackground("5553946656")
end)
Option7:SetOption()

local Colorpicker4 = Section4:CreateColorpicker("BackColor", function(Color)
	Window:SetBackgroundColor(Color)
end)
Colorpicker4:UpdateColor(Color3.new(1,1,1))

local Colorpicker3 = Section4:CreateColorpicker("UI Color", function(Color)
	Window:ChangeColor(Color)
end)
Colorpicker3:UpdateColor(Config.Color)

local Slider3 = Section4:CreateSlider("Transparency",0,1,nil,false, function(Value)
	Window:SetBackgroundTransparency(Value)
end)
Slider3:SetValue(0)

local Slider4 = Section4:CreateSlider("Tile Scale",0,1,nil,false, function(Value)
	Window:SetTileScale(Value)
end)
Slider4:SetValue(1)
local Toggle3 = Section4:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)

--Credit

Toggle3:SetState(true)
Section3:CreateLabel("SupperIdol_Minh")




----SCRIPT

function hitbox()
	spawn (function()
		while aFarm do
		for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					v.HumanoidRootPart.Size = Vector3.new(35, 35, 35)
					v.HumanoidRootPart.Transparency = 1				
					v.HumanoidRootPart.CanCollide = false
				end
			   wait()
		end
	end)
end

function aTp(mobs)
	spawn( function ()
		while aFarm == true do
		local me = game.Players.LocalPlayer.Character
		local pbosd = game:GetService("Workspace").Enemies[(mobs)].HumanoidRootPart
		
		me.HumanoidRootPart.CFrame = 
		CFrame.new(pbosd.Position.X-0, pbosd.Position.Y+15, pbosd.Position.Z+20)
		wait()
		end
		end)
		
end


function aTap()
	spawn (function ()
		while aFarm  do

			game:GetService'VirtualUser':CaptureController()
				game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
			wait()
			end
	end)
end



---NoDodge
function NoDodgeCool()
	if _G.nododgecool then
			for i,v in next, getgc() do
				if game.Players.LocalPlayer.Character.Dodge then
					if typeof(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character.Dodge then
						for i2,v2 in next, getupvalues(v) do
							if tostring(v2) == "0.4" then
								repeat wait()
									setupvalue(v,i2,0)
								until not _G.nododgecool
							end
						end
					end
				end
			end
		end
end




local walkspeedplayer = game:GetService("Players").LocalPlayer
local walkspeedmouse = walkspeedplayer:GetMouse()

local walkspeedenabled = false

function walkspeed(key)
if key == "g" then
if walkspeedenabled == false then
local Humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid;
Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
Humanoid.WalkSpeed = WSf;
end)
Humanoid.WalkSpeed = WSf;

walkspeedenabled = true
elseif walkspeedenabled == true then
_G.WSs = 20;
local Humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid;
Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
Humanoid.WalkSpeed = _G.WSs;
end)
Humanoid.WalkSpeed = _G.WSs;

walkspeedenabled = false
end
end
end
walkspeedmouse.KeyDown:connect(walkspeed)

-----
local Dropdown1 = Section1:CreateDropdown("Select Tool")
Dropdown1:AddToolTip("Select Tool to use for farmming")
for i,v in next,tools do
Dropdown1:AddOption(v, function(String)
tools = String
end)
end

local Dropdown1 = Section1:CreateDropdown("Select Mob")
Dropdown1:AddToolTip("Select Mob")
for i,v in next,mobs do
Dropdown1:AddOption(v, function(String)
mobs = String

end)
end

local hehe = Section1:CreateButton("Start Farm",function ()
	if mobs then
		aTp(mobs)
		
	end
end)







