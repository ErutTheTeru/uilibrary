local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local CoreGui = LocalPlayer.PlayerGui --// game:GetService("CoreGui")
local function MakeDraggable(changesizeobject, mainobject, topbarobject)
    local function CustomPos(topbarobject, object)
        local Dragging = nil
        local DragInput = nil
        local DragStart = nil
        local StartPosition = nil

        local function UpdatePos(input)
            local Delta = input.Position - DragStart
            local pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
            local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
            Tween:Play()
        end

        topbarobject.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPosition = object.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        Dragging = false
                    end
                end)
            end
        end)

        topbarobject.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                DragInput = input
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input == DragInput and Dragging then
                UpdatePos(input)
            end
        end)
    end
    local function CustomSize(changesizeobject, object)
        local Dragging = false
		local DragInput = nil
		local DragStart = nil
		local StartSize = nil

		local function UpdateSize(input)
			local Delta = input.Position - DragStart
			local newWidth = StartSize.X.Offset + Delta.X
			local newHeight = StartSize.Y.Offset + Delta.Y
			newWidth = math.max(newWidth, 220)
			newHeight = math.max(newHeight, 37)
			local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Size = UDim2.new(0, newWidth, 0, newHeight)})
			Tween:Play()
		end

		changesizeobject.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartSize = object.Size
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						Dragging = false
					end
				end)
			end
		end)

		changesizeobject.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				DragInput = input
			end
		end)

		UserInputService.InputChanged:Connect(function(input)
			if input == DragInput and Dragging then
				UpdateSize(input)
			end
		end)
    end
    CustomSize(changesizeobject, mainobject)
    CustomPos(topbarobject, mainobject)
end
function CircleClick(Button, X, Y)
	spawn(function()
		Button.ClipsDescendants = true
		local Circle = Instance.new("ImageLabel")
		Circle.Image = "rbxassetid://266543268"
		Circle.ImageColor3 = Color3.fromRGB(80, 80, 80)
		Circle.ImageTransparency = 0.8999999761581421
		Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Circle.BackgroundTransparency = 1
		Circle.ZIndex = 10
		Circle.Name = "Circle"
		Circle.Parent = Button
		
		local NewX = X - Circle.AbsolutePosition.X
		local NewY = Y - Circle.AbsolutePosition.Y
		Circle.Position = UDim2.new(0, NewX, 0, NewY)
		local Size = 0
		if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
			Size = Button.AbsoluteSize.X*1.5
		elseif Button.AbsoluteSize.X < Button.AbsoluteSize.Y then
			Size = Button.AbsoluteSize.Y*1.5
		elseif Button.AbsoluteSize.X == Button.AbsoluteSize.Y then
			Size = Button.AbsoluteSize.X*1.5
		end

		local Time = 0.5
		Circle:TweenSizeAndPosition(UDim2.new(0, Size, 0, Size), UDim2.new(0.5, -Size/2, 0.5, -Size/2), "Out", "Quad", Time, false, nil)
		for i=1,10 do
			Circle.ImageTransparency = Circle.ImageTransparency + 0.01
			wait(Time/10)
		end
		Circle:Destroy()
	end)
end
local RimusLib = {}
function RimusLib:MakeNotify(Config)
    local NotifyConfig = Config or {}
	NotifyConfig.Title = NotifyConfig.Title or "Notification"
	NotifyConfig.Content = NotifyConfig.Content or "Content"
	NotifyConfig.Image = NotifyConfig.Image or "rbxassetid://16410678154"
	NotifyConfig.Time = NotifyConfig.Time or 1
	NotifyConfig.Delay = NotifyConfig.Delay or 5
	spawn(function()
		local NotifyPosHeigh = 30
		for i, v in pairs(CoreGui:GetChildren()) do
			if v.Name == "RimusNotifyGui" then
				if v:FindFirstChild("ShadowHolder1") and v.ShadowHolder1.Active then
					NotifyPosHeigh = -(v.ShadowHolder1.Position.Y.Offset) + 95
				end
			end
		end
		local NotifyPos = UDim2.new(1, -30, 1, (0 - NotifyPosHeigh))
		local NotifyPosFirst = UDim2.new(1, 350, 1, (0 - NotifyPosHeigh))
		local RimusNotifyGui = Instance.new("ScreenGui");
		local ShadowHolder1 = Instance.new("Frame");
		local ShadowImage1 = Instance.new("ImageLabel");
		local Notify = Instance.new("Frame");
		local UICorner = Instance.new("UICorner");
		local Top = Instance.new("Frame");
		local NameHub = Instance.new("TextLabel");
		local UIStroke = Instance.new("UIStroke");
		local Notification = Instance.new("TextLabel");
		local UIStroke1 = Instance.new("UIStroke");
		local Icon = Instance.new("ImageLabel");
		local UICorner1 = Instance.new("UICorner");
		local ShadowHolder2 = Instance.new("Frame");
		local ShadowImage2 = Instance.new("ImageLabel");
		local Content = Instance.new("TextLabel");

		RimusNotifyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		RimusNotifyGui.Name = "RimusNotifyGui"
		RimusNotifyGui.Parent = CoreGui

		ShadowHolder1.AnchorPoint = Vector2.new(1, 1)
		ShadowHolder1.BackgroundTransparency = 1
		ShadowHolder1.BorderSizePixel = 0
		ShadowHolder1.Position = NotifyPosFirst
		ShadowHolder1.Size = UDim2.new(0, 310, 0, 80)
		ShadowHolder1.ZIndex = 0
		ShadowHolder1.Name = "ShadowHolder1"
		ShadowHolder1.Parent = RimusNotifyGui
		ShadowHolder1.Active = true

		ShadowImage1.Image = "rbxassetid://6015897843"
		ShadowImage1.ImageColor3 = Color3.fromRGB(35.00000171363354, 160.00000566244125, 255)
		ShadowImage1.ScaleType = Enum.ScaleType.Slice
		ShadowImage1.SliceCenter = Rect.new(49, 49, 450, 450)
		ShadowImage1.AnchorPoint = Vector2.new(0.5, 0.5)
		ShadowImage1.BackgroundTransparency = 1
		ShadowImage1.BorderSizePixel = 0
		ShadowImage1.Position = UDim2.new(0.5, 0, 0.5, 0)
		ShadowImage1.Size = UDim2.new(1, 47, 1, 47)
		ShadowImage1.ZIndex = 0
		ShadowImage1.Name = "ShadowImage1"
		ShadowImage1.Parent = ShadowHolder1

		Notify.AnchorPoint = Vector2.new(0.5, 0.5)
		Notify.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Notify.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Notify.BorderSizePixel = 0
		Notify.ClipsDescendants = true
		Notify.Position = UDim2.new(0.5, 0, 0.5, 0)
		Notify.Size = UDim2.new(1, -47, 1, -47)
		Notify.Name = "Notify"
		Notify.Parent = ShadowImage1

		UICorner.CornerRadius = UDim.new(0, 3)
		UICorner.Parent = Notify

		Top.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Top.BackgroundTransparency = 0.9990000128746033
		Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Top.BorderSizePixel = 0
		Top.Size = UDim2.new(1, 0, 0, 31)
		Top.Name = "Top"
		Top.Parent = Notify

		NameHub.Font = Enum.Font.GothamBold
		NameHub.Text = "  ".."Rimus Hub"
		NameHub.TextColor3 = Color3.fromRGB(255, 255, 255)
		NameHub.TextSize = 15
		NameHub.TextXAlignment = Enum.TextXAlignment.Left
		NameHub.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		NameHub.BackgroundTransparency = 0.9990000128746033
		NameHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
		NameHub.BorderSizePixel = 0
		NameHub.Size = UDim2.new(1, 0, 1, 0)
		NameHub.Name = "NameHub"
		NameHub.Parent = Top

		UIStroke.Color = Color3.fromRGB(255, 255, 255)
		UIStroke.Thickness = 0.20000000298023224
		UIStroke.Parent = NameHub

		Notification.Font = Enum.Font.GothamBold
		Notification.Text = "                      "..NotifyConfig.Title
		Notification.TextColor3 = Color3.fromRGB(35.00000171363354, 160.00000566244125, 255)
		Notification.TextSize = 15
		Notification.TextXAlignment = Enum.TextXAlignment.Left
		Notification.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Notification.BackgroundTransparency = 0.9990000128746033
		Notification.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Notification.BorderSizePixel = 0
		Notification.Position = UDim2.new(0, 1, 0, 0)
		Notification.Size = UDim2.new(1, 0, 1, 0)
		Notification.Name = "Notification"
		Notification.Parent = Top

		UIStroke1.Color = Color3.fromRGB(35.00000171363354, 160.00000566244125, 255)
		UIStroke1.Thickness = 0.4000000059604645
		UIStroke1.Parent = Notification

		Icon.Image = tostring(NotifyConfig.Image)
		Icon.AnchorPoint = Vector2.new(1, 0.5)
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 0.9990000128746033
		Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Icon.BorderSizePixel = 0
		Icon.Position = UDim2.new(1, -1, 0.49000001, 0)
		Icon.Size = UDim2.new(0, 25, 0, 25)
		Icon.Name = "Icon"
		Icon.Parent = Top

		UICorner1.CornerRadius = UDim.new(0, 3)
		UICorner1.Parent = Icon

		ShadowHolder2.BackgroundTransparency = 1
		ShadowHolder2.BorderSizePixel = 0
		ShadowHolder2.Size = UDim2.new(1, 0, 1, 0)
		ShadowHolder2.ZIndex = 0
		ShadowHolder2.Name = "ShadowHolder2"
		ShadowHolder2.Parent = Notify

		ShadowImage2.Image = "rbxassetid://6015897843"
		ShadowImage2.ImageColor3 = Color3.fromRGB(0, 0, 0)
		ShadowImage2.ImageTransparency = 0.5
		ShadowImage2.ScaleType = Enum.ScaleType.Slice
		ShadowImage2.SliceCenter = Rect.new(49, 49, 450, 450)
		ShadowImage2.AnchorPoint = Vector2.new(0.5, 0.5)
		ShadowImage2.BackgroundTransparency = 1
		ShadowImage2.BorderSizePixel = 0
		ShadowImage2.Position = UDim2.new(0.5, 0, 0.5, 0)
		ShadowImage2.Size = UDim2.new(1, 47, 1, 47)
		ShadowImage2.ZIndex = 0
		ShadowImage2.Name = "ShadowImage2"
		ShadowImage2.Parent = ShadowHolder2

		Content.Font = Enum.Font.GothamBold
		Content.Text = tostring(NotifyConfig.Content)
		Content.TextColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877)
		Content.TextSize = 14
		Content.TextWrapped = true
		Content.TextXAlignment = Enum.TextXAlignment.Left
		Content.TextYAlignment = Enum.TextYAlignment.Top
		Content.AnchorPoint = Vector2.new(0.5, 0)
		Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Content.BackgroundTransparency = 0.9990000128746033
		Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Content.BorderSizePixel = 0
		Content.Position = UDim2.new(0.5, 0, 0, 28)
		Content.Size = UDim2.new(0, 293, 0, 43)
		Content.Name = "Content"
		Content.Parent = Notify
		TweenService:Create(
			ShadowHolder1,
			TweenInfo.new(tonumber(NotifyConfig.Time), Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
			{Position = NotifyPos}
		):Play()
		task.wait(tonumber(NotifyConfig.Delay))
		TweenService:Create(
			ShadowHolder1,
			TweenInfo.new(tonumber(NotifyConfig.Time), Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
			{Position = NotifyPosFirst}
		):Play()
		task.wait(tonumber(NotifyConfig.Time) / 2)
		ShadowHolder1.Active = false
		task.wait(tonumber(NotifyConfig.Time) / 2)
		RimusNotifyGui:Destroy()
	end)
end
function RimusLib:MakeGui(GuiConfig)
	local GuiConfig = GuiConfig or {}
	GuiConfig.NameHub = GuiConfig.NameHub or "Rimus Hub"
	GuiConfig.NameGam = GuiConfig.NameGam or "V2"
	GuiConfig.Icon = GuiConfig.Icon or "rbxassetid://16410678154"

	local ScreenGui = Instance.new("ScreenGui");
	local DropShadowHolder = Instance.new("Frame");
	local DropShadow = Instance.new("ImageLabel");
	local Frame = Instance.new("Frame");
	local UICorner = Instance.new("UICorner");
	local ToggleButton = Instance.new("TextButton");
	local ImageLabel = Instance.new("ImageLabel");
	local UICorner1 = Instance.new("UICorner");

	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.Name = "ScreenGui"
	ScreenGui.Parent = CoreGui

	DropShadowHolder.AnchorPoint = Vector2.new(0, 0.5)
	DropShadowHolder.BackgroundTransparency = 1
	DropShadowHolder.BorderSizePixel = 0
	DropShadowHolder.Position = UDim2.new(0, 15, 0.449999988, 0)
	DropShadowHolder.Size = UDim2.new(0, 30, 0, 30)
	DropShadowHolder.ZIndex = 0
	DropShadowHolder.Name = "DropShadowHolder"
	DropShadowHolder.Parent = ScreenGui

	DropShadow.Image = "rbxassetid://6015897843"
	DropShadow.ImageColor3 = Color3.fromRGB(35.00000171363354, 160.00000566244125, 255)
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Size = UDim2.new(1, 30, 1, 30)
	DropShadow.ZIndex = 0
	DropShadow.Name = "DropShadow"
	DropShadow.Parent = DropShadowHolder

	Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.ClipsDescendants = true
	Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	Frame.Size = UDim2.new(1, -30, 1, -30)
	Frame.Parent = DropShadow

	UICorner.CornerRadius = UDim.new(0, 3)
	UICorner.Parent = Frame

	ToggleButton.Font = Enum.Font.SourceSans
	ToggleButton.Text = ""
	ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	ToggleButton.TextSize = 14
	ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ToggleButton.BackgroundTransparency = 0.9990000128746033
	ToggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ToggleButton.BorderSizePixel = 0
	ToggleButton.Size = UDim2.new(1, 0, 1, 0)
	ToggleButton.Parent = Frame

	ImageLabel.Image = GuiConfig.Icon
	ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BackgroundTransparency = 0.9990000128746033
	ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel.BorderSizePixel = 0
	ImageLabel.Position = UDim2.new(0.5, 0, 0.479999989, 0)
	ImageLabel.Size = UDim2.new(0, 28, 0, 28)
	ImageLabel.Parent = ToggleButton

	UICorner1.CornerRadius = UDim.new(0, 3)
	UICorner1.Parent = ImageLabel

	local ShadowHolder1 = Instance.new("Frame");
	local ShadowImage1 = Instance.new("ImageLabel");
	local Main = Instance.new("Frame");
	local UICorner = Instance.new("UICorner");
	local ChangeSizeFrame = Instance.new("Frame");
	local Top = Instance.new("Frame");
	local NameHub = Instance.new("TextLabel");
	local UIStroke = Instance.new("UIStroke");
	local NameGam = Instance.new("TextLabel");
	local UIStroke1 = Instance.new("UIStroke");
	local ChageSizeButton = Instance.new("TextButton");
	local ImageLabel = Instance.new("ImageLabel");
	local UICorner1 = Instance.new("UICorner");
	local LayersTab = Instance.new("Frame");
	local UICorner2 = Instance.new("UICorner");
	local ScrollTab = Instance.new("ScrollingFrame");
	local UIListLayout = Instance.new("UIListLayout");

	local Open = true
	ToggleButton.MouseButton1Down:Connect(function()
		if Open == false then
			Open = true
			ShadowHolder1.Visible = true
		else
			Open = false
			ShadowHolder1.Visible = false
		end
	end)
	
	ShadowHolder1.BackgroundTransparency = 1
	ShadowHolder1.BorderSizePixel = 0
	ShadowHolder1.Position = UDim2.new(0, 50, 0, 50)
	ShadowHolder1.Size = UDim2.new(0, 310, 0, 230)
	ShadowHolder1.ZIndex = 0
	ShadowHolder1.Name = "ShadowHolder1"
	ShadowHolder1.Parent = ScreenGui

	ShadowImage1.Image = "rbxassetid://6015897843"
	ShadowImage1.ImageColor3 = Color3.fromRGB(35.00000171363354, 160.00000566244125, 255)
	ShadowImage1.ScaleType = Enum.ScaleType.Slice
	ShadowImage1.SliceCenter = Rect.new(49, 49, 450, 450)
	ShadowImage1.AnchorPoint = Vector2.new(0.5, 0.5)
	ShadowImage1.BackgroundTransparency = 1
	ShadowImage1.BorderSizePixel = 0
	ShadowImage1.Position = UDim2.new(0.5, 0, 0.5, 0)
	ShadowImage1.Size = UDim2.new(1, 47, 1, 47)
	ShadowImage1.ZIndex = 0
	ShadowImage1.Name = "ShadowImage1"
	ShadowImage1.Parent = ShadowHolder1

	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.ClipsDescendants = true
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(1, -47, 1, -47)
	Main.Name = "Main"
	Main.Parent = ShadowImage1

	UICorner.CornerRadius = UDim.new(0, 3)
	UICorner.Parent = Main
	
	ChangeSizeFrame.AnchorPoint = Vector2.new(1, 1)
	ChangeSizeFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ChangeSizeFrame.BackgroundTransparency = 0.9990000128746033
	ChangeSizeFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ChangeSizeFrame.BorderSizePixel = 0
	ChangeSizeFrame.Position = UDim2.new(1, 20, 1, 20)
	ChangeSizeFrame.Size = UDim2.new(0, 40, 0, 40)
	ChangeSizeFrame.Name = "ChangeSizeFrame"
	ChangeSizeFrame.Parent = ShadowHolder1

	Top.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Top.BackgroundTransparency = 0.9990000128746033
	Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Top.BorderSizePixel = 0
	Top.Size = UDim2.new(1, 0, 0, 31)
	Top.Name = "Top"
	Top.Parent = Main

	NameHub.Font = Enum.Font.GothamBold
	NameHub.Text = "  "..GuiConfig.NameHub
	NameHub.TextColor3 = Color3.fromRGB(255, 255, 255)
	NameHub.TextSize = 15
	NameHub.TextXAlignment = Enum.TextXAlignment.Left
	NameHub.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	NameHub.BackgroundTransparency = 0.9990000128746033
	NameHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NameHub.BorderSizePixel = 0
	NameHub.Size = UDim2.new(1, 0, 1, 0)
	NameHub.Name = "NameHub"
	NameHub.Parent = Top

	UIStroke.Color = Color3.fromRGB(255, 255, 255)
	UIStroke.Thickness = 0.20000000298023224
	UIStroke.Parent = NameHub

	NameGam.Font = Enum.Font.GothamBold
	NameGam.Text = "                      "..GuiConfig.NameGam
	NameGam.TextColor3 = Color3.fromRGB(35.00000171363354, 160.00000566244125, 255)
	NameGam.TextSize = 15
	NameGam.TextXAlignment = Enum.TextXAlignment.Left
	NameGam.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	NameGam.BackgroundTransparency = 0.9990000128746033
	NameGam.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NameGam.BorderSizePixel = 0
	NameGam.Position = UDim2.new(0, 1, 0, 0)
	NameGam.Size = UDim2.new(1, 0, 1, 0)
	NameGam.Name = "NameGam"
	NameGam.Parent = Top

	UIStroke1.Color = Color3.fromRGB(35.00000171363354, 160.00000566244125, 255)
	UIStroke1.Thickness = 0.4000000059604645
	UIStroke1.Parent = NameGam

	ChageSizeButton.Font = Enum.Font.SourceSans
	ChageSizeButton.Text = ""
	ChageSizeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	ChageSizeButton.TextSize = 14
	ChageSizeButton.AnchorPoint = Vector2.new(1, 0)
	ChageSizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ChageSizeButton.BackgroundTransparency = 0.9990000128746033
	ChageSizeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ChageSizeButton.BorderSizePixel = 0
	ChageSizeButton.Position = UDim2.new(1, 0, 0, 0)
	ChageSizeButton.Size = UDim2.new(0, 31, 0, 31)
	ChageSizeButton.Name = "ChageSizeButton"
	ChageSizeButton.Parent = Top

	ImageLabel.Image = "rbxassetid://16533504085"
	ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BackgroundTransparency = 0.9990000128746033
	ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel.BorderSizePixel = 0
	ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	ImageLabel.Size = UDim2.new(1, -8, 1, -8)
	ImageLabel.Parent = ChageSizeButton

	UICorner1.CornerRadius = UDim.new(0, 3)
	UICorner1.Parent = ImageLabel

	local Out = false
	local OldPos = ShadowHolder1.Position
	local OldSize = ShadowHolder1.Size
	ChageSizeButton.MouseButton1Click:Connect(function()
		if Out == false then
			Out = true
			ChageSizeButton.ImageLabel.Image = "rbxassetid://16533565304"
			OldPos = ShadowHolder1.Position
			OldSize = ShadowHolder1.Size
			TweenService:Create(ShadowHolder1, TweenInfo.new(0.3), {Position = UDim2.new(0, 0, 0, 0)}):Play()
			TweenService:Create(ShadowHolder1, TweenInfo.new(0.3), {Size = UDim2.new(1, 0, 1, 0)}):Play()
		else
			Out = false
			ChageSizeButton.ImageLabel.Image = "rbxassetid://16533504085"
			TweenService:Create(ShadowHolder1, TweenInfo.new(0.3), {Position = OldPos}):Play()
			TweenService:Create(ShadowHolder1, TweenInfo.new(0.3), {Size = OldSize}):Play()
		end
	end)
	MakeDraggable(ChangeSizeFrame, ShadowHolder1, Top)
	--// Layers Tab
	LayersTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LayersTab.BackgroundTransparency = 0.9990000128746033
	LayersTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LayersTab.BorderSizePixel = 0
	LayersTab.ClipsDescendants = true
	LayersTab.Position = UDim2.new(0, 7, 0, 31)
	LayersTab.Size = UDim2.new(0, 88, 1, -37)
	LayersTab.Name = "LayersTab"
	LayersTab.Parent = Main

	UICorner2.CornerRadius = UDim.new(0, 3)
	UICorner2.Parent = LayersTab

	ScrollTab.CanvasSize = UDim2.new(0, 0, 1.20000005, 0)
	ScrollTab.ScrollBarThickness = 0
	ScrollTab.Active = true
	ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollTab.BackgroundTransparency = 0.9990000128746033
	ScrollTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScrollTab.BorderSizePixel = 0
	ScrollTab.Size = UDim2.new(1, 0, 1, 0)
	ScrollTab.Name = "ScrollTab"
	ScrollTab.Parent = LayersTab
	local function UpdateCanvaSize()
        local OffsetY = 0
        for _, child in pairs(ScrollTab:GetChildren()) do
            if child.Name ~= "UIListLayout" then
				OffsetY = OffsetY + 3 + child.Size.Y.Offset
			end
        end
        ScrollTab.CanvasSize = UDim2.new(0, 0, 0, OffsetY)
    end
    ScrollTab.ChildAdded:Connect(UpdateCanvaSize)
    ScrollTab.ChildRemoved:Connect(UpdateCanvaSize)

	UIListLayout.Padding = UDim.new(0, 3)
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Parent = ScrollTab
	--// Layers
	local Layers = Instance.new("Frame");
	local UICorner5 = Instance.new("UICorner");
	local FolderTab = Instance.new("Folder");
	local UIPageLayout = Instance.new("UIPageLayout");
	
	Layers.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Layers.BackgroundTransparency = 0.9990000128746033
	Layers.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Layers.BorderSizePixel = 0
	Layers.ClipsDescendants = true
	Layers.Position = UDim2.new(0, 101, 0, 31)
	Layers.Size = UDim2.new(1, -108, 1, -37)
	Layers.Name = "Layers"
	Layers.Parent = Main

	UICorner5.CornerRadius = UDim.new(0, 2)
	UICorner5.Parent = Layers

	FolderTab.Name = "FolderTab"
	FolderTab.Parent = Layers
	
	UIPageLayout.Circular = true
	UIPageLayout.EasingDirection = Enum.EasingDirection.InOut
	UIPageLayout.EasingStyle = Enum.EasingStyle.Quad
	UIPageLayout.FillDirection = Enum.FillDirection.Vertical
	UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIPageLayout.TweenTime = 0.3
	UIPageLayout.Parent = FolderTab
	--// Tabs
	local Tabs = {}
	local CountTab = 0
	function Tabs:CreateTab(TabConfig)
		local TabConfig = TabConfig or {}
		TabConfig.Name = TabConfig.Name or "Tab"
		TabConfig.Icon = TabConfig.Icon or ""
		local Tab1 = Instance.new("Frame");
		local UICorner3 = Instance.new("UICorner");
		local TextButton = Instance.new("TextButton");
		local TabImg = Instance.new("ImageLabel");

		Tab1.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Tab1.BorderSizePixel = 0
		Tab1.LayoutOrder = CountTab
		Tab1.Size = UDim2.new(1, 0, 0, 26)
		Tab1.Name = "Tab1"
		Tab1.Parent = ScrollTab
		if CountTab == 0 then
			Tab1.BackgroundColor3 = Color3.fromRGB(32.00000189244747, 140.00000685453415, 255)
			UIPageLayout:JumpToIndex(CountTab)
		else
			Tab1.BackgroundColor3 = Color3.fromRGB(20.000000707805157, 20.000000707805157, 20.000000707805157)
		end

		UICorner3.CornerRadius = UDim.new(0, 2)
		UICorner3.Parent = Tab1

		TextButton.Font = Enum.Font.GothamBold
		TextButton.Text = "       "..TabConfig.Name
		TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.TextSize = 13
		TextButton.TextXAlignment = Enum.TextXAlignment.Left
		TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.BackgroundTransparency = 0.9990000128746033
		TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextButton.BorderSizePixel = 0
		TextButton.Position = UDim2.new(0, 1, 0, 0)
		TextButton.Size = UDim2.new(1, 0, 1, 0)
		TextButton.Parent = Tab1

		TabImg.Image = TabConfig.Icon
		TabImg.AnchorPoint = Vector2.new(0, 0.5)
		TabImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabImg.BackgroundTransparency = 0.9990000128746033
		TabImg.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabImg.BorderSizePixel = 0
		TabImg.Position = UDim2.new(0, 4, 0.5, 0)
		TabImg.Size = UDim2.new(0, 19, 0, 19)
		TabImg.Name = "TabImg"
		TabImg.Parent = Tab1

		local LayersScroll = Instance.new("ScrollingFrame");
		local UIListLayout1 = Instance.new("UIListLayout");

		LayersScroll.CanvasSize = UDim2.new(0, 0, 3, 0)
		LayersScroll.ScrollBarThickness = 0
		LayersScroll.Active = true
		LayersScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LayersScroll.BackgroundTransparency = 0.9990000128746033
		LayersScroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LayersScroll.BorderSizePixel = 0
		LayersScroll.LayoutOrder = CountTab
		LayersScroll.Position = UDim2.new(-0.148514852, 0, -0.163157895, 0)
		LayersScroll.Size = UDim2.new(1, 0, 1, 0)
		LayersScroll.Name = "LayersScroll"
		LayersScroll.Parent = FolderTab
		local function UpdateCanvaSize2()
			local OffsetY = 0
			for _, child in pairs(LayersScroll:GetChildren()) do
				if child.Name ~= "UIListLayout" then
					OffsetY = OffsetY + 5 + child.Size.Y.Offset
				end
			end
			LayersScroll.CanvasSize = UDim2.new(0, 0, 0, OffsetY)
		end
		LayersScroll.ChildAdded:Connect(UpdateCanvaSize2)
		LayersScroll.ChildRemoved:Connect(UpdateCanvaSize2)

		UIListLayout1.Padding = UDim.new(0, 5)
		UIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout1.Parent = LayersScroll

		TextButton.MouseButton1Down:Connect(function()
			CircleClick(TextButton, Mouse.X, Mouse.Y) 
			for _, Tab in pairs(ScrollTab:GetChildren()) do
				if Tab.Name == "Tab1" then
					TweenService:Create(
						Tab,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{BackgroundColor3 = Color3.fromRGB(20.000000707805157, 20.000000707805157, 20.000000707805157)}
					):Play()
				end    
			end
			UIPageLayout:JumpToIndex(Tab1.LayoutOrder)
			TweenService:Create(
				Tab1,
				TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
				{BackgroundColor3 = Color3.fromRGB(32.00000189244747, 140.00000685453415, 255)}
			):Play()
		end)
		local Items = {}
		local CountItem = 0
		function Items:AddSeperator(SeperatorContent)
			local SeperatorContent = SeperatorContent or "Seperator"
			local SeperatorFunc = {}
			local Seperator = Instance.new("TextLabel");

			Seperator.Font = Enum.Font.GothamBold
			Seperator.Text = tostring(SeperatorContent)
			Seperator.TextColor3 = Color3.fromRGB(230.00000149011612, 230.00000149011612, 230.00000149011612)
			Seperator.TextSize = 15
			Seperator.TextXAlignment = Enum.TextXAlignment.Left
			Seperator.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Seperator.BackgroundTransparency = 0.9990000128746033
			Seperator.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Seperator.BorderSizePixel = 0
			Seperator.Size = UDim2.new(0, 200, 0, 18)
			Seperator.Name = "Seperator"
			Seperator.Parent = LayersScroll
			Seperator.LayoutOrder = CountItem

			CountItem = CountItem + 1
			return SeperatorFunc
		end
		function Items:AddParagraph(ParagraphConfig)
			local ParagraphConfig = ParagraphConfig or {}
			ParagraphConfig.Title = ParagraphConfig.Title or "Title"
			ParagraphConfig.Content = ParagraphConfig.Content or "Content"
			ParagraphConfig.Icon = ParagraphConfig.Icon or "rbxassetid://16520329204"
			local ParagraphFunc = {}

			local Paragraph = Instance.new("Frame");
			local UICorner22 = Instance.new("UICorner");
			local FeatureFrame5 = Instance.new("Frame");
			local FeatureImg2 = Instance.new("ImageLabel");
			local UICorner23 = Instance.new("UICorner");
			local UICorner24 = Instance.new("UICorner");
			local Title5 = Instance.new("TextLabel");
			local Content1 = Instance.new("TextLabel");

			Paragraph.BackgroundColor3 = Color3.fromRGB(20.000000707805157, 20.000000707805157, 20.000000707805157)
			Paragraph.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Paragraph.BorderSizePixel = 0
			Paragraph.Size = UDim2.new(1, 0, 0, 55)
			Paragraph.Name = "Paragraph"
			Paragraph.Parent = LayersScroll
			Paragraph.LayoutOrder = CountItem
			UICorner22.CornerRadius = UDim.new(0, 2)
			UICorner22.Parent = Paragraph

			FeatureFrame5.AnchorPoint = Vector2.new(1, 0)
			FeatureFrame5.BackgroundColor3 = Color3.fromRGB(2.000000118277967, 2.000000118277967, 2.000000118277967)
			FeatureFrame5.BorderColor3 = Color3.fromRGB(0, 0, 0)
			FeatureFrame5.BorderSizePixel = 0
			FeatureFrame5.Position = UDim2.new(1, -12, 0, 15)
			FeatureFrame5.Size = UDim2.new(0, 25, 0, 25)
			FeatureFrame5.Name = "FeatureFrame"
			FeatureFrame5.Parent = Paragraph

			FeatureImg2.Image = tostring(ParagraphConfig.Icon)
			FeatureImg2.ImageColor3 = Color3.fromRGB(32.00000189244747, 140.00000685453415, 255)
			FeatureImg2.AnchorPoint = Vector2.new(0.5, 0.5)
			FeatureImg2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			FeatureImg2.BackgroundTransparency = 0.9990000128746033
			FeatureImg2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			FeatureImg2.BorderSizePixel = 0
			FeatureImg2.Position = UDim2.new(0.5, 0, 0.5, 0)
			FeatureImg2.Size = UDim2.new(1, 0, 1, 0)
			FeatureImg2.Name = "FeatureImg"
			FeatureImg2.Parent = FeatureFrame5

			UICorner23.CornerRadius = UDim.new(0, 2)
			UICorner23.Parent = FeatureImg2

			UICorner24.CornerRadius = UDim.new(0, 2)
			UICorner24.Parent = FeatureFrame5

			Title5.Font = Enum.Font.GothamBold
			Title5.Text = tostring(ParagraphConfig.Title)
			Title5.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title5.TextSize = 14
			Title5.TextXAlignment = Enum.TextXAlignment.Left
			Title5.TextYAlignment = Enum.TextYAlignment.Top
			Title5.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Title5.BackgroundTransparency = 0.9990000128746033
			Title5.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title5.BorderSizePixel = 0
			Title5.Position = UDim2.new(0, 6, 0, 6)
			Title5.Size = UDim2.new(1, -45, 0, 16)
			Title5.Name = "Title"
			Title5.Parent = Paragraph

			Content1.Font = Enum.Font.GothamBold
			Content1.Text = tostring(ParagraphConfig.Content)
			Content1.TextColor3 = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
			Content1.TextSize = 12
			Content1.TextWrapped = true
			Content1.TextXAlignment = Enum.TextXAlignment.Left
			Content1.TextYAlignment = Enum.TextYAlignment.Bottom
			Content1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Content1.BackgroundTransparency = 0.9990000128746033
			Content1.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Content1.BorderSizePixel = 0
			Content1.Position = UDim2.new(0, 6, 0, 22)
			Content1.Size = UDim2.new(1, -45, 0, 26)
			Content1.Name = "Content"
			Content1.Parent = Paragraph

			function ParagraphFunc:Set(ParagraphSetConfig)
				local ParagraphSetConfig = ParagraphSetConfig or {}
				ParagraphSetConfig.Title = ParagraphSetConfig.Title or "Title"
				ParagraphSetConfig.Content = ParagraphSetConfig.Content or "Content"

				Title5.Text = tostring(ParagraphConfig.Title)
				Content1.Text = tostring(ParagraphConfig.Content)
			end
			ParagraphFunc:Set(ParagraphConfig)
			CountItem = CountItem + 1
			return ParagraphFunc
		end
		function Items:AddToggle(ToggleConfig)
			local ToggleConfig = ToggleConfig or {}
			ToggleConfig.Title = ToggleConfig.Title or "Title"
			ToggleConfig.Content = ToggleConfig.Content or "Content"
			ToggleConfig.Default = ToggleConfig.Default or false
			ToggleConfig.Callback = ToggleConfig.Callback or function() end
			local ToggleFunc = {Value = ToggleConfig.Default}

			local Toggle = Instance.new("Frame");
			local UICorner8 = Instance.new("UICorner");
			local TextButton3 = Instance.new("TextButton");
			local FeatureFrame1 = Instance.new("Frame");
			local ImageLabel2 = Instance.new("ImageLabel");
			local UICorner9 = Instance.new("UICorner");
			local Title1 = Instance.new("TextLabel");
			local Describe1 = Instance.new("TextLabel");

			Toggle.BackgroundColor3 = Color3.fromRGB(20.000000707805157, 20.000000707805157, 20.000000707805157)
			Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.BorderSizePixel = 0
			Toggle.LayoutOrder = CountItem
			Toggle.Size = UDim2.new(1, 0, 0, 55)
			Toggle.Name = "Toggle"
			Toggle.Parent = LayersScroll

			UICorner8.CornerRadius = UDim.new(0, 2)
			UICorner8.Parent = Toggle

			TextButton3.Font = Enum.Font.GothamBold
			TextButton3.Text = ""
			TextButton3.TextColor3 = Color3.fromRGB(230.00000149011612, 230.00000149011612, 230.00000149011612)
			TextButton3.TextSize = 13
			TextButton3.TextXAlignment = Enum.TextXAlignment.Left
			TextButton3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			TextButton3.BackgroundTransparency = 0.9990000128746033
			TextButton3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton3.BorderSizePixel = 0
			TextButton3.Size = UDim2.new(1, 0, 1, 0)
			TextButton3.Parent = Toggle

			FeatureFrame1.AnchorPoint = Vector2.new(1, 0)
			FeatureFrame1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			FeatureFrame1.BorderColor3 = Color3.fromRGB(0, 0, 0)
			FeatureFrame1.BorderSizePixel = 0
			FeatureFrame1.Position = UDim2.new(1, -12, 0, 15)
			FeatureFrame1.Size = UDim2.new(0, 25, 0, 25)
			FeatureFrame1.Name = "FeatureFrame"
			FeatureFrame1.Parent = Toggle

			ImageLabel2.Image = "rbxassetid://16435649909"
			ImageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
			ImageLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageLabel2.BackgroundTransparency = 0.9990000128746033
			ImageLabel2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageLabel2.BorderSizePixel = 0
			ImageLabel2.Position = UDim2.new(0.5, 0, 0.5, 0)
			ImageLabel2.Parent = FeatureFrame1
			UICorner9.CornerRadius = UDim.new(0, 2)
			UICorner9.Parent = FeatureFrame1

			Title1.Font = Enum.Font.GothamBold
			Title1.Text = tostring(ToggleConfig.Title)
			Title1.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title1.TextSize = 14
			Title1.TextXAlignment = Enum.TextXAlignment.Left
			Title1.TextYAlignment = Enum.TextYAlignment.Top
			Title1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Title1.BackgroundTransparency = 0.9990000128746033
			Title1.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title1.BorderSizePixel = 0
			Title1.Position = UDim2.new(0, 6, 0, 6)
			Title1.Size = UDim2.new(1, -45, 0, 16)
			Title1.Name = "Title"
			Title1.Parent = Toggle

			Describe1.Font = Enum.Font.GothamBold
			Describe1.Text = tostring(ToggleConfig.Content)
			Describe1.TextColor3 = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
			Describe1.TextSize = 12
			Describe1.TextWrapped = true
			Describe1.TextXAlignment = Enum.TextXAlignment.Left
			Describe1.TextYAlignment = Enum.TextYAlignment.Bottom
			Describe1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Describe1.BackgroundTransparency = 0.9990000128746033
			Describe1.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Describe1.BorderSizePixel = 0
			Describe1.Position = UDim2.new(0, 6, 0, 22)
			Describe1.Size = UDim2.new(1, -45, 0, 26)
			Describe1.Name = "Describe"
			Describe1.Parent = Toggle

			TextButton3.MouseButton1Down:Connect(function()
				CircleClick(TextButton3, Mouse.X, Mouse.Y) 
				ToggleFunc.Value = not ToggleFunc.Value
				ToggleFunc:Set(ToggleFunc.Value)
			end)
			function ToggleFunc:Set(Value)
				ToggleConfig.Callback(Value)
				if Value then
					TweenService:Create(
						ImageLabel2,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{Size = UDim2.new(1, 4, 1, 4)}
					):Play()
				else
					TweenService:Create(
						ImageLabel2,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{Size = UDim2.new(0, 0, 0, 0)}
					):Play()
				end
			end
			ToggleFunc:Set(ToggleConfig.Default)
			CountItem = CountItem + 1
			return ToggleFunc
		end
		function Items:AddDropdown(DropdownConfig)
			local DropdownConfig = DropdownConfig or {}
			DropdownConfig.Title = DropdownConfig.Title or "Dropdown"
			DropdownConfig.Multi = DropdownConfig.Multi or false
			DropdownConfig.Options = DropdownConfig.Options or {}
			DropdownConfig.Default = DropdownConfig.Default or ""
			DropdownConfig.Callback = DropdownConfig.Callback or function() end
			local DropdownFunc = {Value = DropdownConfig.Default, Options = DropdownConfig.Options}

			local Dropdown = Instance.new("Frame");
			local UICorner10 = Instance.new("UICorner");
			local TopDrop = Instance.new("Frame");
			local UICorner11 = Instance.new("UICorner");
			local TextButton4 = Instance.new("TextButton");
			local FeatureFrame2 = Instance.new("Frame");
			local FeatureImg = Instance.new("ImageLabel");
			local UICorner12 = Instance.new("UICorner");
			local TextFrame = Instance.new("Frame");
			local UICorner13 = Instance.new("UICorner");
			local Selecting = Instance.new("TextLabel");
			local Title2 = Instance.new("TextLabel");
			local UIListLayout2 = Instance.new("UIListLayout");
			local UnderDrop = Instance.new("Frame");
			local UICorner14 = Instance.new("UICorner");
			local ScrollingFrame = Instance.new("ScrollingFrame");
			local UIListLayout3 = Instance.new("UIListLayout");

			Dropdown.BackgroundColor3 = Color3.fromRGB(20.000000707805157, 20.000000707805157, 20.000000707805157)
			Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Dropdown.BorderSizePixel = 0
			Dropdown.LayoutOrder = CountItem
			Dropdown.Size = UDim2.new(1, 0, 0, 55)
			Dropdown.Name = "Dropdown"
			Dropdown.Parent = LayersScroll
		
			UICorner10.CornerRadius = UDim.new(0, 2)
			UICorner10.Parent = Dropdown
		
			TopDrop.BackgroundColor3 = Color3.fromRGB(20.000000707805157, 20.000000707805157, 20.000000707805157)
			TopDrop.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TopDrop.BorderSizePixel = 0
			TopDrop.LayoutOrder = 1
			TopDrop.Size = UDim2.new(1, 0, 0, 55)
			TopDrop.Name = "TopDrop"
			TopDrop.Parent = Dropdown
		
			UICorner11.CornerRadius = UDim.new(0, 2)
			UICorner11.Parent = TopDrop
		
			TextButton4.Font = Enum.Font.GothamBold
			TextButton4.Text = ""
			TextButton4.TextColor3 = Color3.fromRGB(230.00000149011612, 230.00000149011612, 230.00000149011612)
			TextButton4.TextSize = 13
			TextButton4.TextXAlignment = Enum.TextXAlignment.Left
			TextButton4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			TextButton4.BackgroundTransparency = 0.9990000128746033
			TextButton4.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton4.BorderSizePixel = 0
			TextButton4.Size = UDim2.new(1, 0, 1, 0)
			TextButton4.Parent = TopDrop
		
			FeatureFrame2.AnchorPoint = Vector2.new(1, 0)
			FeatureFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			FeatureFrame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			FeatureFrame2.BorderSizePixel = 0
			FeatureFrame2.Position = UDim2.new(1, -12, 0, 15)
			FeatureFrame2.Size = UDim2.new(0, 25, 0, 25)
			FeatureFrame2.Name = "FeatureFrame"
			FeatureFrame2.Parent = TopDrop
		
			FeatureImg.Image = "rbxassetid://16425489566"
			FeatureImg.ImageColor3 = Color3.fromRGB(0, 0, 0)
			FeatureImg.AnchorPoint = Vector2.new(0.5, 0.5)
			FeatureImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			FeatureImg.BackgroundTransparency = 0.9990000128746033
			FeatureImg.BorderColor3 = Color3.fromRGB(0, 0, 0)
			FeatureImg.BorderSizePixel = 0
			FeatureImg.Position = UDim2.new(0.5, 0, 0.5, 0)
			FeatureImg.Size = UDim2.new(1, 12, 1, 12)
			FeatureImg.Name = "FeatureImg"
			FeatureImg.Parent = FeatureFrame2
		
			UICorner12.Parent = FeatureFrame2
		
			TextFrame.BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871)
			TextFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextFrame.BorderSizePixel = 0
			TextFrame.Position = UDim2.new(0, 6, 0, 22)
			TextFrame.Size = UDim2.new(1, -50, 0, 26)
			TextFrame.Name = "TextFrame"
			TextFrame.Parent = TopDrop
		
			UICorner13.CornerRadius = UDim.new(0, 2)
			UICorner13.Parent = TextFrame
		
			Selecting.Font = Enum.Font.GothamBold
			if DropdownConfig.Multi then
				Selecting.Text = tostring(unpack(DropdownFunc.Value))
			else
				Selecting.Text = tostring(DropdownFunc.Value)
			end
			Selecting.TextColor3 = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
			Selecting.TextSize = 12
			Selecting.TextWrapped = true
			Selecting.TextXAlignment = Enum.TextXAlignment.Left
			Selecting.AnchorPoint = Vector2.new(0.5, 0.5)
			Selecting.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Selecting.BackgroundTransparency = 0.9990000128746033
			Selecting.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Selecting.BorderSizePixel = 0
			Selecting.Position = UDim2.new(0.5, 0, 0.5, 0)
			Selecting.Size = UDim2.new(1, -8, 1, -8)
			Selecting.Name = "Selecting"
			Selecting.Parent = TextFrame
		
			Title2.Font = Enum.Font.GothamBold
			Title2.Text = tostring(DropdownConfig.Title)
			Title2.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title2.TextSize = 14
			Title2.TextXAlignment = Enum.TextXAlignment.Left
			Title2.TextYAlignment = Enum.TextYAlignment.Top
			Title2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Title2.BackgroundTransparency = 0.9990000128746033
			Title2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title2.BorderSizePixel = 0
			Title2.Position = UDim2.new(0, 6, 0, 6)
			Title2.Size = UDim2.new(1, -45, 0, 16)
			Title2.Name = "Title"
			Title2.Parent = TopDrop
		
			UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout2.Parent = Dropdown
		
			UnderDrop.BackgroundColor3 = Color3.fromRGB(20.000000707805157, 20.000000707805157, 20.000000707805157)
			UnderDrop.BorderColor3 = Color3.fromRGB(0, 0, 0)
			UnderDrop.BorderSizePixel = 0
			UnderDrop.LayoutOrder = 2
			UnderDrop.Size = UDim2.new(1, 0, 0, 55)
			UnderDrop.Visible = false
			UnderDrop.Name = "UnderDrop"
			UnderDrop.Parent = Dropdown
		
			UICorner14.CornerRadius = UDim.new(0, 2)
			UICorner14.Parent = UnderDrop
		
			ScrollingFrame.ScrollBarThickness = 0
			ScrollingFrame.Active = true
			ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ScrollingFrame.BackgroundTransparency = 0.9990000128746033
			ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ScrollingFrame.BorderSizePixel = 0
			ScrollingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
			ScrollingFrame.Size = UDim2.new(1, -12, 1, 0)
			ScrollingFrame.Parent = UnderDrop
			local function UpdateCanvaSize3()
				local OffsetY = 0
				for _, child in pairs(ScrollingFrame:GetChildren()) do
					if child.Name ~= "UIListLayout" then
						OffsetY = OffsetY + 3 + child.Size.Y.Offset
					end
				end
				ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, OffsetY)
			end
			ScrollingFrame.ChildAdded:Connect(UpdateCanvaSize3)
			ScrollingFrame.ChildRemoved:Connect(UpdateCanvaSize3)
	
			UIListLayout3.Padding = UDim.new(0, 1)
			UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout3.Parent = ScrollingFrame

			local DropCount = 0
			local Open = false

			TextButton4.MouseButton1Down:Connect(function()
				CircleClick(TextButton4, Mouse.X, Mouse.Y) 
				if Open == false then
					Open = true
					TweenService:Create(
						Dropdown,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{Size = UDim2.new(1, 0, 0, 110)}
					):Play()
					TweenService:Create(
						Dropdown.TopDrop.FeatureFrame.FeatureImg,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{ImageColor3 = Color3.fromRGB(32, 140, 255)}
					):Play()
					task.wait(0.2)
					Dropdown.UnderDrop.Visible = true
				else
					Open = false
					TweenService:Create(
						Dropdown,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{Size = UDim2.new(1, 0, 0, 55)}
					):Play()
					TweenService:Create(
						Dropdown.TopDrop.FeatureFrame.FeatureImg,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{ImageColor3 = Color3.fromRGB(0, 0, 0)}
					):Play()
					Dropdown.UnderDrop.Visible = false
				end
				task.wait(0.3)
				UpdateCanvaSize2()
			end)
			function DropdownFunc:Clear()
				for _, DropFrame in pairs(Dropdown.UnderDrop.ScrollingFrame:GetChildren()) do
					if DropFrame.Name == "Frame" then
						if DropdownConfig.Multi then
							DropdownFunc.Value = {}
						else
							DropdownFunc.Value = ""
						end
						Selecting.Text = "Select Options"
						DropdownFunc.Options = {}
						DropFrame:Destroy()
					end
				end
			end
			function DropdownFunc:Set(Value)
				if DropdownConfig.Multi then
					DropdownFunc.Value = {}
					for _, Drop in pairs(Dropdown.UnderDrop.ScrollingFrame:GetChildren()) do
						for _, Drop2 in pairs(Drop:GetChildren()) do 
							if Drop2.Name == "Text Button" and table.find(Value, Drop2.Text) then
								TweenService:Create(
									Drop2,
									TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
									{TextColor3 = Color3.fromRGB(230.00000149011612, 230.00000149011612, 230.00000149011612)}
								):Play()
								table.insert(DropdownFunc.Value, Drop2.Text)
							elseif Drop2.Name == "Text Button" and not table.find(Value, Drop2.Text) then
								TweenService:Create(
									Drop2,
									TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
									{TextColor3 = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)}
								):Play()
							end
						end
					end
					local DropdownValueTable = table.concat(DropdownFunc.Value, ", ")
					if DropdownValueTable == "" then
						Selecting.Text = "Select Options"
					else
						Selecting.Text = tostring(DropdownValueTable)
					end
					DropdownConfig.Callback(DropdownFunc.Value)
				else
					local CountDrop = 0
					for _, Drop in pairs(Dropdown.UnderDrop.ScrollingFrame:GetChildren()) do
						for _, Drop2 in pairs(Drop:GetChildren()) do 
							if Drop2.Name == "Text Button" and Drop2.Text == tostring(Value) then
								if CountDrop == 0 then
									TweenService:Create(
										Drop2,
										TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
										{TextColor3 = Color3.fromRGB(230.00000149011612, 230.00000149011612, 230.00000149011612)}
									):Play()
									DropdownFunc.Value = Drop2.Text
									CountDrop = CountDrop + 1
								end
							elseif Drop2.Name == "Text Button" and not (Drop2.Text == tostring(Value)) then
								TweenService:Create(
									Drop2,
									TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
									{TextColor3 = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)}
								):Play()
							end
						end
					end
					Selecting.Text = tostring(DropdownFunc.Value)
					DropdownConfig.Callback(DropdownFunc.Value)
				end
			end
			function DropdownFunc:AddOption(OptionName)
				local Frame1 = Instance.new("Frame");
				local UICorner16 = Instance.new("UICorner");
				local TextButton6 = Instance.new("TextButton");

				Frame1.BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871)
				Frame1.BackgroundTransparency = 0.9990000128746033
				Frame1.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Frame1.BorderSizePixel = 0
				Frame1.LayoutOrder = DropCount
				Frame1.Name = "Frame"
				Frame1.Size = UDim2.new(1, 0, 0, 25)
				Frame1.Parent = ScrollingFrame
			
				UICorner16.CornerRadius = UDim.new(0, 2)
				UICorner16.Parent = Frame1

				TextButton6.Font = Enum.Font.GothamBold
				TextButton6.Text = OptionName
				TextButton6.Name = "Text Button"
				TextButton6.TextColor3 = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
				TextButton6.TextSize = 12
				TextButton6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton6.BackgroundTransparency = 0.9990000128746033
				TextButton6.BorderColor3 = Color3.fromRGB(0, 0, 0)
				TextButton6.BorderSizePixel = 0
				TextButton6.Size = UDim2.new(1, 0, 1, 0)
				TextButton6.Parent = Frame1
				TextButton6.MouseButton1Down:Connect(function()
					CircleClick(TextButton6, Mouse.X, Mouse.Y) 
					if DropdownConfig.Multi then
						if TextButton6.TextColor3 == Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773) then
							table.insert(DropdownFunc.Value, OptionName)
							DropdownFunc:Set(DropdownFunc.Value)
						else
							for i, value in pairs(DropdownFunc.Value) do
								if value == OptionName then
									table.remove(DropdownFunc.Value, i)
									break
								end
							end
							DropdownFunc:Set(DropdownFunc.Value)
						end
					else
						DropdownFunc.Value = tostring(OptionName)
						DropdownFunc:Set(DropdownFunc.Value)
					end
				end)
				DropCount = DropCount + 1
			end
			function DropdownFunc:Refresh(RefreshList, OptionSelecting)
				DropdownFunc:Clear()
				for _, Drop in pairs(RefreshList) do
					DropdownFunc:AddOption(Drop)
					task.wait(0.1)
				end
				DropdownFunc:Set(OptionSelecting)
			end
			DropdownFunc:Refresh(DropdownConfig.Options, DropdownConfig.Default)
			CountItem = CountItem + 1
			return DropdownFunc
		end
		function Items:AddSlider(SliderConfig)
			local SliderConfig = SliderConfig or {}
			SliderConfig.Title = SliderConfig.Title or "Slider"
			SliderConfig.Increment = SliderConfig.Increment or 1
			SliderConfig.Min = SliderConfig.Min or 0
			SliderConfig.Max = SliderConfig.Max or 100
			SliderConfig.Default = SliderConfig.Default or 50
			SliderConfig.ValueName = SliderConfig.ValueName or ""
			SliderConfig.Callback = SliderConfig.Callback or function() end
			local SliderFunc = {Value = SliderConfig.Default}

			local Slider = Instance.new("Frame");
			local FeatureFrame3 = Instance.new("Frame");
			local UICorner17 = Instance.new("UICorner");
			local SliderValue = Instance.new("TextBox");
			local Title3 = Instance.new("TextLabel");
			local MainSlider = Instance.new("Frame");
			local SliderDrag = Instance.new("Frame");
			local UICorner18 = Instance.new("UICorner");
			local SliderText = Instance.new("TextLabel");
			local UICorner19 = Instance.new("UICorner");

			Slider.BackgroundColor3 = Color3.fromRGB(20.000000707805157, 20.000000707805157, 20.000000707805157)
			Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Slider.BorderSizePixel = 0
			Slider.LayoutOrder = CountItem
			Slider.Size = UDim2.new(1, 0, 0, 55)
			Slider.Name = "Slider"
			Slider.Parent = LayersScroll

			FeatureFrame3.AnchorPoint = Vector2.new(1, 0)
			FeatureFrame3.BackgroundColor3 = Color3.fromRGB(32.00000189244747, 140.00000685453415, 255)
			FeatureFrame3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			FeatureFrame3.BorderSizePixel = 0
			FeatureFrame3.Position = UDim2.new(1, -10, 0, 15)
			FeatureFrame3.Size = UDim2.new(0, 28, 0, 25)
			FeatureFrame3.Name = "FeatureFrame"
			FeatureFrame3.ClipsDescendants = true
			FeatureFrame3.Parent = Slider

			UICorner17.CornerRadius = UDim.new(0, 2)
			UICorner17.Parent = FeatureFrame3

			SliderValue.Font = Enum.Font.GothamBold
			SliderValue.Text = tonumber(SliderConfig.Default)
			SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderValue.TextSize = 13
			SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderValue.BackgroundTransparency = 0.9990000128746033
			SliderValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderValue.BorderSizePixel = 0
			SliderValue.Size = UDim2.new(1, 0, 1, 0)
			SliderValue.Name = "SliderValue"
			SliderValue.Parent = FeatureFrame3

			Title3.Font = Enum.Font.GothamBold
			Title3.Text = tostring(SliderConfig.Title)
			Title3.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title3.TextSize = 14
			Title3.TextXAlignment = Enum.TextXAlignment.Left
			Title3.TextYAlignment = Enum.TextYAlignment.Top
			Title3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Title3.BackgroundTransparency = 0.9990000128746033
			Title3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title3.BorderSizePixel = 0
			Title3.Position = UDim2.new(0, 6, 0, 6)
			Title3.Size = UDim2.new(1, -45, 0, 16)
			Title3.Name = "Title"
			Title3.Parent = Slider

			MainSlider.BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871)
			MainSlider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			MainSlider.BorderSizePixel = 0
			MainSlider.Position = UDim2.new(0, 6, 0, 22)
			MainSlider.Size = UDim2.new(1, -50, 0, 26)
			MainSlider.Name = "MainSlider"
			MainSlider.Parent = Slider

			SliderDrag.BackgroundColor3 = Color3.fromRGB(40.00000141561031, 40.00000141561031, 40.00000141561031)
			SliderDrag.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderDrag.BorderSizePixel = 0
			SliderDrag.Position = UDim2.new(8.03094167e-07, 0, 0, 0)
			SliderDrag.Size = UDim2.new(0.899999976, 0, 1, 0)
			SliderDrag.Name = "SliderDrag"
			SliderDrag.Parent = MainSlider

			UICorner18.CornerRadius = UDim.new(0, 2)
			UICorner18.Parent = SliderDrag

			SliderText.Font = Enum.Font.GothamBold
			SliderText.Text = "  "..tostring(SliderConfig.ValueName)
			SliderText.TextColor3 = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
			SliderText.TextSize = 12
			SliderText.TextXAlignment = Enum.TextXAlignment.Left
			SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderText.BackgroundTransparency = 0.9990000128746033
			SliderText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderText.BorderSizePixel = 0
			SliderText.Size = UDim2.new(1, 0, 1, 0)
			SliderText.Name = "SliderText"
			SliderText.Parent = MainSlider

			UICorner19.CornerRadius = UDim.new(0, 2)
			UICorner19.Parent = MainSlider
			local Dragging = false
			local function Round(Number, Factor)
				local Result = math.floor(Number/Factor + (math.sign(Number) * 0.5)) * Factor
				if Result < 0 then Result = Result + Factor end
				return Result
			end
			function SliderFunc:Set(Value)
				Value = math.clamp(Round(Value, SliderConfig.Increment), SliderConfig.Min, SliderConfig.Max)
				SliderFunc.Value = Value
				SliderValue.Text = tostring(Value)
				TweenService:Create(
					SliderDrag,
					TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Size = UDim2.fromScale((Value - SliderConfig.Min) / (SliderConfig.Max - SliderConfig.Min), 1)}
				):Play()
			end
			MainSlider.InputBegan:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
					Dragging = true 
				end 
			end)
			MainSlider.InputEnded:Connect(function(Input) 
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
					Dragging = false 
					SliderConfig.Callback(SliderFunc.Value)
				end 
			end)
			UserInputService.InputChanged:Connect(function(Input)
				if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then 
					local SizeScale = math.clamp((Input.Position.X - MainSlider.AbsolutePosition.X) / MainSlider.AbsoluteSize.X, 0, 1)
					SliderFunc:Set(SliderConfig.Min + ((SliderConfig.Max - SliderConfig.Min) * SizeScale)) 
				end
			end)
			SliderValue:GetPropertyChangedSignal("Text"):Connect(function()
				local Valid = SliderValue.Text:gsub("[^%d]", "")
				if Valid ~= "" then
					local ValidNumber = math.min(tonumber(Valid), SliderConfig.Max)
					SliderValue.Text = tostring(ValidNumber)
				else
					SliderValue.Text = tostring(Valid)
				end
			end)
			SliderValue.FocusLost:Connect(function()
				if SliderValue.Text ~= "" then
					SliderFunc:Set(tonumber(SliderValue.Text))
				else
					SliderFunc:Set(0)
				end
			end)
			SliderFunc:Set(tonumber(SliderConfig.Default))
			CountItem = CountItem + 1
			return SliderFunc
		end
		function Items:AddInput(InputConfig)
			local InputFunc = {}
			local InputConfig = InputConfig or {}
			InputConfig.Title = InputConfig.Title or "Title"
			InputConfig.Icon = InputConfig.Icon or "rbxassetid://16532766392"
			InputConfig.Callback = InputConfig.Callback or function() end

			local Input = Instance.new("Frame");
			local UICorner25 = Instance.new("UICorner");
			local FeatureFrame6 = Instance.new("Frame");
			local FeatureImg3 = Instance.new("ImageLabel");
			local UICorner26 = Instance.new("UICorner");
			local InputFrame = Instance.new("Frame");
			local UICorner27 = Instance.new("UICorner");
			local InputBox = Instance.new("TextBox");
			local UICorner28 = Instance.new("UICorner");
			local Title6 = Instance.new("TextLabel");

			Input.BackgroundColor3 = Color3.fromRGB(20.000000707805157, 20.000000707805157, 20.000000707805157)
			Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Input.BorderSizePixel = 0
			Input.LayoutOrder = CountItem
			Input.Size = UDim2.new(1, 0, 0, 55)
			Input.Name = "Input"
			Input.Parent = LayersScroll

			UICorner25.CornerRadius = UDim.new(0, 2)
			UICorner25.Parent = Input

			FeatureFrame6.AnchorPoint = Vector2.new(1, 0)
			FeatureFrame6.BackgroundColor3 = Color3.fromRGB(32.00000189244747, 140.00000685453415, 255)
			FeatureFrame6.BorderColor3 = Color3.fromRGB(0, 0, 0)
			FeatureFrame6.BorderSizePixel = 0
			FeatureFrame6.Position = UDim2.new(1, -12, 0, 15)
			FeatureFrame6.Size = UDim2.new(0, 25, 0, 25)
			FeatureFrame6.Name = "FeatureFrame"
			FeatureFrame6.Parent = Input

			FeatureImg3.Image = tostring(InputConfig.Icon)
			FeatureImg3.AnchorPoint = Vector2.new(0.5, 0.5)
			FeatureImg3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			FeatureImg3.BackgroundTransparency = 0.9990000128746033
			FeatureImg3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			FeatureImg3.BorderSizePixel = 0
			FeatureImg3.Position = UDim2.new(0.5, 0, 0.5, 0)
			FeatureImg3.Size = UDim2.new(1, -5, 1, -5)
			FeatureImg3.Name = "FeatureImg"
			FeatureImg3.Parent = FeatureFrame6

			UICorner26.CornerRadius = UDim.new(0, 2)
			UICorner26.Parent = FeatureFrame6

			InputFrame.BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871)
			InputFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			InputFrame.BorderSizePixel = 0
			InputFrame.ClipsDescendants = true
			InputFrame.Position = UDim2.new(0, 6, 0, 22)
			InputFrame.Size = UDim2.new(1, -50, 0, 26)
			InputFrame.Name = "InputFrame"
			InputFrame.Parent = Input

			UICorner27.CornerRadius = UDim.new(0, 2)
			UICorner27.Parent = InputFrame

			InputBox.Font = Enum.Font.GothamBold
			InputBox.PlaceholderColor3 = Color3.fromRGB(80.00000283122063, 80.00000283122063, 80.00000283122063)
			InputBox.PlaceholderText = "Write your input here..."
			InputBox.Text = ""
			InputBox.TextColor3 = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
			InputBox.TextSize = 12
			InputBox.TextXAlignment = Enum.TextXAlignment.Left
			InputBox.AnchorPoint = Vector2.new(0, 0.5)
			InputBox.BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871)
			InputBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
			InputBox.BorderSizePixel = 0
			InputBox.Position = UDim2.new(0, 4, 0.5, 0)
			InputBox.Size = UDim2.new(1, -4, 1, 0)
			InputBox.Name = "InputBox"
			InputBox.Parent = InputFrame

			UICorner28.CornerRadius = UDim.new(0, 2)
			UICorner28.Parent = InputBox

			Title6.Font = Enum.Font.GothamBold
			Title6.Text = tostring(InputConfig.Title)
			Title6.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title6.TextSize = 14
			Title6.TextXAlignment = Enum.TextXAlignment.Left
			Title6.TextYAlignment = Enum.TextYAlignment.Top
			Title6.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Title6.BackgroundTransparency = 0.9990000128746033
			Title6.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title6.BorderSizePixel = 0
			Title6.Position = UDim2.new(0, 6, 0, 6)
			Title6.Size = UDim2.new(1, -45, 0, 16)
			Title6.Name = "Title"
			Title6.Parent = Input
			function InputFunc:Set(Value)
				InputBox.Text = Value
			end
			local Inputting = false
			InputBox:GetPropertyChangedSignal("Text"):Connect(function()
				if Inputting then
					InputBox.Size = UDim2.new(1, -(InputBox.TextBounds.X + 4), 1, 0)
				end
			end)
			InputBox.Focused:Connect(function()
				Inputting = true
			end)
			InputBox.FocusLost:Connect(function()
				Inputting = false
				InputBox.Size = UDim2.new(1, 4, 1, 0)
				InputConfig.Callback(InputBox.Text)
			end)
			CountItem = CountItem + 1
			return InputFunc
		end
		function Items:AddButton(ButtonConfig)
			local ButtonFunc = {}
			local ButtonConfig = ButtonConfig or {}
			ButtonConfig.Title = ButtonConfig.Title or "Title"
			ButtonConfig.Content = ButtonConfig.Content or "Content"
			ButtonConfig.Icon = ButtonConfig.Icon or "rbxassetid://16520422220"
			ButtonConfig.Callback = ButtonConfig.Callback or function() end
			
			local Button = Instance.new("Frame");
			local UICorner20 = Instance.new("UICorner");
			local FeatureFrame4 = Instance.new("Frame");
			local FeatureImg1 = Instance.new("ImageLabel");
			local UICorner21 = Instance.new("UICorner");
			local Title4 = Instance.new("TextLabel");
			local Content = Instance.new("TextLabel");
			local TextButton7 = Instance.new("TextButton");

			Button.BackgroundColor3 = Color3.fromRGB(20.000000707805157, 20.000000707805157, 20.000000707805157)
			Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.LayoutOrder = CountItem
			Button.Size = UDim2.new(1, 0, 0, 55)
			Button.Name = "Button"
			Button.Parent = LayersScroll
		
			UICorner20.CornerRadius = UDim.new(0, 2)
			UICorner20.Parent = Button
		
			FeatureFrame4.AnchorPoint = Vector2.new(1, 0)
			FeatureFrame4.BackgroundColor3 = Color3.fromRGB(32.00000189244747, 140.00000685453415, 255)
			FeatureFrame4.BorderColor3 = Color3.fromRGB(0, 0, 0)
			FeatureFrame4.BorderSizePixel = 0
			FeatureFrame4.Position = UDim2.new(1, -12, 0, 15)
			FeatureFrame4.Size = UDim2.new(0, 25, 0, 25)
			FeatureFrame4.Name = "FeatureFrame"
			FeatureFrame4.Parent = Button
		
			FeatureImg1.Image = "rbxassetid://16520422220"
			FeatureImg1.AnchorPoint = Vector2.new(0.5, 0.5)
			FeatureImg1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			FeatureImg1.BackgroundTransparency = 0.9990000128746033
			FeatureImg1.BorderColor3 = Color3.fromRGB(0, 0, 0)
			FeatureImg1.BorderSizePixel = 0
			FeatureImg1.Position = UDim2.new(0.5, 0, 0.5, 0)
			FeatureImg1.Size = UDim2.new(1, -5, 1, -5)
			FeatureImg1.Name = "FeatureImg"
			FeatureImg1.Parent = FeatureFrame4
		
			UICorner21.CornerRadius = UDim.new(0, 2)
			UICorner21.Parent = FeatureFrame4
		
			Title4.Font = Enum.Font.GothamBold
			Title4.Text = tostring(ButtonConfig.Title)
			Title4.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title4.TextSize = 14
			Title4.TextXAlignment = Enum.TextXAlignment.Left
			Title4.TextYAlignment = Enum.TextYAlignment.Top
			Title4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Title4.BackgroundTransparency = 0.9990000128746033
			Title4.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title4.BorderSizePixel = 0
			Title4.Position = UDim2.new(0, 6, 0, 6)
			Title4.Size = UDim2.new(1, -45, 0, 16)
			Title4.Name = "Title"
			Title4.Parent = Button
		
			Content.Font = Enum.Font.GothamBold
			Content.Text = tostring(ButtonConfig.Content)
			Content.TextColor3 = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
			Content.TextSize = 12
			Content.TextWrapped = true
			Content.TextXAlignment = Enum.TextXAlignment.Left
			Content.TextYAlignment = Enum.TextYAlignment.Bottom
			Content.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			Content.BackgroundTransparency = 0.9990000128746033
			Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Content.BorderSizePixel = 0
			Content.Position = UDim2.new(0, 6, 0, 22)
			Content.Size = UDim2.new(1, -45, 0, 26)
			Content.Name = "Content"
			Content.Parent = Button
		
			TextButton7.Font = Enum.Font.GothamBold
			TextButton7.Text = ""
			TextButton7.TextColor3 = Color3.fromRGB(230.00000149011612, 230.00000149011612, 230.00000149011612)
			TextButton7.TextSize = 13
			TextButton7.TextXAlignment = Enum.TextXAlignment.Left
			TextButton7.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			TextButton7.BackgroundTransparency = 0.9990000128746033
			TextButton7.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton7.BorderSizePixel = 0
			TextButton7.Size = UDim2.new(1, 0, 1, 0)
			TextButton7.Parent = Button
			TextButton7.MouseButton1Down:Connect(function()
				CircleClick(TextButton7, Mouse.X, Mouse.Y) 
				ButtonConfig.Callback()
			end)
			CountItem = CountItem + 1
			return ButtonFunc
		end
		CountTab = CountTab + 1
		return Items
	end
	return Tabs
end
return RimusLib