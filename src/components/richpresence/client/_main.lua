--[[
  This file is part of Redlife.
  Created at 17/12/2025 23:09

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

---@class _RedClient_RichPresence
_RedClient_RichPresence = {}

local appId = 0
local running = false

_RedClient_RichPresence.initialize = function(id)
    appId = id
    SetDiscordAppId(id)
    _RedClient_RichPresence.setPresence(_RedEnum_RICHPRESENCE.CONNECTING)
    _RedClient_RichPresence.requestVersion()
    SetDiscordRichPresenceAction(0, "Discord", "https://discord.gg/redlife")
end

_RedClient_RichPresence.requestVersion = function()
    _RedLife.onReceive("richpresence:cbVersion", function(version)
        SetDiscordRichPresenceAssetSmall("redguy")
        SetDiscordRichPresenceAssetSmallText(("RedLife [Version %s]"):format(version))
    end)
    _RedLife.toServer("richpresence:getVersion")
end

_RedClient_RichPresence.setPresence = function(presenceEnum)
    presenceEnum()
end

_RedLife.loadedComponent("richPresence")
