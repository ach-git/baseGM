---notify
---@public
---@param message string
function GM.Utils:notify(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(0,1)
end