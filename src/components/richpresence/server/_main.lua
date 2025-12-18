--[[
  This file is part of Redlife.
  Created at 17/12/2025 23:19

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

---@class _RedServer_RichPresence
_RedServer_RichPresence = {}

_RedLife.onReceive("richpresence:getVersion", function()
    local _src = source
    local version = _RedServer_Versioning.getCurrentVersion()
    _RedLife.toClient("richpresence:cbVersion", _src, version)
end)

_RedLife.loadedComponent("richPresence")
