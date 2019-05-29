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
		x = approach(x, pos(x_pos_new), move_spd);
		y = approach(y, pos(y_pos_new), move_spd);
	
		if(x == x_pos_new * 8 && y == y_pos_new * 8)
		{
			set_pos(x_pos_new, y_pos_new)
			state = "idle";
		}
		break;
	case "moveblocked":
		var x_target = pos(x_pos) + ((pos(x_pos_new) - pos(x_pos)) / 4);
		var y_target = pos(y_pos) + ((pos(y_pos_new) - pos(y_pos)) / 4);
		x = approach(x, x_target, move_spd);
		y = approach(y, y_target, move_spd);
	
		if(x == x_target && y == y_target)
		{
			x_pos_new = x_pos;
			y_pos_new = y_pos;
			state = "moveblocked_back";
		}
		break;
	case "moveblocked_back":
		x = approach(x, pos(x_pos), move_spd);
		y = approach(y, pos(y_pos), move_spd);
	
		if(x == pos(x_pos) && y == pos(y_pos))
		{
			state = "idle";
		}
		break;
}