global.can_move = false;
fadeout = instance_create_layer(-1, -2, layer_game, o_fadeout);
fadeout.duration = 300;

die_text = "You died";
sub_text = "Press space to restart";

hud_you_died = instance_create_layer(-1, -1, layer_game, o_hud_you_died);
hud_you_died.sub_text = ""

restart_on_action = true;

destroy_wait_frames = 10;
destroy_countdown_running = false;

after_death_game_state = noone;


