---fileExists
---@param file string
---@return boolean
---@public
function GM.Utils:fileExists(file)
    local f = io.open(file, "rb")
    if f then
        f:close()
    end
    return f ~= nil
end

---fileRead
---@param file string
---@return string
---@public
function GM.Utils:fileRead(file)
    local f = io.open(file, "rb")
    local content = f:read("*all")
    f:close()
    return content
end

---fileWrite
---@param file string
---@public
function GM.Utils:fileWrite(file, text)
    local f = io.open(file, "w")
    f:write(text)
    f:close()
end