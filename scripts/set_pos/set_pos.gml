///@description Sets the position of object
///@arg _x_pos
///@arg _y_pos
var _x_pos = argument0;
var _y_pos = argument1;

o_player.x = apos(_x_pos);
o_player.y = apos(_y_pos);

o_player.x_pos = _x_pos;
o_player.y_pos = _y_pos;