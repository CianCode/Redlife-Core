--[[
  This file is part of Redlife.
  Created at 17/12/2025 23:18

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

local weather = "EXTRASUNNY"
local weatherOverride
local running = false

local intervalForAChange = 60000

local function changeWeather()
    -- TODO → Meteo algorithm
end

_RedServer_Synchronizer.destroyWeatherThread = function()
    if (not (running)) then
        return
    end
    running = false
    _RedLife.log("Arrêt du synchronisateur de météo")
end

_RedServer_Synchronizer.isWeatherSynchronizerRunning = function()
    return (running == true)
end

_RedServer_Synchronizer.getWeather = function()
    return (weatherOverride ~= nil and weatherOverride or weather)
end

_RedServer_Synchronizer.overrideWeather = function(weather)
    weatherOverride = weather
end

_RedLife.onReceive("synchronizer:getWeather", function()
    local _src = source
    _RedLife.toClient("synchronizer:setWeather", _src, _RedServer_Synchronizer.getWeather())
end)
