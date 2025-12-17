--[[
  This file is part of Redlife.
  Created at 16/12/2025 23:47

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

local entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end
        enum.destructor = nil
        enum.handle = nil
    end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
        local iter, id = initFunc()
        if not id or id == 0 then
            disposeFunc(iter)
            return
        end

        local enum = { handle = iter, destructor = disposeFunc }
        setmetatable(enum, entityEnumerator)

        local next = true
        repeat
            coroutine.yield(id)
            next, id = moveFunc(iter)
        until not next

        enum.destructor, enum.handle = nil, nil
        disposeFunc(iter)
    end)
end

_RedClient_Utils.entityiter_objects = function()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

_RedClient_Utils.entityiter_peds = function()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

_RedClient_Utils.entityiter_vehicles = function()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

_RedClient_Utils.entityiter_pickups = function()
    return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end
