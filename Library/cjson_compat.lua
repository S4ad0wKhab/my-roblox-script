-- cjson_compat.lua
-- Simple wrapper for Lua-CJSON

local M = {}

local cjson

-- พยายามโหลด Lua-CJSON
local ok, result = pcall(require, "cjson")

if ok then
    cjson = result
else
    error("Lua-CJSON is not installed or cannot be loaded: " .. tostring(result))
end

-- JSON string -> Lua value
function M.decode(json)
    return cjson.decode(json)
end

-- Lua value -> JSON string
function M.encode(value)
    return cjson.encode(value)
end

-- ตรวจสอบว่าเป็น JSON ที่ decode ได้หรือไม่
function M.safe_decode(json)
    local ok, result = pcall(cjson.decode, json)

    if ok then
        return true, result
    end

    return false, result
end

-- ตรวจสอบว่า encode ได้หรือไม่
function M.safe_encode(value)
    local ok, result = pcall(cjson.encode, value)

    if ok then
        return true, result
    end

    return false, result
end

-- ส่งต่อฟังก์ชันของ Lua-CJSON
M.null = cjson.null
M.encode_sparse_array = cjson.encode_sparse_array
M.decode_max_depth = cjson.decode_max_depth
M.encode_max_depth = cjson.encode_max_depth
M.encode_invalid_numbers = cjson.encode_invalid_numbers
M.encode_number_precision = cjson.encode_number_precision
M.encode_keep_buffer = cjson.encode_keep_buffer

return M
