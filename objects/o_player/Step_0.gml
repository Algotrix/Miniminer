if(global.is_in_dialogue || global.halted) exit;

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
		x = approach(x, x_target, global.move_spd);
		y = approach(y, y_target, global.move_spd);
	
		if(x == x_target && y == y_target)
		{
			x_pos_new = x_pos;
			y_pos_new = y_pos;
			state = "moveblocked_back";
		}
		break;
	case "moveblocked_back":
		x = approach(x, apos(x_pos), global.move_spd);
		y = approach(y, apos(y_pos), global.move_spd);
	
		if(x == apos(x_pos) && y == apos(y_pos))
		{
			state = "idle";
		}
		break;
	case "mine":
		var x_target = apos(x_pos) + ((apos(x_pos_new) - apos(x_pos)) / 4);
		var y_target = apos(y_pos) + ((apos(y_pos_new) - apos(y_pos)) / 4);
		x = approach(x, x_target, global.mine_spd);
		y = approach(y, y_target, global.mine_spd);
		
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
			block_apply_damage(_block, global.mine_dmg, reverse_dir(last_action_dir));
						
			x_pos_new = x_pos;
			y_pos_new = y_pos;
			state = "mine_moveback";
		}
		break;
	case "mine_moveback":
		x = approach(x, apos(x_pos), global.mine_spd);
		y = approach(y, apos(y_pos), global.mine_spd);
	
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