--[[
  This file is part of Redlife.
  Created at 18/12/2025 01:21

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

---@param player _Player
_RedLife.onReceiveWithoutNet("players:newLoadedPlayer", function(_src, data)
    _RedLife.log(("Le joueur ^5%s^7 s'est ^2connecté"):format(GetPlayerName(_src)))
    ---@param player _Player
    local player = _Player(_src, data.flashId, data.identifier, data.rankId, json.decode(data.identity), data.cash,
        json.decode(data.skin), json.decode(data.outfits), data.selectedOutfit, json.decode(data.accessories))
    _RedServer_Players.add(player)
    player:getDbPosition(function(position)
        _RedLife.toClient("spawn:spawn", _src, position, player.skin, player.outfits[player.selectedOutfit])
    end)
end)
