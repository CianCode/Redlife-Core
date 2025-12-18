--[[
  This file is part of Redlife.
  Created at 18/12/2025 01:26

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedServer_Players.register = function(_src, infos)
    local outfits = { ["Tenue d'arrivée"] = infos.outfit }
    local license = _RedServer_Utils.identifiers_get(_src, "steam")
    _RedServer_Database.insert(
        "INSERT INTO red_players (identifier, identity, cash, skin, outfits, selectedOutfit, accessories) VALUES(@identifier, @identity, @cash, @skin, @outfits, @selectedOutfit, @accessories)",
        {
            ["identifier"] = license,
            ["identity"] = json.encode(infos.identity),
            ["cash"] = _ConfigServer.Start.cash,
            ["skin"] = json.encode(infos.skin),
            ["outfits"] = json.encode(outfits),
            ["selectedOutfit"] = "Tenue d'arrivée",
            ["accessories"] = json.encode({})
        }, function(redId)
            ---@type _Player
            local player = _Player(_src, redId, license, infos.identity, _ConfigServer.Start.cash, infos.skin, outfits,
            "Tenue d'arrivée", {})
            _RedServer_Players.add(player)
            _RedLife.toInternal("creator:playerRegistered", _src)
            -- TODO -> Send back infos
            _RedServer_Database.insert(
                "INSERT INTO red_players_positions (redId, position) VALUES(@redId, @position)", {
                    ["redId"] = redId,
                    ["position"] = json.encode(_ConfigServer.Start.startPosition)
                })
            _RedServer_Database.insert(
                "INSERT INTO red_players_identifiers (redId, license, steam, live, xbl, discord, endpoint) VALUES(@redId, @license, @steam, @live, @xbl, @discord, @endpoint)",
                {
                    ["redId"] = redId,
                    ["license"] = _RedServer_Utils.identifiers_get(_src, "license"),
                    ["steam"] = _RedServer_Utils.identifiers_get(_src, "steam"),
                    ["live"] = _RedServer_Utils.identifiers_get(_src, "live"),
                    ["xbl"] = _RedServer_Utils.identifiers_get(_src, "xbl"),
                    ["discord"] = _RedServer_Utils.identifiers_get(_src, "discord"),
                    ["endpoint"] = _RedServer_Utils.identifiers_get(_src, "ip")
                })
        end)
end
