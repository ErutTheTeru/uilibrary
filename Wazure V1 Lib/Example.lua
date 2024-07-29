local WazureV1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/ErutTheTeru/uilibrary/main/wazurev1uimain.lua"))()
local Notify = WazureV1:Notify({
	["Title"] = "Alert",
	["Content"] = "Loaded UI!",
	["Logo"] = "rbxassetid://18289959127",
	["Time"] = 0.5,
	["Delay"] = 5
})
local WazureGui = WazureV1:Start({
	["Name"] = "W-azure (Remake)",
	["Logo Player"] = "rbxassetid://18243105495",
	["Name Player"] = "ruteteru",
	["Tab Width"] = 120,
	["Color"] = Color3.fromRGB(6.000000117346644, 141.0000067949295, 234.00000125169754),
	["Custom Toggle"] = false,
	["Save Config"] = {
		["Enabled"] = true,
		["Name Folder"] = "W-azure",
		["Name Config"] = "Config",
	},
	["CloseCallBack"] = function()
		WazureV1:Notify({
			["Title"] = "Alert",
			["Content"] = "Closed UI!",
			["Logo"] = "rbxassetid://18289959127",
			["Time"] = 0.5,
			["Delay"] = 5
		})
	end
})
local MainTab = WazureGui:MakeTab("Main")
local Seperator = MainTab:Seperator("Main")
local Label = MainTab:Label("This is a label")
local Button = MainTab:Button("Button", {
	["Title"] = "Button",
	["Content"] = "This is a button",
	["Logo"] = "rbxassetid://18271082015",
	["Callback"] = function()
		print("Button Clicked!")
	end
})
local TextInput = MainTab:TextInput("Text Input", {
	["Title"] = "Webhook",
	["Content"] = "Enter your webhook here",
	["Callback"] = function(Value)
		print(Value)
	end
})
local Toggle = MainTab:Toggle("Toggle", {
	["Title"]= "Toggle",
	["Content"] = "This is a Toggle",
	["Default"] = false,
	["Callback"] = function(Value) 
		print(Value)
	end
})
local ToggleSetting = Toggle:AddSetting()
local SettingToggle = ToggleSetting:Toggle("Setting Toggle", {
	["Name"] = "Toggle",
	["Default"] = false,
	["Callback"] = function(Value)
		print(Value)
	end
})
local SliderSetting = ToggleSetting:Slider("Setting Slider", {
	["Name"] = "Slider",
	["Min"] = 0,
	["Max"] = 100,
	["Increment"] = 1,
	["Default"] = 30,
	["Callback"] = function(Value)
		print(Value)
	end
})
local Slider = MainTab:Slider("Slider", {
	["Title"] = "Slider",
	["Content"] = "This is a Slider",
	["Min"] = 0,
	["Max"] = 100,
	["Increment"] = 1,
	["Default"] = 30,
	["Callback"] = function(Value) 
		print(Value)
	end
})
local Dropdown = MainTab:Dropdown("Dropdown", {
	["Title"] = "Dropdown",
	["Content"] = "This is a dropdown",
	["Multi"] = false,
	["Options"] = {"Option 1", "Option 2"},
	["Default"] = {"Option 1"},
	["Callback"] = function(Value)
		print(Value)
	end
})
local MultiDropdown = MainTab:Dropdown("Multi Dropdown", {
	["Title"] = "Multi Dropdown",
	["Content"] = "This is a multi dropdown",
	["Multi"] = true,
	["Options"] = {"Option 1", "Option 2"},
	["Default"] = {"Option 1"},
	["Callback"] = function(Value)
		print(Value)
	end
})
local SubFarmTab = WazureGui:MakeTab("Sub Farming")
