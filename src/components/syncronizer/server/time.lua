--[[
  This file is part of Redlife.
  Created at 17/12/2025 23:17

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

local time = _ConfigServer.Synchronizer.baseTime
local timeOverride
local running = false
local intervalForAMin = _ConfigServer.Synchronizer.time

local function incrementTime()
    time[2] = (time[2] + 1)
    if (time[2] >= 60) then
        time[2] = 0
        time[1] = (time[1] + 1)
        if (time[1] >= 24) then
            time[1] = 0
        end
    end
end

_RedServer_Synchronizer.createTimeThread = function()
    if (running) then
        return
    end
    running = true
    CreateThread(function()
        while (running) do
            Wait(intervalForAMin)
            incrementTime()
            _RedLife.toClients("synchronizer:setTime", _RedServer_Synchronizer.getTime())
        end
    end)
end

_RedServer_Synchronizer.destroyTimeThread = function()
    if (not (running)) then
        return
    end
    running = false
    _RedLife.log("Arrêt du synchronisateur de temps")
end

_RedServer_Synchronizer.isTimeSynchronizerRunning = function()
    return (running == true)
end

_RedServer_Synchronizer.getTime = function()
    return (timeOverride ~= nil and timeOverride or time)
end

_RedServer_Synchronizer.overrideTime = function(h, m)
    timeOverride = { h, m }
end

_RedLife.onReceive("synchronizer:getTime", function()
    local _src = source
    _RedLife.toClient("synchronizer:setTime", _src, _RedServer_Synchronizer.getTime())
end)
