--[[
  This file is part of Redlife.
  Created at 18/12/2025 00:08

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

local defaultModels = {
    "mp_m_freemode_01",
    "mp_f_freemode_01"
}

_RedLife.onReceive("creator:init", function()
    Wait(5000)
    local coords, heading = _ConfigClient.Creator.pedPosition.coords, _ConfigClient.Creator.pedPosition.heading
    _RedClient_Synchronizer.setTimeOverride({ 12, 00 })
    _RedClient_Synchronizer.setWeatherOverride("EXTRASUNNY")
    _RedClient_Utils.screen_radar(false)
    _RedClient_Utils.loading_show("Chargement de l'éditeur de personnage", 4)
    _RedClient_Utils.memory_loadAll(defaultModels)
    _RedClient_Utils.screen_fade(1500, true)
    _RedClient_Utils.ped_spawn("mp_m_freemode_01",
        { x = coords.x, y = coords.y, z = coords.z, heading = _ConfigClient.Creator.pedPosition.heading })
    _RedClient_SkinChanger.setAllToDefault()
    _RedLife.toInternal("creator:initCamera")
    _RedClient_Utils.ped_tp(PlayerPedId(), coords, heading)
    _RedClient_Utils.ped_scenario(PlayerPedId(), "WORLD_HUMAN_GUARD_STAND_CLUBHOUSE", false)
    _RedClient_Utils.screen_reveal(5000)
    _RedLife.toInternal("creator:initMenu")
    SetTimeout(1500, function()
        _RedClient_RichPresence.setPresence(_RedEnum_RICHPRESENCE.CREATOR)
        _RedClient_Utils.loading_hide()
    end)
end)

_RedLife.loadedAddon("creator")
