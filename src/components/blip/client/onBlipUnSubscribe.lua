--[[
  This file is part of Redlife.
  Created at 02/01/2026 16:30

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedLife.onReceive("blip:unsubscribe", function(lightBlipId)
    _RedClient_Blip.remove(lightBlipId)
end)
