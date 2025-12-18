--[[
  This file is part of Redlife.
  Created at 17/12/2025 23:09

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

local overrideWeather

local currentWeather = "EXTRASUNNY"

local function doTrails()
    if (currentWeather == "XMAS") then
        SetForceVehicleTrails(true)
        SetForcePedFootstepsTracks(true)
    else
        SetForceVehicleTrails(false)
        SetForcePedFootstepsTracks(false)
    end
end

local function setWeather(newWeather)
    SetWeatherTypeOverTime(currentWeather, 3.5)
    Wait(3500)
    ClearOverrideWeather()
    ClearWeatherTypePersist()
    SetWeatherTypePersist(newWeather)
    SetWeatherTypeNow(newWeather)
    SetWeatherTypeNowPersist(newWeather)
    currentWeather = newWeather
    doTrails()
end

local function setWeatherNow(weather)
    ClearOverrideWeather()
    ClearWeatherTypePersist()
    SetWeatherTypeNow(weather)
    SetWeatherTypePersist(weather)
    SetWeatherTypeNowPersist(weather)
    currentWeather = newWeather
    doTrails()
end

_RedClient_Synchronizer.destroyWeatherOverride = function()
    overrideWeather = nil
    _RedLife.toServer("synchronizer:getWeather")
end

_RedClient_Synchronizer.setWeatherOverride = function(weather)
    overrideWeather = weather
    setWeatherNow(weather)
end

_RedLife.onReceiveWithoutNet("joined", function()
    _RedLife.toServer("synchronizer:getWeather")
end)


_RedLife.onReceive("synchronizer:setWeather", function(weather)
    if (overrideWeather ~= nil) then
        return
    end
    setWeather(weather)
end)
