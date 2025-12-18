--[[
  This file is part of Redlife.
  Created at 18/12/2025 01:17

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

---@class _RedServer_Players
_RedServer_Players = {}

local list = {}

---@param player _Player
_RedServer_Players.isNew = function(player)
    return (player.identity == nil)
end

_RedServer_Players.exists = function(playerId)
    return (list[playerId] ~= nil)
end

_RedServer_Players.existsInDb = function(_src)
    local license = _RedServer_Utils.identifiers_get(_src, "steam")
    _RedServer_Database.query("SELECT * FROM red_players WHERE identifier = @identifier", { ["identifier"] = license },
        function(result)
            return (result[1] ~= nil)
        end)
end

_RedServer_Players.get = function(playerId)
    if (not (_RedServer_Players.exists(playerId))) then
        return nil
    end
    return (list[playerId])
end

_RedServer_Players.getAll = function()
    return (list)
end

---@param player _Player
_RedServer_Players.add = function(player)
    --_RedLife.log(("^2Ajout ^7d'un ^6PLAYER ^7id: ^3%s"):format(player.sId))
    list[player.sId] = player
end

_RedServer_Players.remove = function(playerId)
    --_RedLife.log(("^1Suppression ^7d'un ^6PLAYER ^7id: ^3%s"):format(list[playerId].sId))
    list[playerId] = nil
end

_RedServer_Players.loadData = function(_src, cb)
    local identifier = _RedServer_Utils.identifiers_get(_src, "steam")
    _RedServer_Database.query("SELECT * FROM red_players WHERE identifier = @identifier",
        { ["identifier"] = identifier }, function(result)
            cb(result[1])
        end)
end

_RedLife.loadedComponent("player")
