--[[
  This file is part of Redlife.
  Created at 16/12/2025 23:48

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedClient_Utils.input_showBox = function(TextEntry, ExampleText, MaxStringLenght, isValueInt)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    local blockInput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        blockInput = false
        if isValueInt then
            local isNumber = tonumber(result)
            if isNumber and isNumber >= 0 then
                return result
            else
                return nil
            end
        end

        return result
    else
        Wait(500)
        blockInput = false
        return nil
    end
end
