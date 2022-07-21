AddEventHandler("dbConnected", function()
    GM:trace("Database connected")
    GM:triggerEvent("databaseReady")
end)