if(settings.startup["melkiewey-module-tokens-conversion"].value) then
	-- make melkiewey tokens from creeper tokens --
	data:extend({
		{
			type = "recipe",
			name = "creeper-tokens-to-melkiewey-tokens",
			enabled = true,
			energy_required = 10,
			ingredients = { { "artifact-tokens", 1 } },
			result = "iron-ore",
			result_count = 5
		}
	})

end