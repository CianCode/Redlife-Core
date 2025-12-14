--[[
  This file is part of RedLife.
  Created at 14/12/2025 12:15

  Copyright (c) RedLife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

---@class _RedServer_Versioning
_RedServer_Versioning = {}

local version = _Config.version

_RedServer_Versioning.getCurrentVersion = function()
    return (version)
end

_RedLife.loadedComponent("versioning")
