--[[
  This file is part of Redlife.
  Created at 18/12/2025 12:00

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

local function getMyVehicleOrClosest()
    local myVehicle = nil
    if (IsPedInAnyVehicle(PlayerPedId(), false)) then
        myVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    end
    if (myVehicle ~= nil) then
        return myVehicle
    end
    local closestVehicle, closestDistance = _RedClient_Utils.proximity_getClosestVehicle()
    if (closestVehicle ~= nil and closestDistance <= 10.0) then
        return closestVehicle
    end
    return nil
end

-- Spawn a vehicle (fallback client-side)
_RedLife.onReceive("commands:car:spawn", function(model, teleport)
    local hash = GetHashKey(model)
    if (not (IsModelValid(hash))) then
        _RedClient_Utils.notifications_template_error("Modèle de véhicule invalide")
        return
    end
    _RedClient_Utils.memory_load(model)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    
    -- Request control before spawning
    local vehicle = CreateVehicle(hash, coords.x, coords.y, coords.z + 0.5, heading, true, true)
    
    -- Wait for vehicle to exist
    local timeout = GetGameTimer() + 5000
    while not DoesEntityExist(vehicle) do
        if GetGameTimer() > timeout then
            _RedClient_Utils.notifications_template_error("Erreur lors de la création du véhicule")
            return
        end
        Wait(0)
    end
    
    -- Request network control
    local netId = NetworkGetNetworkIdFromEntity(vehicle)
    SetNetworkIdCanMigrate(netId, true)
    SetEntityAsMissionEntity(vehicle, true, true)
    
    -- Wait for network
    timeout = GetGameTimer() + 3000
    while not NetworkDoesNetworkIdExist(netId) do
        if GetGameTimer() > timeout then
            break
        end
        Wait(0)
    end
    
    -- Set vehicle properties
    SetVehicleOnGroundProperly(vehicle)
    SetVehicleHasBeenOwnedByPlayer(vehicle, true)
    SetVehicleNeedsToBeHotwired(vehicle, false)
    SetModelAsNoLongerNeeded(hash)
    SetVehRadioStation(vehicle, "OFF")
    
    if (teleport) then
        SetPedIntoVehicle(ped, vehicle, -1)
    end
    _RedClient_Utils.notifications_template_success(("Véhicule ~y~%s~s~ créé"):format(model))
end)

-- Enter vehicle spawned by server
_RedLife.onReceive("commands:car:enterVehicle", function(netId)
    local ped = PlayerPedId()
    local timeout = GetGameTimer() + 5000
    
    -- Wait for the vehicle to exist on client
    while not NetworkDoesNetworkIdExist(netId) do
        if GetGameTimer() > timeout then
            _RedClient_Utils.notifications_template_error("Erreur lors de la création du véhicule")
            return
        end
        Wait(0)
    end
    
    local vehicle = NetworkGetEntityFromNetworkId(netId)
    
    -- Wait for entity to exist
    timeout = GetGameTimer() + 3000
    while not DoesEntityExist(vehicle) do
        vehicle = NetworkGetEntityFromNetworkId(netId)
        if GetGameTimer() > timeout then
            _RedClient_Utils.notifications_template_error("Erreur lors de la récupération du véhicule")
            return
        end
        Wait(0)
    end
    
    -- Set vehicle properties
    SetVehicleOnGroundProperly(vehicle)
    SetVehicleHasBeenOwnedByPlayer(vehicle, true)
    SetVehicleNeedsToBeHotwired(vehicle, false)
    SetVehRadioStation(vehicle, "OFF")
    
    -- Enter the vehicle
    SetPedIntoVehicle(ped, vehicle, -1)
    _RedClient_Utils.notifications_template_success("Véhicule créé")
end)

-- Delete vehicle
_RedLife.onReceive("commands:car:delete", function()
    local vehicle = getMyVehicleOrClosest()
    if (vehicle == nil) then
        _RedClient_Utils.notifications_template_error("Aucun véhicule à supprimer")
        return
    end
    local ped = PlayerPedId()
    if (IsPedInAnyVehicle(ped, false) and GetVehiclePedIsIn(ped, false) == vehicle) then
        TaskLeaveVehicle(ped, vehicle, 16)
        Wait(500)
    end
    SetEntityAsMissionEntity(vehicle, false, true)
    DeleteVehicle(vehicle)
    _RedClient_Utils.notifications_template_success("Véhicule supprimé")
end)

-- Repair vehicle
_RedLife.onReceive("commands:car:repair", function()
    local vehicle = getMyVehicleOrClosest()
    if (vehicle == nil) then
        _RedClient_Utils.notifications_template_error("Aucun véhicule à réparer")
        return
    end
    SetVehicleFixed(vehicle)
    SetVehicleDeformationFixed(vehicle)
    SetVehicleEngineHealth(vehicle, 1000.0)
    SetVehicleBodyHealth(vehicle, 1000.0)
    SetVehiclePetrolTankHealth(vehicle, 1000.0)
    SetVehicleDirtLevel(vehicle, 0.0)
    _RedClient_Utils.notifications_template_success("Véhicule réparé")
end)

-- Max upgrade vehicle
_RedLife.onReceive("commands:car:max", function()
    local vehicle = getMyVehicleOrClosest()
    if (vehicle == nil) then
        _RedClient_Utils.notifications_template_error("Aucun véhicule à améliorer")
        return
    end
    _RedClient_Utils.vehicle_applyMaxProperties(vehicle)
    _RedClient_Utils.notifications_template_success("Véhicule amélioré au maximum")
end)

_RedLife.loadedAddon("commands/car")
