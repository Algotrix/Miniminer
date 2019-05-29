///@arg min_y
///@arg max_y
///@arg totalcount
///@arg collectible
///@arg removeblock

var _min_y = argument0;
var _max_y = argument1;
var _totalcount = argument2;
var _collectible = argument3;
var _removeblock = argument4;

for(var _i = 0; _i < _totalcount; _i++)
{
	var _new_x = irandom_range(0, room_width / 8);
	var _new_y = irandom_range(_min_y, _max_y)
	create_collectible(_new_x, _new_y, _collectible);
	if(_removeblock)
	{
		remove_block(_new_x, _new_y);	
	}
}
