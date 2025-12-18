--[[
  This file is part of Redlife.
  Created at 18/12/2025 01:18

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

---@param player _Player
_RedServer_Players.getLightPlayer = function(_src)
    ---@type _Player
    local player = _RedServer_Players.get(_src)
    return (_LightPlayer(player.sId, player.flashId, player.identifier, player.identity, player.cash, player.skin, player.outfits, player.selectedOutfit, player.accessories, player.name, player.rpName))
end
