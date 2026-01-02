--[[
  This file is part of Redlife.
  Created at 02/01/2026 16:33

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedServer_Blips.createPublicInArea = function(position, sprite, color, size, label, shortRange, drawDist)
    local id = _RedServer_Blips.getNextId()
    local blip = _Blip(id, position, sprite, color, size, label, shortRange, drawDist, false)
    _RedServer_Blips.add(blip)
    return (id)
end
