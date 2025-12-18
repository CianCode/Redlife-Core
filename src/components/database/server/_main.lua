--[[
  This file is part of Redlife.
  Created at 17/12/2025 21:59

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

---@class _RedServer_Database
_RedServer_Database = {}

---safeParameters
---@param params table
---@return table
---@private
local function safeParameters(params)
    if nil == params then
        return {}
    end
    assert(type(params) == "table", "A table is expected")
    if next(params) == nil then
        return {}
    end
    return params
end

local oxmysql = exports[GetCurrentResourceName()]

_RedServer_Database.execute = function(query, params, func)
    _RedLife.sql(query)
    oxmysql:execute(query, safeParameters(params), func)
end

_RedServer_Database.query = function(query, params, func)
    _RedLife.sql(query)
    oxmysql:query(query, safeParameters(params), func)
end

_RedServer_Database.single = function(query, params, func)
    _RedLife.sql(query)
    oxmysql:single(query, safeParameters(params), func)
end

_RedServer_Database.scalar = function(query, params, func)
    _RedLife.sql(query)
    oxmysql:scalar(query, safeParameters(params), func)
end

_RedServer_Database.insert = function(query, params, func)
    _RedLife.sql(query)
    oxmysql:insert(query, safeParameters(params), func)
end

_RedServer_Database.update = function(query, params, func)
    _RedLife.sql(query)
    oxmysql:update(query, safeParameters(params), func)
end

_RedServer_Database.transaction = function(queries, params, func)
    oxmysql:transaction(queries, safeParameters(params), func)
end

_RedServer_Database.prepare = function(query, params, func)
    _RedLife.sql(query)
    oxmysql:prepare(query, safeParameters(params), func)
end

_RedLife.loadedComponent("database")
