///@arg x_pos
///@arg y_pos
var _x_pos = argument0;
var _y_pos = argument1;

var _block = get_block(_x_pos, _y_pos);
return !instance_exists(_block) || _block == b_empty;