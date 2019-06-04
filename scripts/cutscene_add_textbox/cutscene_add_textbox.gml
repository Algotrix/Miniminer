///@arg cutscene
///@arg text
///@arg top (false = bottom)
///@arg continue_wait
///@arg continue_wait_skippable
///@arg color_dialog
///@arg color_frame
///@arg color_text
///@arg name
///@arg color_name

var _cutscene = noone;
var _text = "";
var _top = 0;
var _continue_wait = 2 * room_speed;
var _continue_wait_skippable = false;
var _color_dialog = c_black;
var _color_frame = c_white;
var _color_text = c_white;
var _name = "";
var _color_name = c_white;

if(argument_count >= 1) _cutscene = argument[0];
if(argument_count >= 2) _text = argument[1];
if(argument_count >= 3) _top = argument[2];
if(argument_count >= 4) _continue_wait = argument[3];
if(argument_count >= 5) _continue_wait_skippable = argument[4];
if(argument_count >= 6) _color_dialog = argument[5];
if(argument_count >= 7) _color_frame = argument[6];
if(argument_count >= 8) _color_text = argument[7];
if(argument_count >= 9) _name = argument[8];
if(argument_count >= 10) _color_name = argument[9];

cutscene_add(_cutscene, cutscene_textbox, _text, _top, _continue_wait, _continue_wait_skippable, 
_color_dialog, _color_frame, _color_text, _name, _color_name);

