---canInteract
---@param playerPos table
---@param targetPos table
---@return boolean
---@public
function GM.Utils:canInteract(playerPos, targetPos)
    if not playerPos or not targetPos then
        return false
    end
    return (#(playerPos - targetPos) <= 2.0)
end

---getClosetPlayer
---@return number, number
---@public
function GM.Utils:getClosetPlayer()
    local players = GetActivePlayers()
    local coords = GetEntityCoords(PlayerPedId())
    local pCloset = nil
    local pClosetPos = nil
    local pClosetDst = nil
    for k, v in pairs(players) do
        if GetPlayerPed(v) ~= PlayerPedId() then
            local oPed = GetPlayerPed(v)
            local oCoords = GetEntityCoords(oPed)
            local dst = GetDistanceBetweenCoords(oCoords, coords, true)
            if pCloset == nil then
                pCloset = v
                pClosetPos = oCoords
                pClosetDst = dst
            else
                if dst < pClosetDst then
                    pCloset = v
                    pClosetPos = oCoords
                    pClosetDst = dst
                end
            end
        end
    end
    return pCloset, pClosetDst
end