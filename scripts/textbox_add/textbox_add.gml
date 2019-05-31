///@description adds a dialogue element for textbox_show_ext
///@arg text
///@arg top (false = bottom)
///@arg continue_wait
///@arg continue_wait_skippable
///@arg color_dialog
///@arg color_frame
///@arg color_text
///@arg name
///@arg color_name

if(global.is_in_dialogue) exit;

var _text = "why u no text?!?"; 
var _top = false;
var _continue_wait = 120;
var _continue_wait_skippable = false;
var _color_dialog = c_black;
var _color_frame = c_white;
var _color_text = c_white;
var _name = "";
var _color_name = c_white;

if(argument_count >= 1) _text = argument[0];
if(argument_count >= 2) _top = argument[1];
if(argument_count >= 3) _continue_wait = argument[2];
if(argument_count >= 4) _continue_wait_skippable = argument[3];
if(argument_count >= 5) _color_dialog = argument[4];
if(argument_count >= 6) _color_frame = argument[5];
if(argument_count >= 7) _color_text = argument[6];
if(argument_count >= 8) _name = argument[7];
if(argument_count >= 9) _color_name = argument[8];

ds_list_add(o_textbox.a_show_text_lines, _text);
ds_list_add(o_textbox.a_show_position, _top);
ds_list_add(o_textbox.a_show_continue_wait, _continue_wait);
ds_list_add(o_textbox.a_show_continue_wait_skippable, _continue_wait_skippable);
ds_list_add(o_textbox.a_show_color_dialog, _color_dialog);
ds_list_add(o_textbox.a_show_color_frame, _color_frame);
ds_list_add(o_textbox.a_show_color_text, _color_text);
ds_list_add(o_textbox.a_show_name, _name);
ds_list_add(o_textbox.a_show_color_name, _color_name);
