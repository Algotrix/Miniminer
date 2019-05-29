///@arg direction (0 = up, 1 = right, 2 = down, 3 = left)
switch(argument0)
{
	case 0:
		set_pos(x_pos, y_pos - 1);
		break;
	case 1:
		set_pos(x_pos + 1, y_pos);
		break;
	case 2:
		set_pos(x_pos, y_pos + 1);
		break;
	case 3:
		set_pos(x_pos - 1, y_pos);
		break;
}