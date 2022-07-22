---kick
---@param target number
---@param staff string
---@param reason string
---@public
function GM.Admin:kick(target, staff, reason)
    if not GMPlayerManager:playerExists(target) then
        return
    end
    DropPlayer(target, ("You have been kicked by %s for %s"):format(staff, reason))
end