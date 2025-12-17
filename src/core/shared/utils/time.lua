--[[
  This file is part of Redlife.
  Created at 17/12/2025 00:00

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedUtils.setCurrentTime = function()
    return (os.time())
end

_RedUtils.getCurrentTime = function()
    local actualTime = os.date("*t")
    return (("%s/%s/%s %sh%s"):format(actualTime.day, actualTime.month, actualTime.year, actualTime.hour, actualTime.min))
end

_RedUtils.decodeTime = function(timeDecode)
    local actualTime = os.date("*t", timeDecode)
    return (("%s/%s/%s %sh%s"):format(actualTime.day, actualTime.month, actualTime.year, actualTime.hour, actualTime.min))
end
