--[[
  This file is part of Redlife.
  Created at 16/12/2025 23:56

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedClient_Utils.screen_radar = function(bool)
    DisplayRadar(bool)
end

_RedClient_Utils.screen_fade = function(duration, waitUntilFinished)
    DoScreenFadeOut(duration)
    if (waitUntilFinished) then
        while (not (IsScreenFadedOut())) do
            Wait(0)
        end
    end
end

_RedClient_Utils.screen_reveal = function(duration, waitUntilFinished)
    DoScreenFadeIn(duration)
    if (waitUntilFinished) then
        while (not (IsScreenFadedIn())) do
            Wait(0)
        end
    end
end
