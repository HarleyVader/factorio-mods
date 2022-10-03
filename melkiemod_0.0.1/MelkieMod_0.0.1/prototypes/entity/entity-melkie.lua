local token_tint = { r = 0.2, g = 0.8, b = 0.4, a = 0.5 }

-- ### MelkieWey Token ### --

local token_creeper = util.table.deepcopy(data.raw["melkiewey-token"]["melkiewey-token"])

token_creeper.name = "token-creeper"
token_creeper.icons = { { icon = "__base__/img/57690_149", tint = { r = 0.2, g = 0.1, b = 0.8, a = 0.8 } } }
token_creeper.minable.result = "token-drop"
token_creeper.fast_replaceable_group = "token-loot"
token_creeper.production = "BRKL"
token_creeper.picture.layers[1].hr_version.tint = token_tint
token_creeper.picture.layers[1].tint = token_tint
token_creeper.picture.layers[2].hr_version.tint = token_tint
token_creeper.picture.layers[2].tint = token_tint

data:extend({ token_creeper })