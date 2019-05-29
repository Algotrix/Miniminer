//dbg(string(x_pos) + "," + string(y_pos));
move_dir = dir_none;
switch(state)
{
	case "idle" :
		if(input.key_up)
		{
			move_dir = dir_up;
		}
		else if(input.key_right)
		{
			move_dir = dir_right;
		}
		else if(input.key_down)
		{
			move_dir = dir_down;
		}
		else if(input.key_left)
		{
			move_dir = dir_left;
		}
		move_tile(move_dir);
		break;
	case "move":
		// erst bewegen, dann erst richtig setzen mit set_pos wenn er schond a ist.
		x = approach(x, x_pos_new * 8, move_spd);
		y = approach(y, y_pos_new * 8, move_spd);
	
		if(x == x_pos_new * 8 && y == y_pos_new * 8)
		{
			set_pos(x_pos_new, y_pos_new)
			state = "idle";
		}
	
	break;
}