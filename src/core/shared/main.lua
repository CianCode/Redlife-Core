--[[
  This file is part of RedLife.
  Created at 14/12/2025 12:15

  Copyright (c) RedLife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

---@class _RedLife
_RedLife = {}

---@type table<string, boolean>
local registredEvents = {}

---registerEvent
---@param event string
---@return nil
---@public
local function registerEvent(event)
    RegisterNetEvent(event)
    table.insert(registredEvents, event)
end

---isEventRegistred
---@param event string
---@return boolean
---@public
local isEventRegistred = function(event)
    for _, eventName in pairs(registredEvents) do
        if (eventName == event) then
            return true
        end
    end
    return false
end

_RedLife.toInternal = function(event, ...)
    _RedLife.log(("Envoie d'un event interne ^6>^3 %s^7"):format(event))
    TriggerEvent(_RedLife.format(event), ...)
end

_RedLife.onReceive = function(event, handler)
    local baseEvent = event
    event = _RedLife.format(event)
    if (not (isEventRegistred(event))) then
        registerEvent(event)
    end
    AddEventHandler(event, function(...)
        local _src, isServer = source, (GetGameName() == "fxserver")
        _RedLife.log(isServer and ("Réception d'un event client (^3%s^7) ^6>^2 %s"):format(_src, baseEvent) or
            (("Réception d'un event serveur ^6>^2 %s"):format(baseEvent)))
        if isServer then
            handler(_src, ...)
        else
            handler(...)
        end
    end)
end

_RedLife.onReceiveWithoutNet = function(event, handler)
    event = _RedLife.format(event)
    AddEventHandler(event, handler)
end

_RedLife.hash = function(string)
    return GetHashKey(string)
end

_RedLife.format = function(string)
    return ("FL_%s"):format(GetHashKey(string))
end

_RedLife.log = function(string)
    if (_Config.environment == _RedEnum_ENV.DEV) then
        print(("%s %s^7"):format(_Config.prefix, string))
    end
end

_RedLife.sql = function(query)
    if (_Config.enableSqlLog) then
        print(("%s ^0%s^7"):format("[^5MySQL^7]", query))
    end
end

_RedLife.err = function(string)
    if (_Config.enableErrorsLog) then
        print(("[^1Erreur^7] %s^7"):format(string))
        local isServer = GetGameName() == "fxserver"
        if (isServer) then
            _RedLife.toInternal("errorCatcher:report", string)
        end
    end
end

_RedLife.suc = function(string)
    print(("[^2Succes^7] %s^7"):format(string))
end

_RedLife.loadedComponent = function(id)
    _RedLife.log(("Chargement du composant ^6>^5 %s"):format(id))
end

_RedLife.loadedAddon = function(id)
    _RedLife.log(("Chargement de l'addon ^6>^4 %s"):format(id))
end

_RedLife.countTable = function(table)
    local i = 0
    for k, v in pairs(table) do
        i = (i + 1)
    end
    return i
end

_RedLife.countTableIp = function(table)
    local i = 0
    for k in (table) do
        i = (i + 1)
    end
    return i
end
