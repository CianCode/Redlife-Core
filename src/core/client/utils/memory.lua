--[[
  This file is part of Redlife.
  Created at 16/12/2025 23:49

  Copyright (c) Redlife - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author CianCode

_RedClient_Utils.memory_load = function(model, alreadyHashed, noLoading)
    if (not (noLoading)) then
        _RedClient_Utils.loading_show(("Chargement du modèle %s"):format(model), 4)
    end
    if (not (alreadyHashed)) then
        model = GetHashKey(model)
    end
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    if (not (noLoading)) then
        _RedClient_Utils.loading_hide()
    end
end

_RedClient_Utils.memory_loadAll = function(models)
    for _, model in pairs(models) do
        _RedClient_Utils.memory_load(model)
    end
end

_RedClient_Utils.memory_loadDict = function(dict)
    RequestStreamedTextureDict(dict)
    while (not (HasStreamedTextureDictLoaded(dict))) do
        Wait(1)
    end
end

_RedClient_Utils.memory_unload = function(model, alreadyHashed)
    if (not (alreadyHashed)) then
        model = GetHashKey(model)
    end
    SetModelAsNoLongerNeeded(model)
end
