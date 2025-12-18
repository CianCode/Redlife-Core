--[[
  This file is part of Redlife.
  Created at 18/12/2025 01:23

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedLife.onReceive("connected", function()
    local _src = tonumber(source)
    _RedServer_Players.loadData(_src, function(result)
        if (not (result)) then
            _RedLife.toInternal("players:newPlayer", _src)
        else
            _RedLife.toInternal("players:newLoadedPlayer", _src, result)
        end
    end)
end)
