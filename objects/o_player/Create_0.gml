/// @description Hier Beschreibung einfügen
state = "idle";
input = o_input;

x_pos = x / 8;
y_pos = y / 8;

x_pos_new = x_pos;
y_pos_new = y_pos;

move_dir = dir_none;

//constants
#macro dir_none -1
#macro dir_up 0
#macro dir_right 1
#macro dir_down 2
#macro dir_left 3