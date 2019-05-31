if(state == "show")
{
	continue_delay_counter = max(0, continue_delay_counter - 1);
	
	if(o_input.key_any && a_show_continue_wait_skippable) continue_delay_counter = 0;
	
	if(o_input.key_any && continue_delay_counter <= 0)
	{
		if(show_line >= ds_list_size(a_show_text_lines) - 1)
		{
			state = "";
			a_show = false;
			ds_list_clear(a_show_text_lines);
			ds_list_clear(a_show_continue_wait);
			ds_list_clear(a_show_continue_wait_skippable);
			ds_list_clear(a_show_color_dialog);
			ds_list_clear(a_show_color_frame);
			show_line = 0;
			global.is_in_dialogue = false;
		}
		else
		{
			show_line += 1;
		}
		continue_delay_counter = a_show_continue_wait;
	}
}