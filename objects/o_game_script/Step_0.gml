if(global.is_in_dialogue) exit;

if(progress == "test")
{
	textbox_add("hello, here am i!", false, 300, true, c_black, c_white, c_red, "The New One", c_red);	
	textbox_add("another fancy dialogue - yay!", true, 300, false, c_black, c_blue, c_white, "Der da!");
	textbox_add("isn't it great, huh?", false, 300, true, c_green, c_black);
	textbox_show_ext();
	
}

if(progress == "start")
{
	textbox_show("Uuuh what happened?")	
	progress = "pre_death1";
}

var _potions_max = 5;
var _stamina_percent = o_stats.stamina / o_stats.max_stamina * 100;

if(progress == "pre_death1")
{
	if(_stamina_percent	< 50)
	{
		textbox_show("I'm getting exhausted...");
		progress = "pre_death2";
	}
}
else if(progress == "pre_death2")
{
	if(_stamina_percent	< 20)
	{
		textbox_show("I'm feeling dizzy");
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
		else if(pre_death_potions_drank == _potions_max - 1)
		{
			textbox_show("There goes the last one...", "Please don't let me die...");
			progress = "pre_death3_wait";
		}
		else if(pre_death_potions_drank == _potions_max)
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
		textbox_add("..", false, 300, false, c_blue, c_black);
		textbox_add(".....", false, 300, false, c_black, c_red);
		textbox_add("oh..", false, 300, false, c_black, c_white);
		textbox_add("what's in this pocket? let's see..", false, 300, false, c_black, c_white);
		textbox_add("oops, i totally forgot about...", false, 300, false);
		textbox_add("...that bag with unlimited potions", false, 300, false);
		textbox_add("sorry, my fault...", false, 300, false);
		textbox_add("well yeah, keep on diggin' and so", false, 300, false);
		textbox_show_ext();
		progress = "pre_death_6_refill";
	}
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