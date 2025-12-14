--[[
  This file is part of RedLife.
  Created at 14/12/2025 12:15

  Copyright (c) RedLife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedServer_Utils.identifiers_getAll = function(_src)
    local identifiers = {}
    local playerIdentifiers = GetPlayerIdentifiers(_src)
    for _, v in pairs(playerIdentifiers) do
        local before, after = playerIdentifiers[_]:match("([^:]+):([^:]+)")
        identifiers[before] = playerIdentifiers[_]
    end
    return identifiers
end

_RedServer_Utils.identifiers_get = function(_src, type)
    return (_RedServer_Utils.identifiers_getAll(_src)[type] or "")
end
