--[[
  This file is part of Redlife.
  Created at 17/12/2025 23:41

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedServer_Commands.usage = function(name, args, client)
    local sb = ("Utilisation: %s/%s"):format((client and "~y~" or "^3"), name:lower())
    for _, arg in pairs(args) do
        sb = (sb .. (" (%s)"):format(arg))
    end
    return (sb)
end
