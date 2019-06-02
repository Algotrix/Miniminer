if(global.is_in_dialogue) exit;

#region init & delay
if(a_event != "" && a_event_delay > 0)
{
	a_event_delay = max(0, a_event_delay - 1);
}

if(a_event != "" && a_event_delay <= 0)
{
	state = a_event;
	a_event = "";
	a_event_delay = 0;
	eventarg0 = a_eventarg0;
	eventarg1 = a_eventarg1;
	eventarg2 = a_eventarg2;
	
	a_eventarg0 = "";
	a_eventarg1 = "";
	a_eventarg2 = "";
}
#endregion

#region check for global events to selftrigger
if(global.shinies > 0 && !pre_death_got_shiney_triggered)
{
	pre_death_got_shiney_triggered = true;	
	o_game_script.state = "pre_death_got_shiney";
}

#endregion

#region pre_death_go_left
if(state == "pre_death_go_left")
{
	if(pre_death_go_left_count == 0)
	{
		textbox_show("There's nothing to the left... i guess.")
		pre_death_go_left_count += 1;
		state = "end";
	}
	else if(pre_death_go_left_count == 1)
	{
		textbox_show("I'm pretty sure there's nothing, really!")
		pre_death_go_left_count += 1;
		state = "end";
	}
	else if(pre_death_go_left_count == 2)
	{
		textbox_show("Come on.. what could be there?", "An Item-Shop maybe? Don't be ridiculous!");
		pre_death_go_left_count += 1;
		state = "end";
	}
	else
	{
		textbox_show("Leave me alone. I don't want to go there.")
		pre_death_go_left_count += 1;
		state = "end";
	}
}
#endregion

#region pre_death_mountain_up
if(state == "pre_death_mountain_up")
{
	state = "end";	
	textbox_show("It's too high");
}
#endregion

#region event instance spawner
if(state == "pre_death_show_shopkeep")
{
	instance_create_layer(apos(1), apos(7), layer_game, eo_pre_death_show_shopkeep);
	state = "end";
}
#endregion

if(state == "event_move_crippled")
{
	instance_create_layer(-1, -1, layer_game, eo_move_crippled);
	state = "end";
}
#region end


if(state == "end")
{
	eventarg0 = "";
	eventarg1 = "";
	eventarg2 = "";
	state = "";
}
#endregion