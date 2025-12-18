--[[
  This file is part of Redlife.
  Created at 18/12/2025 01:27

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedLife.onReceive("player:requestSave", function()
    local _src = source
    if (not (_RedServer_Players.exists(_src))) then
        _RedLife.err(("Tentative de save sur un player inexistant (^3%s^7)"):format(_src))
        return
    end
    ---@type _Player
    local player = _RedServer_Players.get(_src)
    player:savePosition()
    player:saveData()
    player:serverResponded()
    player:sendSystemMessage("success", "Vos informations ont été sauvegardées")
end)
