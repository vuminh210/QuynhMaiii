bplist00�
X$versionY$archiverT$topX$objects ��_NSKeyedArchiver�	Troot��+1259>?DIMU$null�_attributedStringData]dataPersisterV$class����WNS.dataO��)-- 💖 MENU FULL QUỲNH MAI – GỘP TOÀN BỘ CHỨC NĂNG YÊU CẦU (CHUẨN CLINE DELTA)
local plr = game.Players.LocalPlayer
local rs = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local ws = game.Workspace
local Lighting = game:GetService("Lighting")

-- GUI & Nút mở menu
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "QuynhMaiFullMenu"

local btnImg = Instance.new("ImageButton", gui)
btnImg.Size = UDim2.new(0, 80, 0, 80)
btnImg.Position = UDim2.new(0, 10, 0, 10)
btnImg.Image = "rbxassetid://115220483795229"
btnImg.BackgroundTransparency = 1

-- Menu chính
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 260)
frame.Position = UDim2.new(0.5, -160, 0.5, -130)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.Visible = false
frame.Active = true
frame.Draggable = true

-- Tiêu đề
local label = Instance.new("TextLabel", frame)
label.Size = UDim2.new(1, 0, 0, 30)
label.Position = UDim2.new(0, 0, 0, 0)
label.BackgroundTransparency = 1
label.Text = "anh yêu em rất nhiều Quỳnh Maii ơi i love you❄️"
label.TextColor3 = Color3.fromRGB(255, 170, 255)
label.Font = Enum.Font.SourceSansBold
label.TextSize = 16

-- Nút: Tốc độ
local speedBtn = Instance.new("TextButton", frame)
speedBtn.Size = UDim2.new(1, -20, 0, 40)
speedBtn.Position = UDim2.new(0, 10, 0, 40)
speedBtn.Text = "⚡ Tốc độ: OFF"
speedBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
speedBtn.TextColor3 = Color3.new(1, 1, 1)
speedBtn.Font = Enum.Font.SourceSansBold
speedBtn.TextSize = 16
local speedOn = false

-- Nút: Bay cao
local flyBtn = Instance.new("TextButton", frame)
flyBtn.Size = UDim2.new(1, -20, 0, 40)
flyBtn.Position = UDim2.new(0, 10, 0, 90)
flyBtn.Text = "🕊 Bay cao: OFF"
flyBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
flyBtn.TextColor3 = Color3.new(1, 1, 1)
flyBtn.Font = Enum.Font.SourceSansBold
flyBtn.TextSize = 16
local flyOn = false

-- Nút: Đi trên nước
local floatBtn = Instance.new("TextButton", frame)
floatBtn.Size = UDim2.new(1, -20, 0, 40)
floatBtn.Position = UDim2.new(0, 10, 0, 140)
floatBtn.Text = "🌊 Đi trên nước: OFF"
floatBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
floatBtn.TextColor3 = Color3.new(1, 1, 1)
floatBtn.Font = Enum.Font.SourceSansBold
floatBtn.TextSize = 16
local floatOn = false
local floatPart = nil

-- Nút: Nhặt rương
local chestBtn = Instance.new("TextButton", frame)
chestBtn.Size = UDim2.new(1, -20, 0, 40)
chestBtn.Position = UDim2.new(0, 10, 0, 190)
chestBtn.Text = "💰 Nhặt Rương: OFF"
chestBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
chestBtn.TextColor3 = Color3.new(1, 1, 1)
chestBtn.Font = Enum.Font.SourceSansBold
chestBtn.TextSize = 16
local chestOn = false

-- Nhạc mở menu
local sound = Instance.new("Sound", gui)
sound.SoundId = "rbxassetid://9129428489"
sound.Volume = 2

-- Toggle speed
speedBtn.MouseButton1Click:Connect(function()
	speedOn = not speedOn
	speedBtn.Text = "⚡ Tốc độ: " .. (speedOn and "ON" or "OFF")
end)

-- Toggle fly
flyBtn.MouseButton1Click:Connect(function()
	flyOn = not flyOn
	flyBtn.Text = "🕊 Bay cao: " .. (flyOn and "ON" or "OFF")
	if flyOn then
		local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
		if hrp then
			hrp.CFrame = hrp.CFrame + Vector3.new(0, 10000, 0)
		end
	end
end)

-- Toggle float
floatBtn.MouseButton1Click:Connect(function()
	floatOn = not floatOn
	floatBtn.Text = "🌊 Đi trên nước: " .. (floatOn and "ON" or "OFF")
	if floatOn then
		floatPart = Instance.new("Part", ws)
		floatPart.Anchored = true
		floatPart.CanCollide = true
		floatPart.Size = Vector3.new(12, 1, 12)
		floatPart.Transparency = 1
	else
		if floatPart then floatPart:Destroy() end
	end
end)

-- Toggle chest
chestBtn.MouseButton1Click:Connect(function()
	chestOn = not chestOn
	chestBtn.Text = "💰 Nhặt Rương: " .. (chestOn and "ON" or "OFF")
end)

-- Mở Menu & Phát nhạc & Tuyết
btnImg.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
	sound:Play()
	local snow = Instance.new("ParticleEmitter", frame)
	snow.Texture = "rbxassetid://7165863063"
	snow.Rate = 200
	snow.Lifetime = NumberRange.new(1,2)
	snow.Speed = NumberRange.new(3,6)
	snow.VelocitySpread = 180
end)

-- FIX LAG
settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
Lighting.GlobalShadows = false
for _,v in pairs(ws:GetDescendants()) do
	if v:IsA("ParticleEmitter") or v:IsA("Trail") then v.Enabled = false end
end

-- Loop hành động
rs.RenderStepped:Connect(function()
	local char = plr.Character
	if not char then return end
	local hum = char:FindFirstChild("Humanoid")
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if speedOn and hum then hum.WalkSpeed = 1000 end
	if floatOn and hrp and floatPart then
		floatPart.Position = hrp.Position - Vector3.new(0, 3, 0)
	end
	if chestOn and hrp then
		for _,v in pairs(ws:GetDescendants()) do
			if v:IsA("Model") and v:FindFirstChildWhichIsA("BasePart") and v.Name:lower():find("chest") then
				local part = v:FindFirstChildWhichIsA("BasePart")
				if (hrp.Position - part.Position).Magnitude > 5 then
					hrp.CFrame = part.CFrame + Vector3.new(0, 2, 0)
					wait(0.03)
				end
			end
		end
	end
end)*�(J���P�G��7�����Z$classnameX$classes]NSMutableData�]NSMutableDataVNSDataXNSObject� !"#$%&'()*_accumulatedDataSize_objectIdentifierWallURLs_identifierToDataDictionary_cacheDirectoryURL �
�����,-./0WNS.base[NS.relative� ��_�file:///private/var/mobile/Containers/Data/Application/CEFC7FB0-77F2-4C39-929C-7813C5E60B46/tmp/pasteboardDataPersister/B4A549BF-32A2-42E0-8CDE-76E8AE65D3E9�34UNSURL�3�678ZNS.objects��	�:;^NSMutableArray�<=^NSMutableArrayWNSArray_$E1491212-0E9B-4125-A8CB-F2208DC3222E�@6ABCWNS.keys����EF_NSMutableDictionary�GH_NSMutableDictionary\NSDictionary�JK_ICDataPersister�L_ICDataPersister�NO_ICNotePasteboardData�P_ICNotePasteboardData    $ ) 2 7 I L Q S e k r � � � � � � � �UW\gp~���������"*68:<��������#+RYabcej�����������             Q              	