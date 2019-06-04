if(current_fadein == noone)
{
	current_fadein = instance_create_layer(-1, -1, layer_game, o_fadein);
	if(instance_exists(o_fadeout)) instance_destroy(o_fadeout);
}
if(current_fadein.fadein_done)
{
	instance_destroy(current_fadein);
	current_fadein = noone;
	cutscene_end_action();	
}