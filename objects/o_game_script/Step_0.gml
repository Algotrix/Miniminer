if(global.is_in_dialogue) exit;

if(state == "test")
{
	var _c = cutscene_create();
	cutscene_add(_c, cutscene_fadein);
	//cutscene_add_itembox(_c, "You've got an achievement!", s_char_shopkeep, "You sneaky bastard!");
	//cutscene_add_wait(_c, 5);
	cutscene_add_textbox(_c, "esdf!", true);
	//cutscene_add_textbox(_c, "abcd!", true);
	cutscene_start(_c);
	state = "";
}

#region start
if(state == "start")
{
	global.halted = true;
	state = "start_fadein";
}
else if(state == "start_fadein")
{
	if(!instance_exists(o_fadein))
	{
		instance_create_depth(-1, -1, -5000, o_fadein);
	}
	if(o_fadein.fadein_done)
	{
		state = "start_forreal";
		instance_destroy(o_fadein);
	}
}
else if(state == "start_forreal")
{
	textbox_show("Uuuh what happened?")	;
	global.halted = false;
	state = "pre_death1";
}
#endregion

#region pre_death
var _potions_max = 5;
var _stamina_percent = global.stamina / global.max_stamina * 100;

if(state == "pre_death1")
{
	if(_stamina_percent	<= 50)
	{
		textbox_show("I'm getting exhausted...");
		state = "pre_death2";
	}
}
else if(state == "pre_death2")
{
	if(_stamina_percent	<= 25)
	{
		textbox_show("I'm feeling dizzy...", "I will surely die if i run out of stamina");
		state = "pre_death2b";
	}
}
else if(state == "pre_death2b")
{
	if(_stamina_percent	<= 5)
	{
		var _text = "I'm... collapsing .. .. .";
		if(pre_death_potions_drank >= 1) _text += " again";
		textbox_show(_text);
		state = "pre_death3";
	}
}
else if(state == "pre_death3")
{
	if(_stamina_percent	<= 0)
	{
		if(pre_death_potions_drank == 0)
		{
			textbox_show("I guess i should drink this one last potion.");
			state = "pre_death3_wait";
		}
		else if(pre_death_potions_drank == 1)
		{
			textbox_show("Oh.. i found another potion....");
			state = "pre_death3_wait";
		}
		else if(pre_death_potions_drank < _potions_max)
		{
			textbox_show("Here's some more. Only " + string(_potions_max - pre_death_potions_drank) +" left.");
			state = "pre_death3_wait";
		}
		else if(pre_death_potions_drank == _potions_max )
		{
			textbox_show("There goes the last one...", "Please don't let me die...");
			state = "pre_death4";
			pre_death_potions_drank += 1;
			global.stamina = global.max_stamina;
		}
	}


}
else if(state == "pre_death3_wait")
{
	state = "pre_death1";
	pre_death_potions_drank += 1;
	global.stamina = global.max_stamina;
}
else if(state == "pre_death4")
{
	if(_stamina_percent	< 20)
	{
		textbox_show("Dont", "do", "this", "to", "me", "....", "please!!!!!!");
		state = "pre_death5";
	}
}
else if(state == "pre_death5")
{
	if(_stamina_percent	<= 0)
	{
		if(!instance_exists(o_fadeout))
		{
			instance_create_depth(-1, -1, 0, o_fadeout);
		}

		if(!pre_death5_textshown) // wait for fadeout
		{
			textbox_add("Aaaaaaaaaaahhhh!", false, 300, false, rgb("AA0000"), c_black, c_white);	
			textbox_add("aaa. .aaaa.  .. a.a.a", true, 300, false, c_black, c_red, c_red);
			textbox_add("OoooO OoO ooOOoO oOo OOoOooOOo Oooo", true, 300, false, c_black, c_red, c_red);
			textbox_add("", false, 300, false, make_color_rgb(30, 30, 30), c_black);
			textbox_show_ext();
		
			global.halted = true;
			pre_death5_textshown = true;
		}
		
		if(o_fadeout.fadeout_done)
		{
			state = "pre_death5_fadeout"
		}
	}
}
else if(state == "pre_death5_fadeout")
{
	textbox_add("Never gonna give me up never gonna let me down", false, 300, false, make_color_rgb(1, 1, 1), rgb("222222"), c_black);
	textbox_show_ext();
	state = "pre_death5_fadein";

}
else if(state == "pre_death5_fadein")
{
	if(!instance_exists(o_fadein))
	{
		instance_destroy(o_fadeout);
		instance_create_depth(-1, -1, 0, o_fadein);
	}
	if(o_fadein.fadein_done)
	{
		state = "pre_death5_end";
	}
}
else if(state == "pre_death5_end")
{
	instance_destroy(o_fadein);
	textbox_add("!!!!!!!", false, 60, false, c_black, c_red);
	textbox_add("oh..", false, 60, false, c_black, c_white);
	textbox_add("what's that in my pocket? let's see..", false, 60, false, c_black, c_white);
	textbox_add("oops, i totally forgot about...", false, 60, false);
	textbox_add("...that bag with unlimited potions", false, 300, false);
	textbox_add("sorry, my fault...", false, 60, false);
	textbox_add("well yeah, keep on diggin' and so", false, 180, false);
	textbox_show_ext();
	state = "pre_death6_refill";	
	global.halted = false;
}
else if(state == "pre_death6_refill")
{
	state = "pre_death6";
	pre_death_potions_drank += 1;
	global.stamina = global.max_stamina;
	
	global.achievement_unlimited_potions = true;
}
else if(state == "pre_death6")
{
	if(_stamina_percent	<= 0)
	{
		textbox_show("I should drink a potion.");
		state = "pre_death6_refill";
	}
}
#endregion

#region pre_death_got_shiney

if(state == "pre_death_got_shiney")
{	
	global.can_move = false;
	global.pre_death_got_shiney = true;
	textbox_show("Wow! A SHINEY!", "This must be worth a Marillion!", "And it's MINE!", "Its......  M_I_N_E");
	global.stamina = global.max_stamina;
	state = "pre_death_got_shiney2";
}
else if(state == "pre_death_got_shiney2")
{	
	pre_death_got_shiney2_wait -= 1;
	if (pre_death_got_shiney2_wait == 0)
	{
		o_player.sprite_index = s_shiny1_green;
		o_player.image_index = 0;
		o_player.event_move_crippled = true;
		_area = get_area(2, 5, area_jump);
		_area.image_yscale = room_height;
		textbox_add("Harr Harr Harr!!!", false, 120, false, make_color_rgb(0, 128, 0));
		textbox_add("I AM RICH $$$", true, 120, false, make_color_rgb(0, 128, 0));
		textbox_add("I AM -SHINEY-", true, 120, false, make_color_rgb(0, 128, 0));
		textbox_show_ext();
		state = "pre_death_got_shiney3";
		global.can_move = true;
	}
}
else if(state == "pre_death_got_shiney3")
{	
	var _wait = 30;
	var _event_move_crippled = instance_exists(eo_move_crippled);
	pre_death_got_shiney3_jumped_wait -= 1;
	
	#region check for jump messages when not crippled
	if(!_event_move_crippled)
	{
		if(o_input.key_up && pre_death_got_shiney3_jumped_wait < 0)
		{
			pre_death_got_shiney3_jumped += 1;
			pre_death_got_shiney3_jumped_wait = _wait;

			if(pre_death_got_shiney3_jumped = 2)
			{
				textbox_add("What! I'm too heavy!!", false, 120, false, make_color_rgb(0, 128, 0));
				textbox_show_ext();
			}
			else if(pre_death_got_shiney3_jumped = 5)
			{
				textbox_add("No No No!! I won't drop the Shiney!", false, 120, false, make_color_rgb(0, 128, 0));
				textbox_show_ext();
			}
		}
	}
	#endregion
	
	#region check for walk messages when crippled
	if(_event_move_crippled)
	{
		if(o_input.key_left || o_input.key_right && pre_death_got_shiney3_jumped_wait < 0) 
		{
			pre_death_got_shiney3_jumped += 1;
			pre_death_got_shiney3_jumped_wait = _wait;
			
			if(pre_death_got_shiney3_jumped == 3)
			{
				textbox_add("At least i have my shiney...", false, 120, false, make_color_rgb(0, 128, 0));
				textbox_add("my one and only...", false, 120, false, make_color_rgb(0, 128, 0));
				textbox_show_ext();
			}
			else if(pre_death_got_shiney3_jumped == 9)
			{
				textbox_add("I will keep my shiney until i die!", false, 120, false, make_color_rgb(0, 128, 0));
				textbox_show_ext();
			}
			else if(pre_death_got_shiney3_jumped == 15)
			{
				textbox_add("-- UNTIL --", false, 120, false, make_color_rgb(0, 128, 0));
				textbox_show_ext();
			}
			else if(pre_death_got_shiney3_jumped == 16)
			{
				textbox_add("---- I ----", false, 120, false, make_color_rgb(0, 128, 0));
				textbox_show_ext();
			}
			else if(pre_death_got_shiney3_jumped == 18)
			{
				textbox_add("--- DIE ---", false, 120, false, make_color_rgb(0, 128, 0));
				textbox_show_ext();
			}
			global.debug0 = pre_death_got_shiney3_jumped
		}
	}
	#endregion
	
	#region check for SHATTER - player falls down as shiney - min 5 blocks
	if(o_player.vsp == 0 && pre_death_got_shiney3_last_vsp < -(global.grav * 25))
	{
		state = "pre_death_got_shiney_shatter";
		global.achievement_shattered = true;
		global.shinies = 0;
		o_player.sprite_index = s_shiny1_green_shattered;
		if(instance_exists(eo_move_crippled))
		{
			global.achievement_broken = true;	
		}
	}
	#endregion
	
	// stamina runs out
	if(global.stamina <= 10)
	{
		if(between(pre_death_potions_drank, 0, 2))
		{
			textbox_show("No more potions left....");
			pre_death_potions_drank = -1
		}
		else if(pre_death_potions_drank > 2)
		{
			textbox_show("Oh no!! Where are my potions gone?", "I must have dropped them when I picked up SHINEY");
			pre_death_potions_drank = -1
		}
	}
	if(global.stamina <= 0)
	{
		state = "pre_death_got_shiney_die";
	}
	if(global.hp <= 0 && _event_move_crippled)
	{
		state = "pre_death_got_shiney_die";
	}
	pre_death_got_shiney3_last_vsp = o_player.vsp;
}
else if(state == "pre_death_got_shiney_die")
{
	if(!instance_exists(o_dead)) instance_create_layer(-1, -1, layer_game, o_dead);
	o_dead.restart_on_action = false;
	state = "post_death_start";
}
else if(state == "pre_death_got_shiney_shatter")
{
	pre_death_got_shiney3_die_wait -= 1;
	if(pre_death_got_shiney3_die_wait == 0)
	{
		if(!instance_exists(o_dead)) instance_create_layer(-1, -1, layer_game, o_dead);
		o_dead.restart_on_action = false;

		if(instance_exists(eo_move_crippled))
		{
			o_dead.sub_text = "But you were a true hero. Press space to respawn";
		}
		else
		{
			o_dead.sub_text = "And destroyed SHINEY. Press space to respawn";
		}
		state = "post_death_start";
	}
}
#endregion

#region post_death_shopkeep

if(state == "post_death_start")
{
	if(!instance_exists(o_dead))
	{
		// todo: set black background + stars;
		var _c = cutscene_create();
		cutscene_add(_c, cutscene_fadein);
		cutscene_add_wait(_c, 3);

		instance_create_layer(apos(2), apos(7), layer_game, o_shopherd);
		o_player.image_index = 1;
		o_player.look_dir = dir_left;
		o_player.x = apos(4);
		o_player.y = apos(7);
	
		global.shinies = 0;
	
		state = "post_death_shopherd_dialogue";
	}


}
if(state == "post_death_shopherd_dialogue")
{
	cutscene_post_death_shopherd_dialogue = cutscene_create();
	var _c = cutscene_post_death_shopherd_dialogue;
	var _num_achievements = 0;
	var _c_guy = make_color_rgb(0, 0, 30)
	var _c_a1 = make_color_rgb(128, 255, 128);
	var _c_a2 = make_color_rgb(211, 211, 0);
	
	global.can_move = false;
	cutscene_add(_c, cutscene_fadein);
	
	cutscene_add_textbox(_c, "Congratulations you died.", 
		true, 180, false, _c_guy, c_white, c_white, "???", c_white);
		
	cutscene_add_textbox(_c, "Did it hurt?", 
		true, 180, false, _c_guy, c_white, c_white, "???", c_white);
		
	cutscene_add_textbox(_c, "Yeah, well i guess so. Now let's see", 
		true, 180, false, _c_guy, c_white, c_white, "???", c_white);
		
	cutscene_add_textbox(_c, "What do we have here? ...", 
		true, 180, false, _c_guy, c_white, c_white, "???", c_white);
		
	global.achievement_boxxy = true;
	global.achievement_shattered = true;
	global.achievement_broken = true;
	global.achievement_caught_shopkeep = true;
	global.achievement_unlimited_potions = true;
		
	if(global.achievement_boxxy)
	{
		cutscene_add_textbox(_c, "It looks like found the Box! That's great.", true, 180, false, _c_guy, c_white, _c_a1, "???", c_white);
		cutscene_add_textbox(_c, "I'm sure it had something powerful in it", true, 180, false, _c_guy, c_white, c_white, "???", c_white);
		_num_achievements += 1;
		cutscene_add_wait(_c, 3);
	}
	
	if(global.achievement_unlimited_potions)
	{
		cutscene_add_textbox(_c, "Oh i see you've got a bag full of potions.", 	true, 180, false, _c_guy, c_white, _c_a1, "???", c_white);
		cutscene_add_textbox(_c, "I'm sure you don't need that anymore.", true, 180, false, _c_guy, c_white, c_white, "???", c_white);
			
		cutscene_add_textbox(_c, "What what what???", false, 180, false);
		
		cutscene_add_textbox(_c, "It's gone already. Thank me later.",	true, 180, false, _c_guy, c_white, c_white, "???", c_white);
			
		cutscene_add_textbox(_c, "WTF!", false, 180, false);
		_num_achievements += 1;
		cutscene_add_wait(_c, 3);
	}
	
	if(global.achievement_caught_shopkeep)
	{
		cutscene_add_textbox(_c, "Awww.. you sneaky one.. ", true, 180, false, _c_guy, c_white, _c_a1, "???", c_white);
		cutscene_add_textbox(_c, "...tried to lurk under my robe, huh?", true, 180, false, _c_guy, c_white, c_white, "???", c_white);
		cutscene_add_textbox(_c, "Well, uuh.. don't do this again, ok?", true, 180, false, _c_guy, c_white, c_white, "???", c_white);
		_num_achievements += 1;
		cutscene_add_wait(_c, 3);
	}
	
	if(global.achievement_shattered)
	{
		cutscene_add_textbox(_c, "Oh, and you broke the SHINY. What a shame!", true, 180, false, _c_guy, c_white, _c_a1, "???", c_white);
		cutscene_add_textbox(_c, "But it's a feat actually! Congrats for that!", true, 180, false, _c_guy, c_white, c_white, "???", c_white);
		_num_achievements += 1;
		cutscene_add_wait(_c, 3);
		if(global.achievement_broken)
		{
			cutscene_add_textbox(_c, "!!!", true, 60, false, _c_guy, c_white, _c_a2, "???", c_white);
			cutscene_add_textbox(_c, "And you did it all while crippled !!!", true, 180, false, _c_guy, c_white, _c_a2, "???", c_white);
			cutscene_add_textbox(_c, "... and in searing pain !!!", true, 180, false, _c_guy, c_white, _c_a2, "???", c_white);
			cutscene_add_textbox(_c, "You must be a true hero. I bow before you.", true, 180, false, _c_guy, c_white, _c_a1, "???", c_white);
			cutscene_add_textbox(_c, ".. but don't think this will give you any advantages.", true, 180, false, _c_guy, c_white, c_white, "???", c_white);		
			_num_achievements += 1;
		}
	}
	
	cutscene_add_wait(_c, 5);
	cutscene_add_textbox(_c, "You've got " + string(_num_achievements) + " out of 5 achievements.",	true, 180, false, _c_guy, c_white, c_white, "???", c_white);

	if(global.shinies > 0)
	{
		cutscene_add_wait(_c, 3);
		cutscene_add_textbox(_c, "Huh?? Where is my SHINY???", false, 180, false);
	}
	
	cutscene_start(_c);

	state = "post_death_after_dialogue";

}
if(state == "post_death_after_dialogue")
{
	if(!instance_exists(cutscene_post_death_shopherd_dialogue))
	{
		global.can_move = true;	
		cutscene_post_death_shopherd_dialogue = noone;
		state = "end";
	}
}

#endregion
