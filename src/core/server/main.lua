--[[
  This file is part of RedLife.
  Created at 14/12/2025 12:15

  Copyright (c) RedLife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedLife.toClient = function(event, targetSrc, ...)
    TriggerClientEvent(_RedLife.format(event), targetSrc, ...)
    _RedLife.log(("Envoie d'un event au client (^3%i^7) ^6>^1 %s"):format(targetSrc, event))
end

_RedLife.toClients = function(event, ...)
    TriggerClientEvent(_RedLife.format(event), -1, ...)
    _RedLife.log(("Envoie d'un event aux clients ^6>^1 %s"):format(event))
end

_RedLife.serverResponded = function(target)
    _RedLife.toClient("serverResponded", target, true)
end

_RedLife.toClientExposed = function(event, targetSrc, ...)
    TriggerClientEvent(event, targetSrc, ...)
    _RedLife.log(("Envoie d'un event (^1Exposé^7) au client (^3%s^7) ^6>^1 %s"):format(targetSrc, event))
end

CreateThread(function()
    _RedLife.log(("Initialisation RedLife version ^0%s"):format(_RedServer_Versioning.getCurrentVersion()))
    _RedLife.log("Demarrage du serveur...")
    _RedLife.toInternal("loaded")
end)
