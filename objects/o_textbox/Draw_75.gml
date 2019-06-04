/// @description Hier Beschreibung einfügen
if(state == "show")
{
	#region init
	var _dw = display_get_gui_width();
	var _dh = display_get_gui_height();
	
	var _a_show_text_lines = ds_list_find_value(a_show_text_lines, show_line);
	var _a_show_position = ds_list_find_value(a_show_position, show_line);
	var _a_show_color_dialog = ds_list_find_value(a_show_color_dialog, show_line);
	var _a_show_color_frame = ds_list_find_value(a_show_color_frame, show_line);
	var _a_show_color_text = ds_list_find_value(a_show_color_text, show_line);
	var _a_show_name = ds_list_find_value(a_show_name, show_line);
	var _a_show_color_name = ds_list_find_value(a_show_color_name, show_line);
	
	var _frame_margin = 1;
	var _text_margin = 6;
	
	draw_save();
	
	#endregion

	#region position calculations
	if(_a_show_position)
	{
		// top
		var _x1 = _dw * 0.05;
		var _y1 = _x1;
		var _x2 = _dw - _x1;
		var _y2 = _dh - _dh * 0.6;
		var _name_x = _dw - _x1 - string_width(_a_show_name);
		var _name_y = _y2 + 2;
		var _nameframe_x1 = _x2 - string_width(_a_show_name) - 2;
		var _nameframe_y1 = _y2;
		var _nameframe_x2 = _x2;
		var _nameframe_y2 = _y2 + string_height(_a_show_name) + 1;
	}
	else 
	{
		// bottom
		var _x1 = _dw * 0.05;
		var _y1 = _dh * 0.6;
		var _x2 = _dw - _x1;
		var _y2 = _dh - _x1;
		var _name_x = _x1 + 1;
		var _name_y = _y1 - string_height(_a_show_name) + 1
		var _nameframe_x1 = _x1;
		var _nameframe_y1 = _y1;
		var _nameframe_x2 = _x1 + string_width(_a_show_name) + 1;
		var _nameframe_y2 = _y1 - string_height(_a_show_name) - 1;		
	}
	#endregion

	#region frame
	draw_textbox_frame(_x1, _y1, _x2, _y2, _a_show_color_dialog, _a_show_color_frame);
	#endregion
						
	#region text
	draw_set_color(_a_show_color_text);
	draw_text_ext(_x1 + _text_margin,
				  _y1 + _text_margin - 2,
				  _a_show_text_lines,
				  string_height(continue_string) + 1, 
				  _x2 - _x1 - _text_margin * 2);
	#endregion  
				  				  
	#region name frame
	if(_a_show_name != "")
	{
		draw_set_color(_a_show_color_dialog);
		draw_rectangle(_nameframe_x1, _nameframe_y1, _nameframe_x2,	_nameframe_y2, false);
	}
	#endregion
	
	#region name
	draw_set_color(_a_show_color_name);
	draw_text(_name_x, _name_y, _a_show_name);
	#endregion
	
	#region "..." / continue
	draw_set_color(_a_show_color_text);
	if(continue_delay_counter <= 0)
	{
		draw_text(_x2 - string_width(continue_string) - _text_margin, 
				  _y2 - string_height(continue_string) - _text_margin + 4, 
				  continue_string);
	}
	#endregion
	
	
	draw_load();
}