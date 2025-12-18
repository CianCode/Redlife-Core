--[[
  This file is part of Redlife.
  Created at 18/12/2025 12:00

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

-- /car [model] - Spawn a vehicle and teleport into it
RegisterCommand("car", function(_src, args)
    if (_src == 0) then
        return
    end
    if (#args < 1) then
        _RedLife.toClient("notifications:error", _src, _RedServer_Commands.usage("car", { "model" }, true))
        return
    end
    local model = args[1]:lower()
    local hash = GetHashKey(model)
    local ped = GetPlayerPed(_src)
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    
    -- Server-side vehicle creation (OneSync)
    local vehicle = CreateVehicleServerSetter(hash, "automobile", coords.x, coords.y, coords.z + 0.5, heading)
    
    while not DoesEntityExist(vehicle) do
        Wait(0)
    end
    
    -- Give ownership to the player who spawned it
    local netId = NetworkGetNetworkIdFromEntity(vehicle)
    SetEntityOwner(vehicle, _src)
    
    _RedLife.toClient("commands:car:enterVehicle", _src, netId)
end)

-- Event to enter the spawned vehicle on client
_RedLife.onReceive("commands:car:spawned", function(_src, netId)
    -- Callback when client has entered the vehicle
end)

-- /dv - Delete the vehicle you're in or the closest one
RegisterCommand("dv", function(_src, args)
    if (_src == 0) then
        return
    end
    _RedLife.toClient("commands:car:delete", _src)
end)

-- /repair - Repair the vehicle you're in or the closest one
RegisterCommand("repair", function(_src, args)
    if (_src == 0) then
        return
    end
    _RedLife.toClient("commands:car:repair", _src)
end)

-- /carmax - Max upgrade the vehicle you're in or the closest one
RegisterCommand("carmax", function(_src, args)
    if (_src == 0) then
        return
    end
    _RedLife.toClient("commands:car:max", _src)
end)

_RedLife.loadedAddon("commands/car")
