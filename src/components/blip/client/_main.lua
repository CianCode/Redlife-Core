--[[
  This file is part of Redlife.
  Created at 17/12/2025 23:38

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

---@class _RedClient_Blip
_RedClient_Blip = {}

_RedClient_Blip.radiusBlips = {}

local list = {}

_RedClient_Blip.getAmount = function()
    return (_RedUtils.table_count(list))
end

_RedClient_Blip.getAll = function()
    return (list)
end

_RedClient_Blip.get = function(blipId)
    return (list[blipId])
end

_RedClient_Blip.exists = function(blipId)
    return (list[blipId] ~= nil)
end

_RedClient_Blip.set = function(lightBlipId, lightBlip)
    if (_RedClient_Blip.exists(lightBlipId)) then
        lightBlip.handler = list[lightBlipId].handler
        list[lightBlipId] = lightBlip
        return
    end
    list[lightBlipId] = lightBlip
    _RedClient_Blip.createInGameBlip(lightBlip)
end

_RedClient_Blip.remove = function(blipId)
    _RedClient_Blip.destroyInGameBlip(blipId)
    list[blipId] = nil
end
