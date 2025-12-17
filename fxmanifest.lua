--[[
  This file is part of RedLife.
  Created at 12/12/2025 23:15

  Copyright (c) RedLife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

resource_type 'gametype' { name = 'redlife' }

fx_version 'adamant'
game 'gta5'

files {
    'src/web/dist/index.html',
    'src/web/dist/assets/index-4eoCdr-l.css',
    'src/web/dist/assets/index-CtR59rOR.js',
    'src/web/dist/vite.svg'
}

description "Main system of Redlife RP"
author "CianCode"
version '0.1'

--[[
    Vendors
--]]

server_scripts {
    -- MySQL
    "src/vendors/oxmysql/oxmysql.js",
}

client_scripts {
    -- RageUI
    "src/vendors/RageUI/RMenu.lua",
    "src/vendors/RageUI/menu/RageUI.lua",
    "src/vendors/RageUI/menu/Menu.lua",
    "src/vendors/RageUI/menu/MenuController.lua",
    "src/vendors/RageUI/components/*.lua",
    "src/vendors/RageUI/menu/elements/*.lua",
    "src/vendors/RageUI/menu/items/*.lua",
    "src/vendors/RageUI/menu/panels/*.lua",
    "src/vendors/RageUI/menu/windows/*.lua",
    -- Bob74
    "src/vendors/Bob74/lib/common.lua",
    "src/vendors/Bob74/lib/observers/interiorIdObserver.lua",
    "src/vendors/Bob74/lib/observers/officeSafeDoorHandler.lua",
    "src/vendors/Bob74/client.lua",
    "src/vendors/Bob74/gtav/base.lua",
    "src/vendors/Bob74/gtav/ammunations.lua",
    "src/vendors/Bob74/gtav/bahama.lua",
    "src/vendors/Bob74/gtav/floyd.lua",
    "src/vendors/Bob74/gtav/franklin.lua",
    "src/vendors/Bob74/gtav/franklin_aunt.lua",
    "src/vendors/Bob74/gtav/graffitis.lua",
    "src/vendors/Bob74/gtav/pillbox_hospital.lua",
    "src/vendors/Bob74/gtav/lester_factory.lua",
    "src/vendors/Bob74/gtav/michael.lua",
    "src/vendors/Bob74/gtav/north_yankton.lua",
    "src/vendors/Bob74/gtav/red_carpet.lua",
    "src/vendors/Bob74/gtav/simeon.lua",
    "src/vendors/Bob74/gtav/stripclub.lua",
    "src/vendors/Bob74/gtav/trevors_trailer.lua",
    "src/vendors/Bob74/gtav/ufo.lua",
    "src/vendors/Bob74/gtav/zancudo_gates.lua",
    "src/vendors/Bob74/gta_online/apartment_hi_1.lua",
    "src/vendors/Bob74/gta_online/apartment_hi_2.lua",
    "src/vendors/Bob74/gta_online/house_hi_1.lua",
    "src/vendors/Bob74/gta_online/house_hi_2.lua",
    "src/vendors/Bob74/gta_online/house_hi_3.lua",
    "src/vendors/Bob74/gta_online/house_hi_4.lua",
    "src/vendors/Bob74/gta_online/house_hi_5.lua",
    "src/vendors/Bob74/gta_online/house_hi_6.lua",
    "src/vendors/Bob74/gta_online/house_hi_7.lua",
    "src/vendors/Bob74/gta_online/house_hi_8.lua",
    "src/vendors/Bob74/gta_online/house_mid_1.lua",
    "src/vendors/Bob74/gta_online/house_low_1.lua",
    "src/vendors/Bob74/dlc_high_life/apartment1.lua",
    "src/vendors/Bob74/dlc_high_life/apartment2.lua",
    "src/vendors/Bob74/dlc_high_life/apartment3.lua",
    "src/vendors/Bob74/dlc_high_life/apartment4.lua",
    "src/vendors/Bob74/dlc_high_life/apartment5.lua",
    "src/vendors/Bob74/dlc_high_life/apartment6.lua",
    "src/vendors/Bob74/dlc_heists/carrier.lua",
    "src/vendors/Bob74/dlc_heists/yacht.lua",
    "src/vendors/Bob74/dlc_executive/apartment1.lua",
    "src/vendors/Bob74/dlc_executive/apartment2.lua",
    "src/vendors/Bob74/dlc_executive/apartment3.lua",
    "src/vendors/Bob74/dlc_finance/office1.lua",
    "src/vendors/Bob74/dlc_finance/office2.lua",
    "src/vendors/Bob74/dlc_finance/office3.lua",
    "src/vendors/Bob74/dlc_finance/office4.lua",
    "src/vendors/Bob74/dlc_finance/organization.lua",
    "src/vendors/Bob74/dlc_bikers/cocaine.lua",
    "src/vendors/Bob74/dlc_bikers/counterfeit_cash.lua",
    "src/vendors/Bob74/dlc_bikers/document_forgery.lua",
    "src/vendors/Bob74/dlc_bikers/meth.lua",
    "src/vendors/Bob74/dlc_bikers/weed.lua",
    "src/vendors/Bob74/dlc_bikers/clubhouse1.lua",
    "src/vendors/Bob74/dlc_bikers/clubhouse2.lua",
    "src/vendors/Bob74/dlc_bikers/gang.lua",
    "src/vendors/Bob74/dlc_import/garage1.lua",
    "src/vendors/Bob74/dlc_import/garage2.lua",
    "src/vendors/Bob74/dlc_import/garage3.lua",
    "src/vendors/Bob74/dlc_import/garage4.lua",
    "src/vendors/Bob74/dlc_import/vehicle_warehouse.lua",
    "src/vendors/Bob74/dlc_gunrunning/bunkers.lua",
    "src/vendors/Bob74/dlc_gunrunning/yacht.lua",
    "src/vendors/Bob74/dlc_smuggler/hangar.lua",
    "src/vendors/Bob74/dlc_doomsday/facility.lua",
    "src/vendors/Bob74/dlc_afterhours/nightclubs.lua",
    "src/vendors/Bob74/dlc_casino/casino.lua",
    "src/vendors/Bob74/dlc_casino/penthouse.lua",
}

--[[
    RedLife
--]]

loadscreen "src/web/dist/index.html"


shared_scripts {
    -- Config
    "config/global.lua",
    -- Enum
    "src/class/enum/*.lua",
    -- Init
    "src/core/shared/utils/*.lua",
    "src/core/shared/main.lua",
}

client_scripts {
    -- Init
    "src/core/client/utils/*.lua",
    "src/core/client/main.lua",
    -- Addons
    "src/addons/**/client/*.lua",
}

server_scripts {
    -- Init
    "src/core/server/utils/*.lua",
    "src/core/server/main.lua",
    -- Modules
    "src/components/**/server/*.lua",
    -- Addons
    "src/addons/**/server/*.lua",
}
