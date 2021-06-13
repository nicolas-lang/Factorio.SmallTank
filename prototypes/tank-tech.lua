local data = _G.data
local mods = _G.mods
--===================================================================================
--Register Tech
--===================================================================================
local tankTech = {
		type = "technology",
		name = "small-storage-tank",
		icon = "__nco-SmallTank__/graphics/icons/small-storage-tank.png",
		icon_size = 128,
		prerequisites = {
			"automated-rail-transportation",
			"steel-processing"
		},
		effects = {
			{type = "unlock-recipe",recipe = "small-storage-tank"}
		},
		unit = {
			count = 150,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 2},
			},
			time = 30
		},
		order = "c-a"
	}
-------------------------------------------------------------------------------------
if mods["Krastorio2"] then
	table.insert(tankTech.prerequisites, "kr-containers")
	table.insert(tankTech.prerequisites, "kr-steel-fluid-handling")
else
	table.insert(tankTech.prerequisites, "fluid-handling")
end
-------------------------------------------------------------------------------------
data:extend({tankTech})
-------------------------------------------------------------------------------------