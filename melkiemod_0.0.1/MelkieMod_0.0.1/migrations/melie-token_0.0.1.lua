for i, force in pairs(game.forces) do
	if force.technologies["creeper-tokens-to-melkiewey-tokens"].researched then
		force.recipes["token-generation"].enabled = true
	end
end