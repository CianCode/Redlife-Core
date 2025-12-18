--[[
  This file is part of Redlife.
  Created at 18/12/2025 11:00

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedLife.onReceive("spawn:spawned", function()
    _RedLife.toServer("players:onSpawn")
end)

_RedLife.onReceive("spawn:spawn", function(spawn, skin, currentOutfit)
    local alreadyLoaded = (PlayerPedId() ~= nil and (GetEntityModel(PlayerPedId()) == GetHashKey("mp_m_freemode_01") or GetEntityModel(PlayerPedId()) == GetHashKey("mp_f_freemode_01")))
    Wait(500)
    local model = "mp_m_freemode_01"
    _RedClient_Utils.memory_load(model)
    if (not (alreadyLoaded)) then
        _RedClient_Utils.ped_spawn("mp_m_freemode_01",
            { x = spawn.coords.x, y = spawn.coords.x, z = spawn.coords.z - 1.0, heading = spawn.heading })
        while (#(GetEntityCoords(PlayerPedId()) - vector3(spawn.coords.x, spawn.coords.y, spawn.coords.z - 1.0)) >= 5) do
            SetEntityCoords(PlayerPedId(), spawn.coords.x, spawn.coords.y, spawn.coords.z)
            Wait(10)
        end
    end
    _RedClient_SkinChanger.setAllToDefault()
    _RedLife.log("Chargement du skin")
    if (skin["sex"] == 1) then
        local model = "mp_f_freemode_01"
        _RedClient_Utils.memory_load(model)
        SetPlayerModel(PlayerId(), model)
        _RedClient_SkinChanger.setAllToDefault()
    end
    _RedClient_SkinChanger.applySkin(skin)
    _RedLife.log("Chargement des vêtements")
    _RedClient_SkinChanger.applySkin(currentOutfit)
    _RedLife.toInternal("spawn:spawned")
    _RedClient_Utils.loading_hide()
end)

_RedLife.loadedAddon("spawn")
