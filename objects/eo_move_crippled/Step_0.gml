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
		state = "event_move_crippled_restart_or_continue";
		var _fadeout = instance_create_layer(-1, -2, layer_game, o_fadeout);
		_fadeout.duration = 300;
		var _hud = instance_create_layer(-1, -2, layer_game, o_hud_you_died);
		_hud.sub_text = "";
	}
	else
	{
		// todo: schön wärs. hier nach vorne purzeln
		//sprite_set_offset(o_player.sprite_index, 0, 7);
		//o_player.image_angle = map_range(30, 0, event_move_crippled_fall_length, 0, 90);
	}
}
else if(state == "event_move_crippled_restart_or_continue")
{
	if(instance_exists(o_fadeout) && o_fadeout.fadeout_done)
	{
		o_hud_you_died.sub_text = "Press space to restart";
		if(o_input.key_up)
		{
			instance_destroy(o_fadeout);
			instance_create_layer(-1, -2, layer_game, o_fadein);
			state = "event_move_crippled_show_text";
		}
		else if(o_input.key_action)
		{
			room_restart();
		}
	}
}
else if(state == "event_move_crippled_show_text")
{
	if(o_fadein.fadein_done)
	{
		instance_destroy(o_fadein);
		instance_destroy(o_hud_you_died);
		textbox_show("AAaaaaah! My legs are broken!", "Wh... why do do you hate me so much?")
		state = "event_move_crippled_check_damage";
		global.can_move = true;
	}
}
else if(state == "event_move_crippled_check_damage")
{
	var _dmg = 0;
	if(o_player.vsp == 0 && o_player.vsp != event_move_crippled_last_vsp && event_move_crippled_last_vsp >= 1.5)
	{
		_dmg = 100;
		textbox_add("Aaaaaaaaaaaaaaaaa", true, 30, false, make_color_rgb(33,00,00), make_color_rgb(160,00,00), c_red);
		textbox_show_ext();
	}
	if(o_player.vsp == 0 && o_player.vsp != event_move_crippled_last_vsp && event_move_crippled_last_vsp < -1.5)
	{
		_dmg = 9;
		if(global.hp - _dmg > 0)
		{
			textbox_add("Aaaaaaaaa! The pain!!!", true, 30, false, make_color_rgb(33,00,00), make_color_rgb(160,00,00), c_red);
			textbox_show_ext();
		}
	}
	else if(o_player.vsp == 0 && o_player.vsp != event_move_crippled_last_vsp && event_move_crippled_last_vsp < -1)
	{
		_dmg = 4;
		if(global.hp - _dmg > 0)
		{
			textbox_add("Ouch!!", true, 30, false, make_color_rgb(33,00,00), make_color_rgb(160,00,00), c_white);
			textbox_show_ext();
		}
	}
	
	if(global.hp - _dmg <= 0 && !global.pre_death_got_shiney)
	{
		// not normal death
		global.hp = max(global.hp - _dmg, 1);
		var _dead = instance_create_layer(-1, -1, layer_game, o_dead);
		_dead.sub_text = "This time for real";
	}
	else
	{
		player_apply_damage(_dmg);	
	}
	
	event_move_crippled_last_vsp = o_player.vsp;
}
else if(state == "end")
{
	killme();	
}