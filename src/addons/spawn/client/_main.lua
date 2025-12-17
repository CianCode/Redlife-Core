--[[
  This file is part of Redlife.
  Created at 17/12/2025 00:03

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedLife.onReceiveWithoutNet("joined", function()
    _RedLife.toServer("spawn:request")
end)

_RedLife.onReceive("spawn:spawn", function(spawn)
    CreateThread(function()
        -- Shutdown loading screens first
        ShutdownLoadingScreen()
        ShutdownLoadingScreenNui()

        local model = GetHashKey("u_m_y_pogo_01")

        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(10)
        end

        SetPlayerModel(PlayerId(), model)
        SetModelAsNoLongerNeeded(model)

        local ped = PlayerPedId()
        SetEntityCoords(ped, spawn.coords.x, spawn.coords.y, spawn.coords.z, false, false, false, true)
        SetEntityHeading(ped, spawn.heading)
        FreezeEntityPosition(ped, false)
        SetPlayerInvincible(PlayerId(), false)

        -- Ensure screen is visible
        _RedClient_Utils.loading_hide()
        DoScreenFadeIn(500)
        while not IsScreenFadedIn() do
            Wait(10)
        end

        _RedLife.toServer("spawn:completed")
    end)
end)

_RedLife.loadedAddon("spawn")
