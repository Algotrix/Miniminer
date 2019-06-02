if(state == "event_move_crippled")
{
	global.can_move = false;
	event_move_crippled_fall_length -= 1;
	if(event_move_crippled_fall_length == 0)
	{
		o_player.sprite_index = s_player_crippled;
		o_player.event_move_crippled = true;
		_area = get_area(2, 5, area_jump);
		_area.image_yscale = room_height;
		player_apply_damage(global.hp * 0.7);
		state = "event_move_crippled_show_text";
	}
	else
	{
		// todo: schön wärs. hier nach vorne purzeln
		//sprite_set_offset(o_player.sprite_index, 0, 7);
		//o_player.image_angle = map_range(30, 0, event_move_crippled_fall_length, 0, 90);
	}
}
else if(state == "event_move_crippled_show_text")
{
	event_move_crippled_show_text_wait -= 1;
		
	if(event_move_crippled_show_text_wait <= 0)
	{
		textbox_show("AAaaaaah! My legs are broken!", "Wh... why do do you hate me so much?")
		state = "event_move_crippled_check_damage";
		global.can_move = true;
	}
}
else if(state == "event_move_crippled_check_damage")
{
	if(o_player.vsp == 0 && o_player.vsp != event_move_crippled_last_vsp && event_move_crippled_last_vsp < -1.5)
	{
		textbox_add("Aaaaaaaaa! The pain!!!", true, 30, false, make_color_rgb(33,00,00), make_color_rgb(160,00,00), c_red);
		textbox_show_ext();
		player_apply_damage(9);
	}
	else if(o_player.vsp == 0 && o_player.vsp != event_move_crippled_last_vsp && event_move_crippled_last_vsp < -1)
	{
		textbox_add("Ouch!!", true, 30, false, make_color_rgb(33,00,00), make_color_rgb(160,00,00), c_white);
		textbox_show_ext();

		player_apply_damage(4);
	}

	event_move_crippled_last_vsp = o_player.vsp;
}
else if(state == "end")
{
	killme();	
}