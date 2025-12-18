--[[
  This file is part of Redlife.
  Created at 18/12/2025 00:13

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

local isMenuOpen = false

_RedClient_Menu = {}

_RedClient_Menu.isMenuOpen = function()
    return (isMenuOpen)
end

_RedClient_Menu.tryOpenMenu = function(cb)
    if (isMenuOpen) then
        return
    end
    isMenuOpen = true
    cb()
end

_RedClient_Menu.menuClosed = function()
    isMenuOpen = false
end

_RedLife.loadedComponent("menu")
