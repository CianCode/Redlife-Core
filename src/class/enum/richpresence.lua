--[[
  This file is part of Redlife.
  Created at 14/12/2025 15:54

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedEnum_RICHPRESENCE = {
    CONNECTING = function()
        SetRichPresence("Arrive en ville ✈️")
        SetDiscordRichPresenceAsset("connecting") -- The name of the big picture you added in the application.
        SetDiscordRichPresenceAssetText("discord.gg/redlife")
    end,

    INGAME = function()
        SetRichPresence("Se balade en ville 👟️")
        SetDiscordRichPresenceAsset("walking") -- The name of the big picture you added in the application.
        SetDiscordRichPresenceAssetText("discord.gg/redlife")
    end,

    CREATOR = function()
        SetRichPresence("Créé son personnage 🧩")
        SetDiscordRichPresenceAsset("creator") -- The name of the big picture you added in the application.
        SetDiscordRichPresenceAssetText("discord.gg/redlife")
    end
}
