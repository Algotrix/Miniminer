if(o_fadeout.fadeout_done)
{
	o_hud_you_died.die_text = die_text;
	o_hud_you_died.sub_text = sub_text;
	
	if(o_input.key_action)
	{
		if(instance_exists(fadeout)) instance_destroy(fadeout);
		if(instance_exists(hud_you_died)) instance_destroy(hud_you_died);
		if(restart_on_action) room_restart();
		killme();
		destroy_countdown_running = true;
	}
	
	if(destroy_countdown_running)
	{
		destroy_wait_frames -= 1;
		if(destroy_wait_frames == 0) killme();
	}
}
