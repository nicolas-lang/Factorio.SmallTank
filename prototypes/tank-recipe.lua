local data = _G.data
-------------------------------------------------------------------------------------
data:extend({
	{
		type = "recipe",
		name = "small-storage-tank",
		energy_required = 30,
		enabled = false,
		ingredients = {
			{"pump", 1},
			{"pipe", 4},
			{"storage-tank", 1}
		},
		result = "small-storage-tank",
	},
})