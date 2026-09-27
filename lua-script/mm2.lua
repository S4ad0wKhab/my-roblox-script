local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/S4ad0wKhab/my-roblox-script/refs/heads/main/Library/kavo_library.lua"))()

local Window = Library.CreateLib("TITLE", "DarkTheme")

local Tab = Window:NewTab("TabName")
local Section = Tab:NewSection("Section Name")
Section:NewLabel("LabelText")

local Section = Tab:NewSection("Section Name")
Section:NewButton("ButtonText", "ButtonInfo", function()
    print("Clicked")
end)
