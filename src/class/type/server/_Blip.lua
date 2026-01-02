--[[
  This file is part of Redlife.
  Created at 02/01/2026 16:27

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

---@class _Blip
---@field public id number
---@field public position table
---@field public sprite number
---@field public color number
---@field public size number
---@field public label string
---@field public shortRange boolean
---@field public drawDist number
---@field public restricted boolean
---@field public subscribed table
---@field public allowed table
_Blip = {}
_Blip.__index = _Blip

setmetatable(_Blip, {
    __call = function(_, id, position, sprite, color, size, label, shortRange, drawDist, restricted)
        local self = setmetatable({}, _Blip)
        self.id = id
        self.position = position
        self.sprite = sprite
        self.color = color
        self.size = size
        self.label = label
        self.shortRange = shortRange
        self.drawDist = drawDist
        self.restricted = restricted
        self.subscribed = {}
        self.allowed = {}
        return (self)
    end
})

function _Blip:getVisualData()
    return ({ radiusData = self.radiusData })
end

function _Blip:setRadius(radius, color)
    self.radiusData = {
        radius = radius,
        color = color or self.color
    }
end

function _Blip:getLightBlip()
    return (_LightBlip(self.id, self.position, self.sprite, self.color, self.size, self.label, self.shortRange, self:getVisualData()))
end

function _Blip:isSubscribed(_src)
    for _, v in pairs(self.subscribed) do
        if (v == _src) then
            return (true)
        end
    end
    return (false)
end

function _Blip:isAllowed(_src)
    for _, v in pairs(self.allowed) do
        if v == _src then
            return (true)
        end
    end
    return (false)
end

function _Blip:subscribe(_src)
    if (not (self:isSubscribed(_src))) then
        table.insert(self.subscribed, _src)
        _RedLife.toClient("blip:subscribe", _src, self:getLightBlip())
    end
end

function _Blip:unsubscribe(_src, doNotSendEvent)
    for i, v in pairs(self.subscribed) do
        if (v == _src) then
            table.remove(self.subscribed, i)
            if (not (doNotSendEvent)) then
                _RedLife.toClient("blip:unsubscribe", _src, self.id)
            end
            break
        end
    end
end

function _Blip:addAllow(_src)
    if (not (self:isAllowed(_src))) then
        table.insert(self.allowed, _src)
    end
end

function _Blip:removeAllowed(_src)
    for i, v in pairs(self.allowed) do
        if (v == _src) then
            table.remove(self.allowed, i)
        end
    end
end

function _Blip:isEverywhere()
    return (self.drawDist <= 0)
end
