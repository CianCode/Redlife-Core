--[[
  This file is part of Redlife.
  Created at 17/12/2025 00:03

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

local defaultSpawn = {
    coords = { x = -1037.73, y = -2737.86, z = 20.17 },
    heading = 330.0
}

_RedLife.onReceive("spawn:request", function(source)
    _RedLife.toClient("spawn:spawn", source, defaultSpawn)
end)

_RedLife.onReceive("spawn:completed", function(source)
    _RedLife.log(("Joueur ^3%i^7 a spawn"):format(source))
end)

_RedLife.loadedAddon("spawn")
