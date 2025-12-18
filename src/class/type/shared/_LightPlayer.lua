--[[
  This file is part of Redlife.
  Created at 18/12/2025 01:16

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

---@class _LightPlayer
---@field public redId number
---@field public identifier string
---@field public identity table
---@field public cash number
---@field public skin table
---@field public outfits table
---@field public selectedOutfit number
---@field public accessories table
---@field public sId number
---@field public name string
---@field public rpName string
---@field public job table
_LightPlayer = {}
_LightPlayer.__index = _LightPlayer

setmetatable(_LightPlayer, {
    __call = function(_, sId, redId, identifier, rank, identity, cash, skin, outfits, selectedOutfit, accessories, name,
                      rpName, job)
        local self = setmetatable({}, _LightPlayer)
        self.redId = redId
        self.identifier = identifier
        self.identity = identity
        self.cash = cash
        self.skin = skin
        self.outfits = outfits
        self.selectedOutfit = selectedOutfit
        self.accessories = accessories
        self.sId = sId
        self.name = name
        self.rpName = rpName
        self.job = job
        return self
    end
})
