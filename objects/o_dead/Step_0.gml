if(o_fadeout.fadeout_done)
{
	o_hud_you_died.die_text = die_text;
	o_hud_you_died.sub_text = sub_text;
	
	if(o_input.key_action)
	{
		destroy_countdown_running = true;
	}
	
	if(destroy_countdown_running)
	{
		destroy_wait_frames -= 1;
		if(destroy_wait_frames == 0) 
		{
			kill(fadeout);
			kill(hud_you_died);
			if(after_death_game_state != noone)
			{
				o_game_script.state = after_death_game_state;
				global.can_move = true;
			}
			if(restart_on_action) room_restart();
			killme();
		}
	}
}
