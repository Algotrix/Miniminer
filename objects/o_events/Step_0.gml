if(global.is_in_dialogue) exit;

if(a_event != "" && a_event_delay > 0)
{
	a_event_delay = max(0, a_event_delay - 1);
}

if(a_event != "" && a_event_delay <= 0)
{
	state = a_event;
	a_event = "";
	a_event_delay = 0;
}

if(state == "pre_death_go_left")
{
		textbox_show("There's nothing to the left... i guess.")
		pre_death_go_left_count += 1;
		state = "";
}