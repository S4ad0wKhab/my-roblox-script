-- luac_loader.lua
-- Lua 5.1 bytecode loader

local Loader = {}

-- โหลด .luac จากไฟล์
function Loader.load_file(path)
    local file, err = io.open(path, "rb")

    if not file then
        return nil, err
    end

    local bytecode = file:read("*a")
    file:close()

    if not bytecode or #bytecode == 0 then
        return nil, "empty bytecode"
    end

    local chunk, load_err = loadstring(bytecode, "@" .. path)

    if not chunk then
        return nil, load_err
    end

    return chunk
end

-- รัน .luac
function Loader.run_file(path, ...)
    local chunk, err = Loader.load_file(path)

    if not chunk then
        return false, err
    end

    return pcall(chunk, ...)
end

-- โหลด bytecode จาก string
function Loader.load(bytecode, name)
    if type(bytecode) ~= "string" then
        return nil, "bytecode must be a string"
    end

    return loadstring(bytecode, name or "bytecode")
end

-- รัน bytecode จาก string
function Loader.run(bytecode, name, ...)
    local chunk, err = Loader.load(bytecode, name)

    if not chunk then
        return false, err
    end

    return pcall(chunk, ...)
end

return Loader
