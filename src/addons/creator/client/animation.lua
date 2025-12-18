--[[
  This file is part of Redlife.
  Created at 18/12/2025 00:09

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

--SwitchInPlayer(PlayerPedId())

_RedLife.onReceiveWithoutNet("creator:playAnimation", function(spawn)
    RenderScriptCams(0, 0, 0, 0, 0)
    local animation = true

    -- TODO -> add sprite _FlashClient_Utils.memory_loadDict("flashland")

    SwitchOutPlayer(PlayerPedId(), 0, 1)
    SetTimeout(500, function()
        _RedClient_Utils.ped_tp(PlayerPedId(), vector3(spawn.coords.x, spawn.coords.y, spawn.coords.z - 1.0),
            spawn.heading)
    end)

    --[[ TODO -> add sprite _RedClient_Utils.drawer_spriteWithSmooth(function()
       return (animation)
    end, "redlife", "logo_transparent", 0.5, 0.38, 0.35, 0.60, 0.0)]]

    _RedClient_Utils.drawer_textWithSmooth(function()
        return (animation)
    end, 1920 / 2, (1080 / 2) + 300, "Bienvenue sur ~r~Redlife", { 252, 255, 255 }, function()
        while (#(GetEntityCoords(PlayerPedId()) - vector3(spawn.coords.x, spawn.coords.y, spawn.coords.z - 1.0)) >= 1.0) do
            _RedClient_Utils.ped_tp(PlayerPedId(), vector3(spawn.coords.x, spawn.coords.y, spawn.coords.z - 1.0),
                spawn.heading)
            Wait(1)
        end
        SwitchInPlayer(PlayerPedId())
        while (#(GetEntityCoords(PlayerPedId()) - vector3(spawn.coords.x, spawn.coords.y, spawn.coords.z - 1.0)) >= 1.0) do
            _RedClient_Utils.ped_tp(PlayerPedId(), vector3(spawn.coords.x, spawn.coords.y, spawn.coords.z - 1.0),
                spawn.heading)
            Wait(1)
        end
        Wait(3500)
        _RedLife.toInternal("spawn:spawned")
        _RedClient_Utils.screen_radar(true)
        _RedClient_Utils.loading_hide()
        _RedLife.setIsWaitingForServer(false)
    end)
    Wait(4500)
    _RedClient_Utils.loading_show("Chargement du personnage", 5)
    Wait(6000)
    _RedClient_Utils.loading_show("Synchronisation heure et météo", 5)
    Wait(4000)
    _RedClient_Synchronizer.destroyTimeOverride()
    _RedClient_Synchronizer.destroyWeatherOverride()
    Wait(2500)
    _RedClient_Utils.loading_show("Bienvenue sur Redlife", 4)
    Wait(3000)
    animation = false
end)
