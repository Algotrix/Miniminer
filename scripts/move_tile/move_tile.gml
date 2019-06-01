///@description Main function for moving. Checks what to do and selects the rights state.
///@arg direction (0 = up, 1 = right, 2 = down, 3 = left)

var _x_pos_new = 0;
var _y_pos_new = 0;

var _action_dir = argument0;
last_action_dir = _action_dir;

switch(_action_dir)
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


// check ob Bewegung 
var _special = get_special(_x_pos_new, _y_pos_new);
var _next_block = get_block(_x_pos_new, _y_pos_new);
var _this_block = get_block(x_pos, y_pos);

x_pos_new = _x_pos_new;
y_pos_new = _y_pos_new;

if(instance_exists(_special))
{
	dbg("special found");
	if(_special.object_index == b_special_event.object_index)
	{
		dbg("special event " + _special.trigger_event);	
		if((_special.num_triggers < _special.max_triggers || _special.max_triggers < 0) && !_special.needs_action)
		{
			o_events.a_event = _special.trigger_event;
			o_events.a_event_delay = _special.trigger_delay;
			_special.num_triggers += 1;
		}
	}
}

if(move_crippled)
{
	if(move_dir == dir_right || move_dir == dir_left) 
	{
		if(move_dir == dir_right) 
		{
			var _crippled_next_block = get_block(pos(x + 8), pos(y));
		}
		else if(move_dir == dir_left) 
		{
			var _crippled_next_block = get_block(pos(x - 1), pos(y));
		}
		
		if(!_crippled_next_block.is_solid) state = "move_crippled";
	}
	else
	{
		state = "idle";	
	}
	exit;
}


if(_next_block.is_impassable)
{
	// do nothing - block completely unpassable
	state = "idle";
}
else if(is_in_jump_area() && move_dir == dir_up && !_this_block.can_stand_if_not_solid)
{
	// jump
	state = "jump";
	vsp = global.jump_speed;
	player_drain_stamina(global.stamina_drain_jump);
}
else if(is_in_jump_area() && move_dir == dir_down &&
		!_next_block.is_solid && _next_block.can_stand_if_not_solid)
{
	// drop down platforms
	state = "move";
	vsp = global.jump_speed;
	player_drain_stamina(global.stamina_drain_jump);
}
else if(!_next_block.is_solid)
{
	// default move
	state = "move";
	player_drain_stamina(global.stamina_drain_move);
}
else
{
	if(global.mine_level < _next_block.mine_minlevel)
	{
		state = "moveblocked";	
		player_drain_stamina(global.stamina_drain_moveblocked);
	}
	else
	{
		state = "mine";	
		player_drain_stamina(global.stamina_drain_mine);
	}
}

