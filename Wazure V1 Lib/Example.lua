local WazureV1 = loadstring(game:HttpGet("https://github.com/ErutTheTeru/uilibrary/blob/main/Wazure%20V1%20Lib/Source.lua?raw=true"))()
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
		["Folder"] = "W-azure",
		["Name Config"] = "Config"
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
local Tabs = {
	MainTab = WazureGui:MakeTab("Main"),
	SubFarmTab = WazureGui:MakeTab("Sub Farming")
}
local Seperator = Tabs.MainTab:MakeSeperator("Main")
local Label = Tabs.MainTab:MakeLabel("This is a label")
local Button = Tabs.MainTab:MakeButton("Button", {
	["Title"] = "Button",
	["Content"] = "This is a button",
	["Logo"] = "rbxassetid://18271082015",
	["Callback"] = function()
		print("Button Clicked!")
	end
})
local TextInput = Tabs.MainTab:MakeTextInput("Text Input", {
	["Title"] = "Webhook",
	["Content"] = "Enter your webhook here",
	["Callback"] = function(Value)
		print(Value)
	end
})
local Toggle = Tabs.MainTab:MakeToggle("Toggle", {
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
local Slider = Tabs.MainTab:MakeSlider("Slider", {
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
local Dropdown = Tabs.MainTab:MakeDropdown("Dropdown", {
	["Title"] = "Dropdown",
	["Content"] = "This is a dropdown",
	["Multi"] = false,
	["Options"] = {"Option 1", "Option 2"},
	["Default"] = {"Option 1"},
	["Callback"] = function(Value)
		print(Value)
	end
})
local MultiDropdown = Tabs.MainTab:MakeDropdown("Multi Dropdown", {
	["Title"] = "Multi Dropdown",
	["Content"] = "This is a multi dropdown",
	["Multi"] = true,
	["Options"] = {"Option 1", "Option 2"},
	["Default"] = {"Option 1"},
	["Callback"] = function(Value)
		print(Value)
	end
})
loadstring(game:HttpGet("https://github.com/ErutTheTeru/uilibrary/blob/main/Setting%20Func/Source.lua?raw=true"))()
loadsetting("W-azure", "Config", Tabs)
