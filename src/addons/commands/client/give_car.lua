--[[
  This file is part of Redlife.
  Created at 17/12/2025 00:09

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

---@description Client-side vehicle spawning handler

_RedLife.onReceive("command:spawnVehicle", function(vehicleModel)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local playerHeading = GetEntityHeading(playerPed)

    -- Get the vehicle hash
    local vehicleHash = GetHashKey(vehicleModel)

    -- Check if the model is valid
    if not IsModelInCdimage(vehicleHash) or not IsModelAVehicle(vehicleHash) then
        TriggerEvent("chat:addMessage", {
            color = { 255, 0, 0 },
            multiline = true,
            args = { "[RedLife]", "Modèle de véhicule invalide: " .. vehicleModel }
        })
        return
    end

    -- Request the model
    RequestModel(vehicleHash)
    while not HasModelLoaded(vehicleHash) do
        Wait(10)
    end

    -- Delete the current vehicle if the player is in one
    local currentVehicle = GetVehiclePedIsIn(playerPed, false)
    if currentVehicle ~= 0 then
        DeleteEntity(currentVehicle)
    end

    -- Spawn the vehicle
    local vehicle = CreateVehicle(vehicleHash, playerCoords.x, playerCoords.y, playerCoords.z, playerHeading, true, false)

    -- Set the player into the vehicle
    SetPedIntoVehicle(playerPed, vehicle, -1)

    -- Set vehicle properties
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleHasBeenOwnedByPlayer(vehicle, true)
    SetVehicleNeedsToBeHotwired(vehicle, false)
    SetModelAsNoLongerNeeded(vehicleHash)
    SetVehicleOnGroundProperly(vehicle)

    -- Optional: Give the vehicle a random plate
    SetVehicleNumberPlateText(vehicle, "REDLIFE")

    TriggerEvent("chat:addMessage", {
        color = { 0, 255, 0 },
        multiline = true,
        args = { "[RedLife]", "Véhicule " .. vehicleModel .. " créé avec succès!" }
    })

    _RedLife.log(("Véhicule ^2%s^7 créé"):format(vehicleModel))
end)

_RedLife.loadedAddon("commands/give_car")
