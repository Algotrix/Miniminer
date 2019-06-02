test = map_range(23, 87, 75, 500, 1000);

#macro dir_none -1
#macro dir_up 0
#macro dir_right 1
#macro dir_down 2
#macro dir_left 3
#macro dir_top 0
#macro dir_bottom 2

#macro layer_blocks "blocks"
#macro layer_background "blocks_back"
#macro layer_collectibles "collectibles"
#macro layer_drops "drops"
#macro layer_game "game"
#macro layer_special "special_blocks"
#macro layer_areas "areas"

#macro char_player "char_player"
#macro char_shopkeep "char_shopkeep"

global.is_in_dialogue = false;
global.halted = false;
global.can_move = true;

global.debug0 = "";
global.debug1 = "";
global.debug2 = "";
global.debug3 = "";
global.debug4 = "";
global.debug5 = "";

room_goto_next();