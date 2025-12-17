--[[
  This file is part of Redlife.
  Created at 17/12/2025 00:00

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedUtils.table_pairByKeys = function(t, f)
    local a = {}
    for n in pairs(t) do
        table.insert(a, n)
    end
    table.sort(a, f)
    local i = 0
    local iter = function()
        i = i + 1
        if a[i] == nil then
            return nil
        else
            return a[i], t[a[i]]
        end
    end
    return iter
end

_RedUtils.table_sortAlphabetically = function(curTable)
    local ret = {}
    for k, v in _RedUtils.table_pairByKeys(curTable) do
        table.insert(ret, { name = k, count = v })
    end
    return (ret)
end

_RedUtils.table_count = function(curTable)
    local count = 0
    for _, _ in pairs(curTable) do
        count = count + 1
    end
    return (count)
end
