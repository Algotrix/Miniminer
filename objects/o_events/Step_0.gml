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
if(o_stats.shinies > 0 && !event_first_shiney_triggered)
{
	event_first_shiney_triggered = true;	
	textbox_show("Wow! A Shiney!", "This must be worth a Marillion!");
}

#endregion


if(state == "pre_death_go_left")
{
	if(pre_death_go_left_count == 0)
	{
		textbox_show("There's nothing to the left... i guess.")
		pre_death_go_left_count += 1;
		state = "";
	}
	else if(pre_death_go_left_count == 1)
	{
		textbox_show("I'm pretty sure there's nothing, really!")
		pre_death_go_left_count += 1;
		state = "";
	}
	else if(pre_death_go_left_count == 2)
	{
		textbox_show("Come on.. what could be there?", "An Item-Shop maybe? Don't be ridiculous!");
		pre_death_go_left_count += 1;
		state = "";
	}
	else
	{
		textbox_show("Leave me alone. I don't want to go there.")
		pre_death_go_left_count += 1;
		state = "";
	}
}

if(state == "end")
{
	eventarg0 = "";
	eventarg1 = "";
	eventarg2 = "";
	state = "";
	
	
}