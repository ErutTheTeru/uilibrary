getgenv().readdata = function(foldername, filename, tabs)
end
getgenv().save = function(foldername, filename, filecontent)
end
getgenv().loadsetting = function(foldername, filename, tabs)
end
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local CoreGui = game:GetService("CoreGui")
local function MakeDraggable(topbarobject, object)
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
	local function CustomSize(object)
		local Dragging = false
		local DragInput = nil
		local DragStart = nil
		local StartSize = nil
		local maxSizeX = object.Size.X.Offset
		local maxSizeY = object.Size.Y.Offset
		object.Size = UDim2.new(0, maxSizeX, 0, maxSizeY)
		local changesizeobject = Instance.new("Frame");

		changesizeobject.AnchorPoint = Vector2.new(1, 1)
		changesizeobject.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		changesizeobject.BackgroundTransparency = 0.9990000128746033
		changesizeobject.BorderColor3 = Color3.fromRGB(0, 0, 0)
		changesizeobject.BorderSizePixel = 0
		changesizeobject.Position = UDim2.new(1, 20, 1, 20)
		changesizeobject.Size = UDim2.new(0, 40, 0, 40)
		changesizeobject.Name = "changesizeobject"
		changesizeobject.Parent = object

		local function UpdateSize(input)
			local Delta = input.Position - DragStart
			local newWidth = StartSize.X.Offset + Delta.X
			local newHeight = StartSize.Y.Offset + Delta.Y
			newWidth = math.max(newWidth, maxSizeX)
			newHeight = math.max(newHeight, maxSizeY)
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
	CustomSize(object)
	CustomPos(topbarobject, object)
end
local WazureV1 = {}
function WazureV1:Notify(NotifyConfig)
	local NotifyConfig = NotifyConfig or {}
	NotifyConfig.Title = NotifyConfig.Title or "Alert"
	NotifyConfig.Content = NotifyConfig.Content or "Content"
	NotifyConfig.Logo = NotifyConfig.Logo or "rbxassetid://18289959127"
	NotifyConfig.Time = NotifyConfig.Time or 0.5
	NotifyConfig.Delay = NotifyConfig.Delay or 5
	local NotifyFunc = {}
	spawn(function()
		if not CoreGui:FindFirstChild("NotifyGui") then
			local NotifyGui = Instance.new("ScreenGui");
			NotifyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			NotifyGui.Name = "NotifyGui"
			NotifyGui.Parent = CoreGui
		end
		if not CoreGui.NotifyGui:FindFirstChild("NotifyLayout") then
			local NotifyLayout = Instance.new("Frame");
			NotifyLayout.AnchorPoint = Vector2.new(1, 0)
			NotifyLayout.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			NotifyLayout.BackgroundTransparency = 0.9998999834060669
			NotifyLayout.BorderColor3 = Color3.fromRGB(0, 0, 0)
			NotifyLayout.BorderSizePixel = 0
			NotifyLayout.Position = UDim2.new(1, -10, 0, 10)
			NotifyLayout.Size = UDim2.new(0, 260, 1, -20)
			NotifyLayout.Name = "NotifyLayout"
			NotifyLayout.Parent = CoreGui.NotifyGui	
			local Count = 0
			local Count2 = 0
			CoreGui.NotifyGui.NotifyLayout.ChildRemoved:Connect(function()
				Count = 0
				for i, v in CoreGui.NotifyGui.NotifyLayout:GetChildren() do
					TweenService:Create(
						v,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{Position = UDim2.new(0, 0, 0, (v.Size.Y.Offset + 12)*Count)}
					):Play()
					Count = Count + 1
				end
			end)
			CoreGui.NotifyGui.NotifyLayout.ChildAdded:Connect(function(child)
				Count2 = 1
				for i, v in CoreGui.NotifyGui.NotifyLayout:GetChildren() do
					if v ~= child then
						TweenService:Create(
							v,
							TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
							{Position = UDim2.new(0, 0, 0, (v.Size.Y.Offset + 12)*Count2)}
						):Play()
						Count2 = Count2 + 1
					end
				end
			end)
		end
		local NotifyFrame = Instance.new("Frame");
		local NotifyFrameReal = Instance.new("Frame");
		local UICorner = Instance.new("UICorner");
		local DropShadowHolder = Instance.new("Frame");
		local DropShadow = Instance.new("ImageLabel");
		local NotifyLogo = Instance.new("ImageLabel");
		local UICorner1 = Instance.new("UICorner");
		local NotifyTitle = Instance.new("TextLabel");
		local NotifyContent = Instance.new("TextLabel");
		local UIStroke = Instance.new("UIStroke");
		local AlertImage = Instance.new("ImageLabel");
	
		NotifyFrame.BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871)
		NotifyFrame.BackgroundTransparency = 0.999
		NotifyFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		NotifyFrame.BorderSizePixel = 0
		NotifyFrame.Size = UDim2.new(1, 0, 0, 70)
		NotifyFrame.Name = "NotifyFrame"
		NotifyFrame.Parent = CoreGui.NotifyGui.NotifyLayout
		NotifyFrame.Position = UDim2.new(0, 0, 0, 0)

		NotifyFrameReal.BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871)
		NotifyFrameReal.BorderColor3 = Color3.fromRGB(0, 0, 0)
		NotifyFrameReal.BorderSizePixel = 0
		NotifyFrameReal.Position = UDim2.new(0, 270, 0, 0)
		NotifyFrameReal.Size = UDim2.new(1, 0, 1, 0)
		NotifyFrameReal.Name = "NotifyFrameReal"
		NotifyFrameReal.Parent = NotifyFrame

		UICorner.CornerRadius = UDim.new(0, 5)
		UICorner.Parent = NotifyFrameReal
	
		DropShadowHolder.BackgroundTransparency = 1
		DropShadowHolder.BorderSizePixel = 0
		DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
		DropShadowHolder.ZIndex = 0
		DropShadowHolder.Name = "DropShadowHolder"
		DropShadowHolder.Parent = NotifyFrameReal
	
		DropShadow.Image = "rbxassetid://6015897843"
		DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
		DropShadow.ImageTransparency = 0.5
		DropShadow.ScaleType = Enum.ScaleType.Slice
		DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)
		DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
		DropShadow.BackgroundTransparency = 1
		DropShadow.BorderSizePixel = 0
		DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
		DropShadow.Size = UDim2.new(1, 47, 1, 47)
		DropShadow.ZIndex = 0
		DropShadow.Name = "DropShadow"
		DropShadow.Parent = DropShadowHolder
	
		NotifyLogo.Image = NotifyConfig.Logo
		NotifyLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NotifyLogo.BackgroundTransparency = 0.9990000128746033
		NotifyLogo.BorderColor3 = Color3.fromRGB(0, 0, 0)
		NotifyLogo.BorderSizePixel = 0
		NotifyLogo.AnchorPoint = Vector2.new(0, 0.5)
		NotifyLogo.Position = UDim2.new(0, 12, 0.5, 0)
		NotifyLogo.Size = UDim2.new(0, 45, 0, 45)
		NotifyLogo.Name = "NotifyLogo"
		NotifyLogo.Parent = NotifyFrameReal
	
		UICorner1.CornerRadius = UDim.new(0, 5)
		UICorner1.Parent = NotifyLogo
	
		NotifyTitle.Font = Enum.Font.GothamBold
		NotifyTitle.Text = NotifyConfig.Title
		NotifyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		NotifyTitle.TextSize = 12
		NotifyTitle.TextXAlignment = Enum.TextXAlignment.Left
		NotifyTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NotifyTitle.BackgroundTransparency = 0.9990000128746033
		NotifyTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
		NotifyTitle.BorderSizePixel = 0
		NotifyTitle.Position = UDim2.new(0, 69, 0, 15)
		NotifyTitle.Size = UDim2.new(1, -140, 0, 14)
		NotifyTitle.Name = "NotifyTitle"
		NotifyTitle.Parent = NotifyFrameReal
	
		NotifyContent.Font = Enum.Font.Gotham
		NotifyContent.Text = NotifyConfig.Content
		NotifyContent.TextColor3 = Color3.fromRGB(80.00000283122063, 80.00000283122063, 80.00000283122063)
		NotifyContent.TextSize = 12
		NotifyContent.TextTransparency = 0.30000001192092896
		NotifyContent.TextXAlignment = Enum.TextXAlignment.Left
		NotifyContent.TextYAlignment = Enum.TextYAlignment.Top
		NotifyContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		NotifyContent.BackgroundTransparency = 0.9990000128746033
		NotifyContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
		NotifyContent.BorderSizePixel = 0
		NotifyContent.Position = UDim2.new(0, 69, 0, 29)
		NotifyContent.Size = UDim2.new(1, -140, 0, 24)
		NotifyContent.Name = "NotifyContent"
		NotifyContent.Parent = NotifyFrameReal
	
		UIStroke.Color = Color3.fromRGB(80.00000283122063, 80.00000283122063, 80.00000283122063)
		UIStroke.Thickness = 0.30000001192092896
		UIStroke.Parent = NotifyContent
	
		AlertImage.Image = "rbxassetid://18289906180"
		AlertImage.AnchorPoint = Vector2.new(1, 0.5)
		AlertImage.ImageColor3 = Color3.fromRGB(28.000000230968, 12.000000234693289, 143.00000667572021)
		AlertImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		AlertImage.BackgroundTransparency = 0.9990000128746033
		AlertImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
		AlertImage.BorderSizePixel = 0
		AlertImage.Position = UDim2.new(1, -12, 0.5, 0)
		AlertImage.Size = UDim2.new(0, 45, 0, 45)
		AlertImage.Parent = NotifyFrameReal
		
		NotifyContent.Size = UDim2.new(1, -140, 0, 12 + (12 * (NotifyContent.TextBounds.X // NotifyContent.AbsoluteSize.X)))
		NotifyContent.TextWrapped = true
		if NotifyContent.AbsoluteSize.Y < 25 then
			NotifyFrame.Size = UDim2.new(1, 0, 0, 70)
		else
			NotifyFrame.Size = UDim2.new(1, 0, 0, NotifyFrame.AbsoluteSize.Y + 17)
		end
		local waitclose = false
		function NotifyFunc:Close()
			if waitclose then
				return false
			end
			waitclose = true
			TweenService:Create(
				NotifyFrameReal,
				TweenInfo.new(tonumber(NotifyConfig.Time), Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
				{Position = UDim2.new(0, 270, 0, 0)}
			):Play()
			task.wait(tonumber(NotifyConfig.Time) / 1.2)
			NotifyFrame:Destroy()
		end
		TweenService:Create(
			NotifyFrameReal,
			TweenInfo.new(tonumber(NotifyConfig.Time), Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
			{Position = UDim2.new(0, 0, 0, 0)}
		):Play()
		task.wait(tonumber(NotifyConfig.Delay))
		NotifyFunc:Close()
	end)
	return NotifyFunc
end
function WazureV1:Start(GuiConfig)
	local GuiConfig = GuiConfig or {}
	GuiConfig.Name = GuiConfig.Name or "W-azure"
	GuiConfig["Logo Player"] = GuiConfig["Logo Player"] or "https://www.roblox.com/headshot-thumbnail/image?userId="..game:GetService("Players").LocalPlayer.UserId .."&width=420&height=420&format=png"
	GuiConfig["Name Player"] = GuiConfig["Name Player"] or tostring(game:GetService("Players").LocalPlayer.Name)
	GuiConfig["Tab Width"] = GuiConfig["Tab Width"] or 120
	GuiConfig["Color"] = GuiConfig["Color"] or Color3.fromRGB(6.000000117346644, 141.0000067949295, 234.00000125169754)
	GuiConfig["Save Config"] = GuiConfig["Save Config"] or {}
	GuiConfig["Save Config"].Folder = GuiConfig["Save Config"].Folder or GuiConfig.Name
	GuiConfig["Save Config"]["Name Config"] = GuiConfig["Save Config"]["Name Config"] or "Config"
	GuiConfig["Custom Toggle"] = GuiConfig["Custom Toggle"] or false
	GuiConfig["CloseCallBack"] = GuiConfig["CloseCallBack"] or function() end

	local GuiFunc = {}

	local AzuGui = Instance.new("ScreenGui");
	local Main = Instance.new("Frame");
	local UICorner = Instance.new("UICorner");
	local DropShadowHolder = Instance.new("Frame");
	local DropShadow = Instance.new("ImageLabel");
	local Top = Instance.new("Frame");
	local NameHub = Instance.new("TextLabel");
	local CloseButton = Instance.new("TextButton");
	local CloseImage = Instance.new("ImageLabel");
	local HideButton = Instance.new("TextButton");
	local HideImage = Instance.new("ImageLabel");
	local UICorner1 = Instance.new("UICorner");
	local UICorner2 = Instance.new("UICorner");

	AzuGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	AzuGui.Name = "AzuGui"
	AzuGui.Parent = CoreGui

	Main.BackgroundColor3 = Color3.fromRGB(15.000000055879354, 16.000000946223736, 17.00000088661909)
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0, 447, 0, 203)
	Main.Size = UDim2.new(0, 550, 0, 400)
	Main.Name = "Main"
	Main.Parent = AzuGui

	Main.Position = UDim2.new(0, (AzuGui.AbsoluteSize.X // 2 - Main.Size.X.Offset // 2), 0, (AzuGui.AbsoluteSize.Y // 2 - Main.Size.Y.Offset // 2))

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = Main

	DropShadowHolder.BackgroundTransparency = 1
	DropShadowHolder.BorderSizePixel = 0
	DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
	DropShadowHolder.ZIndex = 0
	DropShadowHolder.Name = "DropShadowHolder"
	DropShadowHolder.Parent = Main

	DropShadow.Image = "rbxassetid://6015897843"
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow.ImageTransparency = 0.5
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Size = UDim2.new(1, 47, 1, 47)
	DropShadow.ZIndex = 0
	DropShadow.Name = "DropShadow"
	DropShadow.Parent = DropShadowHolder

	Top.BackgroundColor3 = Color3.fromRGB(25.000000409781933, 26.000000350177288, 27.000000290572643)
	Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Top.BorderSizePixel = 0
	Top.Size = UDim2.new(1, 0, 0, 35)
	Top.Name = "Top"
	Top.Parent = Main

	NameHub.Font = Enum.Font.Highway
	NameHub.Text = GuiConfig.Name
	NameHub.TextColor3 = Color3.fromRGB(202.00000315904617, 251.00000023841858, 255)
	NameHub.TextSize = 24
	NameHub.TextWrapped = true
	NameHub.TextXAlignment = Enum.TextXAlignment.Left
	NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NameHub.BackgroundTransparency = 0.9990000128746033
	NameHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NameHub.BorderSizePixel = 0
	NameHub.Position = UDim2.new(0, 7, 0, 0)
	NameHub.Size = UDim2.new(1, -80, 1, 0)
	NameHub.Name = "NameHub"
	NameHub.Parent = Top

	CloseButton.Font = Enum.Font.SourceSans
	CloseButton.Text = ""
	CloseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	CloseButton.TextSize = 14
	CloseButton.AnchorPoint = Vector2.new(1, 0)
	CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.BackgroundTransparency = 0.9990000128746033
	CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CloseButton.BorderSizePixel = 0
	CloseButton.Position = UDim2.new(1, -1, 0, 0)
	CloseButton.Size = UDim2.new(0, 35, 0, 35)
	CloseButton.Name = "CloseButton"
	CloseButton.Parent = Top

	CloseImage.Image = "rbxassetid://18328658828"
	CloseImage.ImageColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877)
	CloseImage.AnchorPoint = Vector2.new(0.5, 0.5)
	CloseImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseImage.BackgroundTransparency = 0.9990000128746033
	CloseImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CloseImage.BorderSizePixel = 0
	CloseImage.Position = UDim2.new(0.5, 0, 0.5, 0)
	CloseImage.Size = UDim2.new(1, -18, 1, -18)
	CloseImage.Name = "CloseImage"
	CloseImage.Parent = CloseButton

	HideButton.Font = Enum.Font.SourceSans
	HideButton.Text = ""
	HideButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	HideButton.TextSize = 14
	HideButton.AnchorPoint = Vector2.new(1, 0)
	HideButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	HideButton.BackgroundTransparency = 0.9990000128746033
	HideButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	HideButton.BorderSizePixel = 0
	HideButton.Position = UDim2.new(1, -35, 0, 0)
	HideButton.Size = UDim2.new(0, 35, 0, 35)
	HideButton.Name = "HideButton"
	HideButton.Parent = Top

	HideImage.Image = "rbxassetid://18328656799"
	HideImage.ImageColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877)
	HideImage.AnchorPoint = Vector2.new(0.5, 0.5)
	HideImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	HideImage.BackgroundTransparency = 0.9990000128746033
	HideImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	HideImage.BorderSizePixel = 0
	HideImage.Position = UDim2.new(0.5, 0, 0.5, 0)
	HideImage.Size = UDim2.new(1, -18, 1, -18)
	HideImage.Name = "HideImage"
	HideImage.Parent = HideButton

	UICorner1.CornerRadius = UDim.new(0, 3)
	UICorner1.Parent = HideButton

	UICorner2.CornerRadius = UDim.new(0, 3)
	UICorner2.Parent = Top
	
	MakeDraggable(Top, Main)
	function WazureV1:CloseUI()
		AzuGui:Destroy()
	end
	function WazureV1:ToggleUI()
		Main.Visible = not Main.Visible
	end
	if not GuiConfig["Custom Toggle"] then
		local ToggleOpen = Instance.new("Frame");
		local OpenButton = Instance.new("TextButton");
		local UICorner42 = Instance.new("UICorner");
		local DropShadowHolder1 = Instance.new("Frame");
		local DropShadow1 = Instance.new("ImageLabel");
		local UIStroke19 = Instance.new("UIStroke");

		ToggleOpen.AnchorPoint = Vector2.new(0, 0.5)
		ToggleOpen.BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871)
		ToggleOpen.BackgroundTransparency = 0.10000000149011612
		ToggleOpen.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ToggleOpen.BorderSizePixel = 0
		ToggleOpen.Position = UDim2.new(0, Main.Position.X.Offset - 50, 0.5, 0)
		ToggleOpen.Size = UDim2.new(0, 50, 0, 50)
		ToggleOpen.Name = "ToggleOpen"
		ToggleOpen.Visible = false
		ToggleOpen.Parent = AzuGui
		
		OpenButton.Font = Enum.Font.IndieFlower
		OpenButton.Text = "Open"
		OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		OpenButton.TextSize = 30
		OpenButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		OpenButton.BackgroundTransparency = 0.9990000128746033
		OpenButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		OpenButton.BorderSizePixel = 0
		OpenButton.Size = UDim2.new(1, 0, 1, 0)
		OpenButton.Name = "OpenButton"
		OpenButton.Parent = ToggleOpen
		
		UICorner42.CornerRadius = UDim.new(0, 5)
		UICorner42.Parent = ToggleOpen
		
		DropShadowHolder1.BackgroundTransparency = 1
		DropShadowHolder1.BorderSizePixel = 0
		DropShadowHolder1.Size = UDim2.new(1, 0, 1, 0)
		DropShadowHolder1.ZIndex = 0
		DropShadowHolder1.Name = "DropShadowHolder"
		DropShadowHolder1.Parent = ToggleOpen
		
		DropShadow1.Image = "rbxassetid://6015897843"
		DropShadow1.ImageColor3 = Color3.fromRGB(0, 0, 0)
		DropShadow1.ImageTransparency = 0.5
		DropShadow1.ScaleType = Enum.ScaleType.Slice
		DropShadow1.SliceCenter = Rect.new(49, 49, 450, 450)
		DropShadow1.AnchorPoint = Vector2.new(0.5, 0.5)
		DropShadow1.BackgroundTransparency = 1
		DropShadow1.BorderSizePixel = 0
		DropShadow1.Position = UDim2.new(0.5, 0, 0.5, 0)
		DropShadow1.Size = UDim2.new(1, 30, 1, 30)
		DropShadow1.ZIndex = 0
		DropShadow1.Name = "DropShadow"
		DropShadow1.Parent = DropShadowHolder1
		
		UIStroke19.Color = Color3.fromRGB(50.000000819563866, 50.000000819563866, 50.000000819563866)
		UIStroke19.Thickness = 2
		UIStroke19.Parent = ToggleOpen
		
		HideButton.Activated:Connect(function()
			ToggleOpen.Visible = true
			WazureV1:ToggleUI()
		end)
		CloseButton.Activated:Connect(function()
			ToggleOpen.Visible = true
			WazureV1:ToggleUI()
			GuiConfig.CloseCallBack()
		end)
		OpenButton.Activated:Connect(function()
			ToggleOpen.Visible = false
			WazureV1:ToggleUI()
		end)
	end
	--// Layers Tab
	local LayersTab = Instance.new("Frame");
	local ScrollTab = Instance.new("ScrollingFrame");
	local UIListLayout = Instance.new("UIListLayout");
	local Info = Instance.new("Frame");
	local UICorner3 = Instance.new("UICorner");
	local NamePlayer = Instance.new("TextLabel");
	local LogoFrame = Instance.new("Frame");
	local LogoPlayer = Instance.new("ImageLabel");
	local UICorner4 = Instance.new("UICorner");
	local UICorner5 = Instance.new("UICorner");
	
	LayersTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LayersTab.BackgroundTransparency = 0.9990000128746033
	LayersTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LayersTab.BorderSizePixel = 0
	LayersTab.Position = UDim2.new(0, 4, 0, 48)
	LayersTab.Size = UDim2.new(0, GuiConfig["Tab Width"], 1, -56)
	LayersTab.Name = "LayersTab"
	LayersTab.Parent = Main

	ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
	ScrollTab.ScrollBarImageTransparency = 0.699999988079071
	ScrollTab.ScrollBarThickness = 2
	ScrollTab.Active = true
	ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollTab.BackgroundTransparency = 0.9990000128746033
	ScrollTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScrollTab.BorderSizePixel = 0
	ScrollTab.Size = UDim2.new(1, 0, 1, -45)
	ScrollTab.Name = "ScrollTab"
	ScrollTab.Parent = LayersTab

	UIListLayout.Padding = UDim.new(0, 3)
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Parent = ScrollTab

	local function UpSize()
		local OffsetY = 0
		for _, child in ScrollTab:GetChildren() do
			if child.Name ~= "UIListLayout" then
				OffsetY = OffsetY + 3 + child.Size.Y.Offset
			end
		end
		ScrollTab.CanvasSize = UDim2.new(0, 0, 0, OffsetY)
	end
	ScrollTab.ChildAdded:Connect(UpSize)
	ScrollTab.ChildRemoved:Connect(UpSize)
	UpSize()

	Info.AnchorPoint = Vector2.new(0, 1)
	Info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Info.BackgroundTransparency = 0.9990000128746033
	Info.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Info.BorderSizePixel = 0
	Info.Position = UDim2.new(0, 0, 1, 0)
	Info.Size = UDim2.new(1, 0, 0, 40)
	Info.Name = "Info"
	Info.Parent = LayersTab
	
	UICorner3.CornerRadius = UDim.new(0, 3)
	UICorner3.Parent = Info
	
	NamePlayer.Font = Enum.Font.GothamBold
	NamePlayer.Text = GuiConfig["Name Player"]
	NamePlayer.TextColor3 = Color3.fromRGB(230.00000149011612, 230.00000149011612, 230.00000149011612)
	NamePlayer.TextSize = 16
	NamePlayer.TextWrapped = true
	NamePlayer.TextXAlignment = Enum.TextXAlignment.Left
	NamePlayer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NamePlayer.BackgroundTransparency = 0.9990000128746033
	NamePlayer.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NamePlayer.BorderSizePixel = 0
	NamePlayer.Position = UDim2.new(0, 45, 0, 0)
	NamePlayer.Size = UDim2.new(1, -45, 1, 0)
	NamePlayer.Name = "NamePlayer"
	NamePlayer.Parent = Info
	
	LogoFrame.AnchorPoint = Vector2.new(0, 0.5)
	LogoFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LogoFrame.BackgroundTransparency = 0.9990000128746033
	LogoFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LogoFrame.BorderSizePixel = 0
	LogoFrame.Position = UDim2.new(0, 5, 0.5, 0)
	LogoFrame.Size = UDim2.new(0, 30, 0, 30)
	LogoFrame.Name = "LogoFrame"
	LogoFrame.Parent = Info
	
	LogoPlayer.Image = GuiConfig["Logo Player"]
	LogoPlayer.AnchorPoint = Vector2.new(0.5, 0.5)
	LogoPlayer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LogoPlayer.BackgroundTransparency = 0.9990000128746033
	LogoPlayer.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LogoPlayer.BorderSizePixel = 0
	LogoPlayer.Position = UDim2.new(0.5, 0, 0.5, 0)
	LogoPlayer.Size = UDim2.new(1, 0, 1, 0)
	LogoPlayer.Name = "LogoPlayer"
	LogoPlayer.Parent = LogoFrame
	
	UICorner4.CornerRadius = UDim.new(0, 1000)
	UICorner4.Parent = LogoPlayer
	
	UICorner5.CornerRadius = UDim.new(0, 1000)
	UICorner5.Parent = LogoFrame

	--// Layers
	local Layers = Instance.new("Frame");
	local LayersFolder = Instance.new("Folder");
	local LayersPageLayout = Instance.new("UIPageLayout");

	Layers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Layers.BackgroundTransparency = 0.9990000128746033
	Layers.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Layers.BorderSizePixel = 0
	Layers.Position = UDim2.new(0, GuiConfig["Tab Width"] + 8, 0, 48)
	Layers.Size = UDim2.new(1, -(GuiConfig["Tab Width"] + 16), 1, -56)
	Layers.Name = "Layers"
	Layers.ClipsDescendants = true
	Layers.Parent = Main
	
	LayersFolder.Name = "LayersFolder"
	LayersFolder.Parent = Layers

	LayersPageLayout.EasingDirection = Enum.EasingDirection.InOut
	LayersPageLayout.EasingStyle = Enum.EasingStyle.Quad
	LayersPageLayout.TweenTime = 0.009999999776482582
	LayersPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
	LayersPageLayout.Name = "LayersPageLayout"
	LayersPageLayout.Parent = LayersFolder

	--// More Frame
	local MoreFrame = Instance.new("Frame");
	local MoreButton = Instance.new("TextButton");
	local MoreAnother = Instance.new("Frame");
	local UICorner31 = Instance.new("UICorner");
	local TopAnother = Instance.new("Frame");
	local UICorner32 = Instance.new("UICorner");
	local LeftButton = Instance.new("TextButton");
	local LeftImage = Instance.new("ImageLabel");
	local SettingName = Instance.new("TextLabel");
	local UIStroke17 = Instance.new("UIStroke");
	local UnderAnother = Instance.new("Frame");
	local UnderAnotherReal = Instance.new("Frame");
	local AnotherFolder = Instance.new("Folder");
	local AnotherPageLayout = Instance.new("UIPageLayout");

	MoreFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	MoreFrame.BackgroundTransparency = 0.699999988079071
	MoreFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MoreFrame.BorderSizePixel = 0
	MoreFrame.ClipsDescendants = true
	MoreFrame.Position = UDim2.new(0, 0, 0, 35)
	MoreFrame.Size = UDim2.new(1, 0, 1, -35)
	MoreFrame.Visible = false
	MoreFrame.Name = "MoreFrame"
	MoreFrame.Parent = Main

	MoreButton.Font = Enum.Font.SourceSans
	MoreButton.Text = ""
	MoreButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	MoreButton.TextSize = 14
	MoreButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MoreButton.BackgroundTransparency = 0.9990000128746033
	MoreButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MoreButton.BorderSizePixel = 0
	MoreButton.Size = UDim2.new(1, 0, 1, 0)
	MoreButton.Name = "MoreButton"
	MoreButton.Parent = MoreFrame

	MoreAnother.AnchorPoint = Vector2.new(1, 1)
	MoreAnother.BackgroundColor3 = Color3.fromRGB(25.000000409781933, 25.000000409781933, 25.000000409781933)
	MoreAnother.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MoreAnother.BorderSizePixel = 0
	MoreAnother.Position = UDim2.new(1, -1, 1, 0)
	MoreAnother.Size = UDim2.new(0, 240, 1, -4)
	MoreAnother.Name = "MoreAnother"
	MoreAnother.Parent = MoreFrame

	UICorner31.CornerRadius = UDim.new(0, 3)
	UICorner31.Parent = MoreAnother

	TopAnother.BackgroundColor3 = Color3.fromRGB(50.000000819563866, 50.000000819563866, 50.000000819563866)
	TopAnother.BackgroundTransparency = 0.30000001192092896
	TopAnother.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopAnother.BorderSizePixel = 0
	TopAnother.Size = UDim2.new(1, 0, 0, 30)
	TopAnother.Name = "TopAnother"
	TopAnother.Parent = MoreAnother

	UICorner32.CornerRadius = UDim.new(0, 2)
	UICorner32.Parent = TopAnother

	LeftButton.Font = Enum.Font.SourceSans
	LeftButton.Text = ""
	LeftButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	LeftButton.TextSize = 14
	LeftButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LeftButton.BackgroundTransparency = 0.9990000128746033
	LeftButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LeftButton.BorderSizePixel = 0
	LeftButton.Size = UDim2.new(0, 30, 0, 30)
	LeftButton.Name = "LeftButton"
	LeftButton.Parent = TopAnother

	LeftImage.Image = "rbxassetid://18271574494"
	LeftImage.ImageColor3 = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
	LeftImage.AnchorPoint = Vector2.new(0.5, 0.5)
	LeftImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LeftImage.BackgroundTransparency = 0.9990000128746033
	LeftImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LeftImage.BorderSizePixel = 0
	LeftImage.Position = UDim2.new(0.5, 0, 0.5, 0)
	LeftImage.Size = UDim2.new(1, -14, 1, -14)
	LeftImage.Name = "LeftImage"
	LeftImage.Parent = LeftButton

	SettingName.Font = Enum.Font.Gotham
	SettingName.Text = "Setting"
	SettingName.TextColor3 = Color3.fromRGB(255, 255, 255)
	SettingName.TextSize = 13
	SettingName.TextXAlignment = Enum.TextXAlignment.Left
	SettingName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SettingName.BackgroundTransparency = 0.9990000128746033
	SettingName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SettingName.BorderSizePixel = 0
	SettingName.Position = UDim2.new(0, 35, 0, 0)
	SettingName.Size = UDim2.new(1, -35, 1, 0)
	SettingName.Name = "SettingName"
	SettingName.Parent = TopAnother

	UIStroke17.Color = Color3.fromRGB(255, 255, 255)
	UIStroke17.Thickness = 0.20000000298023224
	UIStroke17.Parent = SettingName

	UnderAnother.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UnderAnother.BackgroundTransparency = 0.9990000128746033
	UnderAnother.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UnderAnother.BorderSizePixel = 0
	UnderAnother.Position = UDim2.new(0, 0, 0, 30)
	UnderAnother.Size = UDim2.new(1, 0, 1, -30)
	UnderAnother.Name = "UnderAnother"
	UnderAnother.Parent = MoreAnother

	UnderAnotherReal.AnchorPoint = Vector2.new(0.5, 0.5)
	UnderAnotherReal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UnderAnotherReal.BackgroundTransparency = 0.9990000128746033
	UnderAnotherReal.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UnderAnotherReal.BorderSizePixel = 0
	UnderAnotherReal.Position = UDim2.new(0.5, 0, 0.5, 0)
	UnderAnotherReal.Size = UDim2.new(1, -10, 1, -10)
	UnderAnotherReal.Name = "UnderAnotherReal"
	UnderAnotherReal.ClipsDescendants = true
	UnderAnotherReal.Parent = UnderAnother

	AnotherFolder.Name = "AnotherFolder"
	AnotherFolder.Parent = UnderAnotherReal

	AnotherPageLayout.EasingDirection = Enum.EasingDirection.InOut
	AnotherPageLayout.EasingStyle = Enum.EasingStyle.Quad
	AnotherPageLayout.TweenTime = 0.009999999776482582
	AnotherPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
	AnotherPageLayout.Name = "AnotherPageLayout"
	AnotherPageLayout.Parent = AnotherFolder

	LeftButton.Activated:Connect(function()
		MoreFrame.Visible = false
	end)
	--// Tabs
	local Tabs = {}
	local CountTab = 0
	local CountSetting = 0
	function Tabs:MakeTab(TabName)
		local TabName = TabName or ""
		
		local ScrollLayers = Instance.new("ScrollingFrame");
		local UIListLayout1 = Instance.new("UIListLayout");

		ScrollLayers.CanvasSize = UDim2.new(0, 0, 1.5, 0)
		ScrollLayers.ScrollBarImageTransparency = 0.699999988079071
		ScrollLayers.ScrollBarThickness = 2
		ScrollLayers.Active = true
		ScrollLayers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollLayers.BackgroundTransparency = 0.9990000128746033
		ScrollLayers.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ScrollLayers.BorderSizePixel = 0
		ScrollLayers.Size = UDim2.new(1, 0, 1, 0)
		ScrollLayers.Name = "ScrollLayers"
		ScrollLayers.LayoutOrder = CountTab
		ScrollLayers.Parent = LayersFolder

		UIListLayout1.Padding = UDim.new(0, 4)
		UIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout1.Parent = ScrollLayers

		local function UpSize2()
			local OffsetY = 0
			for _, child in ScrollLayers:GetChildren() do
				if child.Name ~= "UIListLayout" then
					OffsetY = OffsetY + 4 + child.Size.Y.Offset
				end
			end
			ScrollLayers.CanvasSize = UDim2.new(0, 0, 0, OffsetY)
		end
		ScrollLayers.ChildAdded:Connect(UpSize2)
		ScrollLayers.ChildRemoved:Connect(UpSize2)
		UpSize2()
		local Tab = Instance.new("Frame");
		local TabButton = Instance.new("TextButton");
		local ChoosingFrame = Instance.new("Frame");
		local UIStroke = Instance.new("UIStroke");

		Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Tab.BackgroundTransparency = 0.9990000128746033
		Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Tab.BorderSizePixel = 0
		Tab.Size = UDim2.new(1, -5, 0, 30)
		Tab.Name = "Tab"
		Tab.LayoutOrder = CountTab
		Tab.Parent = ScrollTab

		TabButton.Font = Enum.Font.GothamBold
		TabButton.Text = TabName
		TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabButton.TextSize = 15
		TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabButton.BackgroundTransparency = 0.9990000128746033
		TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabButton.BorderSizePixel = 0
		TabButton.Size = UDim2.new(1, 0, 1, 0)
		TabButton.Name = "TabButton"
		TabButton.TextTransparency = 0.5
		TabButton.Parent = Tab

		ChoosingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ChoosingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ChoosingFrame.BorderSizePixel = 0
		ChoosingFrame.AnchorPoint = Vector2.new(0, 0)
		ChoosingFrame.Position = UDim2.new(0, 0, 0, 3)
		ChoosingFrame.Size = UDim2.new(0, 0, 0, 0)
		ChoosingFrame.Name = "ChoosingFrame"
		ChoosingFrame.Parent = Tab

		UIStroke.Color = Color3.fromRGB(255, 255, 255)
		UIStroke.Thickness = 1
		UIStroke.Transparency = 0.999
		UIStroke.Parent = ChoosingFrame

		if CountTab == 0 then
			LayersPageLayout:JumpToIndex(0)
			TabButton.TextTransparency = 0
			ChoosingFrame.AnchorPoint = Vector2.new(0, 0)
			ChoosingFrame.Size = UDim2.new(0, 1, 0, 24)
			UIStroke.Transparency = 0
		end
		TabButton.Activated:Connect(function()
			if Tab.LayoutOrder ~= LayersPageLayout.CurrentPage.LayoutOrder then
				for _, TabFrame in ScrollTab:GetChildren() do
					if TabFrame.Name ~= "UIListLayout" then
						if TabFrame.LayoutOrder ~= Tab.LayoutOrder then
							TweenService:Create(
								TabFrame.TabButton,
								TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
								{TextTransparency = 0.5}
							):Play()
							TweenService:Create(
								TabFrame.ChoosingFrame,
								TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
								{Size = UDim2.new(0, 1, 0, 0)}
							):Play()
							TweenService:Create(
								TabFrame.ChoosingFrame,
								TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
								{Transparency = 0.999}
							):Play()
							TweenService:Create(
								TabFrame.ChoosingFrame.UIStroke,
								TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
								{Transparency = 0.999}
							):Play()
						end
					end
				end
				LayersPageLayout:JumpToIndex(Tab.LayoutOrder)
				TweenService:Create(
					ChoosingFrame,
					TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
					{Size = UDim2.new(0, 1, 0, 24)}
				):Play()
				TweenService:Create(
					ChoosingFrame,
					TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
					{Transparency = 0}
				):Play()
				TweenService:Create(
					UIStroke,
					TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
					{Transparency = 0}
				):Play()
				TweenService:Create(
					TabButton,
					TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
					{TextTransparency = 0}
				):Play()
			end
		end)
		local function EnterMouseGUI(frameenter)
			local old = frameenter.BackgroundColor3
			frameenter.MouseEnter:Connect(function()
				TweenService:Create(
					frameenter,
					TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{BackgroundColor3 = Color3.fromRGB((old.R * 255) + 10, (old.G * 255) + 10, (old.B * 255) + 10)}
				):Play()
			end)
			frameenter.MouseLeave:Connect(function()
				TweenService:Create(
					frameenter,
					TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{BackgroundColor3 = old}
				):Play()
			end)
		end
		local Items = {}
		local CountItem = 0
		local function AddSetting(ItemFunc, ItemFrame)
			function ItemFunc:AddSetting()
				if ItemFrame:FindFirstChild("AnotherFrame") then
					return false
				end
				local AnotherFrame = Instance.new("Frame");
				local AnotherImage = Instance.new("ImageLabel");
				local UICorner10 = Instance.new("UICorner");
				local AnotherButton = Instance.new("TextButton");

				AnotherFrame.AnchorPoint = Vector2.new(1, 0)
				AnotherFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				AnotherFrame.BackgroundTransparency = 0.949999988079071
				AnotherFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				AnotherFrame.BorderSizePixel = 0
				AnotherFrame.ClipsDescendants = true
				AnotherFrame.Position = UDim2.new(1, 0, 0, 0)
				AnotherFrame.Size = UDim2.new(0, 18, 1, 0)
				AnotherFrame.LayoutOrder = CountSetting
				AnotherFrame.Name = "AnotherFrame"
				AnotherFrame.ZIndex = 2
				AnotherFrame.Parent = ItemFrame
				
				AnotherImage.Image = "rbxassetid://16807722553"
				AnotherImage.ImageTransparency = 0.800000011920929
				AnotherImage.AnchorPoint = Vector2.new(0.5, 0.5)
				AnotherImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				AnotherImage.BackgroundTransparency = 0.9990000128746033
				AnotherImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
				AnotherImage.BorderSizePixel = 0
				AnotherImage.Position = UDim2.new(0.5, 0, 0.5, 0)
				AnotherImage.Rotation = 90
				AnotherImage.Size = UDim2.new(0, 22, 0, 22)
				AnotherImage.Name = "AnotherImage"
				AnotherImage.Parent = AnotherFrame
				
				UICorner10.CornerRadius = UDim.new(0, 2)
				UICorner10.Parent = AnotherFrame
				
				AnotherButton.Font = Enum.Font.SourceSans
				AnotherButton.Text = ""
				AnotherButton.TextColor3 = Color3.fromRGB(0, 0, 0)
				AnotherButton.TextSize = 14
				AnotherButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				AnotherButton.BackgroundTransparency = 0.9990000128746033
				AnotherButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
				AnotherButton.BorderSizePixel = 0
				AnotherButton.Size = UDim2.new(1, 0, 1, 0)
				AnotherButton.Name = "AnotherButton"
				AnotherButton.Parent = AnotherFrame

				local ScrollAnother = Instance.new("ScrollingFrame");
				local UIListLayout3 = Instance.new("UIListLayout");

				ScrollAnother.CanvasSize = UDim2.new(0, 0, 1.20000005, 0)
				ScrollAnother.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
				ScrollAnother.ScrollBarThickness = 0
				ScrollAnother.Active = true
				ScrollAnother.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ScrollAnother.BackgroundTransparency = 0.9990000128746033
				ScrollAnother.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ScrollAnother.BorderSizePixel = 0
				ScrollAnother.Size = UDim2.new(1, 0, 1, 0)
				ScrollAnother.LayoutOrder = CountSetting
				ScrollAnother.Name = "ScrollAnother"
				ScrollAnother.Parent = AnotherFolder
		
				UIListLayout3.Padding = UDim.new(0, 3)
				UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout3.Parent = ScrollAnother

				AnotherButton.Activated:Connect(function()
					AnotherPageLayout:JumpToIndex(AnotherFrame.LayoutOrder)
					MoreFrame.Visible = true
				end)
				ItemFunc["Setting Item"] = {}
				local SettingItem = {}
				local CountSettingItem = 0
				function SettingItem:Toggle(ToggleName, ToggleConfig)
					local ToggleConfig = ToggleConfig or {}
					ToggleConfig.Name = ToggleConfig.Name or "Toggle"
					ToggleConfig.Default = ToggleConfig.Default or false
					ToggleConfig.Callback = ToggleConfig.Callback or function() end
					local ToggleFunc = {Type = "Toggle", Value = ToggleConfig.Default}
					local ToggleName = ToggleName or ToggleConfig.Title

					local AnotherToggle = Instance.new("Frame");
					local UICorner33 = Instance.new("UICorner");
					local AnotherToggleButton = Instance.new("TextButton");
					local AnotherToggleSwitch = Instance.new("Frame");
					local UICorner34 = Instance.new("UICorner");
					local AnotherToggleSwitch2 = Instance.new("Frame");
					local UICorner35 = Instance.new("UICorner");
					local AnotherSwitchImage = Instance.new("ImageLabel");

					AnotherToggle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
					AnotherToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
					AnotherToggle.BorderSizePixel = 0
					AnotherToggle.Size = UDim2.new(1, 0, 0, 35)
					AnotherToggle.Name = "AnotherToggle"
					AnotherToggle.Parent = ScrollAnother

					UICorner33.CornerRadius = UDim.new(0, 3)
					UICorner33.Parent = AnotherToggle

					AnotherToggleButton.Font = Enum.Font.GothamBold
					AnotherToggleButton.Text = ToggleConfig.Name
					AnotherToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
					AnotherToggleButton.TextSize = 12
					AnotherToggleButton.TextXAlignment = Enum.TextXAlignment.Left
					AnotherToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					AnotherToggleButton.BackgroundTransparency = 0.9990000128746033
					AnotherToggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
					AnotherToggleButton.BorderSizePixel = 0
					AnotherToggleButton.Size = UDim2.new(1, 0, 1, 0)
					AnotherToggleButton.Name = "AnotherToggleButton"
					AnotherToggleButton.Parent = AnotherToggle

					AnotherToggleSwitch.AnchorPoint = Vector2.new(1, 0.5)
					AnotherToggleSwitch.BackgroundColor3 = Color3.fromRGB(67.00000360608101, 67.00000360608101, 67.00000360608101)
					AnotherToggleSwitch.BorderColor3 = Color3.fromRGB(0, 0, 0)
					AnotherToggleSwitch.BorderSizePixel = 0
					AnotherToggleSwitch.Position = UDim2.new(1, -25, 0.5, 0)
					AnotherToggleSwitch.Size = UDim2.new(0, 40, 0, 20)
					AnotherToggleSwitch.Name = "AnotherToggleSwitch"
					AnotherToggleSwitch.Parent = AnotherToggle

					UICorner34.CornerRadius = UDim.new(1, 0)
					UICorner34.Parent = AnotherToggleSwitch

					AnotherToggleSwitch2.BackgroundColor3 = Color3.fromRGB(25.000000409781933, 25.000000409781933, 25.000000409781933)
					AnotherToggleSwitch2.BorderColor3 = Color3.fromRGB(0, 0, 0)
					AnotherToggleSwitch2.BorderSizePixel = 0
					AnotherToggleSwitch2.Position = UDim2.new(0, 2, 0, 2)
					AnotherToggleSwitch2.Size = UDim2.new(1, -4, 1, -4)
					AnotherToggleSwitch2.Name = "AnotherToggleSwitch2"
					AnotherToggleSwitch2.Parent = AnotherToggleSwitch

					UICorner35.CornerRadius = UDim.new(1, 0)
					UICorner35.Parent = AnotherToggleSwitch2

					AnotherSwitchImage.Image = "rbxassetid://3926305904"
					AnotherSwitchImage.ImageColor3 = Color3.fromRGB(67.00000360608101, 67.00000360608101, 67.00000360608101)
					AnotherSwitchImage.ImageRectOffset = Vector2.new(124, 124)
					AnotherSwitchImage.ImageRectSize = Vector2.new(36, 36)
					AnotherSwitchImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					AnotherSwitchImage.BackgroundTransparency = 1
					AnotherSwitchImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
					AnotherSwitchImage.BorderSizePixel = 0
					AnotherSwitchImage.Position = UDim2.new(0, 20, 0, 0)
					AnotherSwitchImage.Size = UDim2.new(0, 16, 0, 16)
					AnotherSwitchImage.Name = "AnotherSwitchImage"
					AnotherSwitchImage.Parent = AnotherToggleSwitch2

					function ToggleFunc:Set(Value)
						Value = Value or ToggleFunc.Value
						if Value then
							TweenService:Create(
								AnotherToggleButton,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
								{TextColor3 = GuiConfig.Color}
							):Play()
							TweenService:Create(
								AnotherToggleSwitch,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
								{BackgroundColor3 = GuiConfig.Color} 
							):Play()
							TweenService:Create(
								AnotherToggleSwitch2,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
								{BackgroundColor3 = GuiConfig.Color} 
							):Play()
							TweenService:Create(
								AnotherSwitchImage,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
								{Position = UDim2.new(0, 20, 0, 0), ImageColor3 = Color3.fromRGB(255, 255, 255)}
							):Play()
						else
							TweenService:Create(
								AnotherToggleButton,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
								{TextColor3 = Color3.fromRGB(255, 255, 255)}
							):Play()
							TweenService:Create(
								AnotherToggleSwitch,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
								{BackgroundColor3 = Color3.fromRGB(67.00000360608101, 67.00000360608101, 67.00000360608101)} 
							):Play()
							TweenService:Create(
								AnotherToggleSwitch2,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
								{BackgroundColor3 = Color3.fromRGB(25, 25, 25)} 
							):Play()
							TweenService:Create(
								AnotherSwitchImage,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
								{Position = UDim2.new(0, 0, 0, 0), ImageColor3 = Color3.fromRGB(72.00000330805779, 73.00000324845314, 74.0000031888485)}
							):Play()
						end
						ToggleFunc.Value = Value
						save(GuiConfig["Save Config"]["Folder"], GuiConfig["Save Config"]["Name Config"], Tabs)
						ToggleConfig.Callback(Value)
					end
					EnterMouseGUI(AnotherToggle)
					AnotherToggleButton.Activated:Connect(function()
						ToggleFunc.Value = not ToggleFunc.Value
						ToggleFunc:Set(ToggleFunc.Value)
					end)
					ToggleFunc:Set(ToggleFunc.Value)

					SettingItem[ToggleName] = ToggleFunc
					ItemFunc["Setting Item"][ToggleName] = ToggleFunc
					CountSettingItem = CountSettingItem + 1
					return ToggleFunc
				end
				function SettingItem:Slider(SliderName, SliderConfig)
					local SliderConfig = SliderConfig or {}
					SliderConfig.Name = SliderConfig.Name or "Slider"
					SliderConfig.Increment = SliderConfig.Increment or 1
					SliderConfig.Min = SliderConfig.Min or 0
					SliderConfig.Max = SliderConfig.Max or 100
					SliderConfig.Default = SliderConfig.Default or 0
					SliderConfig.Callback = SliderConfig.Callback or function() end
					local SliderFunc = {Type = "Slider", Value = SliderConfig.Default}
					local SliderName = SliderName or SliderConfig.Title

					local AnotherSlider = Instance.new("Frame");
					local AnotherSliderName = Instance.new("TextLabel");
					local AnotherSliderFrame = Instance.new("Frame");
					local UICorner39 = Instance.new("UICorner");
					local SliderDrag1 = Instance.new("Frame");
					local UICorner40 = Instance.new("UICorner");
					local SliderCircle1 = Instance.new("Frame");
					local UICorner41 = Instance.new("UICorner");
					local UIStroke18 = Instance.new("UIStroke");

					AnotherSlider.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
					AnotherSlider.BorderColor3 = Color3.fromRGB(0, 0, 0)
					AnotherSlider.BorderSizePixel = 0
					AnotherSlider.Size = UDim2.new(1, 0, 0, 35)
					AnotherSlider.Name = "AnotherSlider"
					AnotherSlider.LayoutOrder = CountSettingItem
					AnotherSlider.Parent = ScrollAnother

					AnotherSliderName.Font = Enum.Font.GothamBold
					AnotherSliderName.Text = SliderConfig.Name.." / "..tostring(SliderConfig.Default)
					AnotherSliderName.TextColor3 = Color3.fromRGB(255, 255, 255)
					AnotherSliderName.TextSize = 12
					AnotherSliderName.TextXAlignment = Enum.TextXAlignment.Left
					AnotherSliderName.TextYAlignment = Enum.TextYAlignment.Bottom
					AnotherSliderName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					AnotherSliderName.BackgroundTransparency = 0.9990000128746033
					AnotherSliderName.BorderColor3 = Color3.fromRGB(0, 0, 0)
					AnotherSliderName.BorderSizePixel = 0
					AnotherSliderName.Position = UDim2.new(0, 0, 0, 3)
					AnotherSliderName.Size = UDim2.new(1, -70, 0, 12)
					AnotherSliderName.Parent = AnotherSlider

					AnotherSliderFrame.BackgroundColor3 = Color3.fromRGB(60.00000022351742, 60.00000022351742, 60.00000022351742)
					AnotherSliderFrame.BackgroundTransparency = 0.30000001192092896
					AnotherSliderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
					AnotherSliderFrame.BorderSizePixel = 0
					AnotherSliderFrame.Position = UDim2.new(0, 4, 0, 23)
					AnotherSliderFrame.Size = UDim2.new(1, -8, 0, 2)
					AnotherSliderFrame.Name = "AnotherSliderFrame"
					AnotherSliderFrame.Parent = AnotherSlider

					UICorner39.Parent = AnotherSliderFrame

					SliderDrag1.AnchorPoint = Vector2.new(0, 0.5)
					SliderDrag1.BackgroundColor3 = Color3.fromRGB(0, 150.0000062584877, 255)
					SliderDrag1.BorderColor3 = Color3.fromRGB(0, 0, 0)
					SliderDrag1.BorderSizePixel = 0
					SliderDrag1.Position = UDim2.new(0, 0, 0.5, 0)
					SliderDrag1.Size = UDim2.new(0, 0, 0, 2)
					SliderDrag1.Name = "SliderDrag"
					SliderDrag1.Parent = AnotherSliderFrame

					UICorner40.Parent = SliderDrag1

					SliderCircle1.AnchorPoint = Vector2.new(1, 0.5)
					SliderCircle1.BackgroundColor3 = Color3.fromRGB(0, 150.0000062584877, 255)
					SliderCircle1.BorderColor3 = Color3.fromRGB(0, 0, 0)
					SliderCircle1.BorderSizePixel = 0
					SliderCircle1.Position = UDim2.new(1, 5, 0.5, 0)
					SliderCircle1.Size = UDim2.new(0, 10, 0, 10)
					SliderCircle1.Name = "SliderCircle"
					SliderCircle1.Parent = SliderDrag1

					UICorner41.Parent = SliderCircle1

					UIStroke18.Color = Color3.fromRGB(0, 150.0000062584877, 255)
					UIStroke18.Parent = SliderCircle1
					local Dragging = false
					local function Round(Number, Factor)
						local Result = math.floor(Number/Factor + (math.sign(Number) * 0.5)) * Factor
						if Result < 0 then 
							Result = Result + Factor 
						end
						return Result
					end
					function SliderFunc:Set(Value)
						Value = math.clamp(Round(Value, SliderConfig.Increment), SliderConfig.Min, SliderConfig.Max)
						SliderFunc.Value = Value
						AnotherSliderName.Text = SliderConfig.Name.." / "..tostring(Value)
						TweenService:Create(
							SliderDrag1,
							TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.fromScale((Value - SliderConfig.Min) / (SliderConfig.Max - SliderConfig.Min), 1)}
						):Play()
						save(GuiConfig["Save Config"]["Folder"], GuiConfig["Save Config"]["Name Config"], Tabs)
						SliderConfig.Callback(Value)
					end
					AnotherSlider.InputBegan:Connect(function(Input)
						if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
							Dragging = true 
						end 
					end)
					AnotherSlider.InputEnded:Connect(function(Input) 
						if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
							Dragging = false 
							local SizeScale = math.clamp((Input.Position.X - AnotherSliderFrame.AbsolutePosition.X) / AnotherSliderFrame.AbsoluteSize.X, 0, 1)
							SliderFunc:Set(SliderConfig.Min + ((SliderConfig.Max - SliderConfig.Min) * SizeScale)) 
						end 
					end)
					UserInputService.InputChanged:Connect(function(Input)
						if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then 
							local SizeScale = math.clamp((Input.Position.X - AnotherSliderFrame.AbsolutePosition.X) / AnotherSliderFrame.AbsoluteSize.X, 0, 1)
							Value = math.clamp(Round(SliderConfig.Min + ((SliderConfig.Max - SliderConfig.Min) * SizeScale), SliderConfig.Increment), SliderConfig.Min, SliderConfig.Max)
							SliderFunc.Value = Value
							AnotherSliderName.Text = SliderConfig.Name.." / "..tostring(Value)
							TweenService:Create(
								SliderDrag1,
								TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Size = UDim2.fromScale((Value - SliderConfig.Min) / (SliderConfig.Max - SliderConfig.Min), 1)}
							):Play()
						end
					end)
					EnterMouseGUI(AnotherSlider)
					SliderFunc:Set(tonumber(SliderConfig.Default))

					SettingItem[SliderName] = SliderFunc
					ItemFunc["Setting Item"][SliderName] = SliderFunc
					CountSettingItem = CountSettingItem + 1
					return SliderFunc
				end
				CountSetting = CountSetting + 1
				return SettingItem
			end
		end
		function Items:MakeSeperator(SeperatorName)
			local SeperatorName = SeperatorName or "Seperator"
			local SeperatorFunc = {Type = "Seperator", Value = SeperatorName}
			
			local Seperator = Instance.new("TextLabel");
			Seperator.Font = Enum.Font.GothamBold
			Seperator.Text = ""
			Seperator.TextColor3 = Color3.fromRGB(255, 255, 255)
			Seperator.TextSize = 13
			Seperator.TextTransparency = 0.25
			Seperator.TextXAlignment = Enum.TextXAlignment.Left
			Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Seperator.BackgroundTransparency = 0.9990000128746033
			Seperator.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Seperator.BorderSizePixel = 0
			Seperator.Size = UDim2.new(1, -8, 0, 20)
			Seperator.Name = "Seperator"
			Seperator.LayoutOrder = CountItem
			Seperator.Parent = ScrollLayers

			function SeperatorFunc:Set(Value)
				Value = Value or Seperator.Text
				SeperatorFunc.Value = Value
				Seperator.Text = tostring(Value)
				save(GuiConfig["Save Config"]["Folder"], GuiConfig["Save Config"]["Name Config"], Tabs)
			end
			SeperatorFunc:Set(SeperatorName)
			Items[SeperatorName] = SeperatorFunc
			CountItem = CountItem + 1
			return SeperatorFunc
		end
		function Items:MakeLabel(LabelName)
			local LabelName = LabelName or "Label"
			local LabelFunc = {Type = "Label", Value = LabelName}

			local Label = Instance.new("Frame");
			local LabelFrame = Instance.new("Frame");
			local UICorner6 = Instance.new("UICorner");
			local UIStroke2 = Instance.new("UIStroke");
			local LabelText = Instance.new("TextLabel");
			local UIStroke3 = Instance.new("UIStroke");

			Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Label.BackgroundTransparency = 0.9990000128746033
			Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Label.BorderSizePixel = 0
			Label.LayoutOrder = 1
			Label.Size = UDim2.new(1, -8, 0, 20)
			Label.Name = "Label"
			Label.LayoutOrder = CountItem
			Label.Parent = ScrollLayers

			LabelFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			LabelFrame.BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871)
			LabelFrame.BackgroundTransparency = 0.30000001192092896
			LabelFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			LabelFrame.BorderSizePixel = 0
			LabelFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
			LabelFrame.Size = UDim2.new(1, -3, 1, -3)
			LabelFrame.Name = "LabelFrame"
			LabelFrame.Parent = Label

			UICorner6.CornerRadius = UDim.new(0, 2)
			UICorner6.Parent = LabelFrame

			UIStroke2.Color = Color3.fromRGB(60.00000022351742, 60.00000022351742, 60.00000022351742)
			UIStroke2.Thickness = 1.600000023841858
			UIStroke2.Parent = LabelFrame

			LabelText.Font = Enum.Font.Gotham
			LabelText.Text = ""
			LabelText.TextColor3 = Color3.fromRGB(255, 255, 255)
			LabelText.TextSize = 14
			LabelText.TextXAlignment = Enum.TextXAlignment.Left
			LabelText.TextYAlignment = Enum.TextYAlignment.Top
			LabelText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			LabelText.BackgroundTransparency = 0.9990000128746033
			LabelText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			LabelText.BorderSizePixel = 0
			LabelText.Position = UDim2.new(0, 3, 0, 2)
			LabelText.Size = UDim2.new(1, -3, 0, 13)
			LabelText.Name = "LabelText"
			LabelText.Parent = LabelFrame

			UIStroke3.Color = Color3.fromRGB(255, 255, 255)
			UIStroke3.Thickness = 0.20000000298023224
			UIStroke3.Parent = LabelText
			function LabelFunc:AutoSize()
				LabelText.TextWrapped = false
				LabelText.Size = UDim2.new(1, 0, 0, 14 + (14 * (LabelText.TextBounds.X // LabelText.AbsoluteSize.X)))
				LabelText.TextWrapped = true
				Label.Size = UDim2.new(1, -8, 0, LabelText.TextBounds.Y + 5)
				UpSize2()
			end
			function LabelFunc:Set(Value)
				Value = Value or LabelText.Text
				LabelFunc.Value = Value
				LabelText.Text = tostring(Value)
				save(GuiConfig["Save Config"]["Folder"], GuiConfig["Save Config"]["Name Config"], Tabs)
			end
			LabelText:GetPropertyChangedSignal("Text"):Connect(function() 
				LabelFunc:AutoSize() 
			end)
			LabelText:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				LabelFunc:AutoSize()
			end)
			LabelFunc:Set(tostring(LabelName))
			Items[LabelName] = LabelFunc
			CountItem = CountItem + 1
			return LabelFunc
		end
		function Items:MakeButton(ButtonName, ButtonConfig)
			local ButtonConfig = ButtonConfig or {}
			ButtonConfig.Title = ButtonConfig.Title or "Button"
			ButtonConfig.Content = ButtonConfig.Content or ""
			ButtonConfig.Icon = ButtonConfig.Icon or "rbxassetid://18271082015"
			ButtonConfig.Callback = ButtonConfig.Callback or function() end
			local ButtonFunc = {Type = "Button"}
			local ButtonName = ButtonName or ButtonConfig.Title
			
			local Button = Instance.new("Frame");
			local UICorner26 = Instance.new("UICorner");
			local ButtonTitle = Instance.new("TextLabel");
			local ButtonDescription = Instance.new("TextLabel");
			local UIStroke14 = Instance.new("UIStroke");
			local ButtonButton = Instance.new("TextButton");
			local ButtonImage = Instance.new("ImageLabel");

			Button.BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871)
			Button.BackgroundTransparency = 0.30000001192092896
			Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.LayoutOrder = CountItem
			Button.Size = UDim2.new(1, -8, 0, 60)
			Button.Name = "Button"
			Button.Parent = ScrollLayers

			UICorner26.CornerRadius = UDim.new(0, 3)
			UICorner26.Parent = Button
			
			ButtonTitle.Font = Enum.Font.GothamBold
			ButtonTitle.Text = ButtonConfig.Title
			ButtonTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			ButtonTitle.TextSize = 12
			ButtonTitle.TextXAlignment = Enum.TextXAlignment.Left
			ButtonTitle.TextYAlignment = Enum.TextYAlignment.Top
			ButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonTitle.BackgroundTransparency = 0.9990000128746033
			ButtonTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ButtonTitle.BorderSizePixel = 0
			ButtonTitle.Position = UDim2.new(0, 5, 0, 1)
			ButtonTitle.Size = UDim2.new(1, -100, 0, 12)
			ButtonTitle.Name = "ButtonTitle"
			ButtonTitle.Parent = Button
			
			ButtonDescription.Font = Enum.Font.Gotham
			ButtonDescription.Text = ButtonConfig.Content
			ButtonDescription.TextColor3 = Color3.fromRGB(80.00000283122063, 80.00000283122063, 80.00000283122063)
			ButtonDescription.TextSize = 12
			ButtonDescription.TextXAlignment = Enum.TextXAlignment.Left
			ButtonDescription.TextYAlignment = Enum.TextYAlignment.Top
			ButtonDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonDescription.BackgroundTransparency = 0.9990000128746033
			ButtonDescription.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ButtonDescription.BorderSizePixel = 0
			ButtonDescription.Position = UDim2.new(0, 5, 0, 14)
			ButtonDescription.Size = UDim2.new(1, -100, 1, -18)
			ButtonDescription.Name = "ButtonDescription"
			ButtonDescription.TextWrapped = true
			ButtonDescription.Parent = Button
			
			UIStroke14.Color = Color3.fromRGB(50.000000819563866, 50.000000819563866, 50.000000819563866)
			UIStroke14.Thickness = 0.30000001192092896
			UIStroke14.Parent = ButtonDescription

			ButtonButton.Font = Enum.Font.SourceSans
			ButtonButton.Text = ""
			ButtonButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			ButtonButton.TextSize = 14
			ButtonButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonButton.BackgroundTransparency = 0.9990000128746033
			ButtonButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ButtonButton.BorderSizePixel = 0
			ButtonButton.Size = UDim2.new(1, 0, 1, 0)
			ButtonButton.Name = "ButtonButton"
			ButtonButton.Parent = Button
			
			ButtonImage.Image = ButtonConfig.Logo
			ButtonImage.ImageTransparency = 0.699999988079071
			ButtonImage.AnchorPoint = Vector2.new(1, 0.5)
			ButtonImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonImage.BackgroundTransparency = 0.9990000128746033
			ButtonImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ButtonImage.BorderSizePixel = 0
			ButtonImage.Position = UDim2.new(1, -55, 0.5, 0)
			ButtonImage.Size = UDim2.new(0, 22, 0, 22)
			ButtonImage.Name = "ButtonImage"
			ButtonImage.Parent = Button 

			EnterMouseGUI(Button)
			ButtonButton.Activated:Connect(function()
				ButtonConfig.Callback()
			end)

			AddSetting(ButtonFunc, Button)
			Items[ButtonName] = ButtonFunc
			CountItem = CountItem + 1
			return ButtonFunc
		end
		function Items:MakeTextInput(TextInputName, TextInputConfig)
			local TextInputConfig = TextInputConfig or {}
			TextInputConfig.Title = TextInputConfig.Title or "Title"
			TextInputConfig.Content = TextInputConfig.Content or ""
			TextInputConfig.Callback = TextInputConfig.Callback or function() end
			local TextInputFunc = {Type = "TextInput", Value = ""}
			local TextInputName = TextInputName or TextInputConfig.Title

			local Input = Instance.new("Frame");
			local UICorner28 = Instance.new("UICorner");
			local InputTitle = Instance.new("TextLabel");
			local InputDescription = Instance.new("TextLabel");
			local UIStroke15 = Instance.new("UIStroke");
			local InputInput = Instance.new("Frame");
			local UICorner30 = Instance.new("UICorner");
			local UIStroke16 = Instance.new("UIStroke");
			local InputBox = Instance.new("TextBox");

			Input.BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871)
			Input.BackgroundTransparency = 0.30000001192092896
			Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Input.BorderSizePixel = 0
			Input.LayoutOrder = CountItem
			Input.Size = UDim2.new(1, -8, 0, 60)
			Input.Name = "Input"
			Input.Parent = ScrollLayers

			UICorner28.CornerRadius = UDim.new(0, 3)
			UICorner28.Parent = Input

			InputTitle.Font = Enum.Font.GothamBold
			InputTitle.Text = TextInputConfig["Title"]
			InputTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			InputTitle.TextSize = 12
			InputTitle.TextXAlignment = Enum.TextXAlignment.Left
			InputTitle.TextYAlignment = Enum.TextYAlignment.Top
			InputTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			InputTitle.BackgroundTransparency = 0.9990000128746033
			InputTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			InputTitle.BorderSizePixel = 0
			InputTitle.Position = UDim2.new(0, 5, 0, 1)
			InputTitle.Size = UDim2.new(1, -100, 0, 12)
			InputTitle.Name = "InputTitle"
			InputTitle.Parent = Input

			InputDescription.Font = Enum.Font.Gotham
			InputDescription.Text = TextInputConfig["Content"]
			InputDescription.TextColor3 = Color3.fromRGB(80.00000283122063, 80.00000283122063, 80.00000283122063)
			InputDescription.TextSize = 12
			InputDescription.TextXAlignment = Enum.TextXAlignment.Left
			InputDescription.TextYAlignment = Enum.TextYAlignment.Top
			InputDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			InputDescription.BackgroundTransparency = 0.9990000128746033
			InputDescription.BorderColor3 = Color3.fromRGB(0, 0, 0)
			InputDescription.BorderSizePixel = 0
			InputDescription.Position = UDim2.new(0, 5, 0, 14)
			InputDescription.Size = UDim2.new(1, -100, 0, 12)
			InputDescription.Name = "InputDescription"
			InputDescription.Parent = Input

			UIStroke15.Color = Color3.fromRGB(50.000000819563866, 50.000000819563866, 50.000000819563866)
			UIStroke15.Thickness = 0.30000001192092896
			UIStroke15.Parent = InputDescription

			InputInput.BackgroundColor3 = Color3.fromRGB(25.000000409781933, 25.000000409781933, 25.000000409781933)
			InputInput.BorderColor3 = Color3.fromRGB(0, 0, 0)
			InputInput.BorderSizePixel = 0
			InputInput.Position = UDim2.new(0, 7, 0, 32)
			InputInput.Size = UDim2.new(1, -52, 0, 20)
			InputInput.Name = "InputInput"
			InputInput.Parent = Input

			UICorner30.CornerRadius = UDim.new(0, 2)
			UICorner30.Parent = InputInput

			UIStroke16.Color = Color3.fromRGB(60.00000022351742, 60.00000022351742, 60.00000022351742)
			UIStroke16.Thickness = 1.600000023841858
			UIStroke16.Parent = InputInput

			InputBox.Font = Enum.Font.GothamBold
			InputBox.PlaceholderColor3 = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
			InputBox.PlaceholderText = ". . ."
			InputBox.Text = ""
			InputBox.TextColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877)
			InputBox.TextSize = 13
			InputBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			InputBox.BackgroundTransparency = 0.9990000128746033
			InputBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
			InputBox.BorderSizePixel = 0
			InputBox.Size = UDim2.new(1, 0, 1, 0)
			InputBox.Name = "InputBox"
			InputBox.Parent = InputInput
			function TextInputFunc:Set(Value)
				Value = Value or InputBox.Text
				InputBox.Text = Value
				TextInputFunc.Value = Value
				save(GuiConfig["Save Config"]["Folder"], GuiConfig["Save Config"]["Name Config"], Tabs)
				TextInputConfig.Callback(Value)
			end
			EnterMouseGUI(Input)
			InputBox.FocusLost:Connect(function()
				TextInputFunc:Set(InputBox.Text)
			end)
			AddSetting(TextInputFunc, Input)

			Items[TextInputName] = TextInputFunc
			CountItem = CountItem + 1
			return TextInputFunc
		end
		function Items:MakeToggle(ToggleName, ToggleConfig)
			local ToggleConfig = ToggleConfig or {}
			ToggleConfig.Title = ToggleConfig.Title or "Title"
			ToggleConfig.Content = ToggleConfig.Content or ""
			ToggleConfig.Default = ToggleConfig.Default or false
			ToggleConfig.Callback = ToggleConfig.Callback or function() end
			local ToggleFunc = {Type = "Toggle", Value = ToggleConfig.Default}
			local ToggleName = ToggleName or ToggleConfig.Title

			local Toggle = Instance.new("Frame");
			local UICorner7 = Instance.new("UICorner");
			local ToggleTitle = Instance.new("TextLabel");
			local ToggleSwitch = Instance.new("Frame");
			local UICorner8 = Instance.new("UICorner");
			local ToggleSwitch2 = Instance.new("Frame");
			local UICorner9 = Instance.new("UICorner");
			local SwitchImage = Instance.new("ImageLabel");
			local ToggleDescription = Instance.new("TextLabel");
			local UIStroke4 = Instance.new("UIStroke");
			local ToggleButton = Instance.new("TextButton");

			Toggle.BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871)
			Toggle.BackgroundTransparency = 0.30000001192092896
			Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.BorderSizePixel = 0
			Toggle.LayoutOrder = CountItem
			Toggle.Size = UDim2.new(1, -8, 0, 60)
			Toggle.Name = "Toggle"
			Toggle.Parent = ScrollLayers
			
			UICorner7.CornerRadius = UDim.new(0, 3)
			UICorner7.Parent = Toggle
			
			ToggleTitle.Font = Enum.Font.GothamBold
			ToggleTitle.Text = tostring(ToggleConfig.Title)
			ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			ToggleTitle.TextSize = 12
			ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
			ToggleTitle.TextYAlignment = Enum.TextYAlignment.Top
			ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleTitle.BackgroundTransparency = 0.9990000128746033
			ToggleTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleTitle.BorderSizePixel = 0
			ToggleTitle.Position = UDim2.new(0, 5, 0, 1)
			ToggleTitle.Size = UDim2.new(1, -100, 0, 12)
			ToggleTitle.Name = "ToggleTitle"
			ToggleTitle.Parent = Toggle
			
			ToggleSwitch.AnchorPoint = Vector2.new(1, 0.5)
			ToggleSwitch.BackgroundColor3 = Color3.fromRGB(67.00000360608101, 67.00000360608101, 67.00000360608101)
			ToggleSwitch.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleSwitch.BorderSizePixel = 0
			ToggleSwitch.Position = UDim2.new(1, -45, 0.5, 0)
			ToggleSwitch.Size = UDim2.new(0, 40, 0, 20)
			ToggleSwitch.Name = "ToggleSwitch"
			ToggleSwitch.Parent = Toggle
			
			UICorner8.CornerRadius = UDim.new(1, 0)
			UICorner8.Parent = ToggleSwitch
			
			ToggleSwitch2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			ToggleSwitch2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleSwitch2.BorderSizePixel = 0
			ToggleSwitch2.Position = UDim2.new(0, 2, 0, 2)
			ToggleSwitch2.Size = UDim2.new(1, -4, 1, -4)
			ToggleSwitch2.Name = "ToggleSwitch2"
			ToggleSwitch2.Parent = ToggleSwitch
			
			UICorner9.CornerRadius = UDim.new(1, 0)
			UICorner9.Parent = ToggleSwitch2
			
			SwitchImage.Image = "rbxassetid://3926305904"
			SwitchImage.ImageColor3 = Color3.fromRGB(72.00000330805779, 73.00000324845314, 74.0000031888485)
			SwitchImage.ImageRectOffset = Vector2.new(124, 124)
			SwitchImage.ImageRectSize = Vector2.new(36, 36)
			SwitchImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SwitchImage.BackgroundTransparency = 1
			SwitchImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SwitchImage.BorderSizePixel = 0
			SwitchImage.Position = UDim2.new(0, 0, 0, 0)
			SwitchImage.Size = UDim2.new(0, 16, 0, 16)
			SwitchImage.Name = "SwitchImage"
			SwitchImage.Parent = ToggleSwitch2
			
			ToggleDescription.Font = Enum.Font.Gotham
			ToggleDescription.Text = tostring(ToggleConfig.Content)
			ToggleDescription.TextColor3 = Color3.fromRGB(80.00000283122063, 80.00000283122063, 80.00000283122063)
			ToggleDescription.TextSize = 12
			ToggleDescription.TextXAlignment = Enum.TextXAlignment.Left
			ToggleDescription.TextYAlignment = Enum.TextYAlignment.Top
			ToggleDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleDescription.BackgroundTransparency = 0.9990000128746033
			ToggleDescription.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleDescription.BorderSizePixel = 0
			ToggleDescription.Position = UDim2.new(0, 5, 0, 14)
			ToggleDescription.Size = UDim2.new(1, -100, 1, -18)
			ToggleDescription.Name = "ToggleDescription"
			ToggleDescription.Parent = Toggle
			
			UIStroke4.Color = Color3.fromRGB(50.000000819563866, 50.000000819563866, 50.000000819563866)
			UIStroke4.Thickness = 0.30000001192092896
			UIStroke4.Parent = ToggleDescription
			
			ToggleButton.Font = Enum.Font.SourceSans
			ToggleButton.Text = ""
			ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			ToggleButton.TextSize = 14
			ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleButton.BackgroundTransparency = 0.9990000128746033
			ToggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleButton.BorderSizePixel = 0
			ToggleButton.Size = UDim2.new(1, 0, 1, 0)
			ToggleButton.Name = "ToggleButton"
			ToggleButton.Parent = Toggle

			function ToggleFunc:Set(Value)
				Value = Value or ToggleFunc.Value
				if Value then
					TweenService:Create(
						ToggleTitle,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{TextColor3 = GuiConfig.Color}
					):Play()
					TweenService:Create(
						ToggleSwitch,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{BackgroundColor3 = GuiConfig.Color} 
					):Play()
					TweenService:Create(
						ToggleSwitch2,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{BackgroundColor3 = GuiConfig.Color} 
					):Play()
					TweenService:Create(
						SwitchImage,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{Position = UDim2.new(0, 20, 0, 0), ImageColor3 = Color3.fromRGB(255, 255, 255)}
					):Play()
				else
					TweenService:Create(
						ToggleTitle,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{TextColor3 = Color3.fromRGB(255, 255, 255)}
					):Play()
					TweenService:Create(
						ToggleSwitch,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{BackgroundColor3 = Color3.fromRGB(67.00000360608101, 67.00000360608101, 67.00000360608101)} 
					):Play()
					TweenService:Create(
						ToggleSwitch2,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{BackgroundColor3 = Color3.fromRGB(25, 25, 25)} 
					):Play()
					TweenService:Create(
						SwitchImage,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{Position = UDim2.new(0, 0, 0, 0), ImageColor3 = Color3.fromRGB(72.00000330805779, 73.00000324845314, 74.0000031888485)}
					):Play()
				end
				ToggleFunc.Value = Value
				save(GuiConfig["Save Config"]["Folder"], GuiConfig["Save Config"]["Name Config"], Tabs)
				ToggleConfig.Callback(Value)
			end
			EnterMouseGUI(Toggle)
			ToggleButton.Activated:Connect(function()
				ToggleFunc.Value = not ToggleFunc.Value
				ToggleFunc:Set(ToggleFunc.Value)
			end)
			AddSetting(ToggleFunc, Toggle)
			ToggleFunc:Set(ToggleFunc.Value)

			Items[ToggleName] = ToggleFunc
			CountItem = CountItem + 1
			return ToggleFunc
		end 
		function Items:MakeSlider(SliderName, SliderConfig)
			local SliderConfig = SliderConfig or {}
			SliderConfig.Title = SliderConfig.Title or "Title"
			SliderConfig.Content = SliderConfig.Content or ""
			SliderConfig.Increment = SliderConfig.Increment or 1
			SliderConfig.Min = SliderConfig.Min or 0
			SliderConfig.Max = SliderConfig.Max or 100
			SliderConfig.Default = SliderConfig.Default or 0
			SliderConfig.Callback = SliderConfig.Callback or function() end
			local SliderFunc = {Type = "Slider", Value = SliderConfig.Default}
			local SliderName = SliderName or SliderConfig.Title

			local Slider = Instance.new("Frame");
			local UICorner20 = Instance.new("UICorner");
			local SliderTitle = Instance.new("TextLabel")
			local SliderDescription = Instance.new("TextLabel");
			local UIStroke11 = Instance.new("UIStroke");
			local BackButton = Instance.new("TextButton");
			local BackImage = Instance.new("ImageLabel");
			local ForwardButton = Instance.new("TextButton");
			local ForwardImage = Instance.new("ImageLabel");
			local RefreshButton = Instance.new("TextButton");
			local RefreshImage = Instance.new("ImageLabel");
			local SliderInput = Instance.new("Frame");
			local UICorner22 = Instance.new("UICorner");
			local UIStroke12 = Instance.new("UIStroke");
			local SliderBox = Instance.new("TextBox");
			local SliderNumber = Instance.new("TextLabel");
			local SliderFrame = Instance.new("Frame");
			local UICorner23 = Instance.new("UICorner");
			local SliderDrag = Instance.new("Frame");
			local UICorner24 = Instance.new("UICorner");
			local SliderCircle = Instance.new("Frame");
			local UICorner25 = Instance.new("UICorner");
			local UIStroke13 = Instance.new("UIStroke");

			Slider.BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871)
			Slider.BackgroundTransparency = 0.30000001192092896
			Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Slider.BorderSizePixel = 0
			Slider.LayoutOrder = CountItem
			Slider.Size = UDim2.new(1, -8, 0, 67)
			Slider.Name = "Slider"
			Slider.Parent = ScrollLayers

			UICorner20.CornerRadius = UDim.new(0, 3)
			UICorner20.Parent = Slider

			SliderTitle.Font = Enum.Font.GothamBold
			SliderTitle.Text = SliderConfig.Title
			SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderTitle.TextSize = 12
			SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
			SliderTitle.TextYAlignment = Enum.TextYAlignment.Top
			SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderTitle.BackgroundTransparency = 0.9990000128746033
			SliderTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderTitle.BorderSizePixel = 0
			SliderTitle.Position = UDim2.new(0, 5, 0, 1)
			SliderTitle.Size = UDim2.new(1, -100, 0, 12)
			SliderTitle.Name = "SliderTitle"
			SliderTitle.Parent = Slider

			SliderDescription.Font = Enum.Font.Gotham
			SliderDescription.Text = SliderConfig.Content
			SliderDescription.TextColor3 = Color3.fromRGB(80.00000283122063, 80.00000283122063, 80.00000283122063)
			SliderDescription.TextSize = 12
			SliderDescription.TextXAlignment = Enum.TextXAlignment.Left
			SliderDescription.TextYAlignment = Enum.TextYAlignment.Top
			SliderDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderDescription.BackgroundTransparency = 0.9990000128746033
			SliderDescription.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderDescription.BorderSizePixel = 0
			SliderDescription.Position = UDim2.new(0, 5, 0, 14)
			SliderDescription.Size = UDim2.new(1, -100, 0, 12)
			SliderDescription.Name = "SliderDescription"
			SliderDescription.Parent = Slider

			UIStroke11.Color = Color3.fromRGB(50.000000819563866, 50.000000819563866, 50.000000819563866)
			UIStroke11.Thickness = 0.30000001192092896
			UIStroke11.Parent = SliderDescription

			BackButton.Font = Enum.Font.SourceSans
			BackButton.Text = ""
			BackButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			BackButton.TextSize = 14
			BackButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			BackButton.BackgroundTransparency = 0.9990000128746033
			BackButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			BackButton.BorderSizePixel = 0
			BackButton.Position = UDim2.new(0, 5, 0, 37)
			BackButton.Size = UDim2.new(0, 26, 0, 26)
			BackButton.Name = "BackButton"
			BackButton.Parent = Slider

			BackImage.Image = "rbxassetid://18261619962"
			BackImage.ImageColor3 = Color3.fromRGB(80.00000283122063, 80.00000283122063, 80.00000283122063)
			BackImage.ImageTransparency = 0.30000001192092896
			BackImage.AnchorPoint = Vector2.new(0.5, 0.5)
			BackImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			BackImage.BackgroundTransparency = 0.9990000128746033
			BackImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
			BackImage.BorderSizePixel = 0
			BackImage.Position = UDim2.new(0.5, 0, 0.5, 0)
			BackImage.Size = UDim2.new(1, -7, 1, -7)
			BackImage.Name = "BackImage"
			BackImage.Parent = BackButton

			ForwardButton.Font = Enum.Font.SourceSans
			ForwardButton.Text = ""
			ForwardButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			ForwardButton.TextSize = 14
			ForwardButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ForwardButton.BackgroundTransparency = 0.9990000128746033
			ForwardButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ForwardButton.BorderSizePixel = 0
			ForwardButton.Position = UDim2.new(0, 52, 0, 37)
			ForwardButton.Size = UDim2.new(0, 26, 0, 26)
			ForwardButton.Name = "ForwardButton"
			ForwardButton.Parent = Slider

			ForwardImage.Image = "rbxassetid://18261621516"
			ForwardImage.ImageColor3 = Color3.fromRGB(80.00000283122063, 80.00000283122063, 80.00000283122063)
			ForwardImage.ImageTransparency = 0.30000001192092896
			ForwardImage.AnchorPoint = Vector2.new(0.5, 0.5)
			ForwardImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ForwardImage.BackgroundTransparency = 0.9990000128746033
			ForwardImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ForwardImage.BorderSizePixel = 0
			ForwardImage.Position = UDim2.new(0.5, 0, 0.5, 0)
			ForwardImage.Size = UDim2.new(1, -7, 1, -7)
			ForwardImage.Name = "ForwardImage"
			ForwardImage.Parent = ForwardButton

			RefreshButton.Font = Enum.Font.SourceSans
			RefreshButton.Text = ""
			RefreshButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			RefreshButton.TextSize = 14
			RefreshButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			RefreshButton.BackgroundTransparency = 0.9990000128746033
			RefreshButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			RefreshButton.BorderSizePixel = 0
			RefreshButton.Position = UDim2.new(0, 28, 0, 37)
			RefreshButton.Size = UDim2.new(0, 26, 0, 26)
			RefreshButton.Name = "RefreshButton"
			RefreshButton.Parent = Slider

			RefreshImage.Image = "rbxassetid://18261607688"
			RefreshImage.ImageColor3 = Color3.fromRGB(80.00000283122063, 80.00000283122063, 80.00000283122063)
			RefreshImage.ImageTransparency = 0.30000001192092896
			RefreshImage.AnchorPoint = Vector2.new(0.5, 0.5)
			RefreshImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			RefreshImage.BackgroundTransparency = 0.9990000128746033
			RefreshImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
			RefreshImage.BorderSizePixel = 0
			RefreshImage.Position = UDim2.new(0.5, 0, 0.5, 0)
			RefreshImage.Size = UDim2.new(1, -3, 1, -3)
			RefreshImage.Name = "RefreshImage"
			RefreshImage.Parent = RefreshButton

			SliderInput.AnchorPoint = Vector2.new(1, 0)
			SliderInput.BackgroundColor3 = Color3.fromRGB(25.000000409781933, 25.000000409781933, 25.000000409781933)
			SliderInput.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderInput.BorderSizePixel = 0
			SliderInput.Position = UDim2.new(1, -45, 0, 45)
			SliderInput.Size = UDim2.new(0, 65, 0, 15)
			SliderInput.Name = "SliderInput"
			SliderInput.Parent = Slider

			UICorner22.CornerRadius = UDim.new(0, 2)
			UICorner22.Parent = SliderInput

			UIStroke12.Color = Color3.fromRGB(60.00000022351742, 60.00000022351742, 60.00000022351742)
			UIStroke12.Thickness = 1.600000023841858
			UIStroke12.Parent = SliderInput

			SliderBox.Font = Enum.Font.GothamBold
			SliderBox.PlaceholderColor3 = Color3.fromRGB(100.00000163912773, 100.00000163912773, 100.00000163912773)
			SliderBox.PlaceholderText = ". . ."
			SliderBox.Text = ""
			SliderBox.TextColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877)
			SliderBox.TextSize = 13
			SliderBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderBox.BackgroundTransparency = 0.9990000128746033
			SliderBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderBox.BorderSizePixel = 0
			SliderBox.Size = UDim2.new(1, 0, 1, 0)
			SliderBox.Name = "SliderBox"
			SliderBox.Parent = SliderInput

			SliderNumber.Font = Enum.Font.GothamBold
			SliderNumber.Text = SliderConfig.Default
			SliderNumber.TextColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877)
			SliderNumber.TextSize = 13
			SliderNumber.TextXAlignment = Enum.TextXAlignment.Right
			SliderNumber.AnchorPoint = Vector2.new(1, 0)
			SliderNumber.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderNumber.BackgroundTransparency = 0.9990000128746033
			SliderNumber.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderNumber.BorderSizePixel = 0
			SliderNumber.Position = UDim2.new(1, -130, 0, 45)
			SliderNumber.Size = UDim2.new(0, 65, 0, 15)
			SliderNumber.Name = "SliderNumber"
			SliderNumber.Parent = Slider

			SliderFrame.BackgroundColor3 = Color3.fromRGB(60.00000022351742, 60.00000022351742, 60.00000022351742)
			SliderFrame.BackgroundTransparency = 0.30000001192092896
			SliderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderFrame.BorderSizePixel = 0
			SliderFrame.Position = UDim2.new(0, 5, 0, 32)
			SliderFrame.Size = UDim2.new(1, -50, 0, 2)
			SliderFrame.Name = "SliderFrame"
			SliderFrame.Parent = Slider

			UICorner23.Parent = SliderFrame

			SliderDrag.AnchorPoint = Vector2.new(0, 0.5)
			SliderDrag.BackgroundColor3 = Color3.fromRGB(0, 150.0000062584877, 255)
			SliderDrag.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderDrag.BorderSizePixel = 0
			SliderDrag.Position = UDim2.new(0, 0, 0.5, 0)
			SliderDrag.Size = UDim2.new(0, 0, 0, 2)
			SliderDrag.Name = "SliderDrag"
			SliderDrag.Parent = SliderFrame

			UICorner24.Parent = SliderDrag

			SliderCircle.AnchorPoint = Vector2.new(1, 0.5)
			SliderCircle.BackgroundColor3 = Color3.fromRGB(0, 150.0000062584877, 255)
			SliderCircle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderCircle.BorderSizePixel = 0
			SliderCircle.Position = UDim2.new(1, 5, 0.5, 0)
			SliderCircle.Size = UDim2.new(0, 10, 0, 10)
			SliderCircle.Name = "SliderCircle"
			SliderCircle.Parent = SliderDrag

			UICorner25.Parent = SliderCircle

			UIStroke13.Color = Color3.fromRGB(0, 150.0000062584877, 255)
			UIStroke13.Parent = SliderCircle
			local Dragging = false
			local function Round(Number, Factor)
				local Result = math.floor(Number/Factor + (math.sign(Number) * 0.5)) * Factor
				if Result < 0 then 
					Result = Result + Factor 
				end
				return Result
			end
			function SliderFunc:Set(Value)
				Value = math.clamp(Round(Value, SliderConfig.Increment), SliderConfig.Min, SliderConfig.Max)
				SliderFunc.Value = Value
				SliderNumber.Text = tostring(Value)
				TweenService:Create(
					SliderDrag,
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Size = UDim2.fromScale((Value - SliderConfig.Min) / (SliderConfig.Max - SliderConfig.Min), 1)}
				):Play()
				save(GuiConfig["Save Config"]["Folder"], GuiConfig["Save Config"]["Name Config"], Tabs)
				SliderConfig.Callback(Value)
			end
			Slider.InputBegan:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
					Dragging = true 
				end 
			end)
			Slider.InputEnded:Connect(function(Input) 
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
					Dragging = false 
					local SizeScale = math.clamp((Input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1)
					SliderFunc:Set(SliderConfig.Min + ((SliderConfig.Max - SliderConfig.Min) * SizeScale)) 
				end 
			end)
			UserInputService.InputChanged:Connect(function(Input)
				if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then 
					local SizeScale = math.clamp((Input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1)
					Value = math.clamp(Round(SliderConfig.Min + ((SliderConfig.Max - SliderConfig.Min) * SizeScale), SliderConfig.Increment), SliderConfig.Min, SliderConfig.Max)
					SliderNumber.Text = tostring(Value)
					TweenService:Create(
						SliderDrag,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.fromScale((Value - SliderConfig.Min) / (SliderConfig.Max - SliderConfig.Min), 1)}
					):Play()
				end
			end)
			SliderBox:GetPropertyChangedSignal("Text"):Connect(function()
				local Valid = SliderBox.Text:gsub("[^%d]", "")
				if Valid ~= "" then
					local ValidNumber = math.min(tonumber(Valid), SliderConfig.Max)
					SliderBox.Text = tostring(ValidNumber)
				else
					SliderBox.Text = tostring(Valid)
				end
			end)
			SliderBox.FocusLost:Connect(function()
				if SliderBox.Text ~= "" then
					SliderFunc:Set(tonumber(SliderBox.Text))
				else
					SliderFunc:Set(0)
				end
				SliderNumber.Text = SliderBox.Text
				SliderBox.Text = ""
			end)
			BackButton.Activated:Connect(function()
				if SliderFunc.Value > SliderConfig.Min then
					SliderFunc:Set(SliderFunc.Value - SliderConfig.Increment)
				end
			end)
			ForwardButton.Activated:Connect(function()
				if SliderFunc.Value < SliderConfig.Max then
					SliderFunc:Set(SliderFunc.Value + SliderConfig.Increment)
				end
			end)
			RefreshButton.Activated:Connect(function()
				SliderFunc:Set(SliderConfig.Default)
			end)
			EnterMouseGUI(Slider)
			SliderFunc:Set(tonumber(SliderConfig.Default))
			AddSetting(SliderFunc, Slider)

			Items[SliderName] = SliderFunc
			CountItem = CountItem + 1
			return SliderFunc
		end
		function Items:MakeDropdown(DropdownName, DropdownConfig)
			local DropdownConfig = DropdownConfig or {}
			DropdownConfig.Title = DropdownConfig.Title or "Title"
			DropdownConfig.Content = DropdownConfig.Content or ""
			DropdownConfig.Multi = DropdownConfig.Multi or false
			DropdownConfig.Options = DropdownConfig.Options or {}
			DropdownConfig.Default = DropdownConfig.Default or {}
			DropdownConfig.Callback = DropdownConfig.Callback or function() end
			local DropdownFunc = {Type = "Dropdown", Value = DropdownConfig.Default, Options = DropdownConfig.Options}
			local DropdownName = DropdownName or DropdownConfig.Title

			local Dropdown = Instance.new("Frame");
			local UICorner15 = Instance.new("UICorner");
			local DropTop = Instance.new("Frame");
			local DropFrame = Instance.new("Frame");
			local UICorner16 = Instance.new("UICorner");
			local UIStroke6 = Instance.new("UIStroke");
			local DropFrameText = Instance.new("TextLabel");
			local DropImage = Instance.new("ImageLabel");
			local DropdownTitle = Instance.new("TextLabel");
			local DropdownDescription = Instance.new("TextLabel");
			local UIStroke7 = Instance.new("UIStroke");
			local DropUnder = Instance.new("Frame");
			local DropUnderFrame = Instance.new("Frame");
			local UIStroke8 = Instance.new("UIStroke");
			local UICorner17 = Instance.new("UICorner");
			local ScrollDrop = Instance.new("ScrollingFrame");
			local UIListLayout2 = Instance.new("UIListLayout");
			local DropButton = Instance.new("TextButton");

			Dropdown.BackgroundColor3 = Color3.fromRGB(255,255,255)
			Dropdown.BackgroundTransparency = 0.999
			Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Dropdown.BorderSizePixel = 0
			Dropdown.ClipsDescendants = true
			Dropdown.LayoutOrder = CountItem
			Dropdown.Size = UDim2.new(1, -8, 0, 60)
			Dropdown.Name = "Dropdown"
			Dropdown.Parent = ScrollLayers

			Dropdown:GetPropertyChangedSignal("Size"):Connect(function()
				UpSize2()
			end)
			UICorner15.CornerRadius = UDim.new(0, 3)
			UICorner15.Parent = Dropdown

			DropTop.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			DropTop.BackgroundTransparency = 0.3
			DropTop.BorderColor3 = Color3.fromRGB(0, 0, 0)
			DropTop.BorderSizePixel = 0
			DropTop.Size = UDim2.new(1, 0, 0, 60)
			DropTop.Name = "DropTop"
			DropTop.Parent = Dropdown

			DropFrame.BackgroundColor3 = Color3.fromRGB(25.000000409781933, 25.000000409781933, 25.000000409781933)
			DropFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			DropFrame.BorderSizePixel = 0
			DropFrame.Position = UDim2.new(0, 7, 0, 32)
			DropFrame.Size = UDim2.new(1, -110, 0, 20)
			DropFrame.Name = "DropFrame"
			DropFrame.Parent = DropTop

			UICorner16.CornerRadius = UDim.new(0, 2)
			UICorner16.Parent = DropFrame

			UIStroke6.Color = Color3.fromRGB(60.00000022351742, 60.00000022351742, 60.00000022351742)
			UIStroke6.Thickness = 1.600000023841858
			UIStroke6.Parent = DropFrame

			DropFrameText.Font = Enum.Font.GothamBold
			DropFrameText.Text = ""
			DropFrameText.TextColor3 = Color3.fromRGB(230.00000149011612, 230.00000149011612, 230.00000149011612)
			DropFrameText.TextSize = 13
			DropFrameText.TextXAlignment = Enum.TextXAlignment.Left
			DropFrameText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropFrameText.BackgroundTransparency = 0.9990000128746033
			DropFrameText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			DropFrameText.BorderSizePixel = 0
			DropFrameText.Position = UDim2.new(0, 3, 0, 0)
			DropFrameText.Size = UDim2.new(1, -10, 1, 0)
			DropFrameText.Parent = DropFrame

			DropImage.Image = "http://www.roblox.com/asset/?id=10815258127"
			DropImage.ImageTransparency = 0.5
			DropImage.AnchorPoint = Vector2.new(1, 0.5)
			DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropImage.BackgroundTransparency = 0.9990000128746033
			DropImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
			DropImage.BorderSizePixel = 0
			DropImage.Position = UDim2.new(1, -55, 0.5, 0)
			DropImage.Rotation = 180
			DropImage.Size = UDim2.new(0, 22, 0, 22)
			DropImage.Name = "DropImage"
			DropImage.Parent = DropTop

			DropdownTitle.Font = Enum.Font.GothamBold
			DropdownTitle.Text = DropdownConfig.Title
			DropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			DropdownTitle.TextSize = 12
			DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
			DropdownTitle.TextYAlignment = Enum.TextYAlignment.Top
			DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropdownTitle.BackgroundTransparency = 0.9990000128746033
			DropdownTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			DropdownTitle.BorderSizePixel = 0
			DropdownTitle.Position = UDim2.new(0, 5, 0, 1)
			DropdownTitle.Size = UDim2.new(1, -90, 0, 12)
			DropdownTitle.Name = "DropdownTitle"
			DropdownTitle.Parent = DropTop

			DropdownDescription.Font = Enum.Font.Gotham
			DropdownDescription.Text = DropdownConfig.Content
			DropdownDescription.TextColor3 = Color3.fromRGB(80.00000283122063, 80.00000283122063, 80.00000283122063)
			DropdownDescription.TextSize = 12
			DropdownDescription.TextXAlignment = Enum.TextXAlignment.Left
			DropdownDescription.TextYAlignment = Enum.TextYAlignment.Top
			DropdownDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropdownDescription.BackgroundTransparency = 0.9990000128746033
			DropdownDescription.BorderColor3 = Color3.fromRGB(0, 0, 0)
			DropdownDescription.BorderSizePixel = 0
			DropdownDescription.Position = UDim2.new(0, 5, 0, 14)
			DropdownDescription.Size = UDim2.new(1, -90, 0, 12)
			DropdownDescription.Name = "DropdownDescription"
			DropdownDescription.Parent = DropTop

			UIStroke7.Color = Color3.fromRGB(50.000000819563866, 50.000000819563866, 50.000000819563866)
			UIStroke7.Thickness = 0.30000001192092896
			UIStroke7.Parent = DropdownDescription

			DropUnder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropUnder.BackgroundTransparency = 0.9990000128746033
			DropUnder.BorderColor3 = Color3.fromRGB(0, 0, 0)
			DropUnder.BorderSizePixel = 0
			DropUnder.Position = UDim2.new(0, 0, 0, 63)
			DropUnder.Size = UDim2.new(1, 0, 0, 110)
			DropUnder.Name = "DropUnder"
			DropUnder.ZIndex = 2
			DropUnder.Parent = Dropdown

			DropUnderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			DropUnderFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			DropUnderFrame.BackgroundTransparency = 0.3
			DropUnderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			DropUnderFrame.BorderSizePixel = 0
			DropUnderFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
			DropUnderFrame.Size = UDim2.new(1, -4, 1, -4)
			DropUnderFrame.Name = "DropUnderFrame"
			DropUnderFrame.Parent = DropUnder

			UIStroke8.Color = Color3.fromRGB(60.00000022351742, 60.00000022351742, 60.00000022351742)
			UIStroke8.Thickness = 1.600000023841858
			UIStroke8.Parent = DropUnderFrame

			UICorner17.CornerRadius = UDim.new(0, 2)
			UICorner17.Parent = DropUnderFrame

			ScrollDrop.CanvasSize = UDim2.new(0, 0, 0, 0)
			ScrollDrop.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
			ScrollDrop.ScrollBarThickness = 0
			ScrollDrop.Active = true
			ScrollDrop.AnchorPoint = Vector2.new(0.5, 0.5)
			ScrollDrop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ScrollDrop.BackgroundTransparency = 0.9990000128746033
			ScrollDrop.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ScrollDrop.BorderSizePixel = 0
			ScrollDrop.Position = UDim2.new(0.5, 0, 0.5, 0)
			ScrollDrop.Size = UDim2.new(1, -12, 1, -12)
			ScrollDrop.Name = "ScrollDrop"
			ScrollDrop.Parent = DropUnderFrame

			UIListLayout2.Padding = UDim.new(0, 3)
			UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout2.Parent = ScrollDrop

			DropButton.Font = Enum.Font.SourceSans
			DropButton.Text = ""
			DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			DropButton.TextSize = 14
			DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropButton.BackgroundTransparency = 0.9990000128746033
			DropButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			DropButton.BorderSizePixel = 0
			DropButton.Size = UDim2.new(1, 0, 1, 0)
			DropButton.Name = "DropButton"
			DropButton.Parent = Dropdown

			local DropCount = 0
			function DropdownFunc:Clear()
				for _, DropFrame in ScrollDrop:GetChildren() do
					if DropFrame.Name ~= "UIListLayout" then
						DropdownFunc.Value = {}
						DropdownFunc.Options = {}
						DropFrameText.Text = ". . ."
						DropFrame:Destroy()
					end
				end
			end
			function DropdownFunc:Set(Value)
				DropdownFunc.Value = Value or DropdownFunc.Value
				for _, Drop in ScrollDrop:GetChildren() do
					if Drop.Name ~= "UIListLayout" and not table.find(DropdownFunc.Value, Drop.DropChooseFrame.ChooseButton.Text) then
						TweenService:Create(
							Drop.DropChooseFrame.UIStroke,
							TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
							{Thickness = 0}
						):Play()
						TweenService:Create(
							Drop.DropChooseFrame.ChooseButton,
							TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
							{TextTransparency = 0.5}
						):Play()
						TweenService:Create(
							Drop.DropChooseFrame.ChooseButton.UIStroke,
							TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
							{Transparency = 0.5}
						):Play()
					elseif Drop.Name ~= "UIListLayout" and table.find(DropdownFunc.Value, Drop.DropChooseFrame.ChooseButton.Text) then
						TweenService:Create(
							Drop.DropChooseFrame.UIStroke,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
							{Thickness = 1.6}
						):Play()
						TweenService:Create(
							Drop.DropChooseFrame.ChooseButton,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
							{TextTransparency = 0}
						):Play()
						TweenService:Create(
							Drop.DropChooseFrame.ChooseButton.UIStroke,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
							{Transparency = 0}
						):Play()
					end
				end
				local DropdownValueTable = table.concat(DropdownFunc.Value, ", ")
				if DropdownValueTable == "" then
					DropFrameText.Text = ""
				else
					DropFrameText.Text = tostring(DropdownValueTable)
				end
				save(GuiConfig["Save Config"]["Folder"], GuiConfig["Save Config"]["Name Config"], Tabs)
				DropdownConfig.Callback(DropdownFunc.Value)
			end
			function DropdownFunc:AddOption(OptionName)
				local OptionName = OptionName or "Option"
				local DropChoose = Instance.new("Frame");
				local DropChooseFrame = Instance.new("Frame");
				local UICorner18 = Instance.new("UICorner");
				local UIStroke9 = Instance.new("UIStroke");
				local ChooseButton = Instance.new("TextButton");
				local UIStroke10 = Instance.new("UIStroke");

				DropChoose.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropChoose.BackgroundTransparency = 0.9990000128746033
				DropChoose.BorderColor3 = Color3.fromRGB(0, 0, 0)
				DropChoose.BorderSizePixel = 0
				DropChoose.Size = UDim2.new(1, 0, 0, 25)
				DropChoose.Name = "DropChoose"
				DropChoose.Parent = ScrollDrop

				DropChooseFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				DropChooseFrame.BackgroundColor3 = Color3.fromRGB(25.000000409781933, 25.000000409781933, 25.000000409781933)
				DropChooseFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				DropChooseFrame.BorderSizePixel = 0
				DropChooseFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
				DropChooseFrame.Size = UDim2.new(1, -5, 1, -5)
				DropChooseFrame.Name = "DropChooseFrame"
				DropChooseFrame.Parent = DropChoose

				UICorner18.CornerRadius = UDim.new(0, 2)
				UICorner18.Parent = DropChooseFrame

				UIStroke9.Color = Color3.fromRGB(60.00000022351742, 60.00000022351742, 60.00000022351742)
				UIStroke9.Thickness = 1.600000023841858
				UIStroke9.Parent = DropChooseFrame

				ChooseButton.Font = Enum.Font.Gotham
				ChooseButton.Text = OptionName
				ChooseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
				ChooseButton.TextSize = 13
				ChooseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ChooseButton.BackgroundTransparency = 0.9990000128746033
				ChooseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ChooseButton.BorderSizePixel = 0
				ChooseButton.Size = UDim2.new(1, 0, 1, 0)
				ChooseButton.Name = "ChooseButton"
				ChooseButton.Parent = DropChooseFrame

				UIStroke10.Color = Color3.fromRGB(255, 255, 255)
				UIStroke10.Thickness = 0.2
				UIStroke10.Parent = ChooseButton

				ChooseButton.Activated:Connect(function()
					if DropdownConfig.Multi then
						if UIStroke9.Thickness < 1.6 then
							table.insert(DropdownFunc.Value, ChooseButton.Text)
							DropdownFunc:Set(DropdownFunc.Value)
						else
							for i, value in pairs(DropdownFunc.Value) do
								if value == ChooseButton.Text then
									table.remove(DropdownFunc.Value, i)
									break
								end
							end
							DropdownFunc:Set(DropdownFunc.Value)
						end
					else
						TweenService:Create(
							Dropdown,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
							{Size = UDim2.new(1, -8, 0, 60)}
						):Play()
						TweenService:Create(
							DropImage,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
							{Rotation = 180}
						):Play()
						DropdownFunc.Value = {ChooseButton.Text}
						DropdownFunc:Set(DropdownFunc.Value)
					end
				end)
				local OffsetY = 0
				for _, child in ScrollDrop:GetChildren() do
					if child.Name ~= "UIListLayout" then
						OffsetY = OffsetY + 3 + child.Size.Y.Offset
					end
				end
				ScrollDrop.CanvasSize = UDim2.new(0, 0, 0, OffsetY)
				EnterMouseGUI(DropChooseFrame)
				DropCount = DropCount + 1
			end
			DropButton.Activated:Connect(function()
				if Dropdown.Size.Y.Offset > 60 then
					TweenService:Create(
						Dropdown,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{Size = UDim2.new(1, -8, 0, 60)}
					):Play()
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{Rotation = 180}
					):Play()
				else
					TweenService:Create(
						Dropdown,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{Size = UDim2.new(1, -8, 0, 175)}
					):Play()
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{Rotation = 90}
					):Play()
				end
			end)
			function DropdownFunc:Refresh(RefreshList, Selecting)
				RefreshList = RefreshList or {}
				Selecting = Selecting or {}
				DropdownFunc:Clear()
				for _, Drop in pairs(RefreshList) do
					DropdownFunc:AddOption(Drop)
					wait()
				end
				DropdownFunc.Options = RefreshList
				DropdownFunc:Set(Selecting)
			end
			DropdownFunc:Refresh(DropdownFunc.Options, DropdownFunc.Value)
			EnterMouseGUI(DropTop)
			AddSetting(DropdownFunc, DropTop)

			Items[DropdownName] = DropdownFunc
			CountItem = CountItem + 1
			return DropdownFunc
		end
		CountTab = CountTab + 1
		Tabs[TabName] = Items
		return Items
	end
	return Tabs
end
return WazureV1
