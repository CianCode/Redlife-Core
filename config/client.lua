--[[
  This file is part of Redlife.
  Created at 18/12/2025 00:08

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_ConfigClient = {
    RichPresence = {
        appId = 0,
    },

    Npc = {
        showHealth = false,
        showNpcIcon = true,
    },

    Creator = {
        pedPosition = { coords = vector3(686.25, 577.69, 130.46), heading = 164.0 },
        camPosition = { coords = vector3(683.78, 570.56, 130.46) },

        defaultOutFits = {
            -- TODO → Add components (eg: helmet, ears (...))
            {
                label = "Décontracté",
                values = {
                    [0] = {
                        ["tshirt_1"] = 15,
                        ["tshirt_2"] = 0,
                        ["torso_1"] = 9,
                        ["torso_2"] = 0,
                        ["arms"] = 0,
                        ["pants_1"] = 6,
                        ["pants_2"] = 0,
                        ["shoes_1"] = 5,
                        ["shoes_2"] = 0,
                    },

                    [1] = {
                        ["tshirt_1"] = 15,
                        ["tshirt_2"] = 0,
                        ["torso_1"] = 0,
                        ["torso_2"] = 0,
                        ["arms"] = 0,
                        ["pants_1"] = 7,
                        ["pants_2"] = 1,
                        ["shoes_1"] = 5,
                        ["shoes_2"] = 0,
                    }
                }
            },
        }
    },

    Skin = {
        { id = "skin",    label = "Peau" },
        { id = "face",    label = "Visage" },
        { id = "hair_1",  label = "Cheveux",     sub = "hair_color_1" },
        { id = "beard_2", label = "Taille barbe" },
        { id = "beard_1", label = "Type barbe",  sub = "beard_3" }
    },
}
