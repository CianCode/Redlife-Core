--[[
  This file is part of Redlife.
  Created at 17/12/2025 23:09

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

local overrideTime

local function setTime(timeTable)
    local h, m = timeTable[1], timeTable[2]
    NetworkOverrideClockTime(h, m, 00)
end

_RedClient_Synchronizer.destroyTimeOverride = function()
    overrideTime = nil
    _RedLife.toServer("synchronizer:getTime")
end

_RedClient_Synchronizer.setTimeOverride = function(timeTable)
    overrideTime = timeTable
    setTime(timeTable)
end

_RedLife.onReceiveWithoutNet("joined", function()
    _RedLife.toServer("synchronizer:getTime")
end)

_RedLife.onReceive("synchronizer:setTime", function(timeTable)
    if (overrideTime ~= nil) then
        return
    end
    setTime(timeTable)
end)
