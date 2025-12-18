--[[
  This file is part of Redlife.
  Created at 18/12/2025 01:21

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedServer_Players.messenger_system_error = function(_src, message)
    _RedLife.toClient("utils:messenger_system_error", _src, message)
end

_RedServer_Players.messenger_system_success = function(_src, message)
    _RedLife.toClient("utils:messenger_system_success", _src, message)
end

_RedServer_Players.messenger_system_info = function(_src, message)
    _RedLife.toClient("utils:messenger_system_info", _src, message)
end

_RedServer_Players.messenger_system_custom = function(_src, title, message)
    _RedLife.toClient("utils:messenger_system_custom", _src, title, message)
end
