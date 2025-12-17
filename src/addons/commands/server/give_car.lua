--[[
  This file is part of Redlife.
  Created at 17/12/2025 00:09

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

---@description Command to spawn a vehicle for a player
---@usage /givecar [model] - Spawns a vehicle with the specified model name
---@example /givecar adder - Spawns an Adder supercar

RegisterCommand("givecar", function(source, args, rawCommand)
    local _src = source

    -- Check if a vehicle model was provided
    if not args[1] then
        TriggerClientEvent("chat:addMessage", _src, {
            color = { 255, 0, 0 },
            multiline = true,
            args = { "[RedLife]", "Utilisation: /givecar [modèle]" }
        })
        return
    end

    local vehicleModel = args[1]

    -- Trigger client event to spawn the vehicle
    TriggerClientEvent(_RedLife.format("command:spawnVehicle"), _src, vehicleModel)

    _RedLife.log(("Joueur ^3%s^7 a demandé un véhicule: ^2%s"):format(_src, vehicleModel))
end, false)

_RedLife.loadedAddon("commands/give_car")
