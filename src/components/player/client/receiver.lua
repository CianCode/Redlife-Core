--[[
  This file is part of Redlife.
  Created at 17/12/2025 22:32

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedLife.onReceive("players:nowInGame", function()
    _RedLife.setGameState(_RedEnum_GAMESTATE.PLAYING)
    _RedLife.log("Chargement complet effectué, bon jeu !")
end)
