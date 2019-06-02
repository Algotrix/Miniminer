global.can_move = false;
fadeout = instance_create_layer(-1, -2, layer_game, o_fadeout);
fadeout.duration = 300;

die_text = "You died";
sub_text = "Press space to restart";

hud_you_died = instance_create_layer(-1, -1, layer_game, o_hud_you_died);
hud_you_died.sub_text = ""




