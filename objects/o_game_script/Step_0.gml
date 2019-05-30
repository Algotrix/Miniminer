if(global.is_in_dialogue) exit;

if(progress == "start")
{
	textbox_show("Uuuh what happened?")	
	progress = "pre_death1";
}

var _potions_max = 3;
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
		else if(pre_death_potions_drank == _potions_max)
		{
			textbox_show("There goes the last one...", "Please don't let me die...");
			progress = "pre_death4";
			pre_death_potions_drank += 1;
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
	textbox_show("you did it - great!");
	//global.halted = true;
	
	// todo: fade-out- und in	
	
	//global.halted = false;
	
	progress = "pre_death1";
}