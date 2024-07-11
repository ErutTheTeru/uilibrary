# Rimus Library
- any bug & error, report in https://discord.gg/3Aatp4Nhjp 
- made by Teru, discord: ruteteru
## How to use?
- Import the library
```lua
local RimusLib = loadstring(game:HttpGet("https://github.com/ErutTheTeru/uilibrary/blob/main/Rimus%20Lib/Source.lua?raw=true"))()
```
- Create gui
```lua
local RimusHub = RimusLib:MakeGui({
	NameHub = "Rimus Hub",
	NameGam = "V2",
	Icon = "rbxassetid://16410678154"
})
```
- Now you can add items to the gui
- A [template](Example.lua) is given if you want to see how items done
# Rimus Library: Documentation
## Create gui
```lua
local RimusHub = RimusLib:MakeGui({
	NameHub = <string>,
	NameGam = <string>,
	Icon = <string>
})
```
## Notification
```lua
local Notify = RimusLib:MakeNotify({
    Title = <string>,
    Content = <string>,
    Image = <number>,
    Time = <number>,
    Delay = <number>
})
```
## Create Tab
```lua
local Tab = RimusHub:CreateTab({
	Name = <string>,
	Icon = <string>
})
```
## Seperator
```lua
local Seperator = Tab:AddSeperator(<string>)
```
## Paragraph
```lua
local Paragraph = Tab:AddParagraph({
	Title = <string>,
	Content = <string>,
	Icon = <string>
})
```
- Paragraph Function
```lua
Paragraph:Set({
	Title = <string>,
	Content = <string>
})
```
## Button
```lua
local Button = Tab:AddButton({
	Title= <string>,
	Content = <string>,
	Logo = <string>,
	Callback = <function>
})
```
## Input
```lua
local Input = Tab:AddInput({
	Title = <string>,
	Icon = <string>,
	Callback = <function>
})
```
- Text Input Function
```lua
Input:Set(<string>)
```
## Toggle
```lua
local Toggle = Tab:AddToggle({
	Title = <string>,
	Content = <string>,
	Default = <boolean>,
	Callback = <function>
})
```
- Toggle Function
```lua
Toggle:Set(<boolean>)
print(Toggle.Value)
```
## Slider
```lua
local Slider = Tab:AddSlider({
	Title = <string>,
	Min = <number>,
	Max = <number>,
	Increment = <number>,
	Default = <number>,
	ValueName = <string>,
	Callback = <function>
})
```
- Slider Function
```lua
Slider:Set(<number>)
print(Slider.Value)
```
## Dropdown
```lua
local Dropdown = Tab:Dropdown({
    Title = <string>,
	Multi = false,
	Options = <table>,
	Default = <string>,
	Callback = <function>
})
```
- Dropdown Function
```lua
Dropdown:Clear()
Dropdown:AddOption(<string>)
Dropdown:Set(<table>)
Dropdown:Refresh(<table>, <table>)
print(unpack(Dropdown.Value))
print(unpack(Dropdown.Options))
```
## Multi Dropdown
```lua
local MultiDropdown = Tab:Dropdown({
    Title = <string>,
	Multi = true,
	Options = <table>,
	Default = <table>,
	Callback = <function>
})
```
- Multi Dropdown Function
```lua
MultiDropdown:Clear()
MultiDropdown:AddOption(<string>)
MultiDropdown:Set(<table>)
MultiDropdown:Refresh(<table>, <table>)
print(unpack(MultiDropdown.Value))
print(unpack(MultiDropdown.Options))
```
# Rimus Library: Images