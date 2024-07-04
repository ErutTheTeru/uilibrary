--// Any bug & error, report in https://discord.gg/3Aatp4Nhjp
--// How to use
local WazureV1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/ErutTheTeru/uilibrary/main/wazurev1uimain.lua"))()
--// Notify
local Notify = WazureV1:Notify({
	["Title"] = "Alert",
	["Content"] = "Loaded UI!",
	["Logo"] = "rbxassetid://18289959127",
	["Time"] = 0.5,
	["Delay"] = 5
})
--// Start
local WazureGui = WazureV1:Start({
	["Name"] = "W-azure (Remake)",
	["Logo Player"] = "rbxassetid://18243105495",
	["Name Player"] = "ruteteru",
	["Tab Width"] = 120,
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
-- WazureGui:CloseUI()
--// Make Tab
local MainTab = WazureGui:MakeTab("Main")
-- WazureGui:MakeTab(<string>)
--// Seperator
local Seperator = MainTab:Seperator("Main")
--[[
local Seperator = MainTab:Seperator(<string>)
]]--
-- print(Seperator.Value) -- <string>

-- Seperator:Set(<string>)
--// Label
local Label = MainTab:Label("This is a label")
--[[
local Label = MainTab:Label(<string>)
]]--
-- print(Label.Value) -- <string>

-- Label:AutoSize()
-- Label:Set(<string>)
--// Button
local Button = MainTab:Button({
	["Title"] = "Button",
	["Content"] = "This is a button",
	["Logo"] = "rbxassetid://18271082015",
	["Callback"] = function()
		print("Button Clicked!")
	end
})
--[[
local Button = MainTab:Button({
	["Title"]= <string>,
	["Content"] = <string>,
	["Logo"] = <string>,
	["Callback"] = <function>
})
]]--
--// TextInput
local TextInput = MainTab:TextInput({
	["Title"] = "Webhook",
	["Content"] = "Enter your webhook here",
	["Callback"] = function(Value)
		print(Value)
	end
})
--[[
local TextInput = MainTab:TextInput({
	["Title"]= <string>,
	["Content"] = <string>,
	["Callback"] = <function>
})
]]--
-- print(TextInput.Value) -- <string>

-- TextInput:Set(<string>)
--// Toggle
local Toggle = MainTab:Toggle({
	["Title"]= "Toggle",
	["Content"] = "This is a Toggle",
	["Default"] = false,
	["Callback"] = function(Value) 
		print(Value)
	end
})
--[[
local Toggle = MainTab:Toggle({
	["Title"]= <string>,
	["Content"] = <string>,
	["Default"] = <boolen>,
	["Callback"] = <function>
})
]]--
-- print(Toggle.Value) -- <boolen>

-- Toggle:Set(<boolen>)
--// Setting for Toggle
local ToggleSetting = Toggle:AddSetting()
--[[
local ToggleSetting = Toggle:AddSetting()
]]
--// Toggle for setting 
local SettingToggle = ToggleSetting:Toggle({
	["Name"] = "Toggle",
	["Default"] = false,
	["Callback"] = function(Value)
		print(Value)
	end
})
--[[
local SettingToggle = ToggleSetting:Toggle({
	["Name"]= <string>,
	["Default"] = <boolen>,
	["Callback"] = <function>
})
]]
-- print(SettingToggle.Value) -- <boolen>
-- SettingToggle:Set(<boolen>)
--// Slider for setting
local SliderSetting = ToggleSetting:Slider({
	["Name"] = "Slider",
	["Min"] = 0,
	["Max"] = 100,
	["Increment"] = 1,
	["Default"] = 30,
	["Callback"] = function(Value)
		print(Value)
	end
})
--[[
local SliderSetting = ToggleSetting:Slider({
	["Name"]= <string>,
	["Min"] = <number>,
	["Max"] = <number>,
	["Increment"] = <number>,
	["Default"] = <number>,
	["Callback"] = <function>
})
]]
-- print(SliderSetting.Value) -- <number>
-- SliderSetting:Set(<number>)
--// Slider
local Slider = MainTab:Slider({
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
--[[
local Slider = MainTab:Slider({
	["Title"]= <string>,
	["Content"] = <string>,
	["Min"] = <number>,
	["Max"] = <number>,
	["Increment"] = <number>,
	["Default"] = <number>,
	["Callback"] = <function>
})
]]--
-- print(Slider.Value) -- <number>

-- Slider:Set(<number>)
--// Dropdown
local Dropdown = MainTab:Dropdown({
	["Title"] = "Dropdown",
	["Content"] = "This is a dropdown",
	["Multi"] = false,
	["Options"] = {"Option 1", "Option 2"},
	["Default"] = {"Option 1"},
	["Callback"] = function(Value)
		print(Value)
	end
})
--[[
local Dropdown = MainTab:Dropdown({
	["Title"]= <string>,
	["Content"] = <string>,
	["Multi"] = <boolen>,
	["Options"] = <table>,
	["Default"] = <table>,
	["Callback"] = <function>
})
]]--
-- print(Dropdown.Value) -- <table>
-- print(Dropdown.Options) -- <table>

-- Dropdown:Clear()
-- Dropdown:AddOption(<string>)
-- Dropdown:Set(<table>)
-- Dropdown:Refresh(<table>, <table>)
--// Multi Dropdown
local MultiDropdown = MainTab:Dropdown({
	["Title"] = "Multi Dropdown",
	["Content"] = "This is a multi dropdown",
	["Multi"] = true,
	["Options"] = {"Option 1", "Option 2"},
	["Default"] = {"Option 1"},
	["Callback"] = function(Value)
		print(Value)
	end
})
--[[
local MultiDropdown = MainTab:Dropdown({
	["Title"]= <string>,
	["Content"] = <string>,
	["Multi"] = <boolen>,
	["Options"] = <table>,
	["Default"] = <table>,
	["Callback"] = <function>
})
]]--
-- print(MultiDropdown.Value) -- <table>
-- print(MutliDropdown.Options) -- <table>

-- MultiDropdown:Clear()
-- MultiDropdown:AddOption(<string>)
-- MultiDropdown:Set(<table>)
-- MultiDropdown:Refresh(<table>, <table>)
local SubFarmTab = WazureGui:MakeTab("Sub Farming")
