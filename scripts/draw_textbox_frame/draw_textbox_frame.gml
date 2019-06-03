///@arg x1
///@arg y1
///@arg x2
///@arg y2
///@arg color_box
///@arg color_frame

var _x1 = argument0;
var _y1 = argument1;
var _x2 = argument2;
var _y2 = argument3;
var _color_box = argument4;
var _color_frame = argument5;
var _frame_margin = 1;
var _frame_width = 2;

draw_save();

draw_set_color(_color_box);
draw_rectangle(_x1, _y1, _x2, _y2, false);
draw_set_color(_color_frame);

draw_rectangle_width(_x1 + _frame_margin, 
						_y1 + _frame_margin, 
						_x2 - _frame_margin * 2, 
						_y2 - _frame_margin * 2, 
						_frame_width)

draw_load();