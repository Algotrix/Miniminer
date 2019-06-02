/// @description Hier Beschreibung einfügen
state = "idle";
input = o_input;

x_pos = x / 8;
y_pos = y / 8;

x_pos_new = x_pos;
y_pos_new = y_pos;

vsp = 0;

move_dir = dir_none;
action_dir = dir_none;
look_dir = dir_right;

// actions
a_drain_stamina = 0;
a_apply_damage = 0; 

// internal states
event_move_crippled = false;
event_move_crippled_x_new = -1;
