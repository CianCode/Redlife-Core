--[[
  This file is part of Redlife.
  Created at 18/12/2025 01:23

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedLife.onReceiveWithoutNetExposed("playerDropped", function()
    local _src = source
    ---@type _Player
    if (not (_RedServer_Players.exists(_src))) then
        return
    end
    ---@type _Player
    print(_src)
    local player = _RedServer_Players.get(_src)
    print(json.encode(player))
    player:saveData()
    player:savePosition()
    if (_RedServer_Players.exists(_src)) then
        _RedLife.log(("Le joueur ^5%s^7 s'est ^1déconnecté"):format(player.name))
        _RedServer_Players.remove(_src)
    end
end)
