--[[
	Mod Bau_Comunitario para Minetest
	Copyright (C) 2017 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Cria um bau comunitario
	
  ]]

-- Formulario do bau
local formspec_bau =
	"size[8,9]"..
	default.gui_bg..
	default.gui_bg_img..
	default.gui_slots..
	"list[current_player;bau_comunitario;0,0.3;8,4;]"..
	"list[current_player;main;0,4.85;8,1;]"..
	"list[current_player;main;0,6.08;8,3;8]"..
	default.get_hotbar_bg(0,4.85)

minetest.register_node("bau_comunitario:bau", {
	description = "Bau Comunitario",
	tiles = {"default_chest_top.png", "default_chest_top.png", "default_chest_side.png",
		"default_chest_side.png", "default_chest_side.png", "default_chest_front.png"},
	paramtype2 = "facedir",
	groups = {choppy=2,oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),

	on_construct = function(pos)	
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Bau Comunitario")
	end,
	
	on_rightclick = function(pos, node, player)
		local name = player:get_player_name()
		local invref = player:get_inventory()
		if invref:get_list("listname") == nil then
			invref:set_size("bau_comunitario", 8*4)
		end
		minetest.show_formspec(name, "bau_comunitario", "size[8,9]"..
			default.gui_bg..
			default.gui_bg_img..
			default.gui_slots..
			"list[current_player;bau_comunitario;0,0.3;8,4;]"..
			"list[current_player;main;0,4.85;8,1;]"..
			"list[current_player;main;0,6.08;8,3;8]"	
		)
	end
	
})
