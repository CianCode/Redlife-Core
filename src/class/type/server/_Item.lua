--[[
  This file is part of Redlife.
  Created at 17/12/2025 22:52

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

---@class _Item
---@field public id number
---@field public label string
---@field public description string
---@field public weight number
---@field public onUse function
_Item = {}
_Item.__index = _Item

setmetatable(_Item, {
    __call = function(_, id, label, description, weight, onUse)
        local self = setmetatable({}, _Item)
        self.id = id
        self.label = label
        self.description = description
        self.weight = weight
        self.onUse = onUse
        return self
    end
})

function _Item:getIsUsable()
    return (self.onUse ~= nil)
end

function _Item:use(_src)
    if (not (self:getIsUsable())) then
        _RedLife.err(("Tentative d'usage d'un item non utilisable (^3%s^7)"):format(self.id))
        return
    end
    self.onUse(_src)
end
