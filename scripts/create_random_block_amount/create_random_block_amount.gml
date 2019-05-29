///@arg min_y
///@arg max_y
///@arg totalcount
///@arg block
///@arg background

var _min_y = argument0;
var _max_y = argument1;
var _totalcount = argument2;
var _block = argument3;
var _background = argument4;

for(var _i = 0; _i < _totalcount; _i++)
{
	create_block(irandom_range(0, room_width / 8), irandom_range(_min_y, _max_y), _block, _background, true);
}
