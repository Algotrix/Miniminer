if(global.is_in_dialogue) exit;

if(progress == "test")
{
	textbox_add("hello, here am i!", false, 300, true, c_black, c_white, c_red, "The New One", c_red);	
	textbox_add("another fancy dialogue - yay!", true, 300, false, c_black, c_blue, c_white, "Der da!");
	textbox_add("isn't it great, huh?", false, 300, true, c_green, c_black);
	textbox_show_ext();
	
}

#region start
if(progress == "start")
{
	global.halted = true;
	progress = "start_fadein";
}
else if(progress == "start_fadein")
{
	if(!instance_exists(o_fadein))
	{
		instance_create_depth(-1, -1, -5000, o_fadein);
	}
	if(o_fadein.fadein_done)
	{
		progress = "start_forreal";
	}
}
else if(progress == "start_forreal")
{
	textbox_show("Uuuh what happened?")	;
	global.halted = false;
	progress = "pre_death1";
}
#endregion

#region pre_death
var _potions_max = 5;
var _stamina_percent = o_stats.stamina / o_stats.max_stamina * 100;

if(progress == "pre_death1")
{
	if(_stamina_percent	<= 50)
	{
		textbox_show("I'm getting exhausted...");
		progress = "pre_death2";
	}
}
else if(progress == "pre_death2")
{
	if(_stamina_percent	<= 25)
	{
		textbox_show("I'm feeling dizzy...", "I will surely die if i run out of stamina");
		progress = "pre_death2b";
	}
}
else if(progress == "pre_death2b")
{
	if(_stamina_percent	<= 5)
	{
		var _text = "I'm... collapsing .. .. .";
		if(pre_death_potions_drank >= 1) _text += " again";
		textbox_show(_text);
		progress = "pre_death3";
	}
}
else if(progress == "pre_death3")
{
	if(_stamina_percent	<= 0)
	{
		if(pre_death_potions_drank == 0)
		{
			textbox_show("I guess i should drink this one last potion.");
			progress = "pre_death3_wait";
		}
		else if(pre_death_potions_drank == 1)
		{
			textbox_show("Oh.. i found another one....");
			progress = "pre_death3_wait";
		}
		else if(pre_death_potions_drank < _potions_max)
		{
			textbox_show("Here's some more. Only " + string(_potions_max - pre_death_potions_drank) +" left.");
			progress = "pre_death3_wait";
		}
		else if(pre_death_potions_drank == _potions_max )
		{
			textbox_show("There goes the last one...", "Please don't let me die...");
			progress = "pre_death3_wait";
		}
		else if(pre_death_potions_drank == _potions_max + 1)
		{
			progress = "pre_death4";	
		}
		
	}
}
else if(progress == "pre_death3_wait")
{
	progress = "pre_death1";
	pre_death_potions_drank += 1;
	o_stats.stamina = o_stats.max_stamina;
}
else if(progress == "pre_death4")
{
	if(_stamina_percent	< 20)
	{
		textbox_show("Dont", "do", "this", "to", "me", "....", "please!!!!!!");
		progress = "pre_death5";
	}
}
else if(progress == "pre_death5")
{
	if(_stamina_percent	<= 0)
	{
		textbox_add("Aaaaaaaaaaahhhh!", false, 300, false, rgb("AA0000"), c_black, c_white);	
		textbox_add("aaa. .aaaa.  .. a.a.a", true, 300, false, c_black, c_red, c_red);
		textbox_add("", false, 300, false, make_color_rgb(30, 30, 30), c_black);
		textbox_show_ext();
		global.halted = true;
		progress = "pre_death5_fadeout"
	}
}
else if(progress == "pre_death5_fadeout")
{
	if(!instance_exists(o_fadeout))
	{
		instance_create_depth(-1, -1, 0, o_fadeout);
	}
	if(o_fadeout.fadeout_done)
	{
		progress = "pre_death5_fadein";
		textbox_add("Never gonna give me up never gonna let me down", false, 300, false, make_color_rgb(1, 1, 1), rgb("222222"), c_black);
		textbox_show_ext();
	}
}
else if(progress == "pre_death5_fadein")
{
	if(!instance_exists(o_fadein))
	{
		instance_destroy(o_fadeout);
		instance_create_depth(-1, -1, 0, o_fadein);
	}
	if(o_fadein.fadein_done)
	{
		progress = "pre_death5_end";
	}
}
else if(progress == "pre_death5_end")
{
	instance_destroy(o_fadein);
	textbox_add("!!!!!!!", false, 60, false, c_black, c_red);
	textbox_add("oh..", false, 60, false, c_black, c_white);
	textbox_add("what's in this pocket? let's see..", false, 60, false, c_black, c_white);
	textbox_add("oops, i totally forgot about...", false, 60, false);
	textbox_add("...that bag with unlimited potions", false, 300, false);
	textbox_add("sorry, my fault...", false, 60, false);
	textbox_add("well yeah, keep on diggin' and so", false, 180, false);
	textbox_show_ext();
	progress = "pre_death6_refill";	
	global.halted = false;
}
else if(progress == "pre_death6_refill")
{
	progress = "pre_death6";
	pre_death_potions_drank += 1;
	o_stats.stamina = o_stats.max_stamina;
}
else if(progress == "pre_death6")
{
	if(_stamina_percent	<= 0)
	{
		textbox_show("I should drink a potion.");
		progress = "pre_death6_refill";
	}
}
#endregion

