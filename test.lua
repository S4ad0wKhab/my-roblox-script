local loader = loadstring(game:HttpGet("https://raw.githubusercontent.com/S4ad0wKhab/my-roblox-script/refs/heads/main/Library/luac_loader.lua"))()

local bytecode, status = http.request(
    "https://example.com/program.luac"
)

local chunk, err = loader.load(bytecode, "@remote.luac")

chunk()
