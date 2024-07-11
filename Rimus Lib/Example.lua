local RimusLib = loadstring(game:HttpGet("https://github.com/ErutTheTeru/uilibrary/blob/main/Rimus%20Lib/Source.lua?raw=true"))()
local Notify = RimusLib:MakeNotify({
    Title = "Notification",
    Content = "Content",
    Image = "rbxassetid://16410678154",
    Time = 1,
    Delay = 5
})
local RimusHub = RimusLib:MakeGui({
	NameHub = "Rimus Hub",
	NameGam = "V2",
	Icon = "rbxassetid://16410678154"
})
local Tab1 = RimusHub:CreateTab({
	Name = "Tab 1",
	Icon = "rbxassetid://16410678154"
})
local Seperator = Tab1:AddSeperator("Print Hello")
local Paragraph = Tab1:AddParagraph({
	Title = "Click the toggle",
	Content = "It will print hello",
	Icon = "rbxassetid://16520329204"
})
local Button = Tab1:AddButton({
	Title = "Click Button",
	Content = "print hi",
	Icon = "rbxassetid://16520422220",
	Callback = function()
		print("hi")
	end
})
local Input = Tab1:AddInput({
	Title = "Input",
	Icon = "rbxassetid://16532766392",
	Callback = function(Value)
		print(Value)
	end
})
local Toggle = Tab1:AddToggle({
	Title = "print(hello)",
	Content = "Will print hello",
	Default = false,
	Callback = function(Value) 
		if Value then
			print("hello")
		end
	end
})
local Slider = Tab1:AddSlider({
	Title = "Slider",
	Min = 0,
	Max = 100,
	Increment = 1,
	Default = 50,
	ValueName = "Print",
	Callback = function(Value) 
		print(Value)
	end
})
local Dropdown = Tab1:AddDropdown({
	Title = "Dropdown",
	Multi = false,
	Options = {"one", "two", "three", "four"},
	Default = "one",
	Callback = function(Value)
		print(Value)
	end
})
local MultiDropdown = Tab1:AddDropdown({
	Title = "Multi Dropdown",
	Multi = true,
	Options = {"one", "two", "three", "four"},
	Default = {"one", "two"},
	Callback = function(Value) 
		print(Value)
	end
})