--[[
  This file is part of Redlife.
  Created at 16/12/2025 23:56

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedClient_Utils.regex_validate = function(str, regex)
    return (string.match(str, regex))
end

_RedClient_Utils.regex_name = function(name)
    return (_RedClient_Utils.regex_validate(name, "^[A-Z][A-Za-z\\é\\è\\ê\\-]+$"))
end
