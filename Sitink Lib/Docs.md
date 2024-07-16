# Sitink Library
- any bug & error, report in https://discord.gg/3Aatp4Nhjp 
- made by Teru, discord: ruteteru
## How to use?
- Import the library
```lua
local sitinklib = loadstring(game:HttpGet("https://github.com/ErutTheTeru/uilibrary/blob/main/Sitink%20Lib/Source.lua?raw=true"))()
```
- Create gui
```lua
local sitinkgui = sitinklib:Start({
    ["Name"] = "sitink hub",
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
```
- Now you can add items to the gui
- A [template](Example.lua) is given if you want to see how items done
# Sitink Library: Documentation
## Create gui
```lua
local sitinkgui = sitinklib:Start({
    ["Name"] = <string>,
    ["Description"] = <string>,
    ["Info Color"] = <userdata>,
    ["Logo Info"] = <string>,
    ["Logo Player"] = <string>,
    ["Name Info"] = <string>,
    ["Name Player"] = <string>,
    ["Info Description"] = <string>,
    ["Tab Width"] = <number>,
    ["Color"] = <userdata>,
    ["CloseCallBack"] = <function>
})
```
## Notification
```lua
local Notify = sitinklib:Notify({
	["Title"] = <string>,
	["Description"] = <string>,
	["Color"] = <userdata>,
	["Content"] = <string>,
	["Time"] = <number>,
	["Delay"] = <number>
})
```
## Create Tab
```lua
local MainTab = sitinkgui:MakeTab(<string>)
```
## Section
```lua
local Section = MainTab:Section({
    ["Title"] = <string>,
    ["Content"] = <string>
})
```
## Seperator
```lua
local Seperator = Section:Seperator(<string>)
```
## Paragraph
```lua
local Paragraph = Section:Paragraph({
    ["Title"] = <string>,
    ["Content"] = <string>
})
```
- Paragraph Function
```lua
Paragraph:Set({
    ["Title"] = <string>,
    ["Content"] = <string>
})
```
## Button
```lua
local Button = Section:Button({
    ["Title"] = <string>,
    ["Content"] = <string>,
    ["Callback"] = <function>
})
```
## Text Input
```lua
local TextInput = Section:TextInput({
    ["Title"] = <string>,
    ["Content"] = <string>,
    ["Place Holder Text"] = <string>,
    ["Clear Text On Focus"] = <boolean>,
    ["Callback"] = <function>
})
```
- Text Input Function
```lua
TextInput:Set(<string>)
```
## Toggle
```lua
local Toggle = Section:Toggle({
	["Title"]= <string>,
	["Content"] = <string>,
	["Default"] = <boolean>,
	["Callback"] = <function>
})
```
- Toggle Function
```lua
Toggle:Set(<boolean>)
print(Toggle.Value)
```
## Slider
```lua
local Slider = Section:Slider({
    ["Title"] = <string>,
    ["Content"] = <string>,
    ["Min"] = <number>,
    ["Max"] = <number>,
    ["Increment"] = <number>,
    ["Default"] = <number>,
    ["Callback"] = <function>
})
```
- Slider Function
```lua
Slider:Set(<number>)
print(Slider.Value)
```
## Dropdown
```lua
local Dropdown = Section:Dropdown({
    ["Title"] = <string>,
    ["Multi"] = false,
    ["Options"] = <table>,
    ["Default"] = <table>,
    ["Place Holder Text"] = <string>,
    ["Callback"] = <function>
})
```
- Dropdown Function
```lua
Dropdown:Clear()
Dropdown:Add(<string>)
Dropdown:Set(<table>)
Dropdown:Refresh(<table>, <table>)
print(unpack(Dropdown.Value))
print(unpack(Dropdown.Options))
```
## Multi Dropdown
```lua
local MultiDropdown = Section:Dropdown({
    ["Title"] = <string>,
    ["Multi"] = true,
    ["Options"] = <table>,
    ["Default"] = <table>,
    ["Place Holder Text"] = <string>,
    ["Callback"] = <function>
})
```
- Multi Dropdown Function
```lua
MultiDropdown:Clear()
MultiDropdown:Add(<string>)
MultiDropdown:Set(<table>)
MultiDropdown:Refresh(<table>, <table>)
print(unpack(MultiDropdown.Value))
print(unpack(MultiDropdown.Options))
```
# Sitink Library: Images
![image](https://github.com/user-attachments/assets/4414c1a0-91fb-4487-85e5-206840984cc3)
![image](https://github.com/user-attachments/assets/04a6f7e2-d34f-4cc4-b7ec-68d666a8bb69)
![image](https://github.com/user-attachments/assets/f0b9bdf3-ef6f-4232-844d-54d0d184ec88)
![image](https://github.com/user-attachments/assets/ca18d86c-8a98-4a6b-a4dd-19821311153d)
![image](https://github.com/user-attachments/assets/a1001cb8-4ba1-4dba-bb8c-44d65db78ee4)
![image](https://github.com/user-attachments/assets/dbc9759f-0423-4179-8ea6-f41f87e9be5e)
