--[[
  This file is part of Redlife.
  Created at 02/01/2026 16:30

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedClient_Blip.destroyInGameBlip = function(blipId)
    if (not (_RedClient_Blip.exists(blipId))) then
        return
    end
    local blip = _RedClient_Blip.get(blipId)
    if (not (blip.handler)) then
        return
    end
    local radiusBlip = _RedClient_Blip.radiusBlips[blip.handler]
    if (radiusBlip) then
        RemoveBlip(radiusBlip)
        _RedClient_Blip.radiusBlips[blip.handler] = nil
    end
    RemoveBlip(blip.handler)
end
