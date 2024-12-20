﻿require("__base__/prototypes/entity/pipecovers")
local util = require("util")
local data = _G.data
local pipecoverspictures = _G.pipecoverspictures
local circuit_connector_definitions = _G.circuit_connector_definitions
local universal_connector_template = _G.universal_connector_template
-------------------------------------------------------------------------------
local empty_sprite = {
	filename    = "__core__/graphics/empty.png",
	priority    = "extra-high",
	width       = 1,
	height      = 1,
	frame_count = 1
}
-------------------------------------------------------------------------------
local fluidSize = 15000
local myStorageTank = {
	name = "small-storage-tank",
	type = "storage-tank",
	minable = { mining_time = 5, result = "small-storage-tank" },
	two_direction_only = true,
	corpse = "storage-tank-remnants",
	dying_explosion = "storage-tank-explosion",
	flags = { "placeable-player", "player-creation" },
	icon = "__nco-SmallTank__/graphics/icons/small-storage-tank.png",
	icon_size = 128,
	max_health = 500,
	fluid_box = {
		volume = fluidSize,
		pipe_connections = {
			-- a connection needs to be in tile-center and to ensure that, values will be rounded by the game
			-- the position is also used by pipecoverspictures() but without the rounding
			{ position = { x = 0.5, y = -0.51 },  direction = 0 }, --North
			{ position = { x = -0.5, y = -0.51 }, direction = 0 }, --North
			{ position = { x = 0.5, y = 0.51 },   direction = 8 }, -- South
			{ position = { x = -0.5, y = 0.51 },  direction = 8 }, -- South
			{ position = { x = 0.51, y = -0.5 },  direction = 4 }, -- East
			{ position = { x = 0.51, y = 0.5 },   direction = 4 }, -- East
			{ position = { x = -0.51, y = -0.5 }, direction = 12 }, -- West
			{ position = { x = -0.51, y = 0.5 },  direction = 12 } -- West
		},
		pipe_covers = pipecoverspictures(),
	},
	flow_length_in_ticks = 1,
	pictures = {
		flow_sprite = empty_sprite,
		fluid_background = empty_sprite,
		gas_flow = empty_sprite,
		window_background = empty_sprite,
		picture = {
			sheets = {
				{
					filename = "__nco-SmallTank__/graphics/entity/small-storage-tank.png",
					width = 256,
					height = 256,
					scale = 0.5,
				},
				{
					draw_as_shadow = true,
					filename = "__nco-SmallTank__/graphics/entity/small-storage-tank_shadow.png",
					width = 256,
					height = 256,
					scale = 0.5,
				}
			}
		},
	},
	selection_box = {},
	vehicle_impact_sound = {},
	window_bounding_box = { { 0, 0 }, { 0, 0 } },
	working_sound = {},
}

circuit_connector_definitions["small-storage-tank"] = circuit_connector_definitions.create_vector
	(
		universal_connector_template,
		{
			{ variation = 2, main_offset = util.by_pixel(0, 3),   shadow_offset = util.by_pixel(-2, 3),  show_shadow = true },
			{ variation = 4, main_offset = util.by_pixel(-4, 18), shadow_offset = util.by_pixel(-2, 18), show_shadow = true },
			{ variation = 4, main_offset = util.by_pixel(-4, 18), shadow_offset = util.by_pixel(-2, 18), show_shadow = true },
			{ variation = 4, main_offset = util.by_pixel(-4, 18), shadow_offset = util.by_pixel(-2, 18), show_shadow = true }
		}
	)
myStorageTank.vehicle_impact_sound = util.table.deepcopy(
	data.raw["storage-tank"]["storage-tank"]["vehicle_impact_sound"]
)
myStorageTank.working_sound = util.table.deepcopy(data.raw["storage-tank"]["storage-tank"]["working_sound"])
myStorageTank.circuit_connector_sprites = circuit_connector_definitions["small-storage-tank"].sprites
myStorageTank.circuit_wire_connection_points = circuit_connector_definitions["small-storage-tank"].points
myStorageTank.circuit_wire_max_distance = 9
myStorageTank.collision_box = { { -(2 / 2 - 0.01), -(2 / 2 - 0.01) }, { (2 / 2 - 0.01), (2 / 2 - 0.01) } }
myStorageTank.selection_box = { { -(2 / 2), -(2 / 2) }, { (2 / 2), (2 / 2) } }
data:extend({ myStorageTank })
-------------------------------------------------------------------------------------
--[[
local logData = util.table.deepcopy(myStorageTank)
logData.fluid_box.pipe_covers = {}
logData.vehicle_impact_sound = {}
logData.working_sound = {}
logData.circuit_connector_sprites = {}
logData.circuit_wire_connection_points = {}
log(serpent.block(logData, {comment = false, numformat = '%1.8g', compact = true } ))
]]
-------------------------------------------------------------------------------------
