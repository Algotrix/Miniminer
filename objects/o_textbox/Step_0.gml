if(state == "show")
{
	continue_delay_counter = max(0, continue_delay_counter - 1);
	
	if(o_input.key_any && continue_delay_counter <= 0)
	{
		if(show_line >= ds_list_size(a_show_text_lines) - 1)
		{
			state = "";
			a_show = false;
			ds_list_clear(a_show_text_lines);
			global.is_in_dialogue = false;
		}
		else
		{
			show_line += 1;
		}
		continue_delay_counter = continue_delay;
	}
}