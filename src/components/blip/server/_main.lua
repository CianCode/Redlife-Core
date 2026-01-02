--[[
  This file is part of Redlife.
  Created at 17/12/2025 23:38

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

---@class _RedServer_Blips
_RedServer_Blips = {}

local list = {}

_RedServer_Blips.set = function(id, blip)
    list[id] = blip
end

_RedServer_Blips.add = function(blip)
    _RedServer_Blips.set(blip.id, blip)
end

_RedServer_Blips.remove = function(id)
    list[id] = nil
end

_RedServer_Blips.getAmount = function()
    return (_RedUtils.table_count(list))
end

_RedServer_Blips.getAll = function()
    return (list)
end

_RedServer_Blips.get = function(blipId)
    return (list[blipId])
end

_RedServer_Blips.exists = function(blipId)
    return (list[blipId] ~= nil)
end

_RedServer_Blips.getNextId = function()
    return (_RedServer_Blips.getAmount() + 1)
end
