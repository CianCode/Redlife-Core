--[[
  This file is part of Redlife.
  Created at 17/12/2025 22:47

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_ConfigServer = {
    Start = {
        startPosition = { coords = vector3(-221.74, -1053.19, 30.13), heading = 164.00 },
        cash = (1500),
    },

    Citizens = {
        lockdown = true,
    },

    Synchronizer = {
        baseTime = { 21, 00 },
        time = (30000),
        weather = (60000 * 60),
        position = (60000),
    },

    RichPresence = {
        appId = "0",
    }
}
