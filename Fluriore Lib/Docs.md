# Fluriore Library
made by Teru, discord: ruteteru
## How to use?
- Import the library.
```lua
local FlurioreLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ErutTheTeru/uilibrary/main/flurioremain.lua"))()
```
- Create gui
```lua
local FlurioreGui = FlurioreLib:MakeGui({
	["NameHub"] = "Fluriore UI",
	["Description"] = "made by Teru",
	["Color"] = Color3.fromRGB(255, 0, 255),
	["Logo Player"] = "https://www.roblox.com/headshot-thumbnail/image?userId="..game:GetService("Players").LocalPlayer.UserId .."&width=420&height=420&format=png",
	["Name Player"] = tostring(game:GetService("Players").LocalPlayer.Name),
	["Tab Width"] = 120
})
```
- Now you can add items to the gui
- A [template](Fluriore Lib/Example.lua) is given if you want to see how items done
# Fluriore Library: Document
## Create gui
```lua
local FlurioreGui = FlurioreLib:MakeGui({
	["NameHub"] = <string>,
	["Description"] = <string>,
	["Color"] = <userdata>,
	["Logo Player"] = <string>,
	["Name Player"] = <string>,
	["Tab Width"] = <number>
})
```
## Notifications
```lua
local Notify = FlurioreLib:MakeNotify({
	["Title"] = <string>,
	["Description"] = <string>,
	["Color"] = <userdata>,
	["Content"] = <string>,
	["Time"] = <number>,
	["Delay"] = <number>
})
```
- Notify Function
```lua
Notify:Close()
```
## Create Tab
```lua
local Tab = FlurioreGui:CreateTab({
	["Name"] = <string>,
	["Icon"] = <string>
})
```
## Section
```lua
local Section = Tab:AddSection(<string>)
```
## Paragraph
```lua
local Paragraph = Section:AddParagraph({
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
## Toggle
```lua
local Toggle = Section:AddToggle({
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
## Button
```lua
local Button = Section:AddButton({
	["Title"] = <string>,
	["Content"] = <string>,
	["Icon"] = <string>,
	["Callback"] = <function>
})
```
## Slider
```lua
local Slider = Section:AddSlider({
	["Title"] = <string>,
	["Content"] = <string>,
	["Min"] = <number>,
	["Max"] = <number>,
	["Increment"] = <number>,
	["Default"] = <number>,
	["Callback"] = <string>
})
```
- Slider Function
```lua
Slider:Set(<number>)
print(Slider.Value)
```
## Input
```lua
local Input = Section:AddInput({
	["Title"] = <string>,
	["Content"] = <string>,
	["Callback"] = <function>
})
```
- Input Function
```lua
Input:Set(<string>)
print(Input.Value)
```
## Dropdown
```lua
local Dropdown = Section:AddDropdown({
	["Title"] = <string>,
	["Content"] = <string>,
	["Multi"] = <boolean>,
	["Options"] = <table>,
	["Default"] = <string>,
	["Callback"] = <function>
})
```
- Dropdown Function
```lua
Dropdown:Set(<table>)
Dropdown:AddOption(<string>)
Dropdown:Clear()
Dropdown:Refresh(<table>, <table>)
print(unpack(Dropdown.Value))
print(unpack(Dropdown.Options))
```
## Misc
- Destroy Gui
```lua
FlurioreGui:DestroyGui()
```
- Hide / Show UI
```lua
FlurioreGui:ToggleUI()
```
# Fluriore Library: Images
![image](https://github.com/ErutTheTeru/uilibrary/assets/143543521/994ad756-7531-4e72-93fd-d8a24e55961f)
![image](https://github.com/ErutTheTeru/uilibrary/assets/143543521/2377fa90-7860-4f9e-945e-fd0c5943c3af)
![image](https://github.com/ErutTheTeru/uilibrary/assets/143543521/60e9a3f3-bcb0-4b36-9a0e-5006a24175fc)
![image](https://github.com/ErutTheTeru/uilibrary/assets/143543521/efe61b3c-2c24-4cb2-98c9-9ebbdd85bbc0)
