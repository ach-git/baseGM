---@author ach-git

---@type table
local banList = {}

---isBanned
---@param banIdentifier string
---@return boolean
---@public
function GM.Admin:isBanned(banIdentifier)
    return (banList[banIdentifier] ~= nil)
end

---banOutdated
---@param banIdentifier string
---@return boolean
---@public
function GM.Admin:banOutdated(banIdentifier)
    return (banList[banIdentifier].time >= os.time())
end


---banTime
---@param banIdentifier string
---@return number
---@public
function GM.Admin:banTime(banIdentifier)
    if not self:banOutdated(banIdentifier) then
        return 0
    end
    return (banList[banIdentifier].time - os.time())
end

---addBan
---@param target table
---@param time number
---@param reason string
---@param staff string
---@public
function GM.Admin:addBan(target, time, reason, staff)
    if self:isBanned(target.identifier) then
        return
    end
    GM:trace(("%s has been banned by %s for %s"):format(target.identifier, staff, reason))
    banList[target.identifier] = {
        target = target,
        time = os.time() + time,
        reason = reason,
        staff = staff
    }
    GM.Utils:fileWrite(("resources/%s/data/ban.json"):format(GetCurrentResourceName()), json.encode(banList))
end

---removeBan
---@param banIdentifier string
---@param staff string
---@public
function GM.Admin:removeBan(banIdentifier, staff)
    if not self:isBanned(banIdentifier) then
        return
    end
    GM:trace(("%s has been unbanned by %s"):format(banList[banIdentifier].target.name, staff))
    banList[banIdentifier] = nil
    GM.Utils:fileWrite(("resources/%s/data/ban.json"):format(GetCurrentResourceName()), json.encode(banList))
end

GM:handleEvent("gmStarted", function()
    if GM.Utils:fileExists(("resources/%s/data/ban.json"):format(GetCurrentResourceName())) then
        GM.Utils:fileWrite(("resources/%s/data/ban.json"):format(GetCurrentResourceName()), json.encode(banList))
    else
        banList = GM.Utils:fileRead(("resources/%s/data/ban.json"):format(GetCurrentResourceName()))
    end
    GM:trace("Load ban list: "..json.encode(banList))
end)