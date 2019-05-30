/// @description Hier Beschreibung einfügen
if(state == "show")
{
	
	dw = display_get_gui_width();
	dh = display_get_gui_height();

	color = c_black;
	frame_color = c_white;

	x1 = dw * 0.05;
	y1 = dh * 0.6;
	x2 = dw - x1;
	y2 = dh - x1;

	frame_margin = 1;
	text_margin = 6;

	draw_set_color(color);
	draw_rectangle(x1, y1, x2, y2, false);
	draw_set_color(frame_color);

	draw_rectangle_width(x1 + frame_margin, 
						 y1 + frame_margin, 
						 x2 - frame_margin * 2, 
						 y2 - frame_margin * 2, 
						 2)
						 
	draw_text_ext(x1 + text_margin,
				  y1 + text_margin,
				  ds_list_find_value(a_show_text_lines, show_line),
				  string_height(continue_string) + 1, 
				  x2 - x1 - text_margin * 2);
	
	if(continue_delay_counter <= 0)
	{
		draw_text(x2 - string_width(continue_string) - text_margin, 
				  y2 - string_height(continue_string) - text_margin, 
				  continue_string);
	}
}