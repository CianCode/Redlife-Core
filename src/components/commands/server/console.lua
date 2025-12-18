--[[
  This file is part of Redlife.
  Created at 17/12/2025 23:39

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedServer_Commands.registerConsoleCommand = function(name, handler, requieredArgs)
    RegisterCommand(name, function(_src, args)
        if (_src ~= 0) then
            return
        end
        if (#args ~= #requieredArgs) then
            _RedLife.errLog(_RedServer_Commands.usage(name, requieredArgs))
            return
        end
        handler(args)
    end)
end
