--[[
  This file is part of Redlife.
  Created at 17/12/2025 22:40

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

---@class _Player
---@field public flashId number
---@field public identifier string
---@field public identity table
---@field public cash number
---@field public skin table
---@field public outfits table
---@field public selectedOutfit number
---@field public accessories table
---@field public sId number
---@field public spawned boolean
---@field public gameType number
---@field public rpName string
---@field public name string
_Player = {}
_Player.__index = _Player

setmetatable(_Player, {
    __call = function(_, sId, flashId, identifier, identity, cash, skin, outfits, selectedOutfit, accessories)
        local self = setmetatable({}, _Player)
        self.flashId = flashId
        self.identifier = identifier
        self.identity = identity
        self.rpName = ("%s %s"):format(self.identity.firstname, self.identity.lastname)
        -- TODO → Fake identity implementation
        self.cash = cash
        self.skin = skin
        self.outfits = outfits
        self.selectedOutfit = selectedOutfit
        self.accessories = accessories
        self.sId = sId
        --
        self.spawned = false
        self.gameType = _RedEnum_GAMETYPE.RP
        self.name = GetPlayerName(self.sId)
        return self
    end
})

function _Player:getPlayerCash()
    return (self.cash)
end

function _Player:getDbPosition(consumer)
    _RedServer_Database.query("SELECT position FROM flash_players_positions WHERE flashId = @flashId", {
        ["flashId"] = self.flashId
    }, function(result)
        consumer(json.decode(result[1].position))
    end)
end

function _Player:savePosition()
    --_FlashLand.log(("Tentative de sauvegarde position du sID ^3%s^7..."):format(self.sId))
    if (self.gameType == _RedEnum_GAMETYPE.RP and self.spawned) then
        local ped = GetPlayerPed(self.sId)
        local position = GetEntityCoords(ped)
        position = { coords = { x = position.x, y = position.y, z = position.z }, heading = GetEntityHeading(ped) }
        _RedServer_Database.execute("UPDATE flash_players_positions SET position = @position WHERE flashId = @flashId", {
            ["position"] = json.encode(position),
            ["flashId"] = self.flashId
        })
        --_FlashLand.log(("Sauvegarde la position du sID ^3%s"):format(self.sId))
    end
end

function _Player:saveData()
    _RedServer_Database.execute("UPDATE flash_players SET cash = @cash WHERE flashId = @flashId", {
        ["cash"] = self.cash,
        ["flashId"] = self.flashId
    })
end

function _Player:setSpawned()
    self.spawned = true
end

function _Player:getPlayerPos()
    return (GetEntityCoords(GetPlayerPed(self.sId)))
end

function _Player:setTeleportPlayer(position)
    SetEntityCoords(GetPlayerPed(self.sId), position.x, position.y, position.z)
end

function _Player:sendData()
    local lightPlayer = _RedServer_Players.getLightPlayer(self.sId)
    _RedLife.toClient("cache:setCache", self.sId, "playerData", lightPlayer)
end

function _Player:serverResponded()
    _RedLife.toClient("serverReturnedCb", self.sId)
end

-- TODO → Send a simple notification, not an advanced one
function _Player:sendSystemMessage(type, message)
    _RedLife.toClient(("utils:messenger_system_%s"):format(type:lower()), self.sId, message)
end

function _Player:sendAdvancedNotificationMugShot(mugShotPed, sender, subject, content, iconType)
    _RedLife.toClient("utils:messenger_playerPed", self.sId, mugShotPed, sender, subject, content, iconType)
end

function _Player:getPed()
    return (GetPlayerPed(self.sId))
end

function _Player:getName()
    return (self.name)
end

function _Player:getServerId()
    return (self.sId)
end

function _Player:getRpIdentity()
    return (("%s %s"):format(self.identity.firstname, self.identity.lastname))
end

function _Player:kickPlayer(reason)
    DropPlayer(self.source, reason)
end
