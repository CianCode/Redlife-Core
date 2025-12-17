--[[
  This file is part of Redlife.
  Created at 17/12/2025 00:07

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

local running = false

local function createPopulatorTask()
    if (running) then
        _RedLife.err("Populator est déjà en train de tourner")
        return
    end
    running = true
    CreateThread(function()
        while (running) do
            Wait(1500)
            -- TODO -> Populator
        end
    end)
end

_RedLife.onReceiveWithoutNet("populator:init", function()
    createPopulatorTask()
end)
