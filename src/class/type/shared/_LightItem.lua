--[[
  This file is part of Redlife.
  Created at 18/12/2025 01:16

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

---@class _LightItem
---@field public id number
---@field public label string
---@field public description string
---@field public weight number
---@field public usable boolean
_LightItem = {}
_LightItem.__index = _LightItem

setmetatable(_LightItem, {
    __call = function(_, id, label, description, weight, usable)
        local self = setmetatable({}, _LightItem)
        self.id = id
        self.label = label
        self.description = description
        self.weight = weight
        self.usable = usable
        return self
    end
})
