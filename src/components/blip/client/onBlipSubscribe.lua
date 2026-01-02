--[[
  This file is part of Redlife.
  Created at 02/01/2026 16:30

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

---@param lightBlip _LightBlip
_RedLife.onReceive("blip:subscribe", function(lightBlip)
    lightBlip = _LightBlip(lightBlip.id, lightBlip.position, lightBlip.sprite, lightBlip.color, lightBlip.size,
        lightBlip.label, lightBlip.shortRange, lightBlip.visualData)
    _RedClient_Blip.set(lightBlip.id, lightBlip)
end)
