--[[
  This file is part of Redlife.
  Created at 02/01/2026 16:34

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedLife.onReceiveWithoutNetExposed("playerDropped", function()
    local _src = source
    ---@param blip _Blip
    for _, blip in pairs(_RedServer_Blips.getAll()) do
        if (blip:isAllowed(_src)) then
            blip:removeAllowed(_src)
        end
        if (blip:isSubscribed(_src)) then
            blip:unsubscribe(_src, true)
        end
    end
end)
