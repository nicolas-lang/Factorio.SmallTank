local data = _G.data
-------------------------------------------------------------------------------------
data:extend({
	{
		type = "recipe",
		name = "small-storage-tank",
		energy_required = 30,
		enabled = false,
		ingredients = {
			{ type = "item", name = "storage-tank", amount = 5 },
			{ type = "item", name = "pipe",         amount = 4 },
			{ type = "item", name = "pump",         amount = 1 }
		},
		results = {
			{ type = "item", name = "small-storage-tank", amount = 1 },
		}
	},
})
