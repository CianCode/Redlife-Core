--[[
  This file is part of Redlife.
  Created at 16/12/2025 23:45

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

local controlsEnabled = true

local function createControlsDisabler()
    controlsEnabled = false
    CreateThread(function()
        while (not (controlsEnabled)) do
            Wait(1)
            DisableAllControlActions(0)
            DisableAllControlActions(1)
        end
    end)
end

_RedClient_Utils.controls_disable = function()
    if (not (controlsEnabled)) then
        return
    end
    createControlsDisabler()
end

_RedClient_Utils.controls_getCamDirection = function()
    local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
    local pitch = GetGameplayCamRelativePitch()
    local coords = vector3(-math.sin(heading * math.pi / 180.0), math.cos(heading * math.pi / 180.0),
        math.sin(pitch * math.pi / 180.0))
    local len = math.sqrt((coords.x * coords.x) + (coords.y * coords.y) + (coords.z * coords.z))

    if len ~= 0 then
        coords = coords / len
    end

    return coords
end
