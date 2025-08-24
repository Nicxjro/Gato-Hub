local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 15)

local function createLabel(parent, text, yPos, fontSize)
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0.9, 0, 0, fontSize or 30)
	label.Position = UDim2.new(0.05, 0, yPos, 0)
	label.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	label.Text = text
	label.Font = Enum.Font.Gotham
	label.TextScaled = true
	label.TextColor3 = Color3.fromRGB(255,255,255)
	label.Parent = parent
	label.BorderSizePixel = 0
	Instance.new("UICorner", label).CornerRadius = UDim.new(0, 10)
	return label
end

local function createRainbowButton(parent, text, yPos)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0.9, 0, 0, 40)
	button.Position = UDim2.new(0.05, 0, yPos, 0)
	button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	button.Text = text
	button.Font = Enum.Font.Gotham
	button.TextScaled = true
	button.TextColor3 = Color3.fromRGB(255,255,255)
	button.Parent = parent
	button.BorderSizePixel = 0
	Instance.new("UICorner", button).CornerRadius = UDim.new(0, 10)
	return button
end

local mainTitle = createLabel(frame, "Gato Hub | Update in Dc", 0.1)
local getServerBtn = createRainbowButton(frame, "Get Server", 0.5)

task.spawn(function()
	local hue = 0
	while true do
		getServerBtn.TextColor3 = Color3.fromHSV(hue, 1, 1)
		hue = (hue + 0.01) % 1
		task.wait(0.05)
	end
end)

local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://138087397"
clickSound.Volume = 1
clickSound.Parent = frame

getServerBtn.MouseButton1Click:Connect(function()
	clickSound:Play()
	if syn then
		syn.request({Url = "https://discord.gg/5AkVxCSVXc"})
	else
		setclipboard("https://discord.gg/5AkVxCSVXc")
	end
end)

local warnFrame = Instance.new("Frame", screenGui)
warnFrame.Size = UDim2.new(0, 250, 0, 80)
warnFrame.Position = UDim2.new(1, -260, 1, -90)
warnFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
warnFrame.BorderSizePixel = 0
Instance.new("UICorner", warnFrame).CornerRadius = UDim.new(0, 10)

local warnTitle = Instance.new("TextLabel", warnFrame)
warnTitle.Size = UDim2.new(0.95, 0, 0, 30)
warnTitle.Position = UDim2.new(0.025, 0, 0.05, 0)
warnTitle.BackgroundTransparency = 1
warnTitle.Text = "Gato Hub Warn"
warnTitle.Font = Enum.Font.Gotham
warnTitle.TextScaled = true
warnTitle.TextColor3 = getServerBtn.TextColor3

local warnDesc = Instance.new("TextLabel", warnFrame)
warnDesc.Size = UDim2.new(0.95, 0, 0, 40)
warnDesc.Position = UDim2.new(0.025, 0, 0.45, 0)
warnDesc.BackgroundTransparency = 1
warnDesc.Text = "Update in server, paste to join in the server."
warnDesc.Font = Enum.Font.Gotham
warnDesc.TextScaled = true
warnDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
warnDesc.TextWrapped = true

task.spawn(function()
	while true do
		warnTitle.TextColor3 = getServerBtn.TextColor3
		task.wait(0.05)
	end
end)

task.spawn(function()
	task.wait(5)
	for i = 1, 20 do
		warnFrame.BackgroundTransparency = i/20
		warnTitle.TextTransparency = i/20
		warnDesc.TextTransparency = i/20
		task.wait(0.05)
	end
	warnFrame:Destroy()
end)