--[[
  This file is part of Redlife.
  Created at 02/01/2026 16:29

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

---@param blipData _Blip
_RedClient_Blip.createInGameBlip = function(blipData)
    -- Blip already exists in the player's game
    if (_RedClient_Blip.exists(blipData.id) and _RedClient_Blip.get(blipData.id).handler) then
        return
    end
    local blip = AddBlipForCoord(blipData.position.x, blipData.position.y, blipData.position.z)
    SetBlipHighDetail(blip, true)
    SetBlipSprite(blip, blipData.sprite)
    SetBlipColour(blip, blipData.color)
    SetBlipAsShortRange(blip, blipData.shortRange)
    SetBlipScale(blip, blipData.size)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(blipData.label)
    EndTextCommandSetBlipName(blip)
    blipData.handler = blip

    if (blipData.visualData.radiusData ~= nil) then
        local radiusBlip = AddBlipForRadius(blipData.position.x, blipData.position.y, blipData.position.z,
            blipData.visualData.radiusData.radius)
        SetBlipColour(radiusBlip, blipData.color)
        SetBlipAlpha(radiusBlip, 128)
        SetBlipHighDetail(radiusBlip, true)
        _RedClient_Blip.radiusBlips[blip.id] = radiusBlip
    end
end
