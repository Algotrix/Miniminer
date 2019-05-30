///@arg x1
///@arg y1
///@arg x2
///@arg y2
///@arg w

var _x1 = argument0;
var _x2 = argument2;
var _y1 = argument1;
var _y2 = argument3;
var _w = argument4;

draw_line_width(_x1, _y1, _x2, _y1, _w);
draw_line_width(_x2, _y1, _x2, _y2, _w);
draw_line_width(_x1, _y2, _x2, _y2, _w);
draw_line_width(_x1, _y1, _x1, _y2, _w);