--[[
  This file is part of Redlife.
  Created at 16/12/2025 23:58

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedUtils.math_round = function(number, decimalPlace)
    local mult = 10 ^ (decimalPlace or 0)
    return math.floor(number * mult + 0.5) / mult
end

_RedUtils.math_group = function(value)
    local left, num, right = string.match(value, '^([^%d]*%d)(%d*)(.-)$')
    return left .. (num:reverse():gsub('(%d%d%d)', '%1' .. ","):reverse()) .. right
end

_RedUtils.math_price = function(value)
    return ("~g~%s$~s~"):format(_RedUtils.math_group(_RedUtils.math_round(value, 2)))
end

_RedUtils.math_price_integer = function(value)
    return ("~g~%s$~s~"):format(_RedUtils.math_group(math.floor(value)))
end

_RedUtils.math_price_color = function(value, color)
    return ("%s%s$~s~"):format(color, _RedUtils.math_group(_RedUtils.math_round(value, 2)))
end

_RedUtils.math_getInversedHeading = function(heading)
    return (heading + 180) % 360
end
