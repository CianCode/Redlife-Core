--[[
  This file is part of Redlife.
  Created at 17/12/2025 22:09

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

---@class _RedClient_KeyBind
_RedClient_KeyBind = {}

local canUse = false

_RedClient_KeyBind.addKey = function(defaultKey, desc, action)
    RegisterCommand(("+redlife_%s"):format(defaultKey), function(source, args)
        if (not (canUse)) then
            return
        end
        action(source)
    end)
    --[[
    RegisterCommand(("-redlife_%s"):format(defaultKey), function(source, args)
    end)
    --]]
    RegisterKeyMapping(("+redlife_%s"):format(defaultKey), desc, "keyboard", defaultKey)
end

_RedLife.onReceiveWithoutNet("nowPlaying", function()
    canUse = true
end)
