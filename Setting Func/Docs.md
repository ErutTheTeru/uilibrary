# Setting Func for Teru's UI
- any bug & error, report in https://discord.gg/3Aatp4Nhjp 
- made by Teru, discord: ruteteru
## How to use?
- Import the functions
```lua
loadstring(game:HttpGet("https://github.com/ErutTheTeru/uilibrary/blob/main/Setting%20Func/Source.lua?raw=true"))()
```
- You can check another UI for example
# Setting Func: Documentation
## Save Setting
```lua
save(
    <string>, -- Folder Name
    <string>, -- File Name
    <table> -- Data
)
```
## Load Setting
```lua
loadsetting(
    <string>, -- Folder Name
    <string>, -- File Name
    <table> -- Old Data
)
```
## Read Data UI
```lua
readdata(
    <string>, -- Folder Name
    <string>, -- File Name
    <table> -- Old Data
)
```