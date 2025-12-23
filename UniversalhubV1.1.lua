--==================================================
-- KR Hub | Universal Hub
-- Key : KR Pro
--==================================================

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
	Name = "KR Hub | Universal Hub",
	LoadingTitle = "KR Hub",
	LoadingSubtitle = "by LuLu",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "KRHub",
		FileName = "Universal"
	},
	KeySystem = true,
	KeySettings = {
		Title = "KR Hub Key System",
		Subtitle = "Enter Key",
		Note = "Discord https://discord.gg/QdEwuqGnzQ!",
		FileName = "KRHubKey",
		SaveKey = true,
		GrabKeyFromSite = false,
		Key = {"KR Pro"}
	}
})

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local mouse = player:GetMouse()

--==================================================
-- Fun TAB（回転・逆さま等）
--==================================================
local FunTab = Window:CreateTab("Fun", 4483362458)

local reverseActive = false
local spinning = false
local spinSpeed = 10
local spinAngle = 0

FunTab:CreateToggle({
	Name = "逆さま ON / OFF",
	CurrentValue = false,
	Callback = function(v)
		reverseActive = v
	end
})

FunTab:CreateToggle({
	Name = "高速回転 ON / OFF",
	CurrentValue = false,
	Callback = function(v)
		spinning = v
	end
})

FunTab:CreateSlider({
	Name = "回転速度",
	Range = {10,50},
	Increment = 5,
	CurrentValue = 10,
	Callback = function(v)
		spinSpeed = v
	end
})

-- 透明化
FunTab:CreateButton({
	Name = "透明 Script",
	Callback = function()
		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invisible-FE-19153"))()
	end
})

-- テレポート
local teleportEnabled = false
FunTab:CreateToggle({
	Name = "Teleport",
	CurrentValue = false,
	Callback = function(v)
		teleportEnabled = v
	end
})

mouse.Button1Down:Connect(function()
	if teleportEnabled and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		player.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0,3,0))
	end
end)

-- 回転処理
RunService.RenderStepped:Connect(function()
	if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		local hrp = player.Character.HumanoidRootPart
		local cf = CFrame.new(hrp.Position)
		if reverseActive then
			cf = cf * CFrame.Angles(math.rad(180),0,0)
		end
		if spinning then
			spinAngle += math.rad(spinSpeed)
			cf = cf * CFrame.Angles(0,spinAngle,0)
		else
			spinAngle = 0
		end
		hrp.CFrame = cf
	end
end)

--==================================================
-- Player TAB
--==================================================
local PlayerTab = Window:CreateTab("Player", 4483362458)

-- WalkSpeed
local wsOn = false
local wsValue = 16

PlayerTab:CreateToggle({
	Name = "Walk Speed",
	CurrentValue = false,
	Callback = function(v)
		wsOn = v
	end
})

PlayerTab:CreateSlider({
	Name = "Speed Value",
	Range = {16,1000},
	Increment = 10,
	CurrentValue = 16,
	Callback = function(v)
		wsValue = v
	end
})

-- TP Walk
local tpWalk = false
local tpSpeed = 5

PlayerTab:CreateToggle({
	Name = "TP Walk",
	CurrentValue = false,
	Callback = function(v)
		tpWalk = v
	end
})

PlayerTab:CreateSlider({
	Name = "TP Speed",
	Range = {1,50},
	Increment = 1,
	CurrentValue = 5,
	Callback = function(v)
		tpSpeed = v
	end
})

-- Inf Jump
local infJump = false
PlayerTab:CreateToggle({
	Name = "Infinite Jump",
	CurrentValue = false,
	Callback = function(v)
		infJump = v
	end
})

UIS.JumpRequest:Connect(function()
	if infJump and player.Character then
		player.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

-- Jump Power
local jpOn = false
local jpValue = 50

PlayerTab:CreateToggle({
	Name = "Jump Power",
	CurrentValue = false,
	Callback = function(v)
		jpOn = v
	end
})

PlayerTab:CreateSlider({
	Name = "Jump Power Value",
	Range = {50,300},
	Increment = 10,
	CurrentValue = 50,
	Callback = function(v)
		jpValue = v
	end
})

-- Third Person
PlayerTab:CreateButton({
	Name = "Third Person",
	Callback = function()
		player.CameraMaxZoomDistance = 50
		player.CameraMinZoomDistance = 10
	end
})

-- Screen Fix
PlayerTab:CreateButton({
	Name = "Screen Fixing",
	Callback = function()
		player.CameraMinZoomDistance = 12
		player.CameraMaxZoomDistance = 12
	end
})

-- Fly
PlayerTab:CreateButton({
	Name = "Fly",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/mrnonameX/Fly-Script/main/Fly.lua"))()
	end
})

RunService.RenderStepped:Connect(function()
	if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
		local hum = player.Character:FindFirstChildOfClass("Humanoid")
		if wsOn then hum.WalkSpeed = wsValue end
		if jpOn then hum.JumpPower = jpValue end
		if tpWalk and player.Character:FindFirstChild("HumanoidRootPart") then
			player.Character.HumanoidRootPart.CFrame += hum.MoveDirection * tpSpeed
		end
	end
end)

--==================================================
-- Scripts TAB
--==================================================
local ScriptsTab = Window:CreateTab("Scripts", 4483362458)

ScriptsTab:CreateButton({Name="Blitz",Callback=function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/BlizTBr/scripts/main/FTAP.lua"))()
end})

ScriptsTab:CreateButton({Name="Vfly",Callback=function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/makkurokurosukescript/VFly-gui/refs/heads/main/VFly%20gui",true))()
end})

ScriptsTab:CreateButton({
	Name = "Aimbot (FTAP)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/eisyu-tech/aim_bot_MoBA/refs/heads/main/hello.lua"))()
	end
})

ScriptsTab:CreateButton({
	Name = "onanie",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/nxUFMY16"))()
	end
})

ScriptsTab:CreateButton({
	Name = "Shader",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/p0e1/1/refs/heads/main/SimpleShader.lua"))()
	end
})

ScriptsTab:CreateButton({
	Name = "K hub(key ftap k hub beta)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/makkurokurosukescript/K-hub-beta/refs/heads/main/.gitignore", true))()
	end
})

ScriptsTab:CreateButton({
	Name = "Bloody",
	Callback = function()
		loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-*-V2-62163"))()
	end
})

ScriptsTab:CreateButton({
	Name = "Rurihub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/212happybirthday-debug/rurirurihub/refs/heads/main/Rurihub.lua"))()
	end
})

ScriptsTab:CreateButton({
	Name = "Noobhub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLnoob106/noobhub.free.nopro/refs/heads/main/noobhubnopro.lua"))()
	end
})

ScriptsTab:CreateButton({
	Name = "Sex hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLnoob106/sexhub.free.lol/refs/heads/main/sexhub.lua"))()
	end
})

ScriptsTab:CreateButton({
	Name = "Unknownhub",
	Callback = function()
		loadstring(game:HttpGet(("https://pastebin.com/raw/Skn3Aa1Q"), true))()

Source: https://cheater.fun/hacks_roblox/7511-fling-things-and-people-script-super-throw-silent-aim-amp-more.html
	end
})

ScriptsTab:CreateButton({
	Name = "kigahub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLnoob106/Kigahub.free.lol/refs/heads/main/Kiga.lua"))()
	end
})

ScriptsTab:CreateButton({
	Name = "Cosmic (FTAP)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Jeffepicy/CosmicHub/refs/heads/main/CosmicHub",true))()
	end
})

ScriptsTab:CreateButton({
	Name = "Friendly (FTAP)",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/Brovaky/Friendly/refs/heads/main/Friendly'))()
	end
})

ScriptsTab:CreateButton({
	Name = "animation",
	Callback = function()
		loadstring(game:HttpGet(('https://pastebin.com/raw/1p6xnBNf'),true))()"))()
	end
})

ScriptsTab:CreateButton({
	Name = "iyan (FTAP)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/jadpy/suki/refs/heads/main/antiscript"))()
	end
})

ScriptsTab:CreateButton({
	Name = "system Broken(FTAP)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
	end
})

ScriptsTab:CreateButton({Name="Tokra(FTAP)",Callback=function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/sladostrastnik/TokraScript/refs/heads/main/Loader.luau"))()
end})

ScriptsTab:CreateButton({Name="Nameless",Callback=function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ily123950/Vulkan/refs/heads/main/Tr"))()
end})

ScriptsTab:CreateButton({Name="Auto Aim",Callback=function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/DanielHubll/DanielHubll/refs/heads/main/Aimbot%20Mobile"))()
end})

ScriptsTab:CreateButton({Name="TETRIS",Callback=function()
	loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-RTetris-76191"))()
end})

ScriptsTab:CreateButton({Name="Vape4",Callback=function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua",true))()
end})

ScriptsTab:CreateButton({Name="Blitz Crack",Callback=function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/212happybirthday-debug/scripts/refs/heads/main/FTAP.lua"))()
end})

--==================================================
-- Info TAB
--==================================================
local InfoTab = Window:CreateTab("Info", 4483362458)

InfoTab:CreateLabel("made in LuLu")

InfoTab:CreateButton({
	Name = "Discord copy!!",
	Callback = function()
		setclipboard("https://discord.gg/zAUnu7us6")
	end
})

InfoTab:CreateButton({
	Name = "Key copy",
	Callback = function()
		setclipboard("KR Pro")
	end
})

--==================================================
-- Words TAB
--==================================================
local WordsTab = Window:CreateTab("Words", 4483362458)

WordsTab:CreateButton({Name="English",Callback=function() Rayfield:Notify({Title="Language",Content="English",Duration=3}) end})
WordsTab:CreateButton({Name="日本語",Callback=function() Rayfield:Notify({Title="言語",Content="日本語",Duration=3}) end})

--==================================================
-- 追跡 UI（Rayfield）
--==================================================

local followTarget = nil
local followEnabled = false
local followDistance = 3

FunTab:CreateToggle({
	Name = "追跡 ON / OFF",
	CurrentValue = false,
	Callback = function(v)
		followEnabled = v
	end
})

FunTab:CreateSlider({
	Name = "追跡距離",
	Range = {2,10},
	Increment = 1,
	CurrentValue = 3,
	Callback = function(v)
		followDistance = v
	end
})

FunTab:CreateDropdown({
	Name = "追跡ターゲット",
	Options = {},
	CurrentOption = "",
	Callback = function(option)
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.Name == option then
				followTarget = plr
			end
		end
	end
})

-- プレイヤー一覧更新
local function updateFollowList(dropdown)
	local names = {}
	for _,plr in pairs(Players:GetPlayers()) do
		if plr ~= player then
			table.insert(names, plr.Name)
		end
	end
	dropdown:Refresh(names, true)
end

local followDropdown = FunTab:CreateDropdown({
	Name = "プレイヤー一覧",
	Options = {},
	CurrentOption = "",
	Callback = function(option)
		for _,plr in pairs(Players:GetPlayers()) do
			if plr.Name == option then
				followTarget = plr
			end
		end
	end
})

updateFollowList(followDropdown)
Players.PlayerAdded:Connect(function() updateFollowList(followDropdown) end)
Players.PlayerRemoving:Connect(function() updateFollowList(followDropdown) end)

-- 実際の追跡処理
RunService.RenderStepped:Connect(function()
	if followEnabled
	and followTarget
	and followTarget.Character
	and player.Character then

		local targetHRP = followTarget.Character:FindFirstChild("HumanoidRootPart")
		local myHRP = player.Character:FindFirstChild("HumanoidRootPart")

		if targetHRP and myHRP then
			local offset = CFrame.new(0, 0, followDistance)
			myHRP.CFrame = targetHRP.CFrame * offset
		end
	end
end)

--==================================================
-- UI TAB
--==================================================
local UITab = Window:CreateTab("UI", 4483362458)

UITab:CreateButton({
	Name = "Change Color (Random)",
	Callback = function()
		Rayfield:ChangeTheme(Color3.fromHSV(math.random(),1,1))
	end
})

UITab:CreateButton({
	Name = "Gui Destroy",
	Callback = function()
		Rayfield:Destroy()
	end
})
