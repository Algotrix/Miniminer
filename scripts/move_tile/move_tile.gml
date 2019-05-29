///@arg direction (0 = up, 1 = right, 2 = down, 3 = left)
var x_new = 0;
var y_new = 0;
switch(argument0)
{
	case 0:
		x_new = x_pos
		y_new = y_pos - 1
		break;
	case 1:
		x_new = x_pos + 1
		y_new = y_pos
		break;
	case 2:
		x_new = x_pos
		y_new = y_pos + 1
		break;
	case 3:
		x_new = x_pos - 1
		y_new = y_pos
		break;
}

// check ob Bewegung möglich
var block = get_block(x_new, y_new);

if(!block.is_solid) set_pos(x_new, y_new);