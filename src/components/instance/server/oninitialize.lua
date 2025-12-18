--[[
  This file is part of Redlife.
  Created at 17/12/2025 22:47

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedLife.onReceiveWithoutNet("loaded", function()
    SetRoutingBucketEntityLockdownMode(_RedServer_Instances.getPublicInstance(), _ConfigServer.Citizens.lockdown and "strict" or "inactive")
end)
