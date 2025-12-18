--[[
  This file is part of RedLife.
  Created at 14/12/2025 12:15

  Copyright (c) RedLife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

gameType = _RedEnum_GAMETYPE.RP
gameState = _RedEnum_GAMESTATE.WAITING

isAllowedToInteract = true
isWaitingForServer = false

_RedLife.setGameState = function(newGameState)
    gameState = newGameState
    if (gameState == _RedEnum_GAMESTATE.PLAYING) then
        _RedLife.toInternal("nowPlaying")
    end
end

_RedLife.setIsWaitingForServer = function(newState)
    isWaitingForServer = newState
    if (isWaitingForServer) then
        CreateThread(function()
            _RedClient_Utils.loading_show("En attente du serveur", 4)
            while (isWaitingForServer) do
                Wait(1)
            end
            _RedClient_Utils.loading_hide()
        end)
    end
end

_RedLife.toServer = function(event, ...)
    TriggerServerEvent(_RedLife.format(event), ...)
    _RedLife.log(("Envoie d'un event au serveur ^6>^1 %s"):format(event))
end

_RedLife.onReceive("serverReturnedCb", function()
    _RedLife.setIsWaitingForServer(false)
end)

CreateThread(function()
    _RedLife.log("Demarrage du client...")
    _RedLife.toInternal("loaded")
    while (true) do
        Wait(1)
        if (NetworkIsPlayerActive(PlayerId())) then
            _RedLife.toInternal("joined")
            break
        end
    end
end)

_RedLife.log("Bienvenue sur ^1RedLife ^7!")
