if(state == "show")
{
	var _a_show_continue_wait = ds_list_find_value(a_show_continue_wait, show_line);
	var _a_show_continue_wait_skippable = ds_list_find_value(a_show_continue_wait_skippable, show_line);
	
	if(global.debug_quickmode) continue_delay_counter = 0;
	
	if(!counter_init)
	{
		continue_delay_counter = _a_show_continue_wait;
		counter_init = true;
	}
	
	// wenn's hier crasht, wird textbox_show_ext aufgerufen obwohl keine textbox_add gemacht wurden.
	
	continue_delay_counter = max(0, continue_delay_counter - 1);
	
	if(o_input.key_action && _a_show_continue_wait_skippable
	   && continue_delay_counter >= continue_min_delay) continue_delay_counter = 0;
	
	if(o_input.key_action && continue_delay_counter <= 0)
	{
		if(show_line >= ds_list_size(a_show_text_lines) - 1)
		{
			state = "";
			a_show = false;
			counter_init = false;
			ds_list_clear(a_show_text_lines);
			ds_list_clear(a_show_continue_wait);
			ds_list_clear(a_show_continue_wait_skippable);
			ds_list_clear(a_show_color_dialog);
			ds_list_clear(a_show_color_frame);
			ds_list_clear(a_show_color_text);
			ds_list_clear(a_show_name);
			ds_list_clear(a_show_color_name);
			show_line = 0;
			global.is_in_dialogue = false;
		}
		else
		{
			show_line += 1;
		}
		continue_delay_counter = ds_list_find_value(a_show_continue_wait, show_line);
	}
}