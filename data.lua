require("prototypes.entity.entity")

require("prototypes.item.melkiewey-token")

require("prototypes.recipe.entity-melkiwey")

require("prototypes.technology.technology")

local amount_setting = settings.startup["melkiewey-module-token-conversion"].value / 100

function AddTokenToEntity(entityType, entityName, probability, countMin, countMax)
	if data.raw[entityType] ~= nil then
		if data.raw[entityType][entityName] ~= nil then
			if data.raw[entityType][entityName].loot == nil then
				data.raw[entityType][entityName].loot = {}
			end
			table.insert(data.raw[entityType][entityName].loot, { item = "melkiewey-token", probability = probability, count_min = countMin, count_max = math.floor(countMax + 0.5) })
		end
	end
end

local function AddTokenToVanillaEnemies()
	local SMALL_TOKEN_PROBABILITY = 0.33 * amount_setting
	local MEDIUM_TOKEN_PROBABILITY = 0.66 * amount_setting
	local BIG_TOKEN_PROBABILITY = 0.83 * amount_setting
	local ONE_PROBABILITY = 1 * amount_setting

	AddTokenToEntity("unit", "small-spitter", SMALL_TOKEN_PROBABILITY, 1, 1)
	AddTokenToEntity("unit", "small-biter", SMALL_TOKEN_PROBABILITY, 1, 1)

	AddTokenToEntity("unit", "medium-spitter", MEDIUM_TOKEN_PROBABILITY, 1, 2)
	AddTokenToEntity("unit", "medium-biter", MEDIUM_TOKEN_PROBABILITY, 1, 2)

	AddTokenToEntity("unit", "big-spitter", BIG_TOKEN_PROBABILITY, 1, 5)
	AddTokenToEntity("unit", "big-biter", BIG_TOKEN_PROBABILITY, 1, 5)

	AddTokenToEntity("unit", "behemoth-spitter", ONE_PROBABILITY, 2, 20)
	AddTokenToEntity("unit", "behemoth-biter", ONE_PROBABILITY, 2, 20)

	AddTokenToEntity("turret", "little-worm-turret", ONE_PROBABILITY, 1, 5)
	AddTokenToEntity("turret", "medium-worm-turret", ONE_PROBABILITY, 1, 10)
	AddTokenToEntity("turret", "big-worm-turret", ONE_PROBABILITY, 1, 25)
	AddTokenToEntity("turret", "behemoth-worm-turret", ONE_PROBABILITY, 10, 25)

	AddTokenToEntity("unit-spawner", "biter-spawner", ONE_PROBABILITY, 20, 50)
	AddTokenToEntity("unit-spawner", "spitter-spawner", ONE_PROBABILITY, 20, 50)
end


-- This is for the Natural Expansion Mod
local function AddTokenToNEEnemies()
	for i = 1, 20 do
		local token_probability = amount_setting * math.min(i * 0.04, 1) -- 80 % at highest tier
		local max_token_amount = math.floor(math.max(i * 0.101, 1))

		AddTokenToEntity("unit", "ne-biter-breeder-" .. i, token_probability, 1, max_token_amount)
		AddTokenToEntity("unit", "ne-biter-fire-" .. i, token_probability, 1, max_token_amount)
		AddTokenToEntity("unit", "ne-biter-fast-" .. i, token_probability, 1, max_token_amount)
		AddTokenToEntity("unit", "ne-biter-wallbreaker-" .. i, token_probability, 1, max_token_amount)
		AddTokenToEntity("unit", "ne-biter-tank-" .. i, token_probability, 1, max_token_amount)

		AddTokenToEntity("unit", "ne-spitter-breeder-" .. i, token_probability, 1, max_token_amount)
		AddTokenToEntity("unit", "ne-spitter-fire-" .. i, token_probability, 1, max_token_amount)
		AddTokenToEntity("unit", "ne-spitter-ulaunch-" .. i, token_probability, 1, max_token_amount)
		AddTokenToEntity("unit", "ne-spitter-webshooter-" .. i, token_probability, 1, max_token_amount)
		AddTokenToEntity("unit", "ne-spitter-mine-" .. i, token_probability, 1, max_token_amount)
	end

	for i = 2, 3 do
		local MEDIUM_TOKEN_PROBABILITY = 0.5 * amount_setting
		local BIG_TOKEN_PROBABILITY = 1 * amount_setting

		AddTokenToEntity("unit", "small-spitter-Mk" .. i, MEDIUM_TOKEN_PROBABILITY, 1, 1)
		AddTokenToEntity("unit", "small-biter-Mk" .. i, MEDIUM_TOKEN_PROBABILITY, 1, 1)
		AddTokenToEntity("unit", "medium-spitter-Mk" .. i, BIG_TOKEN_PROBABILITY, 1, 2)
		AddTokenToEntity("unit", "medium-biter-Mk" .. i, BIG_TOKEN_PROBABILITY, 1, 2)
		AddTokenToEntity("unit", "big-spitter-Mk" .. i, BIG_TOKEN_PROBABILITY, 1, 5)
		AddTokenToEntity("unit", "big-biter-Mk" .. i, BIG_TOKEN_PROBABILITY, 1, 5)
	end

	-- boss unit from NE
	AddTokenToEntity("unit", "ne-biter-megladon", 1 * amount_setting, 50, 200)
end

-- Rampant mod enemies
local function AddTokenToRampantEnemies()
	for t = 1, 10 do
		for v = 1, 20 do
			local token_probability = amount_setting * math.min(t * 0.08, 1) -- 80 % at highest tier
			local max_token_amount = 1

			AddTokenToEntity("unit", "neutral-biter-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("unit", "neutral-spitter-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("unit", "acid-biter-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("unit", "acid-spitter-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("unit", "physical-biter-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("unit", "electric-biter-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("unit", "suicide-biter-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("unit", "nuclear-biter-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("unit", "fire-biter-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("unit", "fire-spitter-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("unit", "inferno-spitter-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("unit", "troll-biter-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("unit", "troll-spitter-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("unit", "fast-biter-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("unit", "fast-spitter-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("unit", "laser-biter-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("unit", "laser-spitter-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("unit", "wasp-spitter-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("unit", "spawner-spitter-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("unit", "spawner-biter-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)

			AddTokenToEntity("turret", "neutral-worm-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("turret", "acid-worm-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("turret", "physical-worm-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("turret", "electric-worm-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("turret", "suicide-worm-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("turret", "nuclear-worm-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("turret", "fire-worm-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("turret", "inferno-worm-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("turret", "troll-worm-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("turret", "fast-worm-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("turret", "laser-worm-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("turret", "wasp-worm-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
			AddTokenToEntity("turret", "spawner-worm-v" .. v .. "-t" .. t .. "-rampant", token_probability, 1, max_token_amount)
		end
	end
end

local function AddTokenToSchallEndgameEnemies()
	local token_probability = 1 * amount_setting
	--category 5 to 15 (behemoth = 4)
	local units = data.raw.unit
	for n = 5, 15 do
       	local loot_min = math.min(n * 1, 15)
		local loot_max = math.min(n * 4, 35)
        local biter_name = "Schall-category-"..n.."-biter"
        local spitter_name = "Schall-category-"..n.."-spitter"

		if units[biter_name] then
			AddTokenToEntity("unit", biter_name, token_probability, loot_min, loot_max)
		end
		if units[spitter_name] then
			AddTokenToEntity("unit", spitter_name, token_probability, loot_min, loot_max)
		end
	end
end

if amount_setting > 0 then
	AddTokenToVanillaEnemies()
	AddTokenToNEEnemies()
	AddTokenToRampantEnemies()
	AddTokenToSchallEndgameEnemies()
end
