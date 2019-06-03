if(global.is_in_dialogue || global.halted) exit;

move_dir = dir_none;
switch(state)
{
	case "idle" :
		// check inputs and assign next movement
		if(!global.can_move) break;
		
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
		
	#region move
	case "move":
		state_move_smooth("idle");
		state_check_fall();

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
	#endregion
		
	#region mine
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
		if(is_in_jump_area() && block_empty(x_pos, y_pos + 1)) state = "fall";
		break;
	#endregion
		
	#region jump
	case "jump":
	{
		y -= vsp;
		vsp -= global.grav;	
				
		// ceiling
		if(!block_empty(pos(x), pos(y)))
		{
			vsp = 0;
			//y = apos(y_pos);
			set_pos(pos(x), pos(y) + 1);
		}
		
		if(o_input.key_right_hold || o_input.key_left_hold)
		{
			// key pressed
			if(abs(vsp) < global.jump_max_speed_for_move)
			{
				
				if(o_input.key_right_hold)
				{
					var _next_x_pos = x_pos + 1;
				}
				else if(o_input.key_left_hold)
				{
					var _next_x_pos = x_pos - 1;
				}
				
				var _next_y_pos = pos_mid(y);
				
				if(near(y, apos(_next_y_pos), global.jump_max_distance_for_move))
				{
					// near enough to move
					var _next_block = get_block(_next_x_pos, _next_y_pos);
					var _next_block_standing = get_block(_next_x_pos, _next_y_pos + 1);
					if(block_empty(_next_block) || (!_next_block.is_solid && !_next_block.is_impassable))
					{
						// next block is free to move
						
						if(_next_block_standing.is_solid || _next_block_standing.is_impassable || _next_block_standing.can_stand_if_not_solid)
						{
							// you can stand on next block
							if(o_input.key_right_hold)
							{
								look_dir = dir_right;
								move_dir = dir_right;
							}
							else if(o_input.key_left_hold)
							{
								look_dir = dir_left;
								move_dir = dir_left;
							}
							x_pos_new = _next_x_pos;
							y_pos_new = _next_y_pos;
							state = "jump_move";
						}
					}
				}
			}
		}
		
		// floor
		if(!block_empty(pos(x), pos(y) + 1))
		{
			vsp = 0;
			set_pos(pos(x), pos(y));
			state = "idle";
		}
		break;
	}
	case "jump_move":
	{
		state_move_smooth("idle");
		break;
		
	}
	#endregion
	
	#region fall
	case "fall":
	{
		
		// check if on lower border of area, son don't fall
		var _area_jump = get_area(o_player.x_pos, o_player.y_pos, area_jump);
		var _area_jump_low_y_pos = pos(_area_jump.y + apos(_area_jump.image_yscale)) - 1;
		
		if(y_pos == _area_jump_low_y_pos && !event_move_crippled)
		{
			set_pos(pos(x), pos(y));
			state = "idle";	
		}
		else
		{
			y -= vsp;
			vsp -= global.grav;
		}

		var _block_next = get_block(pos(x), pos(y) + 1);
				
		// floor
		if(_block_next.can_stand_if_not_solid)
		{
			vsp = 0;
			set_pos(pos(x), pos(y));
			state = "idle";
		}
		break;
	}
	#endregion
	
	case "event_move_crippled":
	if(event_move_crippled_x_new == -1)
	{
		if(last_action_dir == dir_right) 
		{ 
			//image_index = 1;
			event_move_crippled_x_new = x + 1;
		}
			
		if(last_action_dir == dir_left) 
		{
			//image_index = 0;
			event_move_crippled_x_new = x - 1;
		}
	}
	x = approach(x, event_move_crippled_x_new, global.move_spd);

	if(x == event_move_crippled_x_new)
	{
		state = "idle";	
		event_move_crippled_x_new = -1;
	}
	
	if(x mod 8 == 0)
	{
		set_pos(pos_mid(x), pos_mid(y));

		x_pos_new = x_pos;
		y_pos_new = y_pos;
		state_check_fall();
	}
	break;
}

global.debug0 = global.achievement_caught_shopkeep; // when he comes down, approach him from below
global.debug1 = global.achievement_unlimited_potions; // let me run out of stamina enough times
global.debug2 = global.achievement_shattered; // as shiny fall 5 tiles
global.debug3 = global.achievement_boxxy; // got the box
global.debug4 = global.achievement_broken; // after falling down, complete the game with broken legs
global.debug5 = global.hp;