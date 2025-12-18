--[[
  This file is part of Redlife.
  Created at 18/12/2025 01:24

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedLife.onReceive("players:onSpawn", function()
    local _src = source
    ---@type _Player
    local player = _RedServer_Players.get(_src)
    player:setSpawned()
    player:sendData()
    _RedLife.toClient("players:nowInGame", _src)
end)
