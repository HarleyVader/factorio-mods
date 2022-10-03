table.insert(data.raw["technology"]["military"].effects,
		{
			type = "unlock-recipe",
			recipe = "melkiewey-token"
		})

if data.raw["item"]["creeper-token"] then
	table.insert(data.raw["technology"]["automation"].effects,
			{
				type = "unlock-recipe",
				recipe = "melkiewey-artifact-to-token"
			})
end
