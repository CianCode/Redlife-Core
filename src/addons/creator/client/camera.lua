--[[
  This file is part of Redlife.
  Created at 18/12/2025 00:10

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

local cameraPosition = vector3(683.78, 570.56, 130.46)
local camera

_RedLife.onReceiveWithoutNet("creator:initCamera", function()
    camera = CreateCam("DEFAULT_SCRIPTED_CAMERA")
    SetCamCoord(camera, cameraPosition)
    PointCamAtEntity(camera, PlayerPedId())
    SetCamActive(camera, true)
    SetCamFov(camera, 17.0)
    RenderScriptCams(1, 0, 0, 0, 0)
end)
