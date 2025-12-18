--[[
  This file is part of Redlife.
  Created at 17/12/2025 23:16

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

local running = false
local interval = _ConfigServer.Synchronizer.position

local function savePlayersPosition()
    ---@param player _Player
    for _, player in pairs(_RedServer_Players.getAll()) do
        player:savePosition()
    end
    _RedLife.log("Position de tous les joueurs sauvegardée")
end

_RedServer_Synchronizer.createPositionsThread = function()
    if (running) then
        return
    end
    running = true
    CreateThread(function()
        while (running) do
            Wait(interval)
            savePlayersPosition()
        end
    end)
end

_RedServer_Synchronizer.destroyPositionsThread = function()
    if (not (running)) then
        return
    end
    running = false
    _RedLife.log("Arrêt du synchronisateur de positions")
end

_RedServer_Synchronizer.isPositionsSynchronizerRunning = function()
    return (running == true)
end
