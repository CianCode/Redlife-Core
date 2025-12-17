--[[
  This file is part of Redlife.
  Created at 17/12/2025 00:00

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedUtils.string_startsWith = function(str, start)
    return (string.sub(str, 1, string.len(start)) == start)
end

_RedUtils.string_split = function(str, delimiter)
    result = {};
    for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
        table.insert(result, match);
    end
    return result;
end

_RedUtils.string_replaceAll = function(str, find, replace)
    return str:gsub(find, replace)
end
