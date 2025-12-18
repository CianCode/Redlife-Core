--[[
  This file is part of Redlife.
  Created at 18/12/2025 01:22

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedLife.onReceiveWithoutNet("players:newPlayer", function(_src)
    local instance = _RedServer_Instances.setOnRandomInstance(_src)
    _RedLife.log(("Le joueur ^1%s^7 est nouveau (instance: ^3%s^7)"):format(GetPlayerName(_src), instance))
    _RedLife.toClient("creator:init", _src)
end)
