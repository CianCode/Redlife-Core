--[[
  This file is part of RedLife.
  Created at 14/12/2025 12:15

  Copyright (c) RedLife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedLife_Utils.loading_show = function(loadingText, spinnerType)
    if IsLoadingPromptBeingDisplayed() then
        RemoveLoadingPrompt()
    end
    if (loadingText == nil) then
        BeginTextCommandBusyString(nil)
    else
        BeginTextCommandBusyString("STRING");
        AddTextComponentSubstringPlayerName(loadingText);
    end
    EndTextCommandBusyString(spinnerType)
end

_RedLife_Utils.loading_hide = function()
    if IsLoadingPromptBeingDisplayed() then
        RemoveLoadingPrompt()
    end
end
