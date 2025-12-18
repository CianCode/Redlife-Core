--[[
  This file is part of Redlife.
  Created at 18/12/2025 01:14

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedLife.onReceive("creator:sendData", function(creatorData)
    local _src = source
    local skin, identity, outfit = creatorData.skin, creatorData.identity, creatorData.outfit
    _RedServer_Players.register(_src, creatorData)
end)

_RedLife.onReceive("creator:playerRegistered", function(_src)
    _RedServer_Instances.setOnPublicInstance(_src)
    _RedLife.toClient("creator:characterDone", _src, _ConfigServer.Start.startPosition)
end)

_RedLife.loadedAddon("creator")
