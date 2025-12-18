--[[
  This file is part of Redlife.
  Created at 17/12/2025 23:16

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedServer_Synchronizer = {}

_RedLife.onReceiveWithoutNet("loaded", function()
    _RedServer_Synchronizer.createTimeThread()
    _RedServer_Synchronizer.createPositionsThread()
end)

_RedLife.loadedComponent("synchronizer")
