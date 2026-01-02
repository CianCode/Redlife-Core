--[[
  This file is part of Redlife.
  Created at 02/01/2026 16:27

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

---@class _LightBlip
---@field public id number
---@field public position table
---@field public sprite number
---@field public color number
---@field public size number
---@field public label string
---@field public shortRange boolean
---@field public visualData table
_LightBlip = {}
_LightBlip.__index = _LightBlip

setmetatable(_LightBlip, {
    __call = function(_, id, position, sprite, color, size, label, shortRange, visualData)
        local self = setmetatable({}, _LightBlip)
        self.id = id
        self.position = position
        self.sprite = sprite
        self.color = color
        self.size = size
        self.label = label
        self.shortRange = shortRange
        self.visualData = visualData
        return (self)
    end
})
