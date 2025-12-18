--[[
  This file is part of Redlife.
  Created at 16/12/2025 23:49

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedClient_Utils.notifications_show = function(message)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(message)
    DrawNotification(0, 1)
end

_RedClient_Utils.notifications_showHelp = function(message)
    AddTextEntry("RedLifeHelp", message)
    DisplayHelpTextThisFrame("RedLifeHelp", false)
end

_RedClient_Utils.notifications_showAdvanced = function(sender, subject, msg, textureDict, iconType, red, saveToBrief,
                                                       hudColorIndex)
    if saveToBrief == nil then
        saveToBrief = true
    end
    AddTextEntry("anotif", msg)
    BeginTextCommandThefeedPost("anotif")
    if hudColorIndex then
        ThefeedNextPostBackgroundColor(hudColorIndex)
    end
    EndTextCommandThefeedPostMessagetext(textureDict, textureDict, false, iconType, sender, subject)
    EndTextCommandThefeedPostTicker(red or false, saveToBrief)
end

_RedLife.onReceive("utils:notifications_showAdvanced", function(sender, subject, msg, textureDict, iconType)
    _RedClient_Utils.notifications_showAdvanced(sender, subject, msg, textureDict, iconType)
end)

_RedClient_Utils.notifications_template_error = function(message)
    _RedClient_Utils.notifications_showAdvanced("RedLife", "~r~Erreur", message, _RedEnum_CHARACTERPICTURE.EPSILON,
        _RedEnum_MESSAGEICONTYPE.CHAT)
end

_RedClient_Utils.notifications_template_success = function(message)
    _RedClient_Utils.notifications_showAdvanced("RedLife", "~g~Succès", message, _RedEnum_CHARACTERPICTURE.EPSILON,
        _RedEnum_MESSAGEICONTYPE.CHAT)
end

_RedClient_Utils.notifications_template_info = function(message)
    _RedClient_Utils.notifications_showAdvanced("RedLife", "~o~Information", message, _RedEnum_CHARACTERPICTURE.EPSILON,
        _RedEnum_MESSAGEICONTYPE.CHAT)
end

_RedLife.onReceive("utils:messenger_system_error", function(message)
    _RedClient_Utils.notifications_template_error(message)
end)

_RedLife.onReceive("utils:messenger_system_success", function(message)
    _RedClient_Utils.notifications_template_success(message)
end)

_RedLife.onReceive("utils:messenger_system_info", function(message)
    _RedClient_Utils.notifications_template_info(message)
end)

_RedLife.onReceive("utils:messenger_playerPed", function(sourcePed, sender, subject, content, iconType)
    local otherPed = GetPlayerPed(GetPlayerFromServerId(sourcePed))
    local mugshot, mugshotStr = _RedClient_Utils.ped_getMugShot(otherPed)
    _RedClient_Utils.notifications_showAdvanced(sender, subject, content, mugshotStr, iconType, false)
end)

_RedLife.onReceive("utils:messenger_system_custom", function(title, message)
    _RedClient_Utils.notifications_showAdvanced("Système", title, message, _RedEnum_CHARACTERPICTURE.SYSTEM,
        _RedEnum_MESSAGEICONTYPE.CHAT)
end)
