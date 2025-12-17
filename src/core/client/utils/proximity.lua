--[[
  This file is part of Redlife.
  Created at 16/12/2025 23:53

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedClient_Utils.proximity_canInteract = function(closestPlayerData)
    return (closestPlayerData[1] ~= nil and closestPlayerData[2] <= 2.0)
end

_RedClient_Utils.proximity_getClosestPlayerId = function(closestPlayerData)
    return (GetPlayerServerId(closestPlayerData[1]))
end

_RedClient_Utils.proximity_getClosestVehicle = function()
    local pCoords = GetEntityCoords(PlayerPedId())
    local closestVehicle, closestDistance = nil, 0
    for vehicle in (_RedClient_Utils.entityiter_vehicles()) do
        local dst = #(GetEntityCoords(vehicle) - pCoords)
        if (dst > 0.0) then
            if (not (closestVehicle)) then
                closestVehicle = vehicle
                closestDistance = dst
            end
            if (dst < closestDistance) then
                closestVehicle = vehicle
                closestDistance = dst
            end
        end
    end
    return closestVehicle, closestDistance
end

_RedClient_Utils.proximity_getClosestPlayer = function()
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

-- Get all the closest players
_RedClient_Utils.proximity_getAllClosestPlayers = function()
    local players = GetActivePlayers()
    local coords = GetEntityCoords(PlayerPedId())
    local allClosest = {}
    for k, v in pairs(players) do
        if GetPlayerPed(v) ~= PlayerPedId() then
            local oPed = GetPlayerPed(v)
            local oCoords = GetEntityCoords(oPed)
            local dst = GetDistanceBetweenCoords(oCoords, coords, true)
            table.insert(allClosest, { v, dst })
        end
    end
    table.sort(allClosest, function(a, b) return a[2] < b[2] end)
    return allClosest
end
