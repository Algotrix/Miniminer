if(o_fadeout.fadeout_done)
{
	o_hud_you_died.sub_text = sub_text;
	if(o_input.key_action)
	{
		room_restart();
		killme();
	}
}
