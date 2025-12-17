--[[
  This file is part of Redlife.
  Created at 16/12/2025 23:44

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedClient_Utils.animation_load = function(dict)
     RequestAnimDict(dict)
     while not HasAnimDictLoaded(dict) do
        Wait(1)
     end
end

_RedClient_Utils.process_load = function(name)
    RequestAnimSet(name)
    while not HasAnimSetLoaded(name) do
        Wait(1)
    end
end
