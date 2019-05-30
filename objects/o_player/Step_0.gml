//dbg(string(x_pos) + "," + string(y_pos));
move_dir = dir_none;
switch(state)
{
	case "idle" :
		// check inputs and assign next movement
		if(input.key_up)
		{
			move_dir = dir_up;
		}
		else if(input.key_right)
		{
			move_dir = dir_right;
			look_dir = dir_right;
		}
		else if(input.key_down)
		{
			move_dir = dir_down;
		}
		else if(input.key_left)
		{
			move_dir = dir_left;
			look_dir = dir_left;
		}
		
		// set sprite for orientation
		if(look_dir == dir_right)
		{
			image_index = 0;
		}
		else
		{
			image_index = 1;
		}
		
		// look what's up in the next block!
		move_tile(move_dir);
		break;
	case "move":
		state_move_smooth("idle");
		break;
	case "moveblocked":
		var x_target = apos(x_pos) + ((apos(x_pos_new) - apos(x_pos)) / 4);
		var y_target = apos(y_pos) + ((apos(y_pos_new) - apos(y_pos)) / 4);
		x = approach(x, x_target, o_stats.move_spd);
		y = approach(y, y_target, o_stats.move_spd);
	
		if(x == x_target && y == y_target)
		{
			x_pos_new = x_pos;
			y_pos_new = y_pos;
			state = "moveblocked_back";
		}
		break;
	case "moveblocked_back":
		x = approach(x, apos(x_pos), o_stats.move_spd);
		y = approach(y, apos(y_pos), o_stats.move_spd);
	
		if(x == apos(x_pos) && y == apos(y_pos))
		{
			state = "idle";
		}
		break;
	case "mine":
		var x_target = apos(x_pos) + ((apos(x_pos_new) - apos(x_pos)) / 4);
		var y_target = apos(y_pos) + ((apos(y_pos_new) - apos(y_pos)) / 4);
		x = approach(x, x_target, o_stats.mine_spd);
		y = approach(y, y_target, o_stats.mine_spd);
		
		// set sprite for orientation
		if(look_dir == dir_right)
		{
			image_index = 2;
		}
		else
		{
			image_index = 3;
		}
		
		if(x == x_target && y == y_target)
		{
			var _block = get_block(x_pos_new, y_pos_new);
			_block.hp -= o_stats.mine_dmg;
			
			if(move_dir == dir_down) _block.hit_from = dir_up;
			if(move_dir == dir_up) _block.hit_from = dir_down;
			if(move_dir == dir_left) _block.hit_from = dir_right;
			if(move_dir == dir_right) _block.hit_from = dir_left;
			
			x_pos_new = x_pos;
			y_pos_new = y_pos;
			state = "mine_moveback";
		}
		break;
	case "mine_moveback":
		x = approach(x, apos(x_pos), o_stats.mine_spd);
		y = approach(y, apos(y_pos), o_stats.mine_spd);
	
		if(x == apos(x_pos) && y == apos(y_pos))
		{
			state = "idle";
		}
		break;
	case "collect":
	{
		state_move_smooth("idle");
		var collectible = get_collectible(x_pos_new, y_pos_new);
		break;
	}
}