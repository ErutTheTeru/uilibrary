# W-azure V1 Library (remake)
- made by Teru, discord: ruteteru
- any bug & error, report in https://discord.gg/3Aatp4Nhjp 
## How to use?
- Import the library
```lua
local WazureV1 = loadstring(game:HttpGet("https://github.com/ErutTheTeru/uilibrary/blob/main/Wazure%20V1%20Lib/Source.lua?raw=true"))()
```
- Create gui
```lua
local WazureGui = WazureV1:Start({
	["Name"] = "W-azure (Remake)",
	["Logo Player"] = "rbxassetid://18243105495",
	["Name Player"] = "ruteteru",
	["Tab Width"] = 120,
	["Color"] = Color3.fromRGB(6.000000117346644, 141.0000067949295, 234.00000125169754),
	["Custom Toggle"] = false,
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
```
- Now you can add items to the gui
- A [template](Example.lua) is given if you want to see how items done
# W-azure V1 Library (remake): Documentation
## Create gui
```lua
local WazureGui = WazureV1:Start({
	["Name"] = <string>,
	["Logo Player"] = <string>,
	["Name Player"] = <string>,
	["Tab Width"] = <number>,
	["Color"] = <userdata>,
	["Custom Toggle"] = <boolean>,
	["CloseCallBack"] = <function>
})
```
## Notification
```lua
local Notify = WazureV1:Notify({
	["Title"] = <string>,
	["Content"] = <string>,
	["Logo"] = <string>,
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
local MainTab = WazureGui:MakeTab(<string>)
```
## Seperator
```lua
local Seperator = MainTab:Seperator(<string>)
```
- Seperator Function
```lua
Seperator:Set(<string>)
print(Seperator.Value)
```
## Label
```lua
local Label = MainTab:Label(<string>)
```
- Label Function
```lua
Label:AutoSize()
Label:Set(<string>)
print(Label.Value)
```
## Button
```lua
local Button = MainTab:Button({
	["Title"]= <string>,
	["Content"] = <string>,
	["Logo"] = <string>,
	["Callback"] = <function>
})
```
## Text Input
```lua
local TextInput = MainTab:TextInput({
	["Title"]= <string>,
	["Content"] = <string>,
	["Callback"] = <function>
})
```
- Text Input Function
```lua
TextInput:Set(<string>)
print(TextInput.Value)
```
## Toggle
```lua
local Toggle = MainTab:Toggle({
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
## Setting for Toggle
```lua
local ToggleSetting = Toggle:AddSetting()
```
### Toggle of Setting
```lua
local SettingToggle = ToggleSetting:Toggle({
	["Name"]= <string>,
	["Default"] = <boolean>,
	["Callback"] = <function>
})
```
- Toggle of Setting Function
```lua
SettingToggle:Set(<boolean>)
print(SettingToggle.Value)
```
### Slider of Setting
```lua
local SliderSetting = ToggleSetting:Slider({
	["Name"]= <string>,
	["Min"] = <number>,
	["Max"] = <number>,
	["Increment"] = <number>,
	["Default"] = <number>,
	["Callback"] = <function>
})
```
- Slider of Setting Function
```lua
SliderSetting:Set(<number>)
print(SliderSetting.Value) 
```
## Slider
```lua
local Slider = MainTab:Slider({
	["Title"]= <string>,
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
local Dropdown = MainTab:Dropdown({
    ["Title"]= <string>,
	["Content"] = <string>,
	["Multi"] = <boolean>,
	["Options"] = <table>,
	["Default"] = <table>,
	["Callback"] = <function>
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
## Misc
- Close UI
```lua
WazureV1:CloseUI()
```
- Hide / Show UI
```lua
WazureV1:ToggleUI()
```
# W-azure V1 Library (remake): Images
![image](https://github.com/ErutTheTeru/uilibrary/assets/143543521/a6f6a576-e601-46cd-bf44-e46898ae7f24)
![image](https://github.com/ErutTheTeru/uilibrary/assets/143543521/cf21e96f-52ef-4d72-ac94-ae532c721759)
![image](https://github.com/ErutTheTeru/uilibrary/assets/143543521/adb39c70-7111-4825-8da1-69920bbf87bb)
![image](https://github.com/ErutTheTeru/uilibrary/assets/143543521/555bfd46-3240-496e-9a56-52308125dfc9)
