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
if(global.shinies > 0 && !event_first_shiney_triggered)
{
	event_first_shiney_triggered = true;	
	textbox_show("Wow! A Shiney!", "This must be worth a Marillion!");
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

if(state == "pre_death_mountain_up")
{
	if(pre_death_mountain_up_y == 0)
	{
		pre_death_mountain_up_y	= o_player.y;
	}
	
	if(o_player.y > pre_death_mountain_up_y + 40)
	{
		o_player.y = pre_death_mountain_up_y + 40
	}
	if(o_player.y <= pre_death_mountain_up_y)
	{
		o_player.y = pre_death_mountain_up_y + 40
	}
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