local sitinklib = loadstring(game:HttpGet("https://github.com/ErutTheTeru/uilibrary/blob/main/Sitink%20Lib/Source.lua?raw=true"))()
local Notify = sitinklib:Notify({
	["Title"] = "sitink Hub",
	["Description"] = "- from R's UI",
	["Color"] = Color3.fromRGB(127.00000002980232, 146.00000649690628, 242.00000077486038),
	["Content"] = "Welcome to sitink Hub",
	["Time"] = 1,
	["Delay"] = 10
})
local sitinkgui = sitinklib:Start({
    ["Name"] = "sitink Hub",
    ["Description"] = "- from R's UI",
    ["Info Color"] = Color3.fromRGB(5.000000176951289, 59.00000028312206, 113.00000086426735),
    ["Logo Info"] = "rbxassetid://18243105495",
    ["Logo Player"] = "rbxassetid://18243105495",
    ["Name Info"] = "sitink Hub Info",
    ["Name Player"] = "ruteteru",
    ["Info Description"] = "discord.gg/3Aatp4Nhjp",
    ["Tab Width"] = 135,
    ["Color"] = Color3.fromRGB(127.00000002980232, 146.00000649690628, 242.00000077486038),
    ["CloseCallBack"] = function() end
})
local MainTab = sitinkgui:MakeTab("Main")
local Section = MainTab:Section({
    ["Title"] = "Local Player",
    ["Content"] = "Local Player Function"
})
local Seperator = Section:Seperator("Local Player")
local Paragraph = Section:Paragraph({
    ["Title"] = "Paragraph",
    ["Content"] = ""
})
local Paragraph1 = Section:Paragraph({
    ["Title"] = "Paragraph",
    ["Content"] = "This is a Paragraph"
})
local Button = Section:Button({
    ["Title"] = "Button",
    ["Content"] = "",
    ["Callback"] = function()
        print("Button Clicked!")
    end
})
local Button1 = Section:Button({
    ["Title"] = "Button",
    ["Content"] = "This is a Button",
    ["Callback"] = function()
        print("Button Clicked!")
    end
})
local TextInput = Section:TextInput({
    ["Title"] = "Text Input",
    ["Content"] = "",
    ["Place Holder Text"] = "Enter you text here...",
    ["Clear Text On Focus"] = true,
    ["Callback"] = function(Value)
        print(Value)
    end
})
local TextInput1 = Section:TextInput({
    ["Title"] = "Text Input",
    ["Content"] = "This is a Text Input",
    ["Place Holder Text"] = "Enter you text here...",
    ["Clear Text On Focus"] = true,
    ["Callback"] = function(Value)
        print(Value)
    end
})
local Toggle = Section:Toggle({
	["Title"]= "Toggle",
	["Content"] = "",
	["Default"] = true,
	["Callback"] = function(Value) 
		print(Value)
	end
})
local Toggle1 = Section:Toggle({
	["Title"]= "Toggle",
	["Content"] = "This is a Toggle",
	["Default"] = false,
	["Callback"] = function(Value) 
		print(Value)
	end
})
local Slider = Section:Slider({
    ["Title"] = "Slider",
    ["Content"] = "",
    ["Min"] = 0,
    ["Max"] = 100,
    ["Increment"] = 1,
    ["Default"] = 30,
    ["Callback"] = function(Value)
        print(Value)
    end
})
local Slider1 = Section:Slider({
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
local Dropdown = Section:Dropdown({
    ["Title"] = "Dropdown",
    ["Multi"] = true,
    ["Options"] = {"Option 1", "Option 2"},
    ["Default"] = {"Option 1"},
    ["Place Holder Text"] = "Select Options",
    ["Callback"] = function(Value)
        print(Value)
    end
})
local ProfileTab = sitinkgui:MakeTab("Profile")