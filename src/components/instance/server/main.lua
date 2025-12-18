--[[
  This file is part of Redlife.
  Created at 17/12/2025 22:46

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

---@class _RedServer_Instances
_RedServer_Instances = {}

local public = 0

_RedServer_Instances.getPublicInstance = function()
    return (public)
end

_RedServer_Instances.setOnPublicInstance = function(_src)
    SetPlayerRoutingBucket(_src, public)
end

_RedServer_Instances.setOnRandomInstance = function(_src)
    local instance = math.random(1, 800000)
    SetRoutingBucketEntityLockdownMode(instance, "strict")
    SetPlayerRoutingBucket(_src, public)
    return (instance)
end

_RedServer_Instances.getPlayerInstance = function(_src)
    return (GetPlayerRoutingBucket(_src))
end

_RedServer_Instances.setOnInstance = function(_src, instance)
    SetRoutingBucketEntityLockdownMode(instance, "strict")
    SetPlayerRoutingBucket(_src, instance)
end

_RedLife.loadedComponent("instances")
