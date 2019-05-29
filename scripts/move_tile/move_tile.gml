///@arg direction (0 = up, 1 = right, 2 = down, 3 = left)

var _x_pos_new = 0;
var _y_pos_new = 0;
switch(argument0)
{
	case dir_none:
		exit;
	case dir_up:
		_x_pos_new = x_pos
		_y_pos_new = y_pos - 1
		break;
	case dir_right:
		_x_pos_new = x_pos + 1
		_y_pos_new = y_pos
		break;
	case dir_down:
		_x_pos_new = x_pos
		_y_pos_new = y_pos + 1
		break;
	case dir_left:
		_x_pos_new = x_pos - 1
		_y_pos_new = y_pos
		break;
}

// check ob Bewegung möglich
var block = get_block(_x_pos_new, _y_pos_new);

if(!block.is_solid)
{
	x_pos_new = _x_pos_new;
	y_pos_new = _y_pos_new;
	state = "move";
}