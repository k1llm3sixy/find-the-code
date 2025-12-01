-- Gui to Lua
-- Version: 3.2

-- Instances:

local KeyGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local StageLabel = Instance.new("TextLabel")
local CodeLabel = Instance.new("TextLabel")
local DragDetector = Instance.new("UIDragDetector")

--Properties:

KeyGui.Name = "KeyGui"
KeyGui.Parent = game.CoreGui
KeyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
KeyGui.ResetOnSpawn = false
KeyGui.IgnoreGuiInset = true

MainFrame.Name = "MainFrame"
MainFrame.Parent = KeyGui
MainFrame.BackgroundColor3 = Color3.fromRGB(29, 32, 49)
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.463181138, 171, 0.430317849, -191)
MainFrame.Size = UDim2.new(0, 207, 0, 107)

DragDetector.Parent = MainFrame

UICorner.Parent = MainFrame

StageLabel.Name = "StageLabel"
StageLabel.Parent = MainFrame
StageLabel.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
StageLabel.BackgroundTransparency = 1.000
StageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
StageLabel.BorderSizePixel = 0
StageLabel.Position = UDim2.new(0.0386473425, 0, 0.0747663528, 0)
StageLabel.Size = UDim2.new(0, 190, 0, 30)
StageLabel.Font = Enum.Font.SourceSans
StageLabel.Text = ""
StageLabel.TextColor3 = Color3.fromRGB(0, 85, 255)
StageLabel.TextSize = 25.000

CodeLabel.Name = "CodeLabel"
CodeLabel.Parent = MainFrame
CodeLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CodeLabel.BackgroundTransparency = 1.000
CodeLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
CodeLabel.BorderSizePixel = 0
CodeLabel.Position = UDim2.new(0.0144927539, 0, 0.355140179, 0)
CodeLabel.Size = UDim2.new(0, 200, 0, 50)
CodeLabel.Font = Enum.Font.SourceSans
CodeLabel.Text = ""
CodeLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
CodeLabel.TextSize = 32.000
CodeLabel.TextWrapped = true
CodeLabel.RichText = true

local player = game:GetService("Players").LocalPlayer

local cfg = {
    ["Code"] = player:FindFirstChild("CurrentCode"),
    ["Stage"] = player:FindFirstChild("StageText"):FindFirstChild("Text")
}

function updateValues()
    StageLabel.Text = cfg.Stage.Value
    CodeLabel.Text = "<font color=\"rgb(200,200,200)\"><b>Code:</b></font> <b><font color=\"rgb(0,255,255)\">" .. cfg.Code.Value .. "</font></b>"
end

cfg.Code:GetPropertyChangedSignal("Value"):Connect(updateValues)
cfg.Stage:GetPropertyChangedSignal("Value"):Connect(updateValues)

updateValues()
