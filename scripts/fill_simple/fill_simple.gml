///@arg x_pos
///@arg y_pos
///@arg block
///@arg block_background
///@arg replace

var _x_pos = argument0;
var _y_pos = argument1;
var _block = argument2;
var _block_background = argument3;
var _replace = argument4;

var _x_pos_scan = _x_pos;
var _x_max_pos = pos(room_width);
var _y_max_pos = pos(room_height);

for(var _i = _y_pos; _i < _y_max_pos; _i++)
{
	// go right
	while(block_empty(_x_pos_scan, _y_pos) && _x_pos_scan < _x_max_pos && _x_pos_scan >= 0)
	{
		create_block(_x_pos_scan, _y_pos, _block, _block_background, _replace);
		_x_pos_scan += 1;
	}
	_x_pos_scan = _x_pos - 1;
	
	while(block_empty(_x_pos_scan, _y_pos) && _x_pos_scan < _x_max_pos && _x_pos_scan >= 0)
	{
		create_block(_x_pos_scan, _y_pos, _block, _block_background, _replace);
		_x_pos_scan -= 1;
	}
	
	_x_pos_scan = _x_pos;
	_y_pos += 1;
	
	if(!block_empty(_x_pos_scan, _y_pos) || _y_pos >= _y_max_pos)
	{
		exit;	
	}
}

